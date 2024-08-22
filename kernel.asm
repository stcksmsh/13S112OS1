
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000f117          	auipc	sp,0xf
    80000004:	1a013103          	ld	sp,416(sp) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	2c8090ef          	jal	ra,800092e4 <start>

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

    csrr t0, scause
    8000107c:	142022f3          	csrr	t0,scause
    li t1, 0x8000000000000000
    80001080:	fff0031b          	addiw	t1,zero,-1
    80001084:	03f31313          	slli	t1,t1,0x3f
    and t0, t0, t1
    80001088:	0062f2b3          	and	t0,t0,t1
    bnez t0, interrupt
    8000108c:	00029663          	bnez	t0,80001098 <interrupt>
    call exceptionHandler
    80001090:	674030ef          	jal	ra,80004704 <exceptionHandler>
    j end
    80001094:	0100006f          	j	800010a4 <end>

0000000080001098 <interrupt>:
interrupt:
    sd a0, 10*8(sp)
    80001098:	04a13823          	sd	a0,80(sp)
    call exceptionHandler
    8000109c:	668030ef          	jal	ra,80004704 <exceptionHandler>
    ld a0, 10*8(sp)
    800010a0:	05013503          	ld	a0,80(sp)

00000000800010a4 <end>:

end:
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010a4:	00813083          	ld	ra,8(sp)
    800010a8:	01013103          	ld	sp,16(sp)
    800010ac:	01813183          	ld	gp,24(sp)
    800010b0:	02013203          	ld	tp,32(sp)
    800010b4:	02813283          	ld	t0,40(sp)
    800010b8:	03013303          	ld	t1,48(sp)
    800010bc:	03813383          	ld	t2,56(sp)
    800010c0:	04013403          	ld	s0,64(sp)
    800010c4:	04813483          	ld	s1,72(sp)
    800010c8:	05813583          	ld	a1,88(sp)
    800010cc:	06013603          	ld	a2,96(sp)
    800010d0:	06813683          	ld	a3,104(sp)
    800010d4:	07013703          	ld	a4,112(sp)
    800010d8:	07813783          	ld	a5,120(sp)
    800010dc:	08013803          	ld	a6,128(sp)
    800010e0:	08813883          	ld	a7,136(sp)
    800010e4:	09013903          	ld	s2,144(sp)
    800010e8:	09813983          	ld	s3,152(sp)
    800010ec:	0a013a03          	ld	s4,160(sp)
    800010f0:	0a813a83          	ld	s5,168(sp)
    800010f4:	0b013b03          	ld	s6,176(sp)
    800010f8:	0b813b83          	ld	s7,184(sp)
    800010fc:	0c013c03          	ld	s8,192(sp)
    80001100:	0c813c83          	ld	s9,200(sp)
    80001104:	0d013d03          	ld	s10,208(sp)
    80001108:	0d813d83          	ld	s11,216(sp)
    8000110c:	0e013e03          	ld	t3,224(sp)
    80001110:	0e813e83          	ld	t4,232(sp)
    80001114:	0f013f03          	ld	t5,240(sp)
    80001118:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    8000111c:	10010113          	addi	sp,sp,256
    80001120:	10200073          	sret
	...

000000008000112c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000112c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001130:	00b29a63          	bne	t0,a1,80001144 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001134:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001138:	fe029ae3          	bnez	t0,8000112c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000113c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001140:	00008067          	ret

0000000080001144 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001144:	00100513          	li	a0,1
    80001148:	00008067          	ret

000000008000114c <_ZN6ThreadD1Ev>:
	this->body = body;
	this->arg = arg;
	this->myHandle = nullptr;
}

Thread::~Thread()
    8000114c:	ff010113          	addi	sp,sp,-16
    80001150:	00813423          	sd	s0,8(sp)
    80001154:	01010413          	addi	s0,sp,16
{
	// delete myHandle;
}
    80001158:	00813403          	ld	s0,8(sp)
    8000115c:	01010113          	addi	sp,sp,16
    80001160:	00008067          	ret

0000000080001164 <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned int init)
{
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore()
    80001164:	ff010113          	addi	sp,sp,-16
    80001168:	00113423          	sd	ra,8(sp)
    8000116c:	00813023          	sd	s0,0(sp)
    80001170:	01010413          	addi	s0,sp,16
    80001174:	0000b797          	auipc	a5,0xb
    80001178:	ee478793          	addi	a5,a5,-284 # 8000c058 <_ZTV9Semaphore+0x10>
    8000117c:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
{
	sem_close(myHandle);
    80001180:	00853503          	ld	a0,8(a0)
    80001184:	00004097          	auipc	ra,0x4
    80001188:	01c080e7          	jalr	28(ra) # 800051a0 <_Z9sem_closeP4_sem>
}
    8000118c:	00813083          	ld	ra,8(sp)
    80001190:	00013403          	ld	s0,0(sp)
    80001194:	01010113          	addi	sp,sp,16
    80001198:	00008067          	ret

000000008000119c <_Znwm>:
{
    8000119c:	ff010113          	addi	sp,sp,-16
    800011a0:	00113423          	sd	ra,8(sp)
    800011a4:	00813023          	sd	s0,0(sp)
    800011a8:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800011ac:	00004097          	auipc	ra,0x4
    800011b0:	e54080e7          	jalr	-428(ra) # 80005000 <_Z9mem_allocm>
}
    800011b4:	00813083          	ld	ra,8(sp)
    800011b8:	00013403          	ld	s0,0(sp)
    800011bc:	01010113          	addi	sp,sp,16
    800011c0:	00008067          	ret

00000000800011c4 <_ZdlPv>:
{
    800011c4:	ff010113          	addi	sp,sp,-16
    800011c8:	00113423          	sd	ra,8(sp)
    800011cc:	00813023          	sd	s0,0(sp)
    800011d0:	01010413          	addi	s0,sp,16
	mem_free(chunk);
    800011d4:	00004097          	auipc	ra,0x4
    800011d8:	e5c080e7          	jalr	-420(ra) # 80005030 <_Z8mem_freePv>
}
    800011dc:	00813083          	ld	ra,8(sp)
    800011e0:	00013403          	ld	s0,0(sp)
    800011e4:	01010113          	addi	sp,sp,16
    800011e8:	00008067          	ret

00000000800011ec <_ZN6ThreadD0Ev>:
Thread::~Thread()
    800011ec:	ff010113          	addi	sp,sp,-16
    800011f0:	00113423          	sd	ra,8(sp)
    800011f4:	00813023          	sd	s0,0(sp)
    800011f8:	01010413          	addi	s0,sp,16
}
    800011fc:	00000097          	auipc	ra,0x0
    80001200:	fc8080e7          	jalr	-56(ra) # 800011c4 <_ZdlPv>
    80001204:	00813083          	ld	ra,8(sp)
    80001208:	00013403          	ld	s0,0(sp)
    8000120c:	01010113          	addi	sp,sp,16
    80001210:	00008067          	ret

0000000080001214 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore()
    80001214:	fe010113          	addi	sp,sp,-32
    80001218:	00113c23          	sd	ra,24(sp)
    8000121c:	00813823          	sd	s0,16(sp)
    80001220:	00913423          	sd	s1,8(sp)
    80001224:	02010413          	addi	s0,sp,32
    80001228:	00050493          	mv	s1,a0
}
    8000122c:	00000097          	auipc	ra,0x0
    80001230:	f38080e7          	jalr	-200(ra) # 80001164 <_ZN9SemaphoreD1Ev>
    80001234:	00048513          	mv	a0,s1
    80001238:	00000097          	auipc	ra,0x0
    8000123c:	f8c080e7          	jalr	-116(ra) # 800011c4 <_ZdlPv>
    80001240:	01813083          	ld	ra,24(sp)
    80001244:	01013403          	ld	s0,16(sp)
    80001248:	00813483          	ld	s1,8(sp)
    8000124c:	02010113          	addi	sp,sp,32
    80001250:	00008067          	ret

0000000080001254 <_Znam>:
{
    80001254:	ff010113          	addi	sp,sp,-16
    80001258:	00113423          	sd	ra,8(sp)
    8000125c:	00813023          	sd	s0,0(sp)
    80001260:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001264:	00004097          	auipc	ra,0x4
    80001268:	d9c080e7          	jalr	-612(ra) # 80005000 <_Z9mem_allocm>
}
    8000126c:	00813083          	ld	ra,8(sp)
    80001270:	00013403          	ld	s0,0(sp)
    80001274:	01010113          	addi	sp,sp,16
    80001278:	00008067          	ret

000000008000127c <_ZdaPv>:
{
    8000127c:	ff010113          	addi	sp,sp,-16
    80001280:	00113423          	sd	ra,8(sp)
    80001284:	00813023          	sd	s0,0(sp)
    80001288:	01010413          	addi	s0,sp,16
    mem_free(chunk);
    8000128c:	00004097          	auipc	ra,0x4
    80001290:	da4080e7          	jalr	-604(ra) # 80005030 <_Z8mem_freePv>
}
    80001294:	00813083          	ld	ra,8(sp)
    80001298:	00013403          	ld	s0,0(sp)
    8000129c:	01010113          	addi	sp,sp,16
    800012a0:	00008067          	ret

00000000800012a4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg)
    800012a4:	ff010113          	addi	sp,sp,-16
    800012a8:	00813423          	sd	s0,8(sp)
    800012ac:	01010413          	addi	s0,sp,16
    800012b0:	0000b797          	auipc	a5,0xb
    800012b4:	d8078793          	addi	a5,a5,-640 # 8000c030 <_ZTV6Thread+0x10>
    800012b8:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800012bc:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800012c0:	00c53c23          	sd	a2,24(a0)
	this->myHandle = nullptr;
    800012c4:	00053423          	sd	zero,8(a0)
}
    800012c8:	00813403          	ld	s0,8(sp)
    800012cc:	01010113          	addi	sp,sp,16
    800012d0:	00008067          	ret

00000000800012d4 <_ZN6Thread5startEv>:
{
    800012d4:	ff010113          	addi	sp,sp,-16
    800012d8:	00113423          	sd	ra,8(sp)
    800012dc:	00813023          	sd	s0,0(sp)
    800012e0:	01010413          	addi	s0,sp,16
    void (*code)(void*) = ((this->body== nullptr)?RunWrapper::runWrapper:this->body);
    800012e4:	01053783          	ld	a5,16(a0)
    800012e8:	02078663          	beqz	a5,80001314 <_ZN6Thread5startEv+0x40>
    800012ec:	00078593          	mv	a1,a5
	void* argument = ((this->body== nullptr)?this:this->arg);
    800012f0:	02078863          	beqz	a5,80001320 <_ZN6Thread5startEv+0x4c>
    800012f4:	01853603          	ld	a2,24(a0)
	return thread_create(&myHandle, code, argument);
    800012f8:	00850513          	addi	a0,a0,8
    800012fc:	00004097          	auipc	ra,0x4
    80001300:	d60080e7          	jalr	-672(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
}
    80001304:	00813083          	ld	ra,8(sp)
    80001308:	00013403          	ld	s0,0(sp)
    8000130c:	01010113          	addi	sp,sp,16
    80001310:	00008067          	ret
    void (*code)(void*) = ((this->body== nullptr)?RunWrapper::runWrapper:this->body);
    80001314:	00000597          	auipc	a1,0x0
    80001318:	1b858593          	addi	a1,a1,440 # 800014cc <_ZN10RunWrapper10runWrapperEPv>
    8000131c:	fd5ff06f          	j	800012f0 <_ZN6Thread5startEv+0x1c>
	void* argument = ((this->body== nullptr)?this:this->arg);
    80001320:	00050613          	mv	a2,a0
    80001324:	fd5ff06f          	j	800012f8 <_ZN6Thread5startEv+0x24>

0000000080001328 <_ZN6Thread4joinEv>:
{
    80001328:	ff010113          	addi	sp,sp,-16
    8000132c:	00113423          	sd	ra,8(sp)
    80001330:	00813023          	sd	s0,0(sp)
    80001334:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80001338:	00853503          	ld	a0,8(a0)
    8000133c:	00004097          	auipc	ra,0x4
    80001340:	ddc080e7          	jalr	-548(ra) # 80005118 <_Z11thread_joinP7_thread>
}
    80001344:	00813083          	ld	ra,8(sp)
    80001348:	00013403          	ld	s0,0(sp)
    8000134c:	01010113          	addi	sp,sp,16
    80001350:	00008067          	ret

0000000080001354 <_ZN6Thread8dispatchEv>:
{
    80001354:	ff010113          	addi	sp,sp,-16
    80001358:	00113423          	sd	ra,8(sp)
    8000135c:	00813023          	sd	s0,0(sp)
    80001360:	01010413          	addi	s0,sp,16
	thread_dispatch();
    80001364:	00004097          	auipc	ra,0x4
    80001368:	d94080e7          	jalr	-620(ra) # 800050f8 <_Z15thread_dispatchv>
}
    8000136c:	00813083          	ld	ra,8(sp)
    80001370:	00013403          	ld	s0,0(sp)
    80001374:	01010113          	addi	sp,sp,16
    80001378:	00008067          	ret

000000008000137c <_ZN6ThreadC1Ev>:
Thread::Thread()
    8000137c:	ff010113          	addi	sp,sp,-16
    80001380:	00813423          	sd	s0,8(sp)
    80001384:	01010413          	addi	s0,sp,16
    80001388:	0000b797          	auipc	a5,0xb
    8000138c:	ca878793          	addi	a5,a5,-856 # 8000c030 <_ZTV6Thread+0x10>
    80001390:	00f53023          	sd	a5,0(a0)
	this->myHandle = nullptr;
    80001394:	00053423          	sd	zero,8(a0)
	this->body = nullptr;
    80001398:	00053823          	sd	zero,16(a0)
	this->arg  = nullptr;
    8000139c:	00053c23          	sd	zero,24(a0)
}
    800013a0:	00813403          	ld	s0,8(sp)
    800013a4:	01010113          	addi	sp,sp,16
    800013a8:	00008067          	ret

00000000800013ac <_ZN6Thread5sleepEm>:
{
    800013ac:	ff010113          	addi	sp,sp,-16
    800013b0:	00113423          	sd	ra,8(sp)
    800013b4:	00813023          	sd	s0,0(sp)
    800013b8:	01010413          	addi	s0,sp,16
    return time_sleep(t);
    800013bc:	00004097          	auipc	ra,0x4
    800013c0:	d80080e7          	jalr	-640(ra) # 8000513c <_Z10time_sleepm>
}
    800013c4:	00813083          	ld	ra,8(sp)
    800013c8:	00013403          	ld	s0,0(sp)
    800013cc:	01010113          	addi	sp,sp,16
    800013d0:	00008067          	ret

00000000800013d4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init)
    800013d4:	ff010113          	addi	sp,sp,-16
    800013d8:	00113423          	sd	ra,8(sp)
    800013dc:	00813023          	sd	s0,0(sp)
    800013e0:	01010413          	addi	s0,sp,16
    800013e4:	0000b797          	auipc	a5,0xb
    800013e8:	c7478793          	addi	a5,a5,-908 # 8000c058 <_ZTV9Semaphore+0x10>
    800013ec:	00f53023          	sd	a5,0(a0)
	sem_open(&myHandle, init);
    800013f0:	00850513          	addi	a0,a0,8
    800013f4:	00004097          	auipc	ra,0x4
    800013f8:	d74080e7          	jalr	-652(ra) # 80005168 <_Z8sem_openPP4_semj>
}
    800013fc:	00813083          	ld	ra,8(sp)
    80001400:	00013403          	ld	s0,0(sp)
    80001404:	01010113          	addi	sp,sp,16
    80001408:	00008067          	ret

000000008000140c <_ZN9Semaphore4waitEv>:

int Semaphore::wait()
{
    8000140c:	ff010113          	addi	sp,sp,-16
    80001410:	00113423          	sd	ra,8(sp)
    80001414:	00813023          	sd	s0,0(sp)
    80001418:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    8000141c:	00853503          	ld	a0,8(a0)
    80001420:	00004097          	auipc	ra,0x4
    80001424:	dac080e7          	jalr	-596(ra) # 800051cc <_Z8sem_waitP4_sem>
}
    80001428:	00813083          	ld	ra,8(sp)
    8000142c:	00013403          	ld	s0,0(sp)
    80001430:	01010113          	addi	sp,sp,16
    80001434:	00008067          	ret

0000000080001438 <_ZN9Semaphore6signalEv>:

int Semaphore::signal()
{
    80001438:	ff010113          	addi	sp,sp,-16
    8000143c:	00113423          	sd	ra,8(sp)
    80001440:	00813023          	sd	s0,0(sp)
    80001444:	01010413          	addi	s0,sp,16
	return sem_signal(this->myHandle);
    80001448:	00853503          	ld	a0,8(a0)
    8000144c:	00004097          	auipc	ra,0x4
    80001450:	dac080e7          	jalr	-596(ra) # 800051f8 <_Z10sem_signalP4_sem>
}
    80001454:	00813083          	ld	ra,8(sp)
    80001458:	00013403          	ld	s0,0(sp)
    8000145c:	01010113          	addi	sp,sp,16
    80001460:	00008067          	ret

0000000080001464 <_ZN7Console4getcEv>:

char Console::getc()
{
    80001464:	ff010113          	addi	sp,sp,-16
    80001468:	00113423          	sd	ra,8(sp)
    8000146c:	00813023          	sd	s0,0(sp)
    80001470:	01010413          	addi	s0,sp,16
	return ::getc();
    80001474:	00004097          	auipc	ra,0x4
    80001478:	e0c080e7          	jalr	-500(ra) # 80005280 <_Z4getcv>
}
    8000147c:	00813083          	ld	ra,8(sp)
    80001480:	00013403          	ld	s0,0(sp)
    80001484:	01010113          	addi	sp,sp,16
    80001488:	00008067          	ret

000000008000148c <_ZN7Console4putcEc>:

void Console::putc(char c)
{
    8000148c:	ff010113          	addi	sp,sp,-16
    80001490:	00113423          	sd	ra,8(sp)
    80001494:	00813023          	sd	s0,0(sp)
    80001498:	01010413          	addi	s0,sp,16
	::putc(c);
    8000149c:	00004097          	auipc	ra,0x4
    800014a0:	e0c080e7          	jalr	-500(ra) # 800052a8 <_Z4putcc>
}
    800014a4:	00813083          	ld	ra,8(sp)
    800014a8:	00013403          	ld	s0,0(sp)
    800014ac:	01010113          	addi	sp,sp,16
    800014b0:	00008067          	ret

00000000800014b4 <_ZN6Thread3runEv>:
	void join();
	static void dispatch();
	static int sleep(time_t);
 protected:
	Thread();
	virtual void run()
    800014b4:	ff010113          	addi	sp,sp,-16
    800014b8:	00813423          	sd	s0,8(sp)
    800014bc:	01010413          	addi	s0,sp,16
	{
	}
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <_ZN10RunWrapper10runWrapperEPv>:
	static void runWrapper(void* arg) {
    800014cc:	ff010113          	addi	sp,sp,-16
    800014d0:	00113423          	sd	ra,8(sp)
    800014d4:	00813023          	sd	s0,0(sp)
    800014d8:	01010413          	addi	s0,sp,16
		thread->run();
    800014dc:	00053783          	ld	a5,0(a0)
    800014e0:	0107b783          	ld	a5,16(a5)
    800014e4:	000780e7          	jalr	a5
	}
    800014e8:	00813083          	ld	ra,8(sp)
    800014ec:	00013403          	ld	s0,0(sp)
    800014f0:	01010113          	addi	sp,sp,16
    800014f4:	00008067          	ret

00000000800014f8 <_Z16thread_test_1cppPv>:
    putc('\n');
}



void thread_test_1cpp(void* args){
    800014f8:	ff010113          	addi	sp,sp,-16
    800014fc:	00113423          	sd	ra,8(sp)
    80001500:	00813023          	sd	s0,0(sp)
    80001504:	01010413          	addi	s0,sp,16
    putc('1');
    80001508:	03100513          	li	a0,49
    8000150c:	00004097          	auipc	ra,0x4
    80001510:	d9c080e7          	jalr	-612(ra) # 800052a8 <_Z4putcc>
    putc('s');
    80001514:	07300513          	li	a0,115
    80001518:	00004097          	auipc	ra,0x4
    8000151c:	d90080e7          	jalr	-624(ra) # 800052a8 <_Z4putcc>
    if(ccpp == 't')Thread::sleep(100);
    80001520:	0000e717          	auipc	a4,0xe
    80001524:	ca074703          	lbu	a4,-864(a4) # 8000f1c0 <ccpp>
    80001528:	07400793          	li	a5,116
    8000152c:	02f70e63          	beq	a4,a5,80001568 <_Z16thread_test_1cppPv+0x70>
    putc('1');
    80001530:	03100513          	li	a0,49
    80001534:	00004097          	auipc	ra,0x4
    80001538:	d74080e7          	jalr	-652(ra) # 800052a8 <_Z4putcc>
    if(ccpp == 's')sem1cpp->signal();
    8000153c:	0000e717          	auipc	a4,0xe
    80001540:	c8474703          	lbu	a4,-892(a4) # 8000f1c0 <ccpp>
    80001544:	07300793          	li	a5,115
    80001548:	02f70863          	beq	a4,a5,80001578 <_Z16thread_test_1cppPv+0x80>
    putc('S');
    8000154c:	05300513          	li	a0,83
    80001550:	00004097          	auipc	ra,0x4
    80001554:	d58080e7          	jalr	-680(ra) # 800052a8 <_Z4putcc>
}
    80001558:	00813083          	ld	ra,8(sp)
    8000155c:	00013403          	ld	s0,0(sp)
    80001560:	01010113          	addi	sp,sp,16
    80001564:	00008067          	ret
    if(ccpp == 't')Thread::sleep(100);
    80001568:	06400513          	li	a0,100
    8000156c:	00000097          	auipc	ra,0x0
    80001570:	e40080e7          	jalr	-448(ra) # 800013ac <_ZN6Thread5sleepEm>
    80001574:	fbdff06f          	j	80001530 <_Z16thread_test_1cppPv+0x38>
    if(ccpp == 's')sem1cpp->signal();
    80001578:	0000e517          	auipc	a0,0xe
    8000157c:	c5853503          	ld	a0,-936(a0) # 8000f1d0 <sem1cpp>
    80001580:	00000097          	auipc	ra,0x0
    80001584:	eb8080e7          	jalr	-328(ra) # 80001438 <_ZN9Semaphore6signalEv>
    80001588:	fc5ff06f          	j	8000154c <_Z16thread_test_1cppPv+0x54>

000000008000158c <_Z16thread_test_2cppPv>:

void thread_test_2cpp(void* args){
    8000158c:	ff010113          	addi	sp,sp,-16
    80001590:	00113423          	sd	ra,8(sp)
    80001594:	00813023          	sd	s0,0(sp)
    80001598:	01010413          	addi	s0,sp,16
    putc('2');
    8000159c:	03200513          	li	a0,50
    800015a0:	00004097          	auipc	ra,0x4
    800015a4:	d08080e7          	jalr	-760(ra) # 800052a8 <_Z4putcc>
    putc('s');
    800015a8:	07300513          	li	a0,115
    800015ac:	00004097          	auipc	ra,0x4
    800015b0:	cfc080e7          	jalr	-772(ra) # 800052a8 <_Z4putcc>
    if(ccpp == 't')Thread::sleep(50);
    800015b4:	0000e717          	auipc	a4,0xe
    800015b8:	c0c74703          	lbu	a4,-1012(a4) # 8000f1c0 <ccpp>
    800015bc:	07400793          	li	a5,116
    800015c0:	02f70e63          	beq	a4,a5,800015fc <_Z16thread_test_2cppPv+0x70>
    putc('2');
    800015c4:	03200513          	li	a0,50
    800015c8:	00004097          	auipc	ra,0x4
    800015cc:	ce0080e7          	jalr	-800(ra) # 800052a8 <_Z4putcc>
    if(ccpp == 's')sem2cpp->signal();
    800015d0:	0000e717          	auipc	a4,0xe
    800015d4:	bf074703          	lbu	a4,-1040(a4) # 8000f1c0 <ccpp>
    800015d8:	07300793          	li	a5,115
    800015dc:	02f70863          	beq	a4,a5,8000160c <_Z16thread_test_2cppPv+0x80>
    putc('S');
    800015e0:	05300513          	li	a0,83
    800015e4:	00004097          	auipc	ra,0x4
    800015e8:	cc4080e7          	jalr	-828(ra) # 800052a8 <_Z4putcc>
}
    800015ec:	00813083          	ld	ra,8(sp)
    800015f0:	00013403          	ld	s0,0(sp)
    800015f4:	01010113          	addi	sp,sp,16
    800015f8:	00008067          	ret
    if(ccpp == 't')Thread::sleep(50);
    800015fc:	03200513          	li	a0,50
    80001600:	00000097          	auipc	ra,0x0
    80001604:	dac080e7          	jalr	-596(ra) # 800013ac <_ZN6Thread5sleepEm>
    80001608:	fbdff06f          	j	800015c4 <_Z16thread_test_2cppPv+0x38>
    if(ccpp == 's')sem2cpp->signal();
    8000160c:	0000e517          	auipc	a0,0xe
    80001610:	bbc53503          	ld	a0,-1092(a0) # 8000f1c8 <sem2cpp>
    80001614:	00000097          	auipc	ra,0x0
    80001618:	e24080e7          	jalr	-476(ra) # 80001438 <_ZN9Semaphore6signalEv>
    8000161c:	fc5ff06f          	j	800015e0 <_Z16thread_test_2cppPv+0x54>

0000000080001620 <_Z10memTestcppv>:
void memTestcpp(){
    80001620:	fd010113          	addi	sp,sp,-48
    80001624:	02113423          	sd	ra,40(sp)
    80001628:	02813023          	sd	s0,32(sp)
    8000162c:	00913c23          	sd	s1,24(sp)
    80001630:	01213823          	sd	s2,16(sp)
    80001634:	01313423          	sd	s3,8(sp)
    80001638:	01413023          	sd	s4,0(sp)
    8000163c:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001640:	0000e517          	auipc	a0,0xe
    80001644:	bc853503          	ld	a0,-1080(a0) # 8000f208 <_ZN11HeapManager8instanceE>
    80001648:	00002097          	auipc	ra,0x2
    8000164c:	ecc080e7          	jalr	-308(ra) # 80003514 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80001650:	00050993          	mv	s3,a0
    putc('F');
    80001654:	04600513          	li	a0,70
    80001658:	00004097          	auipc	ra,0x4
    8000165c:	c50080e7          	jalr	-944(ra) # 800052a8 <_Z4putcc>
    putc('r');
    80001660:	07200513          	li	a0,114
    80001664:	00004097          	auipc	ra,0x4
    80001668:	c44080e7          	jalr	-956(ra) # 800052a8 <_Z4putcc>
    putc('e');
    8000166c:	06500513          	li	a0,101
    80001670:	00004097          	auipc	ra,0x4
    80001674:	c38080e7          	jalr	-968(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001678:	06500513          	li	a0,101
    8000167c:	00004097          	auipc	ra,0x4
    80001680:	c2c080e7          	jalr	-980(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80001684:	02000513          	li	a0,32
    80001688:	00004097          	auipc	ra,0x4
    8000168c:	c20080e7          	jalr	-992(ra) # 800052a8 <_Z4putcc>
    putc('m');
    80001690:	06d00513          	li	a0,109
    80001694:	00004097          	auipc	ra,0x4
    80001698:	c14080e7          	jalr	-1004(ra) # 800052a8 <_Z4putcc>
    putc('e');
    8000169c:	06500513          	li	a0,101
    800016a0:	00004097          	auipc	ra,0x4
    800016a4:	c08080e7          	jalr	-1016(ra) # 800052a8 <_Z4putcc>
    putc('m');
    800016a8:	06d00513          	li	a0,109
    800016ac:	00004097          	auipc	ra,0x4
    800016b0:	bfc080e7          	jalr	-1028(ra) # 800052a8 <_Z4putcc>
    putc('o');
    800016b4:	06f00513          	li	a0,111
    800016b8:	00004097          	auipc	ra,0x4
    800016bc:	bf0080e7          	jalr	-1040(ra) # 800052a8 <_Z4putcc>
    putc('r');
    800016c0:	07200513          	li	a0,114
    800016c4:	00004097          	auipc	ra,0x4
    800016c8:	be4080e7          	jalr	-1052(ra) # 800052a8 <_Z4putcc>
    putc('y');
    800016cc:	07900513          	li	a0,121
    800016d0:	00004097          	auipc	ra,0x4
    800016d4:	bd8080e7          	jalr	-1064(ra) # 800052a8 <_Z4putcc>
    putc(':');
    800016d8:	03a00513          	li	a0,58
    800016dc:	00004097          	auipc	ra,0x4
    800016e0:	bcc080e7          	jalr	-1076(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800016e4:	00f00493          	li	s1,15
    800016e8:	0140006f          	j	800016fc <_Z10memTestcppv+0xdc>
            putc('a' + digit - 10);
    800016ec:	05750513          	addi	a0,a0,87
    800016f0:	00004097          	auipc	ra,0x4
    800016f4:	bb8080e7          	jalr	-1096(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800016f8:	fff4849b          	addiw	s1,s1,-1
    800016fc:	0204c463          	bltz	s1,80001724 <_Z10memTestcppv+0x104>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80001700:	0024951b          	slliw	a0,s1,0x2
    80001704:	00a9d533          	srl	a0,s3,a0
    80001708:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    8000170c:	00900793          	li	a5,9
    80001710:	fca7cee3          	blt	a5,a0,800016ec <_Z10memTestcppv+0xcc>
            putc('0' + digit);
    80001714:	03050513          	addi	a0,a0,48
    80001718:	00004097          	auipc	ra,0x4
    8000171c:	b90080e7          	jalr	-1136(ra) # 800052a8 <_Z4putcc>
    80001720:	fd9ff06f          	j	800016f8 <_Z10memTestcppv+0xd8>
    putc('\n');
    80001724:	00a00513          	li	a0,10
    80001728:	00004097          	auipc	ra,0x4
    8000172c:	b80080e7          	jalr	-1152(ra) # 800052a8 <_Z4putcc>
    int** matrix = new int*[n];
    80001730:	32000513          	li	a0,800
    80001734:	00000097          	auipc	ra,0x0
    80001738:	b20080e7          	jalr	-1248(ra) # 80001254 <_Znam>
    8000173c:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80001740:	00000493          	li	s1,0
    80001744:	0080006f          	j	8000174c <_Z10memTestcppv+0x12c>
    80001748:	0014849b          	addiw	s1,s1,1
    8000174c:	06300793          	li	a5,99
    80001750:	0497c663          	blt	a5,s1,8000179c <_Z10memTestcppv+0x17c>
        matrix[i] = new int[k];
    80001754:	00349a13          	slli	s4,s1,0x3
    80001758:	01490a33          	add	s4,s2,s4
    8000175c:	19000513          	li	a0,400
    80001760:	00000097          	auipc	ra,0x0
    80001764:	af4080e7          	jalr	-1292(ra) # 80001254 <_Znam>
    80001768:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    8000176c:	00000713          	li	a4,0
    80001770:	06300793          	li	a5,99
    80001774:	fce7cae3          	blt	a5,a4,80001748 <_Z10memTestcppv+0x128>
            matrix[i][j] = i * k + j;
    80001778:	06400793          	li	a5,100
    8000177c:	029787bb          	mulw	a5,a5,s1
    80001780:	000a3683          	ld	a3,0(s4)
    80001784:	00271613          	slli	a2,a4,0x2
    80001788:	00c686b3          	add	a3,a3,a2
    8000178c:	00e787bb          	addw	a5,a5,a4
    80001790:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80001794:	0017071b          	addiw	a4,a4,1
    80001798:	fd9ff06f          	j	80001770 <_Z10memTestcppv+0x150>
    for(int i = 0; i < n; i++){
    8000179c:	00000a13          	li	s4,0
    800017a0:	07c0006f          	j	8000181c <_Z10memTestcppv+0x1fc>
        for(int j = 0; j < k; j++){
    800017a4:	0014849b          	addiw	s1,s1,1
    800017a8:	06300793          	li	a5,99
    800017ac:	0497ca63          	blt	a5,s1,80001800 <_Z10memTestcppv+0x1e0>
            assert(matrix[i][j] == i * k + j);
    800017b0:	003a1793          	slli	a5,s4,0x3
    800017b4:	00f907b3          	add	a5,s2,a5
    800017b8:	0007b783          	ld	a5,0(a5)
    800017bc:	00249713          	slli	a4,s1,0x2
    800017c0:	00e787b3          	add	a5,a5,a4
    800017c4:	0007a703          	lw	a4,0(a5)
    800017c8:	06400793          	li	a5,100
    800017cc:	034787bb          	mulw	a5,a5,s4
    800017d0:	009787bb          	addw	a5,a5,s1
    800017d4:	fcf708e3          	beq	a4,a5,800017a4 <_Z10memTestcppv+0x184>
    800017d8:	0000b697          	auipc	a3,0xb
    800017dc:	89068693          	addi	a3,a3,-1904 # 8000c068 <_ZTV9Semaphore+0x20>
    800017e0:	03000613          	li	a2,48
    800017e4:	0000b597          	auipc	a1,0xb
    800017e8:	89c58593          	addi	a1,a1,-1892 # 8000c080 <_ZTV9Semaphore+0x38>
    800017ec:	0000b517          	auipc	a0,0xb
    800017f0:	8ac50513          	addi	a0,a0,-1876 # 8000c098 <_ZTV9Semaphore+0x50>
    800017f4:	00004097          	auipc	ra,0x4
    800017f8:	ebc080e7          	jalr	-324(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    800017fc:	fa9ff06f          	j	800017a4 <_Z10memTestcppv+0x184>
        delete[] matrix[i];
    80001800:	003a1793          	slli	a5,s4,0x3
    80001804:	00f907b3          	add	a5,s2,a5
    80001808:	0007b503          	ld	a0,0(a5)
    8000180c:	00050663          	beqz	a0,80001818 <_Z10memTestcppv+0x1f8>
    80001810:	00000097          	auipc	ra,0x0
    80001814:	a6c080e7          	jalr	-1428(ra) # 8000127c <_ZdaPv>
    for(int i = 0; i < n; i++){
    80001818:	001a0a1b          	addiw	s4,s4,1
    8000181c:	06300793          	li	a5,99
    80001820:	0147c663          	blt	a5,s4,8000182c <_Z10memTestcppv+0x20c>
        for(int j = 0; j < k; j++){
    80001824:	00000493          	li	s1,0
    80001828:	f81ff06f          	j	800017a8 <_Z10memTestcppv+0x188>
    delete[] matrix;
    8000182c:	00090863          	beqz	s2,8000183c <_Z10memTestcppv+0x21c>
    80001830:	00090513          	mv	a0,s2
    80001834:	00000097          	auipc	ra,0x0
    80001838:	a48080e7          	jalr	-1464(ra) # 8000127c <_ZdaPv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    8000183c:	0000e517          	auipc	a0,0xe
    80001840:	9cc53503          	ld	a0,-1588(a0) # 8000f208 <_ZN11HeapManager8instanceE>
    80001844:	00002097          	auipc	ra,0x2
    80001848:	cd0080e7          	jalr	-816(ra) # 80003514 <_ZN11HeapManager17getHeapFreeMemoryEv>
    8000184c:	00050493          	mv	s1,a0
    putc('F');
    80001850:	04600513          	li	a0,70
    80001854:	00004097          	auipc	ra,0x4
    80001858:	a54080e7          	jalr	-1452(ra) # 800052a8 <_Z4putcc>
    putc('r');
    8000185c:	07200513          	li	a0,114
    80001860:	00004097          	auipc	ra,0x4
    80001864:	a48080e7          	jalr	-1464(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001868:	06500513          	li	a0,101
    8000186c:	00004097          	auipc	ra,0x4
    80001870:	a3c080e7          	jalr	-1476(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001874:	06500513          	li	a0,101
    80001878:	00004097          	auipc	ra,0x4
    8000187c:	a30080e7          	jalr	-1488(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80001880:	02000513          	li	a0,32
    80001884:	00004097          	auipc	ra,0x4
    80001888:	a24080e7          	jalr	-1500(ra) # 800052a8 <_Z4putcc>
    putc('m');
    8000188c:	06d00513          	li	a0,109
    80001890:	00004097          	auipc	ra,0x4
    80001894:	a18080e7          	jalr	-1512(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001898:	06500513          	li	a0,101
    8000189c:	00004097          	auipc	ra,0x4
    800018a0:	a0c080e7          	jalr	-1524(ra) # 800052a8 <_Z4putcc>
    putc('m');
    800018a4:	06d00513          	li	a0,109
    800018a8:	00004097          	auipc	ra,0x4
    800018ac:	a00080e7          	jalr	-1536(ra) # 800052a8 <_Z4putcc>
    putc('o');
    800018b0:	06f00513          	li	a0,111
    800018b4:	00004097          	auipc	ra,0x4
    800018b8:	9f4080e7          	jalr	-1548(ra) # 800052a8 <_Z4putcc>
    putc('r');
    800018bc:	07200513          	li	a0,114
    800018c0:	00004097          	auipc	ra,0x4
    800018c4:	9e8080e7          	jalr	-1560(ra) # 800052a8 <_Z4putcc>
    putc('y');
    800018c8:	07900513          	li	a0,121
    800018cc:	00004097          	auipc	ra,0x4
    800018d0:	9dc080e7          	jalr	-1572(ra) # 800052a8 <_Z4putcc>
    putc(':');
    800018d4:	03a00513          	li	a0,58
    800018d8:	00004097          	auipc	ra,0x4
    800018dc:	9d0080e7          	jalr	-1584(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800018e0:	00f00913          	li	s2,15
    800018e4:	0140006f          	j	800018f8 <_Z10memTestcppv+0x2d8>
            putc('a' + digit - 10);
    800018e8:	05750513          	addi	a0,a0,87
    800018ec:	00004097          	auipc	ra,0x4
    800018f0:	9bc080e7          	jalr	-1604(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800018f4:	fff9091b          	addiw	s2,s2,-1
    800018f8:	02094463          	bltz	s2,80001920 <_Z10memTestcppv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    800018fc:	0029151b          	slliw	a0,s2,0x2
    80001900:	00a4d533          	srl	a0,s1,a0
    80001904:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001908:	00900793          	li	a5,9
    8000190c:	fca7cee3          	blt	a5,a0,800018e8 <_Z10memTestcppv+0x2c8>
            putc('0' + digit);
    80001910:	03050513          	addi	a0,a0,48
    80001914:	00004097          	auipc	ra,0x4
    80001918:	994080e7          	jalr	-1644(ra) # 800052a8 <_Z4putcc>
    8000191c:	fd9ff06f          	j	800018f4 <_Z10memTestcppv+0x2d4>
    putc('\n');
    80001920:	00a00513          	li	a0,10
    80001924:	00004097          	auipc	ra,0x4
    80001928:	984080e7          	jalr	-1660(ra) # 800052a8 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    8000192c:	409989b3          	sub	s3,s3,s1
    putc('D');
    80001930:	04400513          	li	a0,68
    80001934:	00004097          	auipc	ra,0x4
    80001938:	974080e7          	jalr	-1676(ra) # 800052a8 <_Z4putcc>
    putc('i');
    8000193c:	06900513          	li	a0,105
    80001940:	00004097          	auipc	ra,0x4
    80001944:	968080e7          	jalr	-1688(ra) # 800052a8 <_Z4putcc>
    putc('f');
    80001948:	06600513          	li	a0,102
    8000194c:	00004097          	auipc	ra,0x4
    80001950:	95c080e7          	jalr	-1700(ra) # 800052a8 <_Z4putcc>
    putc('f');
    80001954:	06600513          	li	a0,102
    80001958:	00004097          	auipc	ra,0x4
    8000195c:	950080e7          	jalr	-1712(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001960:	06500513          	li	a0,101
    80001964:	00004097          	auipc	ra,0x4
    80001968:	944080e7          	jalr	-1724(ra) # 800052a8 <_Z4putcc>
    putc('r');
    8000196c:	07200513          	li	a0,114
    80001970:	00004097          	auipc	ra,0x4
    80001974:	938080e7          	jalr	-1736(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001978:	06500513          	li	a0,101
    8000197c:	00004097          	auipc	ra,0x4
    80001980:	92c080e7          	jalr	-1748(ra) # 800052a8 <_Z4putcc>
    putc('n');
    80001984:	06e00513          	li	a0,110
    80001988:	00004097          	auipc	ra,0x4
    8000198c:	920080e7          	jalr	-1760(ra) # 800052a8 <_Z4putcc>
    putc('c');
    80001990:	06300513          	li	a0,99
    80001994:	00004097          	auipc	ra,0x4
    80001998:	914080e7          	jalr	-1772(ra) # 800052a8 <_Z4putcc>
    putc('e');
    8000199c:	06500513          	li	a0,101
    800019a0:	00004097          	auipc	ra,0x4
    800019a4:	908080e7          	jalr	-1784(ra) # 800052a8 <_Z4putcc>
    putc(':');
    800019a8:	03a00513          	li	a0,58
    800019ac:	00004097          	auipc	ra,0x4
    800019b0:	8fc080e7          	jalr	-1796(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800019b4:	00f00493          	li	s1,15
    800019b8:	0140006f          	j	800019cc <_Z10memTestcppv+0x3ac>
            putc('a' + digit - 10);
    800019bc:	05750513          	addi	a0,a0,87
    800019c0:	00004097          	auipc	ra,0x4
    800019c4:	8e8080e7          	jalr	-1816(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800019c8:	fff4849b          	addiw	s1,s1,-1
    800019cc:	0204c463          	bltz	s1,800019f4 <_Z10memTestcppv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    800019d0:	0024951b          	slliw	a0,s1,0x2
    800019d4:	00a9d533          	srl	a0,s3,a0
    800019d8:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800019dc:	00900793          	li	a5,9
    800019e0:	fca7cee3          	blt	a5,a0,800019bc <_Z10memTestcppv+0x39c>
            putc('0' + digit);
    800019e4:	03050513          	addi	a0,a0,48
    800019e8:	00004097          	auipc	ra,0x4
    800019ec:	8c0080e7          	jalr	-1856(ra) # 800052a8 <_Z4putcc>
    800019f0:	fd9ff06f          	j	800019c8 <_Z10memTestcppv+0x3a8>
    putc('\n');
    800019f4:	00a00513          	li	a0,10
    800019f8:	00004097          	auipc	ra,0x4
    800019fc:	8b0080e7          	jalr	-1872(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    80001a00:	00a00513          	li	a0,10
    80001a04:	00004097          	auipc	ra,0x4
    80001a08:	8a4080e7          	jalr	-1884(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    80001a0c:	00a00513          	li	a0,10
    80001a10:	00004097          	auipc	ra,0x4
    80001a14:	898080e7          	jalr	-1896(ra) # 800052a8 <_Z4putcc>
}
    80001a18:	02813083          	ld	ra,40(sp)
    80001a1c:	02013403          	ld	s0,32(sp)
    80001a20:	01813483          	ld	s1,24(sp)
    80001a24:	01013903          	ld	s2,16(sp)
    80001a28:	00813983          	ld	s3,8(sp)
    80001a2c:	00013a03          	ld	s4,0(sp)
    80001a30:	03010113          	addi	sp,sp,48
    80001a34:	00008067          	ret

0000000080001a38 <_Z11usermainCPPPv>:


void usermainCPP(void* arg){
    80001a38:	fd010113          	addi	sp,sp,-48
    80001a3c:	02113423          	sd	ra,40(sp)
    80001a40:	02813023          	sd	s0,32(sp)
    80001a44:	00913c23          	sd	s1,24(sp)
    80001a48:	01213823          	sd	s2,16(sp)
    80001a4c:	01313423          	sd	s3,8(sp)
    80001a50:	03010413          	addi	s0,sp,48
    ccpp = 't';
    80001a54:	07400793          	li	a5,116
    80001a58:	0000d717          	auipc	a4,0xd
    80001a5c:	76f70423          	sb	a5,1896(a4) # 8000f1c0 <ccpp>
        memTestcpp();
        memTestcpp();
        memTestcpp();
        return;
    }
    memTestcpp();
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	bc0080e7          	jalr	-1088(ra) # 80001620 <_Z10memTestcppv>
    putc('0');
    80001a68:	03000513          	li	a0,48
    80001a6c:	00004097          	auipc	ra,0x4
    80001a70:	83c080e7          	jalr	-1988(ra) # 800052a8 <_Z4putcc>
    Thread *t1, *t2;
    t1 = new Thread(thread_test_1cpp, 0);
    80001a74:	02000513          	li	a0,32
    80001a78:	fffff097          	auipc	ra,0xfffff
    80001a7c:	724080e7          	jalr	1828(ra) # 8000119c <_Znwm>
    80001a80:	00050913          	mv	s2,a0
    80001a84:	00000613          	li	a2,0
    80001a88:	00000597          	auipc	a1,0x0
    80001a8c:	a7058593          	addi	a1,a1,-1424 # 800014f8 <_Z16thread_test_1cppPv>
    80001a90:	00000097          	auipc	ra,0x0
    80001a94:	814080e7          	jalr	-2028(ra) # 800012a4 <_ZN6ThreadC1EPFvPvES0_>
    t2 = new Thread(thread_test_2cpp, 0);
    80001a98:	02000513          	li	a0,32
    80001a9c:	fffff097          	auipc	ra,0xfffff
    80001aa0:	700080e7          	jalr	1792(ra) # 8000119c <_Znwm>
    80001aa4:	00050493          	mv	s1,a0
    80001aa8:	00000613          	li	a2,0
    80001aac:	00000597          	auipc	a1,0x0
    80001ab0:	ae058593          	addi	a1,a1,-1312 # 8000158c <_Z16thread_test_2cppPv>
    80001ab4:	fffff097          	auipc	ra,0xfffff
    80001ab8:	7f0080e7          	jalr	2032(ra) # 800012a4 <_ZN6ThreadC1EPFvPvES0_>
    if(ccpp == 's'){
    80001abc:	0000d717          	auipc	a4,0xd
    80001ac0:	70474703          	lbu	a4,1796(a4) # 8000f1c0 <ccpp>
    80001ac4:	07300793          	li	a5,115
    80001ac8:	0cf70863          	beq	a4,a5,80001b98 <_Z11usermainCPPPv+0x160>
        sem1cpp = new Semaphore(0);
        sem2cpp = new Semaphore(0);
    }
    t1->start();
    80001acc:	00090513          	mv	a0,s2
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	804080e7          	jalr	-2044(ra) # 800012d4 <_ZN6Thread5startEv>
    t2->start();
    80001ad8:	00048513          	mv	a0,s1
    80001adc:	fffff097          	auipc	ra,0xfffff
    80001ae0:	7f8080e7          	jalr	2040(ra) # 800012d4 <_ZN6Thread5startEv>
    if(ccpp == 's')sem1cpp->wait();
    80001ae4:	0000d717          	auipc	a4,0xd
    80001ae8:	6dc74703          	lbu	a4,1756(a4) # 8000f1c0 <ccpp>
    80001aec:	07300793          	li	a5,115
    80001af0:	0ef70a63          	beq	a4,a5,80001be4 <_Z11usermainCPPPv+0x1ac>
    putc('3');
    80001af4:	03300513          	li	a0,51
    80001af8:	00003097          	auipc	ra,0x3
    80001afc:	7b0080e7          	jalr	1968(ra) # 800052a8 <_Z4putcc>
    if(ccpp == 't')t2->join();
    80001b00:	0000d717          	auipc	a4,0xd
    80001b04:	6c074703          	lbu	a4,1728(a4) # 8000f1c0 <ccpp>
    80001b08:	07400793          	li	a5,116
    80001b0c:	0ef70663          	beq	a4,a5,80001bf8 <_Z11usermainCPPPv+0x1c0>
    putc('4');
    80001b10:	03400513          	li	a0,52
    80001b14:	00003097          	auipc	ra,0x3
    80001b18:	794080e7          	jalr	1940(ra) # 800052a8 <_Z4putcc>
    if(ccpp == 't')t1->join();
    80001b1c:	0000d717          	auipc	a4,0xd
    80001b20:	6a474703          	lbu	a4,1700(a4) # 8000f1c0 <ccpp>
    80001b24:	07400793          	li	a5,116
    80001b28:	0ef70063          	beq	a4,a5,80001c08 <_Z11usermainCPPPv+0x1d0>
    if(ccpp == 's')sem2cpp->wait();
    80001b2c:	0000d717          	auipc	a4,0xd
    80001b30:	69474703          	lbu	a4,1684(a4) # 8000f1c0 <ccpp>
    80001b34:	07300793          	li	a5,115
    80001b38:	0ef70063          	beq	a4,a5,80001c18 <_Z11usermainCPPPv+0x1e0>
    putc('5');
    80001b3c:	03500513          	li	a0,53
    80001b40:	00003097          	auipc	ra,0x3
    80001b44:	768080e7          	jalr	1896(ra) # 800052a8 <_Z4putcc>
    if(ccpp == 's')t2->join();
    80001b48:	0000d717          	auipc	a4,0xd
    80001b4c:	67874703          	lbu	a4,1656(a4) # 8000f1c0 <ccpp>
    80001b50:	07300793          	li	a5,115
    80001b54:	0cf70c63          	beq	a4,a5,80001c2c <_Z11usermainCPPPv+0x1f4>
    if(ccpp == 's')t1->join();
    80001b58:	0000d717          	auipc	a4,0xd
    80001b5c:	66874703          	lbu	a4,1640(a4) # 8000f1c0 <ccpp>
    80001b60:	07300793          	li	a5,115
    80001b64:	0cf70c63          	beq	a4,a5,80001c3c <_Z11usermainCPPPv+0x204>
    putc('\n');
    80001b68:	00a00513          	li	a0,10
    80001b6c:	00003097          	auipc	ra,0x3
    80001b70:	73c080e7          	jalr	1852(ra) # 800052a8 <_Z4putcc>
    memTestcpp();
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	aac080e7          	jalr	-1364(ra) # 80001620 <_Z10memTestcppv>
    80001b7c:	02813083          	ld	ra,40(sp)
    80001b80:	02013403          	ld	s0,32(sp)
    80001b84:	01813483          	ld	s1,24(sp)
    80001b88:	01013903          	ld	s2,16(sp)
    80001b8c:	00813983          	ld	s3,8(sp)
    80001b90:	03010113          	addi	sp,sp,48
    80001b94:	00008067          	ret
        sem1cpp = new Semaphore(0);
    80001b98:	01000513          	li	a0,16
    80001b9c:	fffff097          	auipc	ra,0xfffff
    80001ba0:	600080e7          	jalr	1536(ra) # 8000119c <_Znwm>
    80001ba4:	00050993          	mv	s3,a0
    80001ba8:	00000593          	li	a1,0
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	828080e7          	jalr	-2008(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80001bb4:	0000d797          	auipc	a5,0xd
    80001bb8:	6137be23          	sd	s3,1564(a5) # 8000f1d0 <sem1cpp>
        sem2cpp = new Semaphore(0);
    80001bbc:	01000513          	li	a0,16
    80001bc0:	fffff097          	auipc	ra,0xfffff
    80001bc4:	5dc080e7          	jalr	1500(ra) # 8000119c <_Znwm>
    80001bc8:	00050993          	mv	s3,a0
    80001bcc:	00000593          	li	a1,0
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	804080e7          	jalr	-2044(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80001bd8:	0000d797          	auipc	a5,0xd
    80001bdc:	5f37b823          	sd	s3,1520(a5) # 8000f1c8 <sem2cpp>
    80001be0:	eedff06f          	j	80001acc <_Z11usermainCPPPv+0x94>
    if(ccpp == 's')sem1cpp->wait();
    80001be4:	0000d517          	auipc	a0,0xd
    80001be8:	5ec53503          	ld	a0,1516(a0) # 8000f1d0 <sem1cpp>
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	820080e7          	jalr	-2016(ra) # 8000140c <_ZN9Semaphore4waitEv>
    80001bf4:	f01ff06f          	j	80001af4 <_Z11usermainCPPPv+0xbc>
    if(ccpp == 't')t2->join();
    80001bf8:	00048513          	mv	a0,s1
    80001bfc:	fffff097          	auipc	ra,0xfffff
    80001c00:	72c080e7          	jalr	1836(ra) # 80001328 <_ZN6Thread4joinEv>
    80001c04:	f0dff06f          	j	80001b10 <_Z11usermainCPPPv+0xd8>
    if(ccpp == 't')t1->join();
    80001c08:	00090513          	mv	a0,s2
    80001c0c:	fffff097          	auipc	ra,0xfffff
    80001c10:	71c080e7          	jalr	1820(ra) # 80001328 <_ZN6Thread4joinEv>
    80001c14:	f19ff06f          	j	80001b2c <_Z11usermainCPPPv+0xf4>
    if(ccpp == 's')sem2cpp->wait();
    80001c18:	0000d517          	auipc	a0,0xd
    80001c1c:	5b053503          	ld	a0,1456(a0) # 8000f1c8 <sem2cpp>
    80001c20:	fffff097          	auipc	ra,0xfffff
    80001c24:	7ec080e7          	jalr	2028(ra) # 8000140c <_ZN9Semaphore4waitEv>
    80001c28:	f15ff06f          	j	80001b3c <_Z11usermainCPPPv+0x104>
    if(ccpp == 's')t2->join();
    80001c2c:	00048513          	mv	a0,s1
    80001c30:	fffff097          	auipc	ra,0xfffff
    80001c34:	6f8080e7          	jalr	1784(ra) # 80001328 <_ZN6Thread4joinEv>
    80001c38:	f21ff06f          	j	80001b58 <_Z11usermainCPPPv+0x120>
    if(ccpp == 's')t1->join();
    80001c3c:	00090513          	mv	a0,s2
    80001c40:	fffff097          	auipc	ra,0xfffff
    80001c44:	6e8080e7          	jalr	1768(ra) # 80001328 <_ZN6Thread4joinEv>
    80001c48:	f21ff06f          	j	80001b68 <_Z11usermainCPPPv+0x130>
    80001c4c:	00050493          	mv	s1,a0
    t1 = new Thread(thread_test_1cpp, 0);
    80001c50:	00090513          	mv	a0,s2
    80001c54:	fffff097          	auipc	ra,0xfffff
    80001c58:	570080e7          	jalr	1392(ra) # 800011c4 <_ZdlPv>
    80001c5c:	00048513          	mv	a0,s1
    80001c60:	0000e097          	auipc	ra,0xe
    80001c64:	708080e7          	jalr	1800(ra) # 80010368 <_Unwind_Resume>
    80001c68:	00050913          	mv	s2,a0
    t2 = new Thread(thread_test_2cpp, 0);
    80001c6c:	00048513          	mv	a0,s1
    80001c70:	fffff097          	auipc	ra,0xfffff
    80001c74:	554080e7          	jalr	1364(ra) # 800011c4 <_ZdlPv>
    80001c78:	00090513          	mv	a0,s2
    80001c7c:	0000e097          	auipc	ra,0xe
    80001c80:	6ec080e7          	jalr	1772(ra) # 80010368 <_Unwind_Resume>
    80001c84:	00050493          	mv	s1,a0
        sem1cpp = new Semaphore(0);
    80001c88:	00098513          	mv	a0,s3
    80001c8c:	fffff097          	auipc	ra,0xfffff
    80001c90:	538080e7          	jalr	1336(ra) # 800011c4 <_ZdlPv>
    80001c94:	00048513          	mv	a0,s1
    80001c98:	0000e097          	auipc	ra,0xe
    80001c9c:	6d0080e7          	jalr	1744(ra) # 80010368 <_Unwind_Resume>
    80001ca0:	00050493          	mv	s1,a0
        sem2cpp = new Semaphore(0);
    80001ca4:	00098513          	mv	a0,s3
    80001ca8:	fffff097          	auipc	ra,0xfffff
    80001cac:	51c080e7          	jalr	1308(ra) # 800011c4 <_ZdlPv>
    80001cb0:	00048513          	mv	a0,s1
    80001cb4:	0000e097          	auipc	ra,0xe
    80001cb8:	6b4080e7          	jalr	1716(ra) # 80010368 <_Unwind_Resume>

0000000080001cbc <_Z13thread_test_1Pv>:

sem_t sem1, sem2;

char c;

void thread_test_1(void* args){
    80001cbc:	ff010113          	addi	sp,sp,-16
    80001cc0:	00113423          	sd	ra,8(sp)
    80001cc4:	00813023          	sd	s0,0(sp)
    80001cc8:	01010413          	addi	s0,sp,16
    putc('1');
    80001ccc:	03100513          	li	a0,49
    80001cd0:	00003097          	auipc	ra,0x3
    80001cd4:	5d8080e7          	jalr	1496(ra) # 800052a8 <_Z4putcc>
    putc('s');
    80001cd8:	07300513          	li	a0,115
    80001cdc:	00003097          	auipc	ra,0x3
    80001ce0:	5cc080e7          	jalr	1484(ra) # 800052a8 <_Z4putcc>
    if(c == 't')time_sleep(60);
    80001ce4:	0000d717          	auipc	a4,0xd
    80001ce8:	4f474703          	lbu	a4,1268(a4) # 8000f1d8 <c>
    80001cec:	07400793          	li	a5,116
    80001cf0:	02f70e63          	beq	a4,a5,80001d2c <_Z13thread_test_1Pv+0x70>
    putc('1');
    80001cf4:	03100513          	li	a0,49
    80001cf8:	00003097          	auipc	ra,0x3
    80001cfc:	5b0080e7          	jalr	1456(ra) # 800052a8 <_Z4putcc>
    if(c == 's')sem_signal(sem1);
    80001d00:	0000d717          	auipc	a4,0xd
    80001d04:	4d874703          	lbu	a4,1240(a4) # 8000f1d8 <c>
    80001d08:	07300793          	li	a5,115
    80001d0c:	02f70863          	beq	a4,a5,80001d3c <_Z13thread_test_1Pv+0x80>
    putc('S');
    80001d10:	05300513          	li	a0,83
    80001d14:	00003097          	auipc	ra,0x3
    80001d18:	594080e7          	jalr	1428(ra) # 800052a8 <_Z4putcc>
}
    80001d1c:	00813083          	ld	ra,8(sp)
    80001d20:	00013403          	ld	s0,0(sp)
    80001d24:	01010113          	addi	sp,sp,16
    80001d28:	00008067          	ret
    if(c == 't')time_sleep(60);
    80001d2c:	03c00513          	li	a0,60
    80001d30:	00003097          	auipc	ra,0x3
    80001d34:	40c080e7          	jalr	1036(ra) # 8000513c <_Z10time_sleepm>
    80001d38:	fbdff06f          	j	80001cf4 <_Z13thread_test_1Pv+0x38>
    if(c == 's')sem_signal(sem1);
    80001d3c:	0000d517          	auipc	a0,0xd
    80001d40:	4ac53503          	ld	a0,1196(a0) # 8000f1e8 <sem1>
    80001d44:	00003097          	auipc	ra,0x3
    80001d48:	4b4080e7          	jalr	1204(ra) # 800051f8 <_Z10sem_signalP4_sem>
    80001d4c:	fc5ff06f          	j	80001d10 <_Z13thread_test_1Pv+0x54>

0000000080001d50 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80001d50:	ff010113          	addi	sp,sp,-16
    80001d54:	00113423          	sd	ra,8(sp)
    80001d58:	00813023          	sd	s0,0(sp)
    80001d5c:	01010413          	addi	s0,sp,16
    putc('2');
    80001d60:	03200513          	li	a0,50
    80001d64:	00003097          	auipc	ra,0x3
    80001d68:	544080e7          	jalr	1348(ra) # 800052a8 <_Z4putcc>
    putc('s');
    80001d6c:	07300513          	li	a0,115
    80001d70:	00003097          	auipc	ra,0x3
    80001d74:	538080e7          	jalr	1336(ra) # 800052a8 <_Z4putcc>
    if(c == 't')time_sleep(30);
    80001d78:	0000d717          	auipc	a4,0xd
    80001d7c:	46074703          	lbu	a4,1120(a4) # 8000f1d8 <c>
    80001d80:	07400793          	li	a5,116
    80001d84:	02f70e63          	beq	a4,a5,80001dc0 <_Z13thread_test_2Pv+0x70>
    putc('2');
    80001d88:	03200513          	li	a0,50
    80001d8c:	00003097          	auipc	ra,0x3
    80001d90:	51c080e7          	jalr	1308(ra) # 800052a8 <_Z4putcc>
    if(c == 's')sem_signal(sem2);
    80001d94:	0000d717          	auipc	a4,0xd
    80001d98:	44474703          	lbu	a4,1092(a4) # 8000f1d8 <c>
    80001d9c:	07300793          	li	a5,115
    80001da0:	02f70863          	beq	a4,a5,80001dd0 <_Z13thread_test_2Pv+0x80>
    putc('S');
    80001da4:	05300513          	li	a0,83
    80001da8:	00003097          	auipc	ra,0x3
    80001dac:	500080e7          	jalr	1280(ra) # 800052a8 <_Z4putcc>
}
    80001db0:	00813083          	ld	ra,8(sp)
    80001db4:	00013403          	ld	s0,0(sp)
    80001db8:	01010113          	addi	sp,sp,16
    80001dbc:	00008067          	ret
    if(c == 't')time_sleep(30);
    80001dc0:	01e00513          	li	a0,30
    80001dc4:	00003097          	auipc	ra,0x3
    80001dc8:	378080e7          	jalr	888(ra) # 8000513c <_Z10time_sleepm>
    80001dcc:	fbdff06f          	j	80001d88 <_Z13thread_test_2Pv+0x38>
    if(c == 's')sem_signal(sem2);
    80001dd0:	0000d517          	auipc	a0,0xd
    80001dd4:	41053503          	ld	a0,1040(a0) # 8000f1e0 <sem2>
    80001dd8:	00003097          	auipc	ra,0x3
    80001ddc:	420080e7          	jalr	1056(ra) # 800051f8 <_Z10sem_signalP4_sem>
    80001de0:	fc5ff06f          	j	80001da4 <_Z13thread_test_2Pv+0x54>

0000000080001de4 <_Z7memTestv>:
void memTest(){
    80001de4:	fd010113          	addi	sp,sp,-48
    80001de8:	02113423          	sd	ra,40(sp)
    80001dec:	02813023          	sd	s0,32(sp)
    80001df0:	00913c23          	sd	s1,24(sp)
    80001df4:	01213823          	sd	s2,16(sp)
    80001df8:	01313423          	sd	s3,8(sp)
    80001dfc:	01413023          	sd	s4,0(sp)
    80001e00:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001e04:	0000d517          	auipc	a0,0xd
    80001e08:	40453503          	ld	a0,1028(a0) # 8000f208 <_ZN11HeapManager8instanceE>
    80001e0c:	00001097          	auipc	ra,0x1
    80001e10:	708080e7          	jalr	1800(ra) # 80003514 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80001e14:	00050993          	mv	s3,a0
    putc('F');
    80001e18:	04600513          	li	a0,70
    80001e1c:	00003097          	auipc	ra,0x3
    80001e20:	48c080e7          	jalr	1164(ra) # 800052a8 <_Z4putcc>
    putc('r');
    80001e24:	07200513          	li	a0,114
    80001e28:	00003097          	auipc	ra,0x3
    80001e2c:	480080e7          	jalr	1152(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001e30:	06500513          	li	a0,101
    80001e34:	00003097          	auipc	ra,0x3
    80001e38:	474080e7          	jalr	1140(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001e3c:	06500513          	li	a0,101
    80001e40:	00003097          	auipc	ra,0x3
    80001e44:	468080e7          	jalr	1128(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80001e48:	02000513          	li	a0,32
    80001e4c:	00003097          	auipc	ra,0x3
    80001e50:	45c080e7          	jalr	1116(ra) # 800052a8 <_Z4putcc>
    putc('m');
    80001e54:	06d00513          	li	a0,109
    80001e58:	00003097          	auipc	ra,0x3
    80001e5c:	450080e7          	jalr	1104(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80001e60:	06500513          	li	a0,101
    80001e64:	00003097          	auipc	ra,0x3
    80001e68:	444080e7          	jalr	1092(ra) # 800052a8 <_Z4putcc>
    putc('m');
    80001e6c:	06d00513          	li	a0,109
    80001e70:	00003097          	auipc	ra,0x3
    80001e74:	438080e7          	jalr	1080(ra) # 800052a8 <_Z4putcc>
    putc('o');
    80001e78:	06f00513          	li	a0,111
    80001e7c:	00003097          	auipc	ra,0x3
    80001e80:	42c080e7          	jalr	1068(ra) # 800052a8 <_Z4putcc>
    putc('r');
    80001e84:	07200513          	li	a0,114
    80001e88:	00003097          	auipc	ra,0x3
    80001e8c:	420080e7          	jalr	1056(ra) # 800052a8 <_Z4putcc>
    putc('y');
    80001e90:	07900513          	li	a0,121
    80001e94:	00003097          	auipc	ra,0x3
    80001e98:	414080e7          	jalr	1044(ra) # 800052a8 <_Z4putcc>
    putc(':');
    80001e9c:	03a00513          	li	a0,58
    80001ea0:	00003097          	auipc	ra,0x3
    80001ea4:	408080e7          	jalr	1032(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001ea8:	00f00493          	li	s1,15
    80001eac:	0140006f          	j	80001ec0 <_Z7memTestv+0xdc>
            putc('a' + digit - 10);
    80001eb0:	05750513          	addi	a0,a0,87
    80001eb4:	00003097          	auipc	ra,0x3
    80001eb8:	3f4080e7          	jalr	1012(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001ebc:	fff4849b          	addiw	s1,s1,-1
    80001ec0:	0204c463          	bltz	s1,80001ee8 <_Z7memTestv+0x104>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80001ec4:	0024951b          	slliw	a0,s1,0x2
    80001ec8:	00a9d533          	srl	a0,s3,a0
    80001ecc:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001ed0:	00900793          	li	a5,9
    80001ed4:	fca7cee3          	blt	a5,a0,80001eb0 <_Z7memTestv+0xcc>
            putc('0' + digit);
    80001ed8:	03050513          	addi	a0,a0,48
    80001edc:	00003097          	auipc	ra,0x3
    80001ee0:	3cc080e7          	jalr	972(ra) # 800052a8 <_Z4putcc>
    80001ee4:	fd9ff06f          	j	80001ebc <_Z7memTestv+0xd8>
    putc('\n');
    80001ee8:	00a00513          	li	a0,10
    80001eec:	00003097          	auipc	ra,0x3
    80001ef0:	3bc080e7          	jalr	956(ra) # 800052a8 <_Z4putcc>
    int** matrix = (int**)mem_alloc(n * sizeof(int*));
    80001ef4:	32000513          	li	a0,800
    80001ef8:	00003097          	auipc	ra,0x3
    80001efc:	108080e7          	jalr	264(ra) # 80005000 <_Z9mem_allocm>
    80001f00:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80001f04:	00000493          	li	s1,0
    80001f08:	0080006f          	j	80001f10 <_Z7memTestv+0x12c>
    80001f0c:	0014849b          	addiw	s1,s1,1
    80001f10:	06300793          	li	a5,99
    80001f14:	0497c663          	blt	a5,s1,80001f60 <_Z7memTestv+0x17c>
        matrix[i] = (int*)mem_alloc(k * sizeof(int));
    80001f18:	00349a13          	slli	s4,s1,0x3
    80001f1c:	01490a33          	add	s4,s2,s4
    80001f20:	19000513          	li	a0,400
    80001f24:	00003097          	auipc	ra,0x3
    80001f28:	0dc080e7          	jalr	220(ra) # 80005000 <_Z9mem_allocm>
    80001f2c:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80001f30:	00000713          	li	a4,0
    80001f34:	06300793          	li	a5,99
    80001f38:	fce7cae3          	blt	a5,a4,80001f0c <_Z7memTestv+0x128>
            matrix[i][j] = i * k + j;
    80001f3c:	06400793          	li	a5,100
    80001f40:	029787bb          	mulw	a5,a5,s1
    80001f44:	000a3683          	ld	a3,0(s4)
    80001f48:	00271613          	slli	a2,a4,0x2
    80001f4c:	00c686b3          	add	a3,a3,a2
    80001f50:	00e787bb          	addw	a5,a5,a4
    80001f54:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80001f58:	0017071b          	addiw	a4,a4,1
    80001f5c:	fd9ff06f          	j	80001f34 <_Z7memTestv+0x150>
    for(int i = 0; i < n; i++){
    80001f60:	00000a13          	li	s4,0
    80001f64:	0780006f          	j	80001fdc <_Z7memTestv+0x1f8>
        for(int j = 0; j < k; j++){
    80001f68:	0014849b          	addiw	s1,s1,1
    80001f6c:	06300793          	li	a5,99
    80001f70:	0497ca63          	blt	a5,s1,80001fc4 <_Z7memTestv+0x1e0>
            assert(matrix[i][j] == i * k + j);
    80001f74:	003a1793          	slli	a5,s4,0x3
    80001f78:	00f907b3          	add	a5,s2,a5
    80001f7c:	0007b783          	ld	a5,0(a5)
    80001f80:	00249713          	slli	a4,s1,0x2
    80001f84:	00e787b3          	add	a5,a5,a4
    80001f88:	0007a703          	lw	a4,0(a5)
    80001f8c:	06400793          	li	a5,100
    80001f90:	034787bb          	mulw	a5,a5,s4
    80001f94:	009787bb          	addw	a5,a5,s1
    80001f98:	fcf708e3          	beq	a4,a5,80001f68 <_Z7memTestv+0x184>
    80001f9c:	0000a697          	auipc	a3,0xa
    80001fa0:	11c68693          	addi	a3,a3,284 # 8000c0b8 <_ZTV9Semaphore+0x70>
    80001fa4:	02d00613          	li	a2,45
    80001fa8:	0000a597          	auipc	a1,0xa
    80001fac:	12058593          	addi	a1,a1,288 # 8000c0c8 <_ZTV9Semaphore+0x80>
    80001fb0:	0000a517          	auipc	a0,0xa
    80001fb4:	0e850513          	addi	a0,a0,232 # 8000c098 <_ZTV9Semaphore+0x50>
    80001fb8:	00003097          	auipc	ra,0x3
    80001fbc:	6f8080e7          	jalr	1784(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80001fc0:	fa9ff06f          	j	80001f68 <_Z7memTestv+0x184>
        mem_free(matrix[i]);
    80001fc4:	003a1793          	slli	a5,s4,0x3
    80001fc8:	00f907b3          	add	a5,s2,a5
    80001fcc:	0007b503          	ld	a0,0(a5)
    80001fd0:	00003097          	auipc	ra,0x3
    80001fd4:	060080e7          	jalr	96(ra) # 80005030 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80001fd8:	001a0a1b          	addiw	s4,s4,1
    80001fdc:	06300793          	li	a5,99
    80001fe0:	0147c663          	blt	a5,s4,80001fec <_Z7memTestv+0x208>
        for(int j = 0; j < k; j++){
    80001fe4:	00000493          	li	s1,0
    80001fe8:	f85ff06f          	j	80001f6c <_Z7memTestv+0x188>
    mem_free(matrix);
    80001fec:	00090513          	mv	a0,s2
    80001ff0:	00003097          	auipc	ra,0x3
    80001ff4:	040080e7          	jalr	64(ra) # 80005030 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001ff8:	0000d517          	auipc	a0,0xd
    80001ffc:	21053503          	ld	a0,528(a0) # 8000f208 <_ZN11HeapManager8instanceE>
    80002000:	00001097          	auipc	ra,0x1
    80002004:	514080e7          	jalr	1300(ra) # 80003514 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002008:	00050493          	mv	s1,a0
    putc('F');
    8000200c:	04600513          	li	a0,70
    80002010:	00003097          	auipc	ra,0x3
    80002014:	298080e7          	jalr	664(ra) # 800052a8 <_Z4putcc>
    putc('r');
    80002018:	07200513          	li	a0,114
    8000201c:	00003097          	auipc	ra,0x3
    80002020:	28c080e7          	jalr	652(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002024:	06500513          	li	a0,101
    80002028:	00003097          	auipc	ra,0x3
    8000202c:	280080e7          	jalr	640(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002030:	06500513          	li	a0,101
    80002034:	00003097          	auipc	ra,0x3
    80002038:	274080e7          	jalr	628(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    8000203c:	02000513          	li	a0,32
    80002040:	00003097          	auipc	ra,0x3
    80002044:	268080e7          	jalr	616(ra) # 800052a8 <_Z4putcc>
    putc('m');
    80002048:	06d00513          	li	a0,109
    8000204c:	00003097          	auipc	ra,0x3
    80002050:	25c080e7          	jalr	604(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002054:	06500513          	li	a0,101
    80002058:	00003097          	auipc	ra,0x3
    8000205c:	250080e7          	jalr	592(ra) # 800052a8 <_Z4putcc>
    putc('m');
    80002060:	06d00513          	li	a0,109
    80002064:	00003097          	auipc	ra,0x3
    80002068:	244080e7          	jalr	580(ra) # 800052a8 <_Z4putcc>
    putc('o');
    8000206c:	06f00513          	li	a0,111
    80002070:	00003097          	auipc	ra,0x3
    80002074:	238080e7          	jalr	568(ra) # 800052a8 <_Z4putcc>
    putc('r');
    80002078:	07200513          	li	a0,114
    8000207c:	00003097          	auipc	ra,0x3
    80002080:	22c080e7          	jalr	556(ra) # 800052a8 <_Z4putcc>
    putc('y');
    80002084:	07900513          	li	a0,121
    80002088:	00003097          	auipc	ra,0x3
    8000208c:	220080e7          	jalr	544(ra) # 800052a8 <_Z4putcc>
    putc(':');
    80002090:	03a00513          	li	a0,58
    80002094:	00003097          	auipc	ra,0x3
    80002098:	214080e7          	jalr	532(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    8000209c:	00f00913          	li	s2,15
    800020a0:	0140006f          	j	800020b4 <_Z7memTestv+0x2d0>
            putc('a' + digit - 10);
    800020a4:	05750513          	addi	a0,a0,87
    800020a8:	00003097          	auipc	ra,0x3
    800020ac:	200080e7          	jalr	512(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800020b0:	fff9091b          	addiw	s2,s2,-1
    800020b4:	02094463          	bltz	s2,800020dc <_Z7memTestv+0x2f8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    800020b8:	0029151b          	slliw	a0,s2,0x2
    800020bc:	00a4d533          	srl	a0,s1,a0
    800020c0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800020c4:	00900793          	li	a5,9
    800020c8:	fca7cee3          	blt	a5,a0,800020a4 <_Z7memTestv+0x2c0>
            putc('0' + digit);
    800020cc:	03050513          	addi	a0,a0,48
    800020d0:	00003097          	auipc	ra,0x3
    800020d4:	1d8080e7          	jalr	472(ra) # 800052a8 <_Z4putcc>
    800020d8:	fd9ff06f          	j	800020b0 <_Z7memTestv+0x2cc>
    putc('\n');
    800020dc:	00a00513          	li	a0,10
    800020e0:	00003097          	auipc	ra,0x3
    800020e4:	1c8080e7          	jalr	456(ra) # 800052a8 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    800020e8:	409989b3          	sub	s3,s3,s1
    putc('D');
    800020ec:	04400513          	li	a0,68
    800020f0:	00003097          	auipc	ra,0x3
    800020f4:	1b8080e7          	jalr	440(ra) # 800052a8 <_Z4putcc>
    putc('i');
    800020f8:	06900513          	li	a0,105
    800020fc:	00003097          	auipc	ra,0x3
    80002100:	1ac080e7          	jalr	428(ra) # 800052a8 <_Z4putcc>
    putc('f');
    80002104:	06600513          	li	a0,102
    80002108:	00003097          	auipc	ra,0x3
    8000210c:	1a0080e7          	jalr	416(ra) # 800052a8 <_Z4putcc>
    putc('f');
    80002110:	06600513          	li	a0,102
    80002114:	00003097          	auipc	ra,0x3
    80002118:	194080e7          	jalr	404(ra) # 800052a8 <_Z4putcc>
    putc('e');
    8000211c:	06500513          	li	a0,101
    80002120:	00003097          	auipc	ra,0x3
    80002124:	188080e7          	jalr	392(ra) # 800052a8 <_Z4putcc>
    putc('r');
    80002128:	07200513          	li	a0,114
    8000212c:	00003097          	auipc	ra,0x3
    80002130:	17c080e7          	jalr	380(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002134:	06500513          	li	a0,101
    80002138:	00003097          	auipc	ra,0x3
    8000213c:	170080e7          	jalr	368(ra) # 800052a8 <_Z4putcc>
    putc('n');
    80002140:	06e00513          	li	a0,110
    80002144:	00003097          	auipc	ra,0x3
    80002148:	164080e7          	jalr	356(ra) # 800052a8 <_Z4putcc>
    putc('c');
    8000214c:	06300513          	li	a0,99
    80002150:	00003097          	auipc	ra,0x3
    80002154:	158080e7          	jalr	344(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002158:	06500513          	li	a0,101
    8000215c:	00003097          	auipc	ra,0x3
    80002160:	14c080e7          	jalr	332(ra) # 800052a8 <_Z4putcc>
    putc(':');
    80002164:	03a00513          	li	a0,58
    80002168:	00003097          	auipc	ra,0x3
    8000216c:	140080e7          	jalr	320(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002170:	00f00493          	li	s1,15
    80002174:	0140006f          	j	80002188 <_Z7memTestv+0x3a4>
            putc('a' + digit - 10);
    80002178:	05750513          	addi	a0,a0,87
    8000217c:	00003097          	auipc	ra,0x3
    80002180:	12c080e7          	jalr	300(ra) # 800052a8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002184:	fff4849b          	addiw	s1,s1,-1
    80002188:	0204c463          	bltz	s1,800021b0 <_Z7memTestv+0x3cc>
        int digit = (difference >> (i * 4)) & 0xf;
    8000218c:	0024951b          	slliw	a0,s1,0x2
    80002190:	00a9d533          	srl	a0,s3,a0
    80002194:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002198:	00900793          	li	a5,9
    8000219c:	fca7cee3          	blt	a5,a0,80002178 <_Z7memTestv+0x394>
            putc('0' + digit);
    800021a0:	03050513          	addi	a0,a0,48
    800021a4:	00003097          	auipc	ra,0x3
    800021a8:	104080e7          	jalr	260(ra) # 800052a8 <_Z4putcc>
    800021ac:	fd9ff06f          	j	80002184 <_Z7memTestv+0x3a0>
    putc('\n');
    800021b0:	00a00513          	li	a0,10
    800021b4:	00003097          	auipc	ra,0x3
    800021b8:	0f4080e7          	jalr	244(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    800021bc:	00a00513          	li	a0,10
    800021c0:	00003097          	auipc	ra,0x3
    800021c4:	0e8080e7          	jalr	232(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    800021c8:	00a00513          	li	a0,10
    800021cc:	00003097          	auipc	ra,0x3
    800021d0:	0dc080e7          	jalr	220(ra) # 800052a8 <_Z4putcc>
}
    800021d4:	02813083          	ld	ra,40(sp)
    800021d8:	02013403          	ld	s0,32(sp)
    800021dc:	01813483          	ld	s1,24(sp)
    800021e0:	01013903          	ld	s2,16(sp)
    800021e4:	00813983          	ld	s3,8(sp)
    800021e8:	00013a03          	ld	s4,0(sp)
    800021ec:	03010113          	addi	sp,sp,48
    800021f0:	00008067          	ret

00000000800021f4 <_Z8usermainPv>:


void usermain(void* arg){
    800021f4:	fd010113          	addi	sp,sp,-48
    800021f8:	02113423          	sd	ra,40(sp)
    800021fc:	02813023          	sd	s0,32(sp)
    80002200:	00913c23          	sd	s1,24(sp)
    80002204:	03010413          	addi	s0,sp,48
    c = 's';
    80002208:	0000d497          	auipc	s1,0xd
    8000220c:	fd048493          	addi	s1,s1,-48 # 8000f1d8 <c>
    80002210:	07300793          	li	a5,115
    80002214:	00f48023          	sb	a5,0(s1)
    if(c == 'm'){
        memTest();
        return;
    }
    putc('0');
    80002218:	03000513          	li	a0,48
    8000221c:	00003097          	auipc	ra,0x3
    80002220:	08c080e7          	jalr	140(ra) # 800052a8 <_Z4putcc>
    thread_t t1, t2;
    if(c == 's'){
    80002224:	0004c703          	lbu	a4,0(s1)
    80002228:	07300793          	li	a5,115
    8000222c:	0cf70663          	beq	a4,a5,800022f8 <_Z8usermainPv+0x104>
        sem_open(&sem1, 0);
        sem_open(&sem2, 0);
    }
    thread_create(&t1, thread_test_1, 0);
    80002230:	00000613          	li	a2,0
    80002234:	00000597          	auipc	a1,0x0
    80002238:	a8858593          	addi	a1,a1,-1400 # 80001cbc <_Z13thread_test_1Pv>
    8000223c:	fd840513          	addi	a0,s0,-40
    80002240:	00003097          	auipc	ra,0x3
    80002244:	e1c080e7          	jalr	-484(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002248:	00000613          	li	a2,0
    8000224c:	00000597          	auipc	a1,0x0
    80002250:	b0458593          	addi	a1,a1,-1276 # 80001d50 <_Z13thread_test_2Pv>
    80002254:	fd040513          	addi	a0,s0,-48
    80002258:	00003097          	auipc	ra,0x3
    8000225c:	e04080e7          	jalr	-508(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    if(c == 's')sem_wait(sem1);
    80002260:	0000d717          	auipc	a4,0xd
    80002264:	f7874703          	lbu	a4,-136(a4) # 8000f1d8 <c>
    80002268:	07300793          	li	a5,115
    8000226c:	0af70c63          	beq	a4,a5,80002324 <_Z8usermainPv+0x130>
    putc('3');
    80002270:	03300513          	li	a0,51
    80002274:	00003097          	auipc	ra,0x3
    80002278:	034080e7          	jalr	52(ra) # 800052a8 <_Z4putcc>
    if(c == 't')thread_join(t2);
    8000227c:	0000d717          	auipc	a4,0xd
    80002280:	f5c74703          	lbu	a4,-164(a4) # 8000f1d8 <c>
    80002284:	07400793          	li	a5,116
    80002288:	0af70863          	beq	a4,a5,80002338 <_Z8usermainPv+0x144>
    putc('4');
    8000228c:	03400513          	li	a0,52
    80002290:	00003097          	auipc	ra,0x3
    80002294:	018080e7          	jalr	24(ra) # 800052a8 <_Z4putcc>
    if(c == 't')thread_join(t1);
    80002298:	0000d717          	auipc	a4,0xd
    8000229c:	f4074703          	lbu	a4,-192(a4) # 8000f1d8 <c>
    800022a0:	07400793          	li	a5,116
    800022a4:	0af70263          	beq	a4,a5,80002348 <_Z8usermainPv+0x154>
    if(c == 's')sem_wait(sem2);
    800022a8:	0000d717          	auipc	a4,0xd
    800022ac:	f3074703          	lbu	a4,-208(a4) # 8000f1d8 <c>
    800022b0:	07300793          	li	a5,115
    800022b4:	0af70263          	beq	a4,a5,80002358 <_Z8usermainPv+0x164>
    putc('5');
    800022b8:	03500513          	li	a0,53
    800022bc:	00003097          	auipc	ra,0x3
    800022c0:	fec080e7          	jalr	-20(ra) # 800052a8 <_Z4putcc>
    if(c == 's')sem_close(sem1);
    800022c4:	0000d717          	auipc	a4,0xd
    800022c8:	f1474703          	lbu	a4,-236(a4) # 8000f1d8 <c>
    800022cc:	07300793          	li	a5,115
    800022d0:	08f70e63          	beq	a4,a5,8000236c <_Z8usermainPv+0x178>
    if(c == 's')sem_close(sem2);
    800022d4:	0000d717          	auipc	a4,0xd
    800022d8:	f0474703          	lbu	a4,-252(a4) # 8000f1d8 <c>
    800022dc:	07300793          	li	a5,115
    800022e0:	0af70063          	beq	a4,a5,80002380 <_Z8usermainPv+0x18c>
    800022e4:	02813083          	ld	ra,40(sp)
    800022e8:	02013403          	ld	s0,32(sp)
    800022ec:	01813483          	ld	s1,24(sp)
    800022f0:	03010113          	addi	sp,sp,48
    800022f4:	00008067          	ret
        sem_open(&sem1, 0);
    800022f8:	00000593          	li	a1,0
    800022fc:	0000d517          	auipc	a0,0xd
    80002300:	eec50513          	addi	a0,a0,-276 # 8000f1e8 <sem1>
    80002304:	00003097          	auipc	ra,0x3
    80002308:	e64080e7          	jalr	-412(ra) # 80005168 <_Z8sem_openPP4_semj>
        sem_open(&sem2, 0);
    8000230c:	00000593          	li	a1,0
    80002310:	0000d517          	auipc	a0,0xd
    80002314:	ed050513          	addi	a0,a0,-304 # 8000f1e0 <sem2>
    80002318:	00003097          	auipc	ra,0x3
    8000231c:	e50080e7          	jalr	-432(ra) # 80005168 <_Z8sem_openPP4_semj>
    80002320:	f11ff06f          	j	80002230 <_Z8usermainPv+0x3c>
    if(c == 's')sem_wait(sem1);
    80002324:	0000d517          	auipc	a0,0xd
    80002328:	ec453503          	ld	a0,-316(a0) # 8000f1e8 <sem1>
    8000232c:	00003097          	auipc	ra,0x3
    80002330:	ea0080e7          	jalr	-352(ra) # 800051cc <_Z8sem_waitP4_sem>
    80002334:	f3dff06f          	j	80002270 <_Z8usermainPv+0x7c>
    if(c == 't')thread_join(t2);
    80002338:	fd043503          	ld	a0,-48(s0)
    8000233c:	00003097          	auipc	ra,0x3
    80002340:	ddc080e7          	jalr	-548(ra) # 80005118 <_Z11thread_joinP7_thread>
    80002344:	f49ff06f          	j	8000228c <_Z8usermainPv+0x98>
    if(c == 't')thread_join(t1);
    80002348:	fd843503          	ld	a0,-40(s0)
    8000234c:	00003097          	auipc	ra,0x3
    80002350:	dcc080e7          	jalr	-564(ra) # 80005118 <_Z11thread_joinP7_thread>
    80002354:	f55ff06f          	j	800022a8 <_Z8usermainPv+0xb4>
    if(c == 's')sem_wait(sem2);
    80002358:	0000d517          	auipc	a0,0xd
    8000235c:	e8853503          	ld	a0,-376(a0) # 8000f1e0 <sem2>
    80002360:	00003097          	auipc	ra,0x3
    80002364:	e6c080e7          	jalr	-404(ra) # 800051cc <_Z8sem_waitP4_sem>
    80002368:	f51ff06f          	j	800022b8 <_Z8usermainPv+0xc4>
    if(c == 's')sem_close(sem1);
    8000236c:	0000d517          	auipc	a0,0xd
    80002370:	e7c53503          	ld	a0,-388(a0) # 8000f1e8 <sem1>
    80002374:	00003097          	auipc	ra,0x3
    80002378:	e2c080e7          	jalr	-468(ra) # 800051a0 <_Z9sem_closeP4_sem>
    8000237c:	f59ff06f          	j	800022d4 <_Z8usermainPv+0xe0>
    if(c == 's')sem_close(sem2);
    80002380:	0000d517          	auipc	a0,0xd
    80002384:	e6053503          	ld	a0,-416(a0) # 8000f1e0 <sem2>
    80002388:	00003097          	auipc	ra,0x3
    8000238c:	e18080e7          	jalr	-488(ra) # 800051a0 <_Z9sem_closeP4_sem>
    80002390:	f55ff06f          	j	800022e4 <_Z8usermainPv+0xf0>

0000000080002394 <_ZN7_threadC1EPFvPvES0_>:

#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002394:	ff010113          	addi	sp,sp,-16
    80002398:	00813423          	sd	s0,8(sp)
    8000239c:	01010413          	addi	s0,sp,16
    _thread(func function, void* arg);


    void unJoin();

    struct contextWrapper{
    800023a0:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    800023a4:	0000d717          	auipc	a4,0xd
    800023a8:	e4c70713          	addi	a4,a4,-436 # 8000f1f0 <_ZN7_thread6nextIDE>
    800023ac:	00072783          	lw	a5,0(a4)
    800023b0:	0017869b          	addiw	a3,a5,1
    800023b4:	00d72023          	sw	a3,0(a4)
    800023b8:	00f52023          	sw	a5,0(a0)
    closed = 0;
    800023bc:	0a853783          	ld	a5,168(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    800023c0:	0015b593          	seqz	a1,a1
    800023c4:	00459593          	slli	a1,a1,0x4
    800023c8:	fe07f793          	andi	a5,a5,-32
    800023cc:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    800023d0:	0000a717          	auipc	a4,0xa
    800023d4:	c3073703          	ld	a4,-976(a4) # 8000c000 <__memmove+0xdcc>
    800023d8:	00e7f7b3          	and	a5,a5,a4
    800023dc:	0af53423          	sd	a5,168(a0)
    joinHead = 0;
    800023e0:	08053423          	sd	zero,136(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    800023e4:	00200793          	li	a5,2
    800023e8:	08f53c23          	sd	a5,152(a0)
    stackStart = 0;
    800023ec:	0a053023          	sd	zero,160(a0)
    
    context.s0 = 0;
    800023f0:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    800023f4:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    800023f8:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    800023fc:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    80002400:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    80002404:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    80002408:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    8000240c:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    80002410:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    80002414:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    80002418:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    8000241c:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80002420:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002424:	00000797          	auipc	a5,0x0
    80002428:	03c78793          	addi	a5,a5,60 # 80002460 <_ZN7_thread7wrapperEv>
    8000242c:	00f53423          	sd	a5,8(a0)
}
    80002430:	00813403          	ld	s0,8(sp)
    80002434:	01010113          	addi	sp,sp,16
    80002438:	00008067          	ret

000000008000243c <_ZN7_thread10popSppSpieEv>:

void _thread::popSppSpie(){
    __asm__ volatile ("csrw sepc, ra");
    8000243c:	14109073          	csrw	sepc,ra
    if(!currentThread->kernel){
    80002440:	0000d797          	auipc	a5,0xd
    80002444:	db87b783          	ld	a5,-584(a5) # 8000f1f8 <_ZN7_thread13currentThreadE>
    80002448:	0a87b783          	ld	a5,168(a5)
    8000244c:	0107f793          	andi	a5,a5,16
    80002450:	00079663          	bnez	a5,8000245c <_ZN7_thread10popSppSpieEv+0x20>
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002454:	10000793          	li	a5,256
    80002458:	1007b073          	csrc	sstatus,a5
    }
    __asm__ volatile ("sret");
    8000245c:	10200073          	sret

0000000080002460 <_ZN7_thread7wrapperEv>:
}

void _thread::wrapper(){
    80002460:	ff010113          	addi	sp,sp,-16
    80002464:	00113423          	sd	ra,8(sp)
    80002468:	00813023          	sd	s0,0(sp)
    8000246c:	01010413          	addi	s0,sp,16
    popSppSpie();
    80002470:	00000097          	auipc	ra,0x0
    80002474:	fcc080e7          	jalr	-52(ra) # 8000243c <_ZN7_thread10popSppSpieEv>
    currentThread->function(currentThread->arg);
    80002478:	0000d797          	auipc	a5,0xd
    8000247c:	d807b783          	ld	a5,-640(a5) # 8000f1f8 <_ZN7_thread13currentThreadE>
    80002480:	0b07b703          	ld	a4,176(a5)
    80002484:	0b87b503          	ld	a0,184(a5)
    80002488:	000700e7          	jalr	a4
    thread_exit();
    8000248c:	00003097          	auipc	ra,0x3
    80002490:	c48080e7          	jalr	-952(ra) # 800050d4 <_Z11thread_exitv>
}
    80002494:	00813083          	ld	ra,8(sp)
    80002498:	00013403          	ld	s0,0(sp)
    8000249c:	01010113          	addi	sp,sp,16
    800024a0:	00008067          	ret

00000000800024a4 <_ZN7_thread6unJoinEv>:

void _thread::unJoin(){
    800024a4:	fe010113          	addi	sp,sp,-32
    800024a8:	00113c23          	sd	ra,24(sp)
    800024ac:	00813823          	sd	s0,16(sp)
    800024b0:	00913423          	sd	s1,8(sp)
    800024b4:	01213023          	sd	s2,0(sp)
    800024b8:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    800024bc:	08853483          	ld	s1,136(a0)
    while(current != 0){
    800024c0:	0c048e63          	beqz	s1,8000259c <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    800024c4:	0004c503          	lbu	a0,0(s1)
    800024c8:	0014c783          	lbu	a5,1(s1)
    800024cc:	00879793          	slli	a5,a5,0x8
    800024d0:	00a7e7b3          	or	a5,a5,a0
    800024d4:	0024c503          	lbu	a0,2(s1)
    800024d8:	01051513          	slli	a0,a0,0x10
    800024dc:	00f567b3          	or	a5,a0,a5
    800024e0:	0034c503          	lbu	a0,3(s1)
    800024e4:	01851513          	slli	a0,a0,0x18
    800024e8:	00f56533          	or	a0,a0,a5
    800024ec:	0044c783          	lbu	a5,4(s1)
    800024f0:	02079793          	slli	a5,a5,0x20
    800024f4:	00a7e533          	or	a0,a5,a0
    800024f8:	0054c783          	lbu	a5,5(s1)
    800024fc:	02879793          	slli	a5,a5,0x28
    80002500:	00a7e7b3          	or	a5,a5,a0
    80002504:	0064c503          	lbu	a0,6(s1)
    80002508:	03051513          	slli	a0,a0,0x30
    8000250c:	00f567b3          	or	a5,a0,a5
    80002510:	0074c503          	lbu	a0,7(s1)
    80002514:	03851513          	slli	a0,a0,0x38
    80002518:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    8000251c:	0a853783          	ld	a5,168(a0)
    80002520:	ffd7f793          	andi	a5,a5,-3
    80002524:	0af53423          	sd	a5,168(a0)
        Scheduler::put(thread);
    80002528:	00003097          	auipc	ra,0x3
    8000252c:	058080e7          	jalr	88(ra) # 80005580 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002530:	0084c903          	lbu	s2,8(s1)
    80002534:	0094c783          	lbu	a5,9(s1)
    80002538:	00879793          	slli	a5,a5,0x8
    8000253c:	0127e7b3          	or	a5,a5,s2
    80002540:	00a4c903          	lbu	s2,10(s1)
    80002544:	01091913          	slli	s2,s2,0x10
    80002548:	00f967b3          	or	a5,s2,a5
    8000254c:	00b4c903          	lbu	s2,11(s1)
    80002550:	01891913          	slli	s2,s2,0x18
    80002554:	00f96933          	or	s2,s2,a5
    80002558:	00c4c783          	lbu	a5,12(s1)
    8000255c:	02079793          	slli	a5,a5,0x20
    80002560:	0127e933          	or	s2,a5,s2
    80002564:	00d4c783          	lbu	a5,13(s1)
    80002568:	02879793          	slli	a5,a5,0x28
    8000256c:	0127e7b3          	or	a5,a5,s2
    80002570:	00e4c903          	lbu	s2,14(s1)
    80002574:	03091913          	slli	s2,s2,0x30
    80002578:	00f967b3          	or	a5,s2,a5
    8000257c:	00f4c903          	lbu	s2,15(s1)
    80002580:	03891913          	slli	s2,s2,0x38
    80002584:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002588:	00048513          	mv	a0,s1
    8000258c:	00003097          	auipc	ra,0x3
    80002590:	aa4080e7          	jalr	-1372(ra) # 80005030 <_Z8mem_freePv>
        current = next;
    80002594:	00090493          	mv	s1,s2
    while(current != 0){
    80002598:	f29ff06f          	j	800024c0 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    8000259c:	01813083          	ld	ra,24(sp)
    800025a0:	01013403          	ld	s0,16(sp)
    800025a4:	00813483          	ld	s1,8(sp)
    800025a8:	00013903          	ld	s2,0(sp)
    800025ac:	02010113          	addi	sp,sp,32
    800025b0:	00008067          	ret

00000000800025b4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    800025b4:	fc010113          	addi	sp,sp,-64
    800025b8:	02113c23          	sd	ra,56(sp)
    800025bc:	02813823          	sd	s0,48(sp)
    800025c0:	02913423          	sd	s1,40(sp)
    800025c4:	03213023          	sd	s2,32(sp)
    800025c8:	01313c23          	sd	s3,24(sp)
    800025cc:	01413823          	sd	s4,16(sp)
    800025d0:	01513423          	sd	s5,8(sp)
    800025d4:	04010413          	addi	s0,sp,64
    800025d8:	00050493          	mv	s1,a0
    800025dc:	00058913          	mv	s2,a1
    800025e0:	00060a93          	mv	s5,a2
    800025e4:	00068993          	mv	s3,a3
    800025e8:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    800025ec:	0c000513          	li	a0,192
    800025f0:	00003097          	auipc	ra,0x3
    800025f4:	a10080e7          	jalr	-1520(ra) # 80005000 <_Z9mem_allocm>
    800025f8:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    800025fc:	18050263          	beqz	a0,80002780 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1cc>
        return -1;
    }
    (*thread)->function = function;
    80002600:	0b253823          	sd	s2,176(a0)
    (*thread)->arg = arg;
    80002604:	0004b783          	ld	a5,0(s1)
    80002608:	0b57bc23          	sd	s5,184(a5)
    (*thread)->ID = nextID++;
    8000260c:	0000d717          	auipc	a4,0xd
    80002610:	be470713          	addi	a4,a4,-1052 # 8000f1f0 <_ZN7_thread6nextIDE>
    80002614:	00072783          	lw	a5,0(a4)
    80002618:	0017869b          	addiw	a3,a5,1
    8000261c:	00d72023          	sw	a3,0(a4)
    80002620:	0004b703          	ld	a4,0(s1)
    80002624:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80002628:	0004b703          	ld	a4,0(s1)
    8000262c:	0a873783          	ld	a5,168(a4)
    80002630:	ffe7f793          	andi	a5,a5,-2
    80002634:	0af73423          	sd	a5,168(a4)
    (*thread)->blocked = false;
    80002638:	0004b703          	ld	a4,0(s1)
    8000263c:	0a873783          	ld	a5,168(a4)
    80002640:	ffd7f793          	andi	a5,a5,-3
    80002644:	0af73423          	sd	a5,168(a4)
    (*thread)->sleeping = false;
    80002648:	0004b703          	ld	a4,0(s1)
    8000264c:	0a873783          	ld	a5,168(a4)
    80002650:	ffb7f793          	andi	a5,a5,-5
    80002654:	0af73423          	sd	a5,168(a4)
    (*thread)->finished = false;
    80002658:	0004b703          	ld	a4,0(s1)
    8000265c:	0a873783          	ld	a5,168(a4)
    80002660:	ff77f793          	andi	a5,a5,-9
    80002664:	0af73423          	sd	a5,168(a4)
    (*thread)->kernel = (function == 0);
    80002668:	0004b703          	ld	a4,0(s1)
    8000266c:	00193913          	seqz	s2,s2
    80002670:	00491913          	slli	s2,s2,0x4
    80002674:	0a873783          	ld	a5,168(a4)
    80002678:	fef7f793          	andi	a5,a5,-17
    8000267c:	0127e933          	or	s2,a5,s2
    80002680:	0b273423          	sd	s2,168(a4)
    (*thread)->reserved = 0;
    80002684:	0004b703          	ld	a4,0(s1)
    80002688:	0a873783          	ld	a5,168(a4)
    8000268c:	0000a697          	auipc	a3,0xa
    80002690:	9746b683          	ld	a3,-1676(a3) # 8000c000 <__memmove+0xdcc>
    80002694:	00d7f7b3          	and	a5,a5,a3
    80002698:	0af73423          	sd	a5,168(a4)
    (*thread)->joinHead = 0;
    8000269c:	0004b783          	ld	a5,0(s1)
    800026a0:	0807b423          	sd	zero,136(a5)
    (*thread)->joinTail = 0;
    800026a4:	0004b783          	ld	a5,0(s1)
    800026a8:	0807b823          	sd	zero,144(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    800026ac:	0004b783          	ld	a5,0(s1)
    800026b0:	00200713          	li	a4,2
    800026b4:	08e7bc23          	sd	a4,152(a5)
    (*thread)->stackStart = 0;
    800026b8:	0004b783          	ld	a5,0(s1)
    800026bc:	0a07b023          	sd	zero,160(a5)

    (*thread)->context.s0 = 0;
    800026c0:	0004b783          	ld	a5,0(s1)
    800026c4:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    800026c8:	0004b783          	ld	a5,0(s1)
    800026cc:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    800026d0:	0004b783          	ld	a5,0(s1)
    800026d4:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    800026d8:	0004b783          	ld	a5,0(s1)
    800026dc:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    800026e0:	0004b783          	ld	a5,0(s1)
    800026e4:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    800026e8:	0004b783          	ld	a5,0(s1)
    800026ec:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    800026f0:	0004b783          	ld	a5,0(s1)
    800026f4:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    800026f8:	0004b783          	ld	a5,0(s1)
    800026fc:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80002700:	0004b783          	ld	a5,0(s1)
    80002704:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80002708:	0004b783          	ld	a5,0(s1)
    8000270c:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80002710:	0004b783          	ld	a5,0(s1)
    80002714:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    80002718:	0004b783          	ld	a5,0(s1)
    8000271c:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002720:	0004b783          	ld	a5,0(s1)
    80002724:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002728:	0004b783          	ld	a5,0(s1)
    8000272c:	00000717          	auipc	a4,0x0
    80002730:	d3470713          	addi	a4,a4,-716 # 80002460 <_ZN7_thread7wrapperEv>
    80002734:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    80002738:	0004b783          	ld	a5,0(s1)
    8000273c:	0b37b023          	sd	s3,160(a5)
    if(start){
    80002740:	020a1663          	bnez	s4,8000276c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b8>
        Scheduler::put(*thread);
    }
    return 0;
    80002744:	00000513          	li	a0,0
}
    80002748:	03813083          	ld	ra,56(sp)
    8000274c:	03013403          	ld	s0,48(sp)
    80002750:	02813483          	ld	s1,40(sp)
    80002754:	02013903          	ld	s2,32(sp)
    80002758:	01813983          	ld	s3,24(sp)
    8000275c:	01013a03          	ld	s4,16(sp)
    80002760:	00813a83          	ld	s5,8(sp)
    80002764:	04010113          	addi	sp,sp,64
    80002768:	00008067          	ret
        Scheduler::put(*thread);
    8000276c:	0004b503          	ld	a0,0(s1)
    80002770:	00003097          	auipc	ra,0x3
    80002774:	e10080e7          	jalr	-496(ra) # 80005580 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002778:	00000513          	li	a0,0
    8000277c:	fcdff06f          	j	80002748 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x194>
        return -1;
    80002780:	fff00513          	li	a0,-1
    80002784:	fc5ff06f          	j	80002748 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x194>

0000000080002788 <_ZN7_thread10setBlockedEb>:
    mem_free(reinterpret_cast<void*>(reinterpret_cast<uint64>(currentThread->stackStart) - DEFAULT_STACK_SIZE));
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80002788:	ff010113          	addi	sp,sp,-16
    8000278c:	00813423          	sd	s0,8(sp)
    80002790:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002794:	0015f593          	andi	a1,a1,1
    80002798:	00159793          	slli	a5,a1,0x1
    8000279c:	0a853583          	ld	a1,168(a0)
    800027a0:	ffd5f593          	andi	a1,a1,-3
    800027a4:	00f5e5b3          	or	a1,a1,a5
    800027a8:	0ab53423          	sd	a1,168(a0)
}
    800027ac:	00813403          	ld	s0,8(sp)
    800027b0:	01010113          	addi	sp,sp,16
    800027b4:	00008067          	ret

00000000800027b8 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    800027b8:	ff010113          	addi	sp,sp,-16
    800027bc:	00813423          	sd	s0,8(sp)
    800027c0:	01010413          	addi	s0,sp,16
    this->closed = closed;
    800027c4:	0015f793          	andi	a5,a1,1
    800027c8:	0a853583          	ld	a1,168(a0)
    800027cc:	ffe5f593          	andi	a1,a1,-2
    800027d0:	00f5e5b3          	or	a1,a1,a5
    800027d4:	0ab53423          	sd	a1,168(a0)
}
    800027d8:	00813403          	ld	s0,8(sp)
    800027dc:	01010113          	addi	sp,sp,16
    800027e0:	00008067          	ret

00000000800027e4 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00813423          	sd	s0,8(sp)
    800027ec:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800027f0:	0015f593          	andi	a1,a1,1
    800027f4:	00259793          	slli	a5,a1,0x2
    800027f8:	0a853583          	ld	a1,168(a0)
    800027fc:	ffb5f593          	andi	a1,a1,-5
    80002800:	00f5e5b3          	or	a1,a1,a5
    80002804:	0ab53423          	sd	a1,168(a0)
}
    80002808:	00813403          	ld	s0,8(sp)
    8000280c:	01010113          	addi	sp,sp,16
    80002810:	00008067          	ret

0000000080002814 <_ZN7_thread8dispatchEv>:

void _thread::dispatch(){
    saveContext(&(currentThread->context));
    80002814:	0000d517          	auipc	a0,0xd
    80002818:	9e453503          	ld	a0,-1564(a0) # 8000f1f8 <_ZN7_thread13currentThreadE>
    8000281c:	00850793          	addi	a5,a0,8
        "csrr t1, sstatus\n"
        "sd s0, 112(t0)\n"
        "csrr t1, sepc\n"
        "sd t1, 120(t0)\n"
        :: "r"(context)
    );
    80002820:	00078293          	mv	t0,a5
    80002824:	0012b023          	sd	ra,0(t0)
    80002828:	0022b423          	sd	sp,8(t0)
    8000282c:	0082b823          	sd	s0,16(t0)
    80002830:	0092bc23          	sd	s1,24(t0)
    80002834:	0322b023          	sd	s2,32(t0)
    80002838:	0332b423          	sd	s3,40(t0)
    8000283c:	0342b823          	sd	s4,48(t0)
    80002840:	0352bc23          	sd	s5,56(t0)
    80002844:	0562b023          	sd	s6,64(t0)
    80002848:	0572b423          	sd	s7,72(t0)
    8000284c:	0582b823          	sd	s8,80(t0)
    80002850:	0592bc23          	sd	s9,88(t0)
    80002854:	07a2b023          	sd	s10,96(t0)
    80002858:	07b2b423          	sd	s11,104(t0)
    8000285c:	10002373          	csrr	t1,sstatus
    80002860:	0682b823          	sd	s0,112(t0)
    80002864:	14102373          	csrr	t1,sepc
    80002868:	0662bc23          	sd	t1,120(t0)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    8000286c:	00200793          	li	a5,2
    80002870:	08f53c23          	sd	a5,152(a0)
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002874:	00050863          	beqz	a0,80002884 <_ZN7_thread8dispatchEv+0x70>
    80002878:	0a853783          	ld	a5,168(a0)
    8000287c:	00f7f793          	andi	a5,a5,15
    80002880:	06078a63          	beqz	a5,800028f4 <_ZN7_thread8dispatchEv+0xe0>
        currentThread =  Scheduler::get();
    80002884:	00003097          	auipc	ra,0x3
    80002888:	d84080e7          	jalr	-636(ra) # 80005608 <_ZN9Scheduler3getEv>
    8000288c:	0000d797          	auipc	a5,0xd
    80002890:	96a7b623          	sd	a0,-1684(a5) # 8000f1f8 <_ZN7_thread13currentThreadE>
    }while(currentThread->closed || currentThread->blocked || currentThread->sleeping || currentThread->finished); /// If the thread is closed, blocked, sleeping or finished while it is in sched queue, we discard it
    80002894:	0a853783          	ld	a5,168(a0)
    80002898:	00f7f793          	andi	a5,a5,15
    8000289c:	fe0794e3          	bnez	a5,80002884 <_ZN7_thread8dispatchEv+0x70>
    restoreContext(&(currentThread->context));
    800028a0:	00850513          	addi	a0,a0,8
        "ld s0, 16(t0)\n"
        "ld t1, 120(t0)\n"
        "csrw sepc, t1\n"
        "ret\n"
        :: "r"(context)
    );
    800028a4:	00050293          	mv	t0,a0
    800028a8:	0002b083          	ld	ra,0(t0)
    800028ac:	0082b103          	ld	sp,8(t0)
    800028b0:	0182b483          	ld	s1,24(t0)
    800028b4:	0202b903          	ld	s2,32(t0)
    800028b8:	0282b983          	ld	s3,40(t0)
    800028bc:	0302ba03          	ld	s4,48(t0)
    800028c0:	0382ba83          	ld	s5,56(t0)
    800028c4:	0402bb03          	ld	s6,64(t0)
    800028c8:	0482bb83          	ld	s7,72(t0)
    800028cc:	0502bc03          	ld	s8,80(t0)
    800028d0:	0582bc83          	ld	s9,88(t0)
    800028d4:	0602bd03          	ld	s10,96(t0)
    800028d8:	0682bd83          	ld	s11,104(t0)
    800028dc:	0702b403          	ld	s0,112(t0)
    800028e0:	10031073          	csrw	sstatus,t1
    800028e4:	0102b403          	ld	s0,16(t0)
    800028e8:	0782b303          	ld	t1,120(t0)
    800028ec:	14131073          	csrw	sepc,t1
    800028f0:	00008067          	ret
        Scheduler::put(oldThread);
    800028f4:	00003097          	auipc	ra,0x3
    800028f8:	c8c080e7          	jalr	-884(ra) # 80005580 <_ZN9Scheduler3putEP7_thread>
    800028fc:	f89ff06f          	j	80002884 <_ZN7_thread8dispatchEv+0x70>

0000000080002900 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    80002900:	0a85b783          	ld	a5,168(a1)
    80002904:	0097f793          	andi	a5,a5,9
    80002908:	00078463          	beqz	a5,80002910 <_ZN7_thread4joinEPS_+0x10>
    8000290c:	00008067          	ret
void _thread::join(thread_t thread){
    80002910:	fe010113          	addi	sp,sp,-32
    80002914:	00113c23          	sd	ra,24(sp)
    80002918:	00813823          	sd	s0,16(sp)
    8000291c:	00913423          	sd	s1,8(sp)
    80002920:	01213023          	sd	s2,0(sp)
    80002924:	02010413          	addi	s0,sp,32
    80002928:	00050493          	mv	s1,a0
    8000292c:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002930:	01000513          	li	a0,16
    80002934:	00002097          	auipc	ra,0x2
    80002938:	6cc080e7          	jalr	1740(ra) # 80005000 <_Z9mem_allocm>
    this->blocked = true;
    8000293c:	0a84b703          	ld	a4,168(s1)
    80002940:	00276713          	ori	a4,a4,2
    80002944:	0ae4b423          	sd	a4,168(s1)
    newJoin->thread = this;
    80002948:	00950023          	sb	s1,0(a0)
    8000294c:	0084d713          	srli	a4,s1,0x8
    80002950:	00e500a3          	sb	a4,1(a0)
    80002954:	0104d713          	srli	a4,s1,0x10
    80002958:	00e50123          	sb	a4,2(a0)
    8000295c:	0184d71b          	srliw	a4,s1,0x18
    80002960:	00e501a3          	sb	a4,3(a0)
    80002964:	0204d713          	srli	a4,s1,0x20
    80002968:	00e50223          	sb	a4,4(a0)
    8000296c:	0284d713          	srli	a4,s1,0x28
    80002970:	00e502a3          	sb	a4,5(a0)
    80002974:	0304d713          	srli	a4,s1,0x30
    80002978:	00e50323          	sb	a4,6(a0)
    8000297c:	0384d493          	srli	s1,s1,0x38
    80002980:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80002984:	00050423          	sb	zero,8(a0)
    80002988:	000504a3          	sb	zero,9(a0)
    8000298c:	00050523          	sb	zero,10(a0)
    80002990:	000505a3          	sb	zero,11(a0)
    80002994:	00050623          	sb	zero,12(a0)
    80002998:	000506a3          	sb	zero,13(a0)
    8000299c:	00050723          	sb	zero,14(a0)
    800029a0:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800029a4:	08893703          	ld	a4,136(s2)
    800029a8:	06070463          	beqz	a4,80002a10 <_ZN7_thread4joinEPS_+0x110>
        thread->joinTail->next = newJoin;
    800029ac:	09093703          	ld	a4,144(s2)
    800029b0:	00a70423          	sb	a0,8(a4)
    800029b4:	00855693          	srli	a3,a0,0x8
    800029b8:	00d704a3          	sb	a3,9(a4)
    800029bc:	01055693          	srli	a3,a0,0x10
    800029c0:	00d70523          	sb	a3,10(a4)
    800029c4:	0185569b          	srliw	a3,a0,0x18
    800029c8:	00d705a3          	sb	a3,11(a4)
    800029cc:	02055693          	srli	a3,a0,0x20
    800029d0:	00d70623          	sb	a3,12(a4)
    800029d4:	02855693          	srli	a3,a0,0x28
    800029d8:	00d706a3          	sb	a3,13(a4)
    800029dc:	03055693          	srli	a3,a0,0x30
    800029e0:	00d70723          	sb	a3,14(a4)
    800029e4:	03855693          	srli	a3,a0,0x38
    800029e8:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800029ec:	08a93823          	sd	a0,144(s2)
    dispatch();
    800029f0:	00000097          	auipc	ra,0x0
    800029f4:	e24080e7          	jalr	-476(ra) # 80002814 <_ZN7_thread8dispatchEv>
}
    800029f8:	01813083          	ld	ra,24(sp)
    800029fc:	01013403          	ld	s0,16(sp)
    80002a00:	00813483          	ld	s1,8(sp)
    80002a04:	00013903          	ld	s2,0(sp)
    80002a08:	02010113          	addi	sp,sp,32
    80002a0c:	00008067          	ret
        thread->joinHead = newJoin;
    80002a10:	08a93423          	sd	a0,136(s2)
        thread->joinTail = newJoin;
    80002a14:	08a93823          	sd	a0,144(s2)
    80002a18:	fd9ff06f          	j	800029f0 <_ZN7_thread4joinEPS_+0xf0>

0000000080002a1c <_ZN7_thread4tickEv>:
    if(currentThread->blocked){
    80002a1c:	0000c797          	auipc	a5,0xc
    80002a20:	7dc7b783          	ld	a5,2012(a5) # 8000f1f8 <_ZN7_thread13currentThreadE>
    80002a24:	0a87b783          	ld	a5,168(a5)
    80002a28:	0027f713          	andi	a4,a5,2
    80002a2c:	06071063          	bnez	a4,80002a8c <_ZN7_thread4tickEv+0x70>
    if(currentThread->closed){
    80002a30:	0017f713          	andi	a4,a5,1
    80002a34:	06071063          	bnez	a4,80002a94 <_ZN7_thread4tickEv+0x78>
    if(currentThread->sleeping){
    80002a38:	0047f713          	andi	a4,a5,4
    80002a3c:	06071063          	bnez	a4,80002a9c <_ZN7_thread4tickEv+0x80>
    if(currentThread->finished){
    80002a40:	0087f793          	andi	a5,a5,8
    80002a44:	06079063          	bnez	a5,80002aa4 <_ZN7_thread4tickEv+0x88>
    timeLeft --;
    80002a48:	09853783          	ld	a5,152(a0)
    80002a4c:	fff78793          	addi	a5,a5,-1
    80002a50:	08f53c23          	sd	a5,152(a0)
    if(timeLeft == 0){
    80002a54:	00078663          	beqz	a5,80002a60 <_ZN7_thread4tickEv+0x44>
    return 0;
    80002a58:	00000513          	li	a0,0
}
    80002a5c:	00008067          	ret
int _thread::tick(){
    80002a60:	ff010113          	addi	sp,sp,-16
    80002a64:	00113423          	sd	ra,8(sp)
    80002a68:	00813023          	sd	s0,0(sp)
    80002a6c:	01010413          	addi	s0,sp,16
        dispatch();
    80002a70:	00000097          	auipc	ra,0x0
    80002a74:	da4080e7          	jalr	-604(ra) # 80002814 <_ZN7_thread8dispatchEv>
    return 0;
    80002a78:	00000513          	li	a0,0
}
    80002a7c:	00813083          	ld	ra,8(sp)
    80002a80:	00013403          	ld	s0,0(sp)
    80002a84:	01010113          	addi	sp,sp,16
    80002a88:	00008067          	ret
        return -1;
    80002a8c:	fff00513          	li	a0,-1
    80002a90:	00008067          	ret
        return -2;
    80002a94:	ffe00513          	li	a0,-2
    80002a98:	00008067          	ret
        return -3;
    80002a9c:	ffd00513          	li	a0,-3
    80002aa0:	00008067          	ret
        return -4;
    80002aa4:	ffc00513          	li	a0,-4
    80002aa8:	00008067          	ret

0000000080002aac <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    80002aac:	0000c517          	auipc	a0,0xc
    80002ab0:	74c53503          	ld	a0,1868(a0) # 8000f1f8 <_ZN7_thread13currentThreadE>
    80002ab4:	0a853783          	ld	a5,168(a0)
    80002ab8:	0017f713          	andi	a4,a5,1
    80002abc:	06071863          	bnez	a4,80002b2c <_ZN7_thread4exitEv+0x80>
    if(currentThread->blocked){
    80002ac0:	0027f713          	andi	a4,a5,2
    80002ac4:	06071863          	bnez	a4,80002b34 <_ZN7_thread4exitEv+0x88>
    if(currentThread->sleeping){
    80002ac8:	0047f793          	andi	a5,a5,4
    80002acc:	06079863          	bnez	a5,80002b3c <_ZN7_thread4exitEv+0x90>
int _thread::exit(){
    80002ad0:	ff010113          	addi	sp,sp,-16
    80002ad4:	00113423          	sd	ra,8(sp)
    80002ad8:	00813023          	sd	s0,0(sp)
    80002adc:	01010413          	addi	s0,sp,16
    currentThread->unJoin();
    80002ae0:	00000097          	auipc	ra,0x0
    80002ae4:	9c4080e7          	jalr	-1596(ra) # 800024a4 <_ZN7_thread6unJoinEv>
    currentThread->finished = 1;
    80002ae8:	0000c797          	auipc	a5,0xc
    80002aec:	7107b783          	ld	a5,1808(a5) # 8000f1f8 <_ZN7_thread13currentThreadE>
    80002af0:	0a87b703          	ld	a4,168(a5)
    80002af4:	00876713          	ori	a4,a4,8
    80002af8:	0ae7b423          	sd	a4,168(a5)
    mem_free(reinterpret_cast<void*>(reinterpret_cast<uint64>(currentThread->stackStart) - DEFAULT_STACK_SIZE));
    80002afc:	0a07b503          	ld	a0,160(a5)
    80002b00:	fffff7b7          	lui	a5,0xfffff
    80002b04:	00f50533          	add	a0,a0,a5
    80002b08:	00002097          	auipc	ra,0x2
    80002b0c:	528080e7          	jalr	1320(ra) # 80005030 <_Z8mem_freePv>
    dispatch();
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	d04080e7          	jalr	-764(ra) # 80002814 <_ZN7_thread8dispatchEv>
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

0000000080002b44 <main>:
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

/// @brief first function to be called
void main(){
    80002b44:	a7010113          	addi	sp,sp,-1424
    80002b48:	58113423          	sd	ra,1416(sp)
    80002b4c:	58813023          	sd	s0,1408(sp)
    80002b50:	56913c23          	sd	s1,1400(sp)
    80002b54:	59010413          	addi	s0,sp,1424
    Kernel kernel = Kernel();
    80002b58:	a7840513          	addi	a0,s0,-1416
    80002b5c:	00003097          	auipc	ra,0x3
    80002b60:	f04080e7          	jalr	-252(ra) # 80005a60 <_ZN6KernelC1Ev>
    kernel.initialise();
    80002b64:	a7840513          	addi	a0,s0,-1416
    80002b68:	00003097          	auipc	ra,0x3
    80002b6c:	f9c080e7          	jalr	-100(ra) # 80005b04 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80002b70:	a7840513          	addi	a0,s0,-1416
    80002b74:	00003097          	auipc	ra,0x3
    80002b78:	ff4080e7          	jalr	-12(ra) # 80005b68 <_ZN6Kernel3runEv>
    80002b7c:	00050493          	mv	s1,a0
    putc('\n');
    80002b80:	00a00513          	li	a0,10
    80002b84:	00002097          	auipc	ra,0x2
    80002b88:	724080e7          	jalr	1828(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    80002b8c:	00a00513          	li	a0,10
    80002b90:	00002097          	auipc	ra,0x2
    80002b94:	718080e7          	jalr	1816(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002b98:	02d00513          	li	a0,45
    80002b9c:	00002097          	auipc	ra,0x2
    80002ba0:	70c080e7          	jalr	1804(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002ba4:	02d00513          	li	a0,45
    80002ba8:	00002097          	auipc	ra,0x2
    80002bac:	700080e7          	jalr	1792(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002bb0:	02d00513          	li	a0,45
    80002bb4:	00002097          	auipc	ra,0x2
    80002bb8:	6f4080e7          	jalr	1780(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002bbc:	02d00513          	li	a0,45
    80002bc0:	00002097          	auipc	ra,0x2
    80002bc4:	6e8080e7          	jalr	1768(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002bc8:	02d00513          	li	a0,45
    80002bcc:	00002097          	auipc	ra,0x2
    80002bd0:	6dc080e7          	jalr	1756(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002bd4:	02d00513          	li	a0,45
    80002bd8:	00002097          	auipc	ra,0x2
    80002bdc:	6d0080e7          	jalr	1744(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002be0:	02d00513          	li	a0,45
    80002be4:	00002097          	auipc	ra,0x2
    80002be8:	6c4080e7          	jalr	1732(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002bec:	02d00513          	li	a0,45
    80002bf0:	00002097          	auipc	ra,0x2
    80002bf4:	6b8080e7          	jalr	1720(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002bf8:	02d00513          	li	a0,45
    80002bfc:	00002097          	auipc	ra,0x2
    80002c00:	6ac080e7          	jalr	1708(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c04:	02d00513          	li	a0,45
    80002c08:	00002097          	auipc	ra,0x2
    80002c0c:	6a0080e7          	jalr	1696(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c10:	02d00513          	li	a0,45
    80002c14:	00002097          	auipc	ra,0x2
    80002c18:	694080e7          	jalr	1684(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c1c:	02d00513          	li	a0,45
    80002c20:	00002097          	auipc	ra,0x2
    80002c24:	688080e7          	jalr	1672(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c28:	02d00513          	li	a0,45
    80002c2c:	00002097          	auipc	ra,0x2
    80002c30:	67c080e7          	jalr	1660(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c34:	02d00513          	li	a0,45
    80002c38:	00002097          	auipc	ra,0x2
    80002c3c:	670080e7          	jalr	1648(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c40:	02d00513          	li	a0,45
    80002c44:	00002097          	auipc	ra,0x2
    80002c48:	664080e7          	jalr	1636(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c4c:	02d00513          	li	a0,45
    80002c50:	00002097          	auipc	ra,0x2
    80002c54:	658080e7          	jalr	1624(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c58:	02d00513          	li	a0,45
    80002c5c:	00002097          	auipc	ra,0x2
    80002c60:	64c080e7          	jalr	1612(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c64:	02d00513          	li	a0,45
    80002c68:	00002097          	auipc	ra,0x2
    80002c6c:	640080e7          	jalr	1600(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c70:	02d00513          	li	a0,45
    80002c74:	00002097          	auipc	ra,0x2
    80002c78:	634080e7          	jalr	1588(ra) # 800052a8 <_Z4putcc>
    putc('-');
    80002c7c:	02d00513          	li	a0,45
    80002c80:	00002097          	auipc	ra,0x2
    80002c84:	628080e7          	jalr	1576(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    80002c88:	00a00513          	li	a0,10
    80002c8c:	00002097          	auipc	ra,0x2
    80002c90:	61c080e7          	jalr	1564(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    80002c94:	00a00513          	li	a0,10
    80002c98:	00002097          	auipc	ra,0x2
    80002c9c:	610080e7          	jalr	1552(ra) # 800052a8 <_Z4putcc>
    putc('K');
    80002ca0:	04b00513          	li	a0,75
    80002ca4:	00002097          	auipc	ra,0x2
    80002ca8:	604080e7          	jalr	1540(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002cac:	06500513          	li	a0,101
    80002cb0:	00002097          	auipc	ra,0x2
    80002cb4:	5f8080e7          	jalr	1528(ra) # 800052a8 <_Z4putcc>
    putc('r');
    80002cb8:	07200513          	li	a0,114
    80002cbc:	00002097          	auipc	ra,0x2
    80002cc0:	5ec080e7          	jalr	1516(ra) # 800052a8 <_Z4putcc>
    putc('n');
    80002cc4:	06e00513          	li	a0,110
    80002cc8:	00002097          	auipc	ra,0x2
    80002ccc:	5e0080e7          	jalr	1504(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002cd0:	06500513          	li	a0,101
    80002cd4:	00002097          	auipc	ra,0x2
    80002cd8:	5d4080e7          	jalr	1492(ra) # 800052a8 <_Z4putcc>
    putc('l');
    80002cdc:	06c00513          	li	a0,108
    80002ce0:	00002097          	auipc	ra,0x2
    80002ce4:	5c8080e7          	jalr	1480(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80002ce8:	02000513          	li	a0,32
    80002cec:	00002097          	auipc	ra,0x2
    80002cf0:	5bc080e7          	jalr	1468(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002cf4:	06500513          	li	a0,101
    80002cf8:	00002097          	auipc	ra,0x2
    80002cfc:	5b0080e7          	jalr	1456(ra) # 800052a8 <_Z4putcc>
    putc('x');
    80002d00:	07800513          	li	a0,120
    80002d04:	00002097          	auipc	ra,0x2
    80002d08:	5a4080e7          	jalr	1444(ra) # 800052a8 <_Z4putcc>
    putc('i');
    80002d0c:	06900513          	li	a0,105
    80002d10:	00002097          	auipc	ra,0x2
    80002d14:	598080e7          	jalr	1432(ra) # 800052a8 <_Z4putcc>
    putc('t');
    80002d18:	07400513          	li	a0,116
    80002d1c:	00002097          	auipc	ra,0x2
    80002d20:	58c080e7          	jalr	1420(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002d24:	06500513          	li	a0,101
    80002d28:	00002097          	auipc	ra,0x2
    80002d2c:	580080e7          	jalr	1408(ra) # 800052a8 <_Z4putcc>
    putc('d');
    80002d30:	06400513          	li	a0,100
    80002d34:	00002097          	auipc	ra,0x2
    80002d38:	574080e7          	jalr	1396(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80002d3c:	02000513          	li	a0,32
    80002d40:	00002097          	auipc	ra,0x2
    80002d44:	568080e7          	jalr	1384(ra) # 800052a8 <_Z4putcc>
    putc('w');
    80002d48:	07700513          	li	a0,119
    80002d4c:	00002097          	auipc	ra,0x2
    80002d50:	55c080e7          	jalr	1372(ra) # 800052a8 <_Z4putcc>
    putc('i');
    80002d54:	06900513          	li	a0,105
    80002d58:	00002097          	auipc	ra,0x2
    80002d5c:	550080e7          	jalr	1360(ra) # 800052a8 <_Z4putcc>
    putc('t');
    80002d60:	07400513          	li	a0,116
    80002d64:	00002097          	auipc	ra,0x2
    80002d68:	544080e7          	jalr	1348(ra) # 800052a8 <_Z4putcc>
    putc('h');
    80002d6c:	06800513          	li	a0,104
    80002d70:	00002097          	auipc	ra,0x2
    80002d74:	538080e7          	jalr	1336(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80002d78:	02000513          	li	a0,32
    80002d7c:	00002097          	auipc	ra,0x2
    80002d80:	52c080e7          	jalr	1324(ra) # 800052a8 <_Z4putcc>
    putc('c');
    80002d84:	06300513          	li	a0,99
    80002d88:	00002097          	auipc	ra,0x2
    80002d8c:	520080e7          	jalr	1312(ra) # 800052a8 <_Z4putcc>
    putc('o');
    80002d90:	06f00513          	li	a0,111
    80002d94:	00002097          	auipc	ra,0x2
    80002d98:	514080e7          	jalr	1300(ra) # 800052a8 <_Z4putcc>
    putc('d');
    80002d9c:	06400513          	li	a0,100
    80002da0:	00002097          	auipc	ra,0x2
    80002da4:	508080e7          	jalr	1288(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80002da8:	06500513          	li	a0,101
    80002dac:	00002097          	auipc	ra,0x2
    80002db0:	4fc080e7          	jalr	1276(ra) # 800052a8 <_Z4putcc>
    putc(':');
    80002db4:	03a00513          	li	a0,58
    80002db8:	00002097          	auipc	ra,0x2
    80002dbc:	4f0080e7          	jalr	1264(ra) # 800052a8 <_Z4putcc>
    switch(exitCode){
    80002dc0:	00048e63          	beqz	s1,80002ddc <main+0x298>
    80002dc4:	00100793          	li	a5,1
    80002dc8:	02f48263          	beq	s1,a5,80002dec <main+0x2a8>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80002dcc:	03200513          	li	a0,50
    80002dd0:	00002097          	auipc	ra,0x2
    80002dd4:	4d8080e7          	jalr	1240(ra) # 800052a8 <_Z4putcc>
    80002dd8:	0200006f          	j	80002df8 <main+0x2b4>
            putc('0');
    80002ddc:	03000513          	li	a0,48
    80002de0:	00002097          	auipc	ra,0x2
    80002de4:	4c8080e7          	jalr	1224(ra) # 800052a8 <_Z4putcc>
    80002de8:	0100006f          	j	80002df8 <main+0x2b4>
            putc('1');
    80002dec:	03100513          	li	a0,49
    80002df0:	00002097          	auipc	ra,0x2
    80002df4:	4b8080e7          	jalr	1208(ra) # 800052a8 <_Z4putcc>
            break;
    }
    putc('\n');
    80002df8:	00a00513          	li	a0,10
    80002dfc:	00002097          	auipc	ra,0x2
    80002e00:	4ac080e7          	jalr	1196(ra) # 800052a8 <_Z4putcc>
    ConsoleManager::outputHandler();
    80002e04:	00000097          	auipc	ra,0x0
    80002e08:	494080e7          	jalr	1172(ra) # 80003298 <_ZN14ConsoleManager13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80002e0c:	02049263          	bnez	s1,80002e30 <main+0x2ec>
    Kernel kernel = Kernel();
    80002e10:	a7840513          	addi	a0,s0,-1416
    80002e14:	00000097          	auipc	ra,0x0
    80002e18:	060080e7          	jalr	96(ra) # 80002e74 <_ZN6KernelD1Ev>
    80002e1c:	58813083          	ld	ra,1416(sp)
    80002e20:	58013403          	ld	s0,1408(sp)
    80002e24:	57813483          	ld	s1,1400(sp)
    80002e28:	59010113          	addi	sp,sp,1424
    80002e2c:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80002e30:	00009697          	auipc	a3,0x9
    80002e34:	2b068693          	addi	a3,a3,688 # 8000c0e0 <_ZTV9Semaphore+0x98>
    80002e38:	05300613          	li	a2,83
    80002e3c:	00009597          	auipc	a1,0x9
    80002e40:	2b458593          	addi	a1,a1,692 # 8000c0f0 <_ZTV9Semaphore+0xa8>
    80002e44:	00009517          	auipc	a0,0x9
    80002e48:	2bc50513          	addi	a0,a0,700 # 8000c100 <_ZTV9Semaphore+0xb8>
    80002e4c:	00003097          	auipc	ra,0x3
    80002e50:	864080e7          	jalr	-1948(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80002e54:	fbdff06f          	j	80002e10 <main+0x2cc>
    80002e58:	00050493          	mv	s1,a0
    Kernel kernel = Kernel();
    80002e5c:	a7840513          	addi	a0,s0,-1416
    80002e60:	00000097          	auipc	ra,0x0
    80002e64:	014080e7          	jalr	20(ra) # 80002e74 <_ZN6KernelD1Ev>
    80002e68:	00048513          	mv	a0,s1
    80002e6c:	0000d097          	auipc	ra,0xd
    80002e70:	4fc080e7          	jalr	1276(ra) # 80010368 <_Unwind_Resume>

0000000080002e74 <_ZN6KernelD1Ev>:
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80002e74:	fe010113          	addi	sp,sp,-32
    80002e78:	00113c23          	sd	ra,24(sp)
    80002e7c:	00813823          	sd	s0,16(sp)
    80002e80:	00913423          	sd	s1,8(sp)
    80002e84:	02010413          	addi	s0,sp,32
    80002e88:	00050493          	mv	s1,a0
    80002e8c:	12050513          	addi	a0,a0,288
    80002e90:	00000097          	auipc	ra,0x0
    80002e94:	180080e7          	jalr	384(ra) # 80003010 <_ZN14ConsoleManagerD1Ev>
    80002e98:	11048513          	addi	a0,s1,272
    80002e9c:	00002097          	auipc	ra,0x2
    80002ea0:	f2c080e7          	jalr	-212(ra) # 80004dc8 <_ZN5TimerD1Ev>
    80002ea4:	00048513          	mv	a0,s1
    80002ea8:	00000097          	auipc	ra,0x0
    80002eac:	52c080e7          	jalr	1324(ra) # 800033d4 <_ZN11HeapManagerD1Ev>
    80002eb0:	01813083          	ld	ra,24(sp)
    80002eb4:	01013403          	ld	s0,16(sp)
    80002eb8:	00813483          	ld	s1,8(sp)
    80002ebc:	02010113          	addi	sp,sp,32
    80002ec0:	00008067          	ret

0000000080002ec4 <_ZN14ConsoleManager11getInstanceEv>:
    outBuffer.init();
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    80002ec4:	0000c797          	auipc	a5,0xc
    80002ec8:	33c7b783          	ld	a5,828(a5) # 8000f200 <_ZN14ConsoleManager8instanceE>
    80002ecc:	00078863          	beqz	a5,80002edc <_ZN14ConsoleManager11getInstanceEv+0x18>
    return *instance;
}
    80002ed0:	0000c517          	auipc	a0,0xc
    80002ed4:	33053503          	ld	a0,816(a0) # 8000f200 <_ZN14ConsoleManager8instanceE>
    80002ed8:	00008067          	ret
ConsoleManager& ConsoleManager::getInstance(){
    80002edc:	ff010113          	addi	sp,sp,-16
    80002ee0:	00113423          	sd	ra,8(sp)
    80002ee4:	00813023          	sd	s0,0(sp)
    80002ee8:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80002eec:	00009697          	auipc	a3,0x9
    80002ef0:	23c68693          	addi	a3,a3,572 # 8000c128 <_ZTV9Semaphore+0xe0>
    80002ef4:	02200613          	li	a2,34
    80002ef8:	00009597          	auipc	a1,0x9
    80002efc:	26858593          	addi	a1,a1,616 # 8000c160 <_ZTV9Semaphore+0x118>
    80002f00:	00009517          	auipc	a0,0x9
    80002f04:	27850513          	addi	a0,a0,632 # 8000c178 <_ZTV9Semaphore+0x130>
    80002f08:	00002097          	auipc	ra,0x2
    80002f0c:	7a8080e7          	jalr	1960(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
}
    80002f10:	0000c517          	auipc	a0,0xc
    80002f14:	2f053503          	ld	a0,752(a0) # 8000f200 <_ZN14ConsoleManager8instanceE>
    80002f18:	00813083          	ld	ra,8(sp)
    80002f1c:	00013403          	ld	s0,0(sp)
    80002f20:	01010113          	addi	sp,sp,16
    80002f24:	00008067          	ret

0000000080002f28 <_ZN14ConsoleManager13consoleBufferD1Ev>:

ConsoleManager::consoleBuffer::~consoleBuffer(){
    80002f28:	ff010113          	addi	sp,sp,-16
    80002f2c:	00113423          	sd	ra,8(sp)
    80002f30:	00813023          	sd	s0,0(sp)
    80002f34:	01010413          	addi	s0,sp,16
    sem_close(sem);
    80002f38:	00053503          	ld	a0,0(a0)
    80002f3c:	00002097          	auipc	ra,0x2
    80002f40:	264080e7          	jalr	612(ra) # 800051a0 <_Z9sem_closeP4_sem>
}
    80002f44:	00813083          	ld	ra,8(sp)
    80002f48:	00013403          	ld	s0,0(sp)
    80002f4c:	01010113          	addi	sp,sp,16
    80002f50:	00008067          	ret

0000000080002f54 <_ZN14ConsoleManagerC1Ev>:
ConsoleManager::ConsoleManager(){
    80002f54:	fd010113          	addi	sp,sp,-48
    80002f58:	02113423          	sd	ra,40(sp)
    80002f5c:	02813023          	sd	s0,32(sp)
    80002f60:	00913c23          	sd	s1,24(sp)
    80002f64:	01213823          	sd	s2,16(sp)
    80002f68:	01313423          	sd	s3,8(sp)
    80002f6c:	03010413          	addi	s0,sp,48
    80002f70:	00050493          	mv	s1,a0

    static ConsoleManager* instance;
    
    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    80002f74:	20053423          	sd	zero,520(a0)
    80002f78:	20053823          	sd	zero,528(a0)
    80002f7c:	20053c23          	sd	zero,536(a0)
    80002f80:	42053423          	sd	zero,1064(a0)
    80002f84:	42053823          	sd	zero,1072(a0)
    80002f88:	42053c23          	sd	zero,1080(a0)
    assert(instance == 0);
    80002f8c:	0000c797          	auipc	a5,0xc
    80002f90:	2747b783          	ld	a5,628(a5) # 8000f200 <_ZN14ConsoleManager8instanceE>
    80002f94:	02079463          	bnez	a5,80002fbc <_ZN14ConsoleManagerC1Ev+0x68>
    instance = this;
    80002f98:	0000c797          	auipc	a5,0xc
    80002f9c:	2697b423          	sd	s1,616(a5) # 8000f200 <_ZN14ConsoleManager8instanceE>
}
    80002fa0:	02813083          	ld	ra,40(sp)
    80002fa4:	02013403          	ld	s0,32(sp)
    80002fa8:	01813483          	ld	s1,24(sp)
    80002fac:	01013903          	ld	s2,16(sp)
    80002fb0:	00813983          	ld	s3,8(sp)
    80002fb4:	03010113          	addi	sp,sp,48
    80002fb8:	00008067          	ret
    80002fbc:	22050913          	addi	s2,a0,544
    assert(instance == 0);
    80002fc0:	00009697          	auipc	a3,0x9
    80002fc4:	1c868693          	addi	a3,a3,456 # 8000c188 <_ZTV9Semaphore+0x140>
    80002fc8:	01400613          	li	a2,20
    80002fcc:	00009597          	auipc	a1,0x9
    80002fd0:	19458593          	addi	a1,a1,404 # 8000c160 <_ZTV9Semaphore+0x118>
    80002fd4:	00009517          	auipc	a0,0x9
    80002fd8:	1dc50513          	addi	a0,a0,476 # 8000c1b0 <_ZTV9Semaphore+0x168>
    80002fdc:	00002097          	auipc	ra,0x2
    80002fe0:	6d4080e7          	jalr	1748(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80002fe4:	fb5ff06f          	j	80002f98 <_ZN14ConsoleManagerC1Ev+0x44>
    80002fe8:	00050993          	mv	s3,a0
ConsoleManager::ConsoleManager(){
    80002fec:	00090513          	mv	a0,s2
    80002ff0:	00000097          	auipc	ra,0x0
    80002ff4:	f38080e7          	jalr	-200(ra) # 80002f28 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80002ff8:	00048513          	mv	a0,s1
    80002ffc:	00000097          	auipc	ra,0x0
    80003000:	f2c080e7          	jalr	-212(ra) # 80002f28 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80003004:	00098513          	mv	a0,s3
    80003008:	0000d097          	auipc	ra,0xd
    8000300c:	360080e7          	jalr	864(ra) # 80010368 <_Unwind_Resume>

0000000080003010 <_ZN14ConsoleManagerD1Ev>:
ConsoleManager::~ConsoleManager(){
    80003010:	fe010113          	addi	sp,sp,-32
    80003014:	00113c23          	sd	ra,24(sp)
    80003018:	00813823          	sd	s0,16(sp)
    8000301c:	00913423          	sd	s1,8(sp)
    80003020:	02010413          	addi	s0,sp,32
    80003024:	00050493          	mv	s1,a0
    80003028:	22050513          	addi	a0,a0,544
    8000302c:	00000097          	auipc	ra,0x0
    80003030:	efc080e7          	jalr	-260(ra) # 80002f28 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80003034:	00048513          	mv	a0,s1
    80003038:	00000097          	auipc	ra,0x0
    8000303c:	ef0080e7          	jalr	-272(ra) # 80002f28 <_ZN14ConsoleManager13consoleBufferD1Ev>
}
    80003040:	01813083          	ld	ra,24(sp)
    80003044:	01013403          	ld	s0,16(sp)
    80003048:	00813483          	ld	s1,8(sp)
    8000304c:	02010113          	addi	sp,sp,32
    80003050:	00008067          	ret

0000000080003054 <_ZN14ConsoleManager13consoleBuffer4initEv>:

void ConsoleManager::consoleBuffer::init(){
    80003054:	ff010113          	addi	sp,sp,-16
    80003058:	00113423          	sd	ra,8(sp)
    8000305c:	00813023          	sd	s0,0(sp)
    80003060:	01010413          	addi	s0,sp,16
    _sem::open(&sem, 0);
    80003064:	00000593          	li	a1,0
    80003068:	00002097          	auipc	ra,0x2
    8000306c:	264080e7          	jalr	612(ra) # 800052cc <_ZN4_sem4openEPPS_j>
}
    80003070:	00813083          	ld	ra,8(sp)
    80003074:	00013403          	ld	s0,0(sp)
    80003078:	01010113          	addi	sp,sp,16
    8000307c:	00008067          	ret

0000000080003080 <_ZN14ConsoleManager4initEv>:
void ConsoleManager::init(){
    80003080:	fe010113          	addi	sp,sp,-32
    80003084:	00113c23          	sd	ra,24(sp)
    80003088:	00813823          	sd	s0,16(sp)
    8000308c:	00913423          	sd	s1,8(sp)
    80003090:	02010413          	addi	s0,sp,32
    80003094:	00050493          	mv	s1,a0
    inBuffer.init();
    80003098:	00000097          	auipc	ra,0x0
    8000309c:	fbc080e7          	jalr	-68(ra) # 80003054 <_ZN14ConsoleManager13consoleBuffer4initEv>
    outBuffer.init();
    800030a0:	22048513          	addi	a0,s1,544
    800030a4:	00000097          	auipc	ra,0x0
    800030a8:	fb0080e7          	jalr	-80(ra) # 80003054 <_ZN14ConsoleManager13consoleBuffer4initEv>
    waitingThreads = 0;
    800030ac:	4404a023          	sw	zero,1088(s1)
}
    800030b0:	01813083          	ld	ra,24(sp)
    800030b4:	01013403          	ld	s0,16(sp)
    800030b8:	00813483          	ld	s1,8(sp)
    800030bc:	02010113          	addi	sp,sp,32
    800030c0:	00008067          	ret

00000000800030c4 <_ZN14ConsoleManager13consoleBuffer3putEc>:

void ConsoleManager::consoleBuffer::put(char c){
    800030c4:	ff010113          	addi	sp,sp,-16
    800030c8:	00113423          	sd	ra,8(sp)
    800030cc:	00813023          	sd	s0,0(sp)
    800030d0:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    800030d4:	21053783          	ld	a5,528(a0)
    800030d8:	00f50733          	add	a4,a0,a5
    800030dc:	00b70423          	sb	a1,8(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    800030e0:	00178793          	addi	a5,a5,1
    800030e4:	1ff7f793          	andi	a5,a5,511
    800030e8:	20f53823          	sd	a5,528(a0)
    size++;
    800030ec:	21853783          	ld	a5,536(a0)
    800030f0:	00178793          	addi	a5,a5,1
    800030f4:	20f53c23          	sd	a5,536(a0)
    sem_signal(sem);
    800030f8:	00053503          	ld	a0,0(a0)
    800030fc:	00002097          	auipc	ra,0x2
    80003100:	0fc080e7          	jalr	252(ra) # 800051f8 <_Z10sem_signalP4_sem>
}
    80003104:	00813083          	ld	ra,8(sp)
    80003108:	00013403          	ld	s0,0(sp)
    8000310c:	01010113          	addi	sp,sp,16
    80003110:	00008067          	ret

0000000080003114 <_ZN14ConsoleManager13consoleBuffer3getEv>:

char ConsoleManager::consoleBuffer::get(){
    80003114:	fe010113          	addi	sp,sp,-32
    80003118:	00113c23          	sd	ra,24(sp)
    8000311c:	00813823          	sd	s0,16(sp)
    80003120:	00913423          	sd	s1,8(sp)
    80003124:	02010413          	addi	s0,sp,32
    80003128:	00050493          	mv	s1,a0
    sem_wait(sem);
    8000312c:	00053503          	ld	a0,0(a0)
    80003130:	00002097          	auipc	ra,0x2
    80003134:	09c080e7          	jalr	156(ra) # 800051cc <_Z8sem_waitP4_sem>
    char c = buffer[head];
    80003138:	2084b783          	ld	a5,520(s1)
    8000313c:	00f48733          	add	a4,s1,a5
    80003140:	00874503          	lbu	a0,8(a4)
    head = (head + 1) % BUFFER_SIZE;
    80003144:	00178793          	addi	a5,a5,1
    80003148:	1ff7f793          	andi	a5,a5,511
    8000314c:	20f4b423          	sd	a5,520(s1)
    size--;
    80003150:	2184b783          	ld	a5,536(s1)
    80003154:	fff78793          	addi	a5,a5,-1
    80003158:	20f4bc23          	sd	a5,536(s1)
    return c;
}
    8000315c:	01813083          	ld	ra,24(sp)
    80003160:	01013403          	ld	s0,16(sp)
    80003164:	00813483          	ld	s1,8(sp)
    80003168:	02010113          	addi	sp,sp,32
    8000316c:	00008067          	ret

0000000080003170 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>:

bool ConsoleManager::consoleBuffer::isEmpty(){
    80003170:	ff010113          	addi	sp,sp,-16
    80003174:	00813423          	sd	s0,8(sp)
    80003178:	01010413          	addi	s0,sp,16
    return size == 0;
    8000317c:	21853503          	ld	a0,536(a0)
}
    80003180:	00153513          	seqz	a0,a0
    80003184:	00813403          	ld	s0,8(sp)
    80003188:	01010113          	addi	sp,sp,16
    8000318c:	00008067          	ret

0000000080003190 <_ZN14ConsoleManager13consoleBuffer6isFullEv>:

bool ConsoleManager::consoleBuffer::isFull(){
    80003190:	ff010113          	addi	sp,sp,-16
    80003194:	00813423          	sd	s0,8(sp)
    80003198:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    8000319c:	21853503          	ld	a0,536(a0)
    800031a0:	e0050513          	addi	a0,a0,-512
}
    800031a4:	00153513          	seqz	a0,a0
    800031a8:	00813403          	ld	s0,8(sp)
    800031ac:	01010113          	addi	sp,sp,16
    800031b0:	00008067          	ret

00000000800031b4 <_ZN14ConsoleManager4putcEc>:

void ConsoleManager::putc(char c){
    800031b4:	ff010113          	addi	sp,sp,-16
    800031b8:	00113423          	sd	ra,8(sp)
    800031bc:	00813023          	sd	s0,0(sp)
    800031c0:	01010413          	addi	s0,sp,16
    800031c4:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    800031c8:	0000c517          	auipc	a0,0xc
    800031cc:	03853503          	ld	a0,56(a0) # 8000f200 <_ZN14ConsoleManager8instanceE>
    800031d0:	22050513          	addi	a0,a0,544
    800031d4:	00000097          	auipc	ra,0x0
    800031d8:	ef0080e7          	jalr	-272(ra) # 800030c4 <_ZN14ConsoleManager13consoleBuffer3putEc>
}
    800031dc:	00813083          	ld	ra,8(sp)
    800031e0:	00013403          	ld	s0,0(sp)
    800031e4:	01010113          	addi	sp,sp,16
    800031e8:	00008067          	ret

00000000800031ec <_ZN14ConsoleManager4getcEv>:

char ConsoleManager::getc(){
    800031ec:	fe010113          	addi	sp,sp,-32
    800031f0:	00113c23          	sd	ra,24(sp)
    800031f4:	00813823          	sd	s0,16(sp)
    800031f8:	00913423          	sd	s1,8(sp)
    800031fc:	02010413          	addi	s0,sp,32
    instance->waitingThreads++;
    80003200:	0000c497          	auipc	s1,0xc
    80003204:	00048493          	mv	s1,s1
    80003208:	0004b503          	ld	a0,0(s1) # 8000f200 <_ZN14ConsoleManager8instanceE>
    8000320c:	44052783          	lw	a5,1088(a0)
    80003210:	0017879b          	addiw	a5,a5,1
    80003214:	44f52023          	sw	a5,1088(a0)
    char c = instance->inBuffer.get();
    80003218:	00000097          	auipc	ra,0x0
    8000321c:	efc080e7          	jalr	-260(ra) # 80003114 <_ZN14ConsoleManager13consoleBuffer3getEv>
    instance->waitingThreads--;
    80003220:	0004b703          	ld	a4,0(s1)
    80003224:	44072783          	lw	a5,1088(a4)
    80003228:	fff7879b          	addiw	a5,a5,-1
    8000322c:	44f72023          	sw	a5,1088(a4)
    return c;
}
    80003230:	01813083          	ld	ra,24(sp)
    80003234:	01013403          	ld	s0,16(sp)
    80003238:	00813483          	ld	s1,8(sp)
    8000323c:	02010113          	addi	sp,sp,32
    80003240:	00008067          	ret

0000000080003244 <_ZN14ConsoleManager8finishedEv>:

bool ConsoleManager::finished(){
    80003244:	fe010113          	addi	sp,sp,-32
    80003248:	00113c23          	sd	ra,24(sp)
    8000324c:	00813823          	sd	s0,16(sp)
    80003250:	00913423          	sd	s1,8(sp)
    80003254:	02010413          	addi	s0,sp,32
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
    80003258:	0000c497          	auipc	s1,0xc
    8000325c:	fa84b483          	ld	s1,-88(s1) # 8000f200 <_ZN14ConsoleManager8instanceE>
    80003260:	22048513          	addi	a0,s1,544
    80003264:	00000097          	auipc	ra,0x0
    80003268:	f0c080e7          	jalr	-244(ra) # 80003170 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    8000326c:	00050a63          	beqz	a0,80003280 <_ZN14ConsoleManager8finishedEv+0x3c>
    80003270:	4404a783          	lw	a5,1088(s1)
    80003274:	00078863          	beqz	a5,80003284 <_ZN14ConsoleManager8finishedEv+0x40>
    80003278:	00000513          	li	a0,0
    8000327c:	0080006f          	j	80003284 <_ZN14ConsoleManager8finishedEv+0x40>
    80003280:	00000513          	li	a0,0
}
    80003284:	01813083          	ld	ra,24(sp)
    80003288:	01013403          	ld	s0,16(sp)
    8000328c:	00813483          	ld	s1,8(sp)
    80003290:	02010113          	addi	sp,sp,32
    80003294:	00008067          	ret

0000000080003298 <_ZN14ConsoleManager13outputHandlerEv>:

void ConsoleManager::outputHandler(){
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    80003298:	00009797          	auipc	a5,0x9
    8000329c:	d807b783          	ld	a5,-640(a5) # 8000c018 <CONSOLE_STATUS>
    800032a0:	0007c783          	lbu	a5,0(a5)
    800032a4:	0207f793          	andi	a5,a5,32
    800032a8:	04078c63          	beqz	a5,80003300 <_ZN14ConsoleManager13outputHandlerEv+0x68>
void ConsoleManager::outputHandler(){
    800032ac:	ff010113          	addi	sp,sp,-16
    800032b0:	00113423          	sd	ra,8(sp)
    800032b4:	00813023          	sd	s0,0(sp)
    800032b8:	01010413          	addi	s0,sp,16
        (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    800032bc:	0000c517          	auipc	a0,0xc
    800032c0:	f4453503          	ld	a0,-188(a0) # 8000f200 <_ZN14ConsoleManager8instanceE>
    800032c4:	22050513          	addi	a0,a0,544
    800032c8:	00000097          	auipc	ra,0x0
    800032cc:	e4c080e7          	jalr	-436(ra) # 80003114 <_ZN14ConsoleManager13consoleBuffer3getEv>
    800032d0:	00009797          	auipc	a5,0x9
    800032d4:	d407b783          	ld	a5,-704(a5) # 8000c010 <CONSOLE_TX_DATA>
    800032d8:	00a78023          	sb	a0,0(a5)
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    800032dc:	00009797          	auipc	a5,0x9
    800032e0:	d3c7b783          	ld	a5,-708(a5) # 8000c018 <CONSOLE_STATUS>
    800032e4:	0007c783          	lbu	a5,0(a5)
    800032e8:	0207f793          	andi	a5,a5,32
    800032ec:	fc0798e3          	bnez	a5,800032bc <_ZN14ConsoleManager13outputHandlerEv+0x24>
    }
}
    800032f0:	00813083          	ld	ra,8(sp)
    800032f4:	00013403          	ld	s0,0(sp)
    800032f8:	01010113          	addi	sp,sp,16
    800032fc:	00008067          	ret
    80003300:	00008067          	ret

0000000080003304 <_ZN14ConsoleManager12inputHandlerEv>:

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80003304:	00009797          	auipc	a5,0x9
    80003308:	d147b783          	ld	a5,-748(a5) # 8000c018 <CONSOLE_STATUS>
    8000330c:	0007c783          	lbu	a5,0(a5)
    80003310:	0017f793          	andi	a5,a5,1
    80003314:	04078a63          	beqz	a5,80003368 <_ZN14ConsoleManager12inputHandlerEv+0x64>
void ConsoleManager::inputHandler(){
    80003318:	ff010113          	addi	sp,sp,-16
    8000331c:	00113423          	sd	ra,8(sp)
    80003320:	00813023          	sd	s0,0(sp)
    80003324:	01010413          	addi	s0,sp,16
        char ch =(*(char*)CONSOLE_RX_DATA);
        instance->inBuffer.put(ch);
    80003328:	00009797          	auipc	a5,0x9
    8000332c:	ce07b783          	ld	a5,-800(a5) # 8000c008 <CONSOLE_RX_DATA>
    80003330:	0007c583          	lbu	a1,0(a5)
    80003334:	0000c517          	auipc	a0,0xc
    80003338:	ecc53503          	ld	a0,-308(a0) # 8000f200 <_ZN14ConsoleManager8instanceE>
    8000333c:	00000097          	auipc	ra,0x0
    80003340:	d88080e7          	jalr	-632(ra) # 800030c4 <_ZN14ConsoleManager13consoleBuffer3putEc>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80003344:	00009797          	auipc	a5,0x9
    80003348:	cd47b783          	ld	a5,-812(a5) # 8000c018 <CONSOLE_STATUS>
    8000334c:	0007c783          	lbu	a5,0(a5)
    80003350:	0017f793          	andi	a5,a5,1
    80003354:	fc079ae3          	bnez	a5,80003328 <_ZN14ConsoleManager12inputHandlerEv+0x24>
    }
    80003358:	00813083          	ld	ra,8(sp)
    8000335c:	00013403          	ld	s0,0(sp)
    80003360:	01010113          	addi	sp,sp,16
    80003364:	00008067          	ret
    80003368:	00008067          	ret

000000008000336c <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "consoleManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    8000336c:	fe010113          	addi	sp,sp,-32
    80003370:	00113c23          	sd	ra,24(sp)
    80003374:	00813823          	sd	s0,16(sp)
    80003378:	00913423          	sd	s1,8(sp)
    8000337c:	02010413          	addi	s0,sp,32
    80003380:	00050493          	mv	s1,a0
    assert(instance == 0);
    80003384:	0000c797          	auipc	a5,0xc
    80003388:	e847b783          	ld	a5,-380(a5) # 8000f208 <_ZN11HeapManager8instanceE>
    8000338c:	02079063          	bnez	a5,800033ac <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80003390:	0000c797          	auipc	a5,0xc
    80003394:	e697bc23          	sd	s1,-392(a5) # 8000f208 <_ZN11HeapManager8instanceE>
}
    80003398:	01813083          	ld	ra,24(sp)
    8000339c:	01013403          	ld	s0,16(sp)
    800033a0:	00813483          	ld	s1,8(sp)
    800033a4:	02010113          	addi	sp,sp,32
    800033a8:	00008067          	ret
    assert(instance == 0);
    800033ac:	00009697          	auipc	a3,0x9
    800033b0:	e1468693          	addi	a3,a3,-492 # 8000c1c0 <_ZTV9Semaphore+0x178>
    800033b4:	01200613          	li	a2,18
    800033b8:	00009597          	auipc	a1,0x9
    800033bc:	e2858593          	addi	a1,a1,-472 # 8000c1e0 <_ZTV9Semaphore+0x198>
    800033c0:	00009517          	auipc	a0,0x9
    800033c4:	df050513          	addi	a0,a0,-528 # 8000c1b0 <_ZTV9Semaphore+0x168>
    800033c8:	00002097          	auipc	ra,0x2
    800033cc:	2e8080e7          	jalr	744(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    800033d0:	fc1ff06f          	j	80003390 <_ZN11HeapManagerC1Ev+0x24>

00000000800033d4 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800033d4:	ff010113          	addi	sp,sp,-16
    800033d8:	00813423          	sd	s0,8(sp)
    800033dc:	01010413          	addi	s0,sp,16
    
}
    800033e0:	00813403          	ld	s0,8(sp)
    800033e4:	01010113          	addi	sp,sp,16
    800033e8:	00008067          	ret

00000000800033ec <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    800033ec:	fd010113          	addi	sp,sp,-48
    800033f0:	02113423          	sd	ra,40(sp)
    800033f4:	02813023          	sd	s0,32(sp)
    800033f8:	00913c23          	sd	s1,24(sp)
    800033fc:	01213823          	sd	s2,16(sp)
    80003400:	01313423          	sd	s3,8(sp)
    80003404:	03010413          	addi	s0,sp,48
    80003408:	00050993          	mv	s3,a0
    8000340c:	00058913          	mv	s2,a1
    /// Align the start address
    #ifdef CHECK_CONDITIONS
        assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003410:	40b604b3          	sub	s1,a2,a1
    80003414:	0414b793          	sltiu	a5,s1,65
    80003418:	0c079a63          	bnez	a5,800034ec <_ZN11HeapManager4initEmm+0x100>
    #endif
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    8000341c:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003420:	fe100793          	li	a5,-31
    80003424:	00f90c23          	sb	a5,24(s2)
    80003428:	ffe00793          	li	a5,-2
    8000342c:	00f90ca3          	sb	a5,25(s2)
    80003430:	00f00793          	li	a5,15
    80003434:	00f90d23          	sb	a5,26(s2)
    80003438:	01c00793          	li	a5,28
    8000343c:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80003440:	0064d613          	srli	a2,s1,0x6
    80003444:	0009b783          	ld	a5,0(s3)
    80003448:	fff60613          	addi	a2,a2,-1
    8000344c:	00c78823          	sb	a2,16(a5)
    80003450:	00865713          	srli	a4,a2,0x8
    80003454:	00e788a3          	sb	a4,17(a5)
    80003458:	01065713          	srli	a4,a2,0x10
    8000345c:	00e78923          	sb	a4,18(a5)
    80003460:	0186571b          	srliw	a4,a2,0x18
    80003464:	00e789a3          	sb	a4,19(a5)
    80003468:	02065713          	srli	a4,a2,0x20
    8000346c:	00e78a23          	sb	a4,20(a5)
    80003470:	02865713          	srli	a4,a2,0x28
    80003474:	00e78aa3          	sb	a4,21(a5)
    80003478:	03065713          	srli	a4,a2,0x30
    8000347c:	00e78b23          	sb	a4,22(a5)
    80003480:	03865613          	srli	a2,a2,0x38
    80003484:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80003488:	0009b783          	ld	a5,0(s3)
    8000348c:	00078023          	sb	zero,0(a5)
    80003490:	000780a3          	sb	zero,1(a5)
    80003494:	00078123          	sb	zero,2(a5)
    80003498:	000781a3          	sb	zero,3(a5)
    8000349c:	00078223          	sb	zero,4(a5)
    800034a0:	000782a3          	sb	zero,5(a5)
    800034a4:	00078323          	sb	zero,6(a5)
    800034a8:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    800034ac:	0009b783          	ld	a5,0(s3)
    800034b0:	00078423          	sb	zero,8(a5)
    800034b4:	000784a3          	sb	zero,9(a5)
    800034b8:	00078523          	sb	zero,10(a5)
    800034bc:	000785a3          	sb	zero,11(a5)
    800034c0:	00078623          	sb	zero,12(a5)
    800034c4:	000786a3          	sb	zero,13(a5)
    800034c8:	00078723          	sb	zero,14(a5)
    800034cc:	000787a3          	sb	zero,15(a5)
}
    800034d0:	02813083          	ld	ra,40(sp)
    800034d4:	02013403          	ld	s0,32(sp)
    800034d8:	01813483          	ld	s1,24(sp)
    800034dc:	01013903          	ld	s2,16(sp)
    800034e0:	00813983          	ld	s3,8(sp)
    800034e4:	03010113          	addi	sp,sp,48
    800034e8:	00008067          	ret
        assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800034ec:	00009697          	auipc	a3,0x9
    800034f0:	d0c68693          	addi	a3,a3,-756 # 8000c1f8 <_ZTV9Semaphore+0x1b0>
    800034f4:	01d00613          	li	a2,29
    800034f8:	00009597          	auipc	a1,0x9
    800034fc:	ce858593          	addi	a1,a1,-792 # 8000c1e0 <_ZTV9Semaphore+0x198>
    80003500:	00009517          	auipc	a0,0x9
    80003504:	d2050513          	addi	a0,a0,-736 # 8000c220 <_ZTV9Semaphore+0x1d8>
    80003508:	00002097          	auipc	ra,0x2
    8000350c:	1a8080e7          	jalr	424(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80003510:	f0dff06f          	j	8000341c <_ZN11HeapManager4initEmm+0x30>

0000000080003514 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80003514:	fe010113          	addi	sp,sp,-32
    80003518:	00113c23          	sd	ra,24(sp)
    8000351c:	00813823          	sd	s0,16(sp)
    80003520:	00913423          	sd	s1,8(sp)
    80003524:	01213023          	sd	s2,0(sp)
    80003528:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    8000352c:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80003530:	00000913          	li	s2,0
    80003534:	0b80006f          	j	800035ec <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        #ifdef CHECK_CONDITIONS
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        nFreeMemory += pCurrent->nSize;
    80003538:	0104c783          	lbu	a5,16(s1)
    8000353c:	0114c703          	lbu	a4,17(s1)
    80003540:	00871713          	slli	a4,a4,0x8
    80003544:	00f76733          	or	a4,a4,a5
    80003548:	0124c783          	lbu	a5,18(s1)
    8000354c:	01079793          	slli	a5,a5,0x10
    80003550:	00e7e733          	or	a4,a5,a4
    80003554:	0134c783          	lbu	a5,19(s1)
    80003558:	01879793          	slli	a5,a5,0x18
    8000355c:	00e7e7b3          	or	a5,a5,a4
    80003560:	0144c703          	lbu	a4,20(s1)
    80003564:	02071713          	slli	a4,a4,0x20
    80003568:	00f767b3          	or	a5,a4,a5
    8000356c:	0154c703          	lbu	a4,21(s1)
    80003570:	02871713          	slli	a4,a4,0x28
    80003574:	00f76733          	or	a4,a4,a5
    80003578:	0164c783          	lbu	a5,22(s1)
    8000357c:	03079793          	slli	a5,a5,0x30
    80003580:	00e7e733          	or	a4,a5,a4
    80003584:	0174c783          	lbu	a5,23(s1)
    80003588:	03879793          	slli	a5,a5,0x38
    8000358c:	00e7e7b3          	or	a5,a5,a4
    80003590:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003594:	0004c703          	lbu	a4,0(s1)
    80003598:	0014c783          	lbu	a5,1(s1)
    8000359c:	00879793          	slli	a5,a5,0x8
    800035a0:	00e7e733          	or	a4,a5,a4
    800035a4:	0024c783          	lbu	a5,2(s1)
    800035a8:	01079793          	slli	a5,a5,0x10
    800035ac:	00e7e7b3          	or	a5,a5,a4
    800035b0:	0034c703          	lbu	a4,3(s1)
    800035b4:	01871713          	slli	a4,a4,0x18
    800035b8:	00f767b3          	or	a5,a4,a5
    800035bc:	0044c703          	lbu	a4,4(s1)
    800035c0:	02071713          	slli	a4,a4,0x20
    800035c4:	00f76733          	or	a4,a4,a5
    800035c8:	0054c783          	lbu	a5,5(s1)
    800035cc:	02879793          	slli	a5,a5,0x28
    800035d0:	00e7e733          	or	a4,a5,a4
    800035d4:	0064c783          	lbu	a5,6(s1)
    800035d8:	03079793          	slli	a5,a5,0x30
    800035dc:	00e7e7b3          	or	a5,a5,a4
    800035e0:	0074c483          	lbu	s1,7(s1)
    800035e4:	03849493          	slli	s1,s1,0x38
    800035e8:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800035ec:	06048263          	beqz	s1,80003650 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800035f0:	0184c783          	lbu	a5,24(s1)
    800035f4:	0194c703          	lbu	a4,25(s1)
    800035f8:	00871713          	slli	a4,a4,0x8
    800035fc:	00f76733          	or	a4,a4,a5
    80003600:	01a4c783          	lbu	a5,26(s1)
    80003604:	01079793          	slli	a5,a5,0x10
    80003608:	00e7e733          	or	a4,a5,a4
    8000360c:	01b4c783          	lbu	a5,27(s1)
    80003610:	01879793          	slli	a5,a5,0x18
    80003614:	00e7e7b3          	or	a5,a5,a4
    80003618:	0007879b          	sext.w	a5,a5
    8000361c:	1c100737          	lui	a4,0x1c100
    80003620:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003624:	f0e78ae3          	beq	a5,a4,80003538 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80003628:	00009697          	auipc	a3,0x9
    8000362c:	c1868693          	addi	a3,a3,-1000 # 8000c240 <_ZTV9Semaphore+0x1f8>
    80003630:	02c00613          	li	a2,44
    80003634:	00009597          	auipc	a1,0x9
    80003638:	bac58593          	addi	a1,a1,-1108 # 8000c1e0 <_ZTV9Semaphore+0x198>
    8000363c:	00009517          	auipc	a0,0x9
    80003640:	c2c50513          	addi	a0,a0,-980 # 8000c268 <_ZTV9Semaphore+0x220>
    80003644:	00002097          	auipc	ra,0x2
    80003648:	06c080e7          	jalr	108(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    8000364c:	eedff06f          	j	80003538 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003650:	00090513          	mv	a0,s2
    80003654:	01813083          	ld	ra,24(sp)
    80003658:	01013403          	ld	s0,16(sp)
    8000365c:	00813483          	ld	s1,8(sp)
    80003660:	00013903          	ld	s2,0(sp)
    80003664:	02010113          	addi	sp,sp,32
    80003668:	00008067          	ret

000000008000366c <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    8000366c:	fd010113          	addi	sp,sp,-48
    80003670:	02113423          	sd	ra,40(sp)
    80003674:	02813023          	sd	s0,32(sp)
    80003678:	00913c23          	sd	s1,24(sp)
    8000367c:	01213823          	sd	s2,16(sp)
    80003680:	01313423          	sd	s3,8(sp)
    80003684:	03010413          	addi	s0,sp,48
    80003688:	00050993          	mv	s3,a0
    8000368c:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003690:	00053483          	ld	s1,0(a0)
    80003694:	0c00006f          	j	80003754 <_ZN11HeapManager12heapAllocateEm+0xe8>
    while(pCurrent != 0){
        #ifdef CHECK_CONDITIONS
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        if(pCurrent->nSize > nSize + 1){
    80003698:	0104c783          	lbu	a5,16(s1)
    8000369c:	0114c703          	lbu	a4,17(s1)
    800036a0:	00871713          	slli	a4,a4,0x8
    800036a4:	00f76733          	or	a4,a4,a5
    800036a8:	0124c783          	lbu	a5,18(s1)
    800036ac:	01079793          	slli	a5,a5,0x10
    800036b0:	00e7e733          	or	a4,a5,a4
    800036b4:	0134c783          	lbu	a5,19(s1)
    800036b8:	01879793          	slli	a5,a5,0x18
    800036bc:	00e7e7b3          	or	a5,a5,a4
    800036c0:	0144c703          	lbu	a4,20(s1)
    800036c4:	02071713          	slli	a4,a4,0x20
    800036c8:	00f767b3          	or	a5,a4,a5
    800036cc:	0154c703          	lbu	a4,21(s1)
    800036d0:	02871713          	slli	a4,a4,0x28
    800036d4:	00f76733          	or	a4,a4,a5
    800036d8:	0164c783          	lbu	a5,22(s1)
    800036dc:	03079793          	slli	a5,a5,0x30
    800036e0:	00e7e733          	or	a4,a5,a4
    800036e4:	0174c783          	lbu	a5,23(s1)
    800036e8:	03879793          	slli	a5,a5,0x38
    800036ec:	00e7e7b3          	or	a5,a5,a4
    800036f0:	00190713          	addi	a4,s2,1
    800036f4:	0cf76263          	bltu	a4,a5,800037b8 <_ZN11HeapManager12heapAllocateEm+0x14c>
            if(pCurrent == m_pHead){
                m_pHead = pNew;
            }
            pCurrent->nSize = nSize;
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }else if(pCurrent->nSize >= nSize){
    800036f8:	3d27fe63          	bgeu	a5,s2,80003ad4 <_ZN11HeapManager12heapAllocateEm+0x468>
            if(pCurrent == m_pHead){
                m_pHead = pCurrent->pNext;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    800036fc:	0004c703          	lbu	a4,0(s1)
    80003700:	0014c783          	lbu	a5,1(s1)
    80003704:	00879793          	slli	a5,a5,0x8
    80003708:	00e7e733          	or	a4,a5,a4
    8000370c:	0024c783          	lbu	a5,2(s1)
    80003710:	01079793          	slli	a5,a5,0x10
    80003714:	00e7e7b3          	or	a5,a5,a4
    80003718:	0034c703          	lbu	a4,3(s1)
    8000371c:	01871713          	slli	a4,a4,0x18
    80003720:	00f767b3          	or	a5,a4,a5
    80003724:	0044c703          	lbu	a4,4(s1)
    80003728:	02071713          	slli	a4,a4,0x20
    8000372c:	00f76733          	or	a4,a4,a5
    80003730:	0054c783          	lbu	a5,5(s1)
    80003734:	02879793          	slli	a5,a5,0x28
    80003738:	00e7e733          	or	a4,a5,a4
    8000373c:	0064c783          	lbu	a5,6(s1)
    80003740:	03079793          	slli	a5,a5,0x30
    80003744:	00e7e7b3          	or	a5,a5,a4
    80003748:	0074c483          	lbu	s1,7(s1)
    8000374c:	03849493          	slli	s1,s1,0x38
    80003750:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003754:	5c048863          	beqz	s1,80003d24 <_ZN11HeapManager12heapAllocateEm+0x6b8>
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003758:	0184c783          	lbu	a5,24(s1)
    8000375c:	0194c703          	lbu	a4,25(s1)
    80003760:	00871713          	slli	a4,a4,0x8
    80003764:	00f76733          	or	a4,a4,a5
    80003768:	01a4c783          	lbu	a5,26(s1)
    8000376c:	01079793          	slli	a5,a5,0x10
    80003770:	00e7e733          	or	a4,a5,a4
    80003774:	01b4c783          	lbu	a5,27(s1)
    80003778:	01879793          	slli	a5,a5,0x18
    8000377c:	00e7e7b3          	or	a5,a5,a4
    80003780:	0007879b          	sext.w	a5,a5
    80003784:	1c100737          	lui	a4,0x1c100
    80003788:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    8000378c:	f0e786e3          	beq	a5,a4,80003698 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003790:	00009697          	auipc	a3,0x9
    80003794:	b0068693          	addi	a3,a3,-1280 # 8000c290 <_ZTV9Semaphore+0x248>
    80003798:	03800613          	li	a2,56
    8000379c:	00009597          	auipc	a1,0x9
    800037a0:	a4458593          	addi	a1,a1,-1468 # 8000c1e0 <_ZTV9Semaphore+0x198>
    800037a4:	00009517          	auipc	a0,0x9
    800037a8:	ac450513          	addi	a0,a0,-1340 # 8000c268 <_ZTV9Semaphore+0x220>
    800037ac:	00002097          	auipc	ra,0x2
    800037b0:	f04080e7          	jalr	-252(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    800037b4:	ee5ff06f          	j	80003698 <_ZN11HeapManager12heapAllocateEm+0x2c>
            HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    800037b8:	00671713          	slli	a4,a4,0x6
    800037bc:	00048613          	mv	a2,s1
    800037c0:	00970733          	add	a4,a4,s1
            pNew->nSize = pCurrent->nSize - nSize - 1;
    800037c4:	412787b3          	sub	a5,a5,s2
    800037c8:	fff78793          	addi	a5,a5,-1
    800037cc:	00f70823          	sb	a5,16(a4)
    800037d0:	0087d693          	srli	a3,a5,0x8
    800037d4:	00d708a3          	sb	a3,17(a4)
    800037d8:	0107d693          	srli	a3,a5,0x10
    800037dc:	00d70923          	sb	a3,18(a4)
    800037e0:	0187d69b          	srliw	a3,a5,0x18
    800037e4:	00d709a3          	sb	a3,19(a4)
    800037e8:	0207d693          	srli	a3,a5,0x20
    800037ec:	00d70a23          	sb	a3,20(a4)
    800037f0:	0287d693          	srli	a3,a5,0x28
    800037f4:	00d70aa3          	sb	a3,21(a4)
    800037f8:	0307d693          	srli	a3,a5,0x30
    800037fc:	00d70b23          	sb	a3,22(a4)
    80003800:	0387d793          	srli	a5,a5,0x38
    80003804:	00f70ba3          	sb	a5,23(a4)
            pNew->pNext = pCurrent->pNext;
    80003808:	0004c783          	lbu	a5,0(s1)
    8000380c:	0014c683          	lbu	a3,1(s1)
    80003810:	00869693          	slli	a3,a3,0x8
    80003814:	00f6e7b3          	or	a5,a3,a5
    80003818:	0024c683          	lbu	a3,2(s1)
    8000381c:	01069693          	slli	a3,a3,0x10
    80003820:	00f6e6b3          	or	a3,a3,a5
    80003824:	0034c783          	lbu	a5,3(s1)
    80003828:	01879793          	slli	a5,a5,0x18
    8000382c:	00d7e6b3          	or	a3,a5,a3
    80003830:	0044c783          	lbu	a5,4(s1)
    80003834:	02079793          	slli	a5,a5,0x20
    80003838:	00d7e7b3          	or	a5,a5,a3
    8000383c:	0054c683          	lbu	a3,5(s1)
    80003840:	02869693          	slli	a3,a3,0x28
    80003844:	00f6e7b3          	or	a5,a3,a5
    80003848:	0064c683          	lbu	a3,6(s1)
    8000384c:	03069693          	slli	a3,a3,0x30
    80003850:	00f6e6b3          	or	a3,a3,a5
    80003854:	0074c783          	lbu	a5,7(s1)
    80003858:	03879793          	slli	a5,a5,0x38
    8000385c:	00d7e7b3          	or	a5,a5,a3
    80003860:	00d70023          	sb	a3,0(a4)
    80003864:	0087d693          	srli	a3,a5,0x8
    80003868:	00d700a3          	sb	a3,1(a4)
    8000386c:	0107d693          	srli	a3,a5,0x10
    80003870:	00d70123          	sb	a3,2(a4)
    80003874:	0187d69b          	srliw	a3,a5,0x18
    80003878:	00d701a3          	sb	a3,3(a4)
    8000387c:	0207d693          	srli	a3,a5,0x20
    80003880:	00d70223          	sb	a3,4(a4)
    80003884:	0287d693          	srli	a3,a5,0x28
    80003888:	00d702a3          	sb	a3,5(a4)
    8000388c:	0307d693          	srli	a3,a5,0x30
    80003890:	00d70323          	sb	a3,6(a4)
    80003894:	0387d793          	srli	a5,a5,0x38
    80003898:	00f703a3          	sb	a5,7(a4)
            pNew->pPrev = pCurrent->pPrev;
    8000389c:	0084c783          	lbu	a5,8(s1)
    800038a0:	0094c683          	lbu	a3,9(s1)
    800038a4:	00869693          	slli	a3,a3,0x8
    800038a8:	00f6e7b3          	or	a5,a3,a5
    800038ac:	00a4c683          	lbu	a3,10(s1)
    800038b0:	01069693          	slli	a3,a3,0x10
    800038b4:	00f6e6b3          	or	a3,a3,a5
    800038b8:	00b4c783          	lbu	a5,11(s1)
    800038bc:	01879793          	slli	a5,a5,0x18
    800038c0:	00d7e6b3          	or	a3,a5,a3
    800038c4:	00c4c783          	lbu	a5,12(s1)
    800038c8:	02079793          	slli	a5,a5,0x20
    800038cc:	00d7e7b3          	or	a5,a5,a3
    800038d0:	00d4c683          	lbu	a3,13(s1)
    800038d4:	02869693          	slli	a3,a3,0x28
    800038d8:	00f6e7b3          	or	a5,a3,a5
    800038dc:	00e4c683          	lbu	a3,14(s1)
    800038e0:	03069693          	slli	a3,a3,0x30
    800038e4:	00f6e6b3          	or	a3,a3,a5
    800038e8:	00f4c783          	lbu	a5,15(s1)
    800038ec:	03879793          	slli	a5,a5,0x38
    800038f0:	00d7e7b3          	or	a5,a5,a3
    800038f4:	00d70423          	sb	a3,8(a4)
    800038f8:	0087d693          	srli	a3,a5,0x8
    800038fc:	00d704a3          	sb	a3,9(a4)
    80003900:	0107d693          	srli	a3,a5,0x10
    80003904:	00d70523          	sb	a3,10(a4)
    80003908:	0187d69b          	srliw	a3,a5,0x18
    8000390c:	00d705a3          	sb	a3,11(a4)
    80003910:	0207d693          	srli	a3,a5,0x20
    80003914:	00d70623          	sb	a3,12(a4)
    80003918:	0287d693          	srli	a3,a5,0x28
    8000391c:	00d706a3          	sb	a3,13(a4)
    80003920:	0307d693          	srli	a3,a5,0x30
    80003924:	00d70723          	sb	a3,14(a4)
    80003928:	0387d793          	srli	a5,a5,0x38
    8000392c:	00f707a3          	sb	a5,15(a4)
            pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003930:	fe100793          	li	a5,-31
    80003934:	00f70c23          	sb	a5,24(a4)
    80003938:	ffe00793          	li	a5,-2
    8000393c:	00f70ca3          	sb	a5,25(a4)
    80003940:	00f00793          	li	a5,15
    80003944:	00f70d23          	sb	a5,26(a4)
    80003948:	01c00793          	li	a5,28
    8000394c:	00f70da3          	sb	a5,27(a4)
            if(pCurrent->pNext != 0){
    80003950:	0004c783          	lbu	a5,0(s1)
    80003954:	0014c683          	lbu	a3,1(s1)
    80003958:	00869693          	slli	a3,a3,0x8
    8000395c:	00f6e6b3          	or	a3,a3,a5
    80003960:	0024c783          	lbu	a5,2(s1)
    80003964:	01079793          	slli	a5,a5,0x10
    80003968:	00d7e6b3          	or	a3,a5,a3
    8000396c:	0034c783          	lbu	a5,3(s1)
    80003970:	01879793          	slli	a5,a5,0x18
    80003974:	00d7e7b3          	or	a5,a5,a3
    80003978:	0044c683          	lbu	a3,4(s1)
    8000397c:	02069693          	slli	a3,a3,0x20
    80003980:	00f6e7b3          	or	a5,a3,a5
    80003984:	0054c683          	lbu	a3,5(s1)
    80003988:	02869693          	slli	a3,a3,0x28
    8000398c:	00f6e6b3          	or	a3,a3,a5
    80003990:	0064c783          	lbu	a5,6(s1)
    80003994:	03079793          	slli	a5,a5,0x30
    80003998:	00d7e6b3          	or	a3,a5,a3
    8000399c:	0074c783          	lbu	a5,7(s1)
    800039a0:	03879793          	slli	a5,a5,0x38
    800039a4:	00d7e7b3          	or	a5,a5,a3
    800039a8:	04078063          	beqz	a5,800039e8 <_ZN11HeapManager12heapAllocateEm+0x37c>
                pCurrent->pNext->pPrev = pNew;
    800039ac:	00e78423          	sb	a4,8(a5)
    800039b0:	00875693          	srli	a3,a4,0x8
    800039b4:	00d784a3          	sb	a3,9(a5)
    800039b8:	01075693          	srli	a3,a4,0x10
    800039bc:	00d78523          	sb	a3,10(a5)
    800039c0:	0187569b          	srliw	a3,a4,0x18
    800039c4:	00d785a3          	sb	a3,11(a5)
    800039c8:	02075693          	srli	a3,a4,0x20
    800039cc:	00d78623          	sb	a3,12(a5)
    800039d0:	02875693          	srli	a3,a4,0x28
    800039d4:	00d786a3          	sb	a3,13(a5)
    800039d8:	03075693          	srli	a3,a4,0x30
    800039dc:	00d78723          	sb	a3,14(a5)
    800039e0:	03875693          	srli	a3,a4,0x38
    800039e4:	00d787a3          	sb	a3,15(a5)
            if(pCurrent->pPrev != 0){
    800039e8:	0084c783          	lbu	a5,8(s1)
    800039ec:	0094c683          	lbu	a3,9(s1)
    800039f0:	00869693          	slli	a3,a3,0x8
    800039f4:	00f6e6b3          	or	a3,a3,a5
    800039f8:	00a4c783          	lbu	a5,10(s1)
    800039fc:	01079793          	slli	a5,a5,0x10
    80003a00:	00d7e6b3          	or	a3,a5,a3
    80003a04:	00b4c783          	lbu	a5,11(s1)
    80003a08:	01879793          	slli	a5,a5,0x18
    80003a0c:	00d7e7b3          	or	a5,a5,a3
    80003a10:	00c4c683          	lbu	a3,12(s1)
    80003a14:	02069693          	slli	a3,a3,0x20
    80003a18:	00f6e7b3          	or	a5,a3,a5
    80003a1c:	00d4c683          	lbu	a3,13(s1)
    80003a20:	02869693          	slli	a3,a3,0x28
    80003a24:	00f6e6b3          	or	a3,a3,a5
    80003a28:	00e4c783          	lbu	a5,14(s1)
    80003a2c:	03079793          	slli	a5,a5,0x30
    80003a30:	00d7e6b3          	or	a3,a5,a3
    80003a34:	00f4c783          	lbu	a5,15(s1)
    80003a38:	03879793          	slli	a5,a5,0x38
    80003a3c:	00d7e7b3          	or	a5,a5,a3
    80003a40:	04078063          	beqz	a5,80003a80 <_ZN11HeapManager12heapAllocateEm+0x414>
                pCurrent->pPrev->pNext = pNew;
    80003a44:	00e78023          	sb	a4,0(a5)
    80003a48:	00875693          	srli	a3,a4,0x8
    80003a4c:	00d780a3          	sb	a3,1(a5)
    80003a50:	01075693          	srli	a3,a4,0x10
    80003a54:	00d78123          	sb	a3,2(a5)
    80003a58:	0187569b          	srliw	a3,a4,0x18
    80003a5c:	00d781a3          	sb	a3,3(a5)
    80003a60:	02075693          	srli	a3,a4,0x20
    80003a64:	00d78223          	sb	a3,4(a5)
    80003a68:	02875693          	srli	a3,a4,0x28
    80003a6c:	00d782a3          	sb	a3,5(a5)
    80003a70:	03075693          	srli	a3,a4,0x30
    80003a74:	00d78323          	sb	a3,6(a5)
    80003a78:	03875693          	srli	a3,a4,0x38
    80003a7c:	00d783a3          	sb	a3,7(a5)
            if(pCurrent == m_pHead){
    80003a80:	0009b783          	ld	a5,0(s3)
    80003a84:	04978463          	beq	a5,s1,80003acc <_ZN11HeapManager12heapAllocateEm+0x460>
            pCurrent->nSize = nSize;
    80003a88:	01248823          	sb	s2,16(s1)
    80003a8c:	00895793          	srli	a5,s2,0x8
    80003a90:	00f488a3          	sb	a5,17(s1)
    80003a94:	01095793          	srli	a5,s2,0x10
    80003a98:	00f48923          	sb	a5,18(s1)
    80003a9c:	0189579b          	srliw	a5,s2,0x18
    80003aa0:	00f489a3          	sb	a5,19(s1)
    80003aa4:	02095793          	srli	a5,s2,0x20
    80003aa8:	00f48a23          	sb	a5,20(s1)
    80003aac:	02895793          	srli	a5,s2,0x28
    80003ab0:	00f48aa3          	sb	a5,21(s1)
    80003ab4:	03095793          	srli	a5,s2,0x30
    80003ab8:	00f48b23          	sb	a5,22(s1)
    80003abc:	03895913          	srli	s2,s2,0x38
    80003ac0:	01248ba3          	sb	s2,23(s1)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003ac4:	04060493          	addi	s1,a2,64
    80003ac8:	2800006f          	j	80003d48 <_ZN11HeapManager12heapAllocateEm+0x6dc>
                m_pHead = pNew;
    80003acc:	00e9b023          	sd	a4,0(s3)
    80003ad0:	fb9ff06f          	j	80003a88 <_ZN11HeapManager12heapAllocateEm+0x41c>
            if(pCurrent->pPrev != 0){
    80003ad4:	0084c783          	lbu	a5,8(s1)
    80003ad8:	0094c703          	lbu	a4,9(s1)
    80003adc:	00871713          	slli	a4,a4,0x8
    80003ae0:	00f76733          	or	a4,a4,a5
    80003ae4:	00a4c783          	lbu	a5,10(s1)
    80003ae8:	01079793          	slli	a5,a5,0x10
    80003aec:	00e7e733          	or	a4,a5,a4
    80003af0:	00b4c783          	lbu	a5,11(s1)
    80003af4:	01879793          	slli	a5,a5,0x18
    80003af8:	00e7e7b3          	or	a5,a5,a4
    80003afc:	00c4c703          	lbu	a4,12(s1)
    80003b00:	02071713          	slli	a4,a4,0x20
    80003b04:	00f767b3          	or	a5,a4,a5
    80003b08:	00d4c703          	lbu	a4,13(s1)
    80003b0c:	02871713          	slli	a4,a4,0x28
    80003b10:	00f76733          	or	a4,a4,a5
    80003b14:	00e4c783          	lbu	a5,14(s1)
    80003b18:	03079793          	slli	a5,a5,0x30
    80003b1c:	00e7e733          	or	a4,a5,a4
    80003b20:	00f4c783          	lbu	a5,15(s1)
    80003b24:	03879793          	slli	a5,a5,0x38
    80003b28:	00e7e7b3          	or	a5,a5,a4
    80003b2c:	08078c63          	beqz	a5,80003bc4 <_ZN11HeapManager12heapAllocateEm+0x558>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003b30:	0004c703          	lbu	a4,0(s1)
    80003b34:	0014c683          	lbu	a3,1(s1)
    80003b38:	00869693          	slli	a3,a3,0x8
    80003b3c:	00e6e733          	or	a4,a3,a4
    80003b40:	0024c683          	lbu	a3,2(s1)
    80003b44:	01069693          	slli	a3,a3,0x10
    80003b48:	00e6e6b3          	or	a3,a3,a4
    80003b4c:	0034c703          	lbu	a4,3(s1)
    80003b50:	01871713          	slli	a4,a4,0x18
    80003b54:	00d766b3          	or	a3,a4,a3
    80003b58:	0044c703          	lbu	a4,4(s1)
    80003b5c:	02071713          	slli	a4,a4,0x20
    80003b60:	00d76733          	or	a4,a4,a3
    80003b64:	0054c683          	lbu	a3,5(s1)
    80003b68:	02869693          	slli	a3,a3,0x28
    80003b6c:	00e6e733          	or	a4,a3,a4
    80003b70:	0064c683          	lbu	a3,6(s1)
    80003b74:	03069693          	slli	a3,a3,0x30
    80003b78:	00e6e6b3          	or	a3,a3,a4
    80003b7c:	0074c703          	lbu	a4,7(s1)
    80003b80:	03871713          	slli	a4,a4,0x38
    80003b84:	00d76733          	or	a4,a4,a3
    80003b88:	00d78023          	sb	a3,0(a5)
    80003b8c:	00875693          	srli	a3,a4,0x8
    80003b90:	00d780a3          	sb	a3,1(a5)
    80003b94:	01075693          	srli	a3,a4,0x10
    80003b98:	00d78123          	sb	a3,2(a5)
    80003b9c:	0187569b          	srliw	a3,a4,0x18
    80003ba0:	00d781a3          	sb	a3,3(a5)
    80003ba4:	02075693          	srli	a3,a4,0x20
    80003ba8:	00d78223          	sb	a3,4(a5)
    80003bac:	02875693          	srli	a3,a4,0x28
    80003bb0:	00d782a3          	sb	a3,5(a5)
    80003bb4:	03075693          	srli	a3,a4,0x30
    80003bb8:	00d78323          	sb	a3,6(a5)
    80003bbc:	03875713          	srli	a4,a4,0x38
    80003bc0:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003bc4:	0004c783          	lbu	a5,0(s1)
    80003bc8:	0014c703          	lbu	a4,1(s1)
    80003bcc:	00871713          	slli	a4,a4,0x8
    80003bd0:	00f76733          	or	a4,a4,a5
    80003bd4:	0024c783          	lbu	a5,2(s1)
    80003bd8:	01079793          	slli	a5,a5,0x10
    80003bdc:	00e7e733          	or	a4,a5,a4
    80003be0:	0034c783          	lbu	a5,3(s1)
    80003be4:	01879793          	slli	a5,a5,0x18
    80003be8:	00e7e7b3          	or	a5,a5,a4
    80003bec:	0044c703          	lbu	a4,4(s1)
    80003bf0:	02071713          	slli	a4,a4,0x20
    80003bf4:	00f767b3          	or	a5,a4,a5
    80003bf8:	0054c703          	lbu	a4,5(s1)
    80003bfc:	02871713          	slli	a4,a4,0x28
    80003c00:	00f76733          	or	a4,a4,a5
    80003c04:	0064c783          	lbu	a5,6(s1)
    80003c08:	03079793          	slli	a5,a5,0x30
    80003c0c:	00e7e733          	or	a4,a5,a4
    80003c10:	0074c783          	lbu	a5,7(s1)
    80003c14:	03879793          	slli	a5,a5,0x38
    80003c18:	00e7e7b3          	or	a5,a5,a4
    80003c1c:	08078c63          	beqz	a5,80003cb4 <_ZN11HeapManager12heapAllocateEm+0x648>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003c20:	0084c703          	lbu	a4,8(s1)
    80003c24:	0094c683          	lbu	a3,9(s1)
    80003c28:	00869693          	slli	a3,a3,0x8
    80003c2c:	00e6e733          	or	a4,a3,a4
    80003c30:	00a4c683          	lbu	a3,10(s1)
    80003c34:	01069693          	slli	a3,a3,0x10
    80003c38:	00e6e6b3          	or	a3,a3,a4
    80003c3c:	00b4c703          	lbu	a4,11(s1)
    80003c40:	01871713          	slli	a4,a4,0x18
    80003c44:	00d766b3          	or	a3,a4,a3
    80003c48:	00c4c703          	lbu	a4,12(s1)
    80003c4c:	02071713          	slli	a4,a4,0x20
    80003c50:	00d76733          	or	a4,a4,a3
    80003c54:	00d4c683          	lbu	a3,13(s1)
    80003c58:	02869693          	slli	a3,a3,0x28
    80003c5c:	00e6e733          	or	a4,a3,a4
    80003c60:	00e4c683          	lbu	a3,14(s1)
    80003c64:	03069693          	slli	a3,a3,0x30
    80003c68:	00e6e6b3          	or	a3,a3,a4
    80003c6c:	00f4c703          	lbu	a4,15(s1)
    80003c70:	03871713          	slli	a4,a4,0x38
    80003c74:	00d76733          	or	a4,a4,a3
    80003c78:	00d78423          	sb	a3,8(a5)
    80003c7c:	00875693          	srli	a3,a4,0x8
    80003c80:	00d784a3          	sb	a3,9(a5)
    80003c84:	01075693          	srli	a3,a4,0x10
    80003c88:	00d78523          	sb	a3,10(a5)
    80003c8c:	0187569b          	srliw	a3,a4,0x18
    80003c90:	00d785a3          	sb	a3,11(a5)
    80003c94:	02075693          	srli	a3,a4,0x20
    80003c98:	00d78623          	sb	a3,12(a5)
    80003c9c:	02875693          	srli	a3,a4,0x28
    80003ca0:	00d786a3          	sb	a3,13(a5)
    80003ca4:	03075693          	srli	a3,a4,0x30
    80003ca8:	00d78723          	sb	a3,14(a5)
    80003cac:	03875713          	srli	a4,a4,0x38
    80003cb0:	00e787a3          	sb	a4,15(a5)
            if(pCurrent == m_pHead){
    80003cb4:	0009b783          	ld	a5,0(s3)
    80003cb8:	00978663          	beq	a5,s1,80003cc4 <_ZN11HeapManager12heapAllocateEm+0x658>
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003cbc:	04048493          	addi	s1,s1,64
    80003cc0:	0880006f          	j	80003d48 <_ZN11HeapManager12heapAllocateEm+0x6dc>
                m_pHead = pCurrent->pNext;
    80003cc4:	0004c703          	lbu	a4,0(s1)
    80003cc8:	0014c783          	lbu	a5,1(s1)
    80003ccc:	00879793          	slli	a5,a5,0x8
    80003cd0:	00e7e7b3          	or	a5,a5,a4
    80003cd4:	0024c703          	lbu	a4,2(s1)
    80003cd8:	01071713          	slli	a4,a4,0x10
    80003cdc:	00f76733          	or	a4,a4,a5
    80003ce0:	0034c783          	lbu	a5,3(s1)
    80003ce4:	01879793          	slli	a5,a5,0x18
    80003ce8:	00e7e733          	or	a4,a5,a4
    80003cec:	0044c783          	lbu	a5,4(s1)
    80003cf0:	02079793          	slli	a5,a5,0x20
    80003cf4:	00e7e7b3          	or	a5,a5,a4
    80003cf8:	0054c703          	lbu	a4,5(s1)
    80003cfc:	02871713          	slli	a4,a4,0x28
    80003d00:	00f76733          	or	a4,a4,a5
    80003d04:	0064c783          	lbu	a5,6(s1)
    80003d08:	03079793          	slli	a5,a5,0x30
    80003d0c:	00e7e733          	or	a4,a5,a4
    80003d10:	0074c783          	lbu	a5,7(s1)
    80003d14:	03879793          	slli	a5,a5,0x38
    80003d18:	00e7e7b3          	or	a5,a5,a4
    80003d1c:	00f9b023          	sd	a5,0(s3)
    80003d20:	f9dff06f          	j	80003cbc <_ZN11HeapManager12heapAllocateEm+0x650>
    }
    assert(0);
    80003d24:	00008697          	auipc	a3,0x8
    80003d28:	56c68693          	addi	a3,a3,1388 # 8000c290 <_ZTV9Semaphore+0x248>
    80003d2c:	05900613          	li	a2,89
    80003d30:	00008597          	auipc	a1,0x8
    80003d34:	4b058593          	addi	a1,a1,1200 # 8000c1e0 <_ZTV9Semaphore+0x198>
    80003d38:	00008517          	auipc	a0,0x8
    80003d3c:	58050513          	addi	a0,a0,1408 # 8000c2b8 <_ZTV9Semaphore+0x270>
    80003d40:	00002097          	auipc	ra,0x2
    80003d44:	970080e7          	jalr	-1680(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    return 0;
}
    80003d48:	00048513          	mv	a0,s1
    80003d4c:	02813083          	ld	ra,40(sp)
    80003d50:	02013403          	ld	s0,32(sp)
    80003d54:	01813483          	ld	s1,24(sp)
    80003d58:	01013903          	ld	s2,16(sp)
    80003d5c:	00813983          	ld	s3,8(sp)
    80003d60:	03010113          	addi	sp,sp,48
    80003d64:	00008067          	ret

0000000080003d68 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    if(pAddress == nullptr){
    80003d68:	180582e3          	beqz	a1,800046ec <_ZN11HeapManager8heapFreeEPv+0x984>
int HeapManager::heapFree(void* pAddress){
    80003d6c:	fc010113          	addi	sp,sp,-64
    80003d70:	02113c23          	sd	ra,56(sp)
    80003d74:	02813823          	sd	s0,48(sp)
    80003d78:	02913423          	sd	s1,40(sp)
    80003d7c:	03213023          	sd	s2,32(sp)
    80003d80:	01313c23          	sd	s3,24(sp)
    80003d84:	01413823          	sd	s4,16(sp)
    80003d88:	01513423          	sd	s5,8(sp)
    80003d8c:	04010413          	addi	s0,sp,64
    80003d90:	00050a93          	mv	s5,a0
    80003d94:	00058a13          	mv	s4,a1
        return -1;
    }
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pAddress) - MEM_BLOCK_SIZE);
    80003d98:	fc058913          	addi	s2,a1,-64
    80003d9c:	00090993          	mv	s3,s2
    
    #ifdef CHECK_CONDITIONS
        assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003da0:	01894783          	lbu	a5,24(s2)
    80003da4:	01994703          	lbu	a4,25(s2)
    80003da8:	00871713          	slli	a4,a4,0x8
    80003dac:	00f76733          	or	a4,a4,a5
    80003db0:	01a94783          	lbu	a5,26(s2)
    80003db4:	01079793          	slli	a5,a5,0x10
    80003db8:	00e7e733          	or	a4,a5,a4
    80003dbc:	01b94783          	lbu	a5,27(s2)
    80003dc0:	01879793          	slli	a5,a5,0x18
    80003dc4:	00e7e7b3          	or	a5,a5,a4
    80003dc8:	0007879b          	sext.w	a5,a5
    80003dcc:	1c100737          	lui	a4,0x1c100
    80003dd0:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003dd4:	22e79e63          	bne	a5,a4,80004010 <_ZN11HeapManager8heapFreeEPv+0x2a8>
    #endif
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003dd8:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert >= pAddress){
    80003ddc:	00048463          	beqz	s1,80003de4 <_ZN11HeapManager8heapFreeEPv+0x7c>
    80003de0:	2b44e863          	bltu	s1,s4,80004090 <_ZN11HeapManager8heapFreeEPv+0x328>
        pFree->pNext = pInsert;
    80003de4:	fc9a0023          	sb	s1,-64(s4)
    80003de8:	0084d793          	srli	a5,s1,0x8
    80003dec:	00f900a3          	sb	a5,1(s2)
    80003df0:	0104d793          	srli	a5,s1,0x10
    80003df4:	00f90123          	sb	a5,2(s2)
    80003df8:	0184d79b          	srliw	a5,s1,0x18
    80003dfc:	00f901a3          	sb	a5,3(s2)
    80003e00:	0204d793          	srli	a5,s1,0x20
    80003e04:	00f90223          	sb	a5,4(s2)
    80003e08:	0284d793          	srli	a5,s1,0x28
    80003e0c:	00f902a3          	sb	a5,5(s2)
    80003e10:	0304d793          	srli	a5,s1,0x30
    80003e14:	00f90323          	sb	a5,6(s2)
    80003e18:	0384d793          	srli	a5,s1,0x38
    80003e1c:	00f903a3          	sb	a5,7(s2)
        pInsert->pPrev = pFree;
    80003e20:	01248423          	sb	s2,8(s1)
    80003e24:	00895793          	srli	a5,s2,0x8
    80003e28:	00f484a3          	sb	a5,9(s1)
    80003e2c:	01095793          	srli	a5,s2,0x10
    80003e30:	00f48523          	sb	a5,10(s1)
    80003e34:	0189579b          	srliw	a5,s2,0x18
    80003e38:	00f485a3          	sb	a5,11(s1)
    80003e3c:	02095793          	srli	a5,s2,0x20
    80003e40:	00f48623          	sb	a5,12(s1)
    80003e44:	02895793          	srli	a5,s2,0x28
    80003e48:	00f486a3          	sb	a5,13(s1)
    80003e4c:	03095793          	srli	a5,s2,0x30
    80003e50:	00f48723          	sb	a5,14(s1)
    80003e54:	03895793          	srli	a5,s2,0x38
    80003e58:	00f487a3          	sb	a5,15(s1)
        m_pHead = pFree;
    80003e5c:	012ab023          	sd	s2,0(s5)
        }
        pInsert->pNext = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uint64>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree)){
    80003e60:	00894783          	lbu	a5,8(s2)
    80003e64:	00994703          	lbu	a4,9(s2)
    80003e68:	00871713          	slli	a4,a4,0x8
    80003e6c:	00f76733          	or	a4,a4,a5
    80003e70:	00a94783          	lbu	a5,10(s2)
    80003e74:	01079793          	slli	a5,a5,0x10
    80003e78:	00e7e733          	or	a4,a5,a4
    80003e7c:	00b94783          	lbu	a5,11(s2)
    80003e80:	01879793          	slli	a5,a5,0x18
    80003e84:	00e7e7b3          	or	a5,a5,a4
    80003e88:	00c94703          	lbu	a4,12(s2)
    80003e8c:	02071713          	slli	a4,a4,0x20
    80003e90:	00f767b3          	or	a5,a4,a5
    80003e94:	00d94703          	lbu	a4,13(s2)
    80003e98:	02871713          	slli	a4,a4,0x28
    80003e9c:	00f76733          	or	a4,a4,a5
    80003ea0:	00e94783          	lbu	a5,14(s2)
    80003ea4:	03079793          	slli	a5,a5,0x30
    80003ea8:	00e7e733          	or	a4,a5,a4
    80003eac:	00f94783          	lbu	a5,15(s2)
    80003eb0:	03879793          	slli	a5,a5,0x38
    80003eb4:	00e7e7b3          	or	a5,a5,a4
    80003eb8:	06078663          	beqz	a5,80003f24 <_ZN11HeapManager8heapFreeEPv+0x1bc>
    80003ebc:	0107c703          	lbu	a4,16(a5)
    80003ec0:	0117c683          	lbu	a3,17(a5)
    80003ec4:	00869693          	slli	a3,a3,0x8
    80003ec8:	00e6e6b3          	or	a3,a3,a4
    80003ecc:	0127c703          	lbu	a4,18(a5)
    80003ed0:	01071713          	slli	a4,a4,0x10
    80003ed4:	00d766b3          	or	a3,a4,a3
    80003ed8:	0137c703          	lbu	a4,19(a5)
    80003edc:	01871713          	slli	a4,a4,0x18
    80003ee0:	00d76733          	or	a4,a4,a3
    80003ee4:	0147c683          	lbu	a3,20(a5)
    80003ee8:	02069693          	slli	a3,a3,0x20
    80003eec:	00e6e733          	or	a4,a3,a4
    80003ef0:	0157c683          	lbu	a3,21(a5)
    80003ef4:	02869693          	slli	a3,a3,0x28
    80003ef8:	00e6e6b3          	or	a3,a3,a4
    80003efc:	0167c703          	lbu	a4,22(a5)
    80003f00:	03071713          	slli	a4,a4,0x30
    80003f04:	00d766b3          	or	a3,a4,a3
    80003f08:	0177c703          	lbu	a4,23(a5)
    80003f0c:	03871713          	slli	a4,a4,0x38
    80003f10:	00d76733          	or	a4,a4,a3
    80003f14:	00170693          	addi	a3,a4,1
    80003f18:	00669693          	slli	a3,a3,0x6
    80003f1c:	00d786b3          	add	a3,a5,a3
    80003f20:	38d90063          	beq	s2,a3,800042a0 <_ZN11HeapManager8heapFreeEPv+0x538>
            pFree->pNext->pPrev = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uint64>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree->pNext)){
    80003f24:	0009c783          	lbu	a5,0(s3)
    80003f28:	0019c703          	lbu	a4,1(s3)
    80003f2c:	00871713          	slli	a4,a4,0x8
    80003f30:	00f76733          	or	a4,a4,a5
    80003f34:	0029c783          	lbu	a5,2(s3)
    80003f38:	01079793          	slli	a5,a5,0x10
    80003f3c:	00e7e733          	or	a4,a5,a4
    80003f40:	0039c783          	lbu	a5,3(s3)
    80003f44:	01879793          	slli	a5,a5,0x18
    80003f48:	00e7e7b3          	or	a5,a5,a4
    80003f4c:	0049c703          	lbu	a4,4(s3)
    80003f50:	02071713          	slli	a4,a4,0x20
    80003f54:	00f767b3          	or	a5,a4,a5
    80003f58:	0059c703          	lbu	a4,5(s3)
    80003f5c:	02871713          	slli	a4,a4,0x28
    80003f60:	00f76733          	or	a4,a4,a5
    80003f64:	0069c783          	lbu	a5,6(s3)
    80003f68:	03079793          	slli	a5,a5,0x30
    80003f6c:	00e7e733          	or	a4,a5,a4
    80003f70:	0079c783          	lbu	a5,7(s3)
    80003f74:	03879793          	slli	a5,a5,0x38
    80003f78:	00e7e7b3          	or	a5,a5,a4
    80003f7c:	76078c63          	beqz	a5,800046f4 <_ZN11HeapManager8heapFreeEPv+0x98c>
    80003f80:	0109c703          	lbu	a4,16(s3)
    80003f84:	0119c683          	lbu	a3,17(s3)
    80003f88:	00869693          	slli	a3,a3,0x8
    80003f8c:	00e6e6b3          	or	a3,a3,a4
    80003f90:	0129c703          	lbu	a4,18(s3)
    80003f94:	01071713          	slli	a4,a4,0x10
    80003f98:	00d766b3          	or	a3,a4,a3
    80003f9c:	0139c703          	lbu	a4,19(s3)
    80003fa0:	01871713          	slli	a4,a4,0x18
    80003fa4:	00d76733          	or	a4,a4,a3
    80003fa8:	0149c683          	lbu	a3,20(s3)
    80003fac:	02069693          	slli	a3,a3,0x20
    80003fb0:	00e6e733          	or	a4,a3,a4
    80003fb4:	0159c683          	lbu	a3,21(s3)
    80003fb8:	02869693          	slli	a3,a3,0x28
    80003fbc:	00e6e6b3          	or	a3,a3,a4
    80003fc0:	0169c703          	lbu	a4,22(s3)
    80003fc4:	03071713          	slli	a4,a4,0x30
    80003fc8:	00d766b3          	or	a3,a4,a3
    80003fcc:	0179c703          	lbu	a4,23(s3)
    80003fd0:	03871713          	slli	a4,a4,0x38
    80003fd4:	00d76733          	or	a4,a4,a3
    80003fd8:	00170693          	addi	a3,a4,1
    80003fdc:	00669693          	slli	a3,a3,0x6
    80003fe0:	00d986b3          	add	a3,s3,a3
    80003fe4:	58f68863          	beq	a3,a5,80004574 <_ZN11HeapManager8heapFreeEPv+0x80c>
        pFree->pNext = pFree->pNext->pNext;
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
    80003fe8:	00000513          	li	a0,0
}
    80003fec:	03813083          	ld	ra,56(sp)
    80003ff0:	03013403          	ld	s0,48(sp)
    80003ff4:	02813483          	ld	s1,40(sp)
    80003ff8:	02013903          	ld	s2,32(sp)
    80003ffc:	01813983          	ld	s3,24(sp)
    80004000:	01013a03          	ld	s4,16(sp)
    80004004:	00813a83          	ld	s5,8(sp)
    80004008:	04010113          	addi	sp,sp,64
    8000400c:	00008067          	ret
        assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80004010:	00008697          	auipc	a3,0x8
    80004014:	2b068693          	addi	a3,a3,688 # 8000c2c0 <_ZTV9Semaphore+0x278>
    80004018:	06400613          	li	a2,100
    8000401c:	00008597          	auipc	a1,0x8
    80004020:	1c458593          	addi	a1,a1,452 # 8000c1e0 <_ZTV9Semaphore+0x198>
    80004024:	00008517          	auipc	a0,0x8
    80004028:	2c450513          	addi	a0,a0,708 # 8000c2e8 <_ZTV9Semaphore+0x2a0>
    8000402c:	00001097          	auipc	ra,0x1
    80004030:	684080e7          	jalr	1668(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80004034:	da5ff06f          	j	80003dd8 <_ZN11HeapManager8heapFreeEPv+0x70>
            pInsert = pInsert->pNext;
    80004038:	0004c703          	lbu	a4,0(s1)
    8000403c:	0014c783          	lbu	a5,1(s1)
    80004040:	00879793          	slli	a5,a5,0x8
    80004044:	00e7e733          	or	a4,a5,a4
    80004048:	0024c783          	lbu	a5,2(s1)
    8000404c:	01079793          	slli	a5,a5,0x10
    80004050:	00e7e7b3          	or	a5,a5,a4
    80004054:	0034c703          	lbu	a4,3(s1)
    80004058:	01871713          	slli	a4,a4,0x18
    8000405c:	00f767b3          	or	a5,a4,a5
    80004060:	0044c703          	lbu	a4,4(s1)
    80004064:	02071713          	slli	a4,a4,0x20
    80004068:	00f76733          	or	a4,a4,a5
    8000406c:	0054c783          	lbu	a5,5(s1)
    80004070:	02879793          	slli	a5,a5,0x28
    80004074:	00e7e733          	or	a4,a5,a4
    80004078:	0064c783          	lbu	a5,6(s1)
    8000407c:	03079793          	slli	a5,a5,0x30
    80004080:	00e7e7b3          	or	a5,a5,a4
    80004084:	0074c483          	lbu	s1,7(s1)
    80004088:	03849493          	slli	s1,s1,0x38
    8000408c:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80004090:	0004c783          	lbu	a5,0(s1)
    80004094:	0014c703          	lbu	a4,1(s1)
    80004098:	00871713          	slli	a4,a4,0x8
    8000409c:	00f76733          	or	a4,a4,a5
    800040a0:	0024c783          	lbu	a5,2(s1)
    800040a4:	01079793          	slli	a5,a5,0x10
    800040a8:	00e7e733          	or	a4,a5,a4
    800040ac:	0034c783          	lbu	a5,3(s1)
    800040b0:	01879793          	slli	a5,a5,0x18
    800040b4:	00e7e7b3          	or	a5,a5,a4
    800040b8:	0044c703          	lbu	a4,4(s1)
    800040bc:	02071713          	slli	a4,a4,0x20
    800040c0:	00f767b3          	or	a5,a4,a5
    800040c4:	0054c703          	lbu	a4,5(s1)
    800040c8:	02871713          	slli	a4,a4,0x28
    800040cc:	00f76733          	or	a4,a4,a5
    800040d0:	0064c783          	lbu	a5,6(s1)
    800040d4:	03079793          	slli	a5,a5,0x30
    800040d8:	00e7e733          	or	a4,a5,a4
    800040dc:	0074c783          	lbu	a5,7(s1)
    800040e0:	03879793          	slli	a5,a5,0x38
    800040e4:	00e7e7b3          	or	a5,a5,a4
    800040e8:	06078463          	beqz	a5,80004150 <_ZN11HeapManager8heapFreeEPv+0x3e8>
    800040ec:	0747f263          	bgeu	a5,s4,80004150 <_ZN11HeapManager8heapFreeEPv+0x3e8>
                assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    800040f0:	0184c783          	lbu	a5,24(s1)
    800040f4:	0194c703          	lbu	a4,25(s1)
    800040f8:	00871713          	slli	a4,a4,0x8
    800040fc:	00f76733          	or	a4,a4,a5
    80004100:	01a4c783          	lbu	a5,26(s1)
    80004104:	01079793          	slli	a5,a5,0x10
    80004108:	00e7e733          	or	a4,a5,a4
    8000410c:	01b4c783          	lbu	a5,27(s1)
    80004110:	01879793          	slli	a5,a5,0x18
    80004114:	00e7e7b3          	or	a5,a5,a4
    80004118:	0007879b          	sext.w	a5,a5
    8000411c:	1c100737          	lui	a4,0x1c100
    80004120:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80004124:	f0e78ae3          	beq	a5,a4,80004038 <_ZN11HeapManager8heapFreeEPv+0x2d0>
    80004128:	00008697          	auipc	a3,0x8
    8000412c:	19868693          	addi	a3,a3,408 # 8000c2c0 <_ZTV9Semaphore+0x278>
    80004130:	06f00613          	li	a2,111
    80004134:	00008597          	auipc	a1,0x8
    80004138:	0ac58593          	addi	a1,a1,172 # 8000c1e0 <_ZTV9Semaphore+0x198>
    8000413c:	00008517          	auipc	a0,0x8
    80004140:	1d450513          	addi	a0,a0,468 # 8000c310 <_ZTV9Semaphore+0x2c8>
    80004144:	00001097          	auipc	ra,0x1
    80004148:	56c080e7          	jalr	1388(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    8000414c:	eedff06f          	j	80004038 <_ZN11HeapManager8heapFreeEPv+0x2d0>
        pFree->pNext = pInsert->pNext;
    80004150:	fcfa0023          	sb	a5,-64(s4)
    80004154:	0087d713          	srli	a4,a5,0x8
    80004158:	00e900a3          	sb	a4,1(s2)
    8000415c:	0107d713          	srli	a4,a5,0x10
    80004160:	00e90123          	sb	a4,2(s2)
    80004164:	0187d71b          	srliw	a4,a5,0x18
    80004168:	00e901a3          	sb	a4,3(s2)
    8000416c:	0207d713          	srli	a4,a5,0x20
    80004170:	00e90223          	sb	a4,4(s2)
    80004174:	0287d713          	srli	a4,a5,0x28
    80004178:	00e902a3          	sb	a4,5(s2)
    8000417c:	0307d713          	srli	a4,a5,0x30
    80004180:	00e90323          	sb	a4,6(s2)
    80004184:	0387d793          	srli	a5,a5,0x38
    80004188:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    8000418c:	00990423          	sb	s1,8(s2)
    80004190:	0084d793          	srli	a5,s1,0x8
    80004194:	00f904a3          	sb	a5,9(s2)
    80004198:	0104d793          	srli	a5,s1,0x10
    8000419c:	00f90523          	sb	a5,10(s2)
    800041a0:	0184d79b          	srliw	a5,s1,0x18
    800041a4:	00f905a3          	sb	a5,11(s2)
    800041a8:	0204d793          	srli	a5,s1,0x20
    800041ac:	00f90623          	sb	a5,12(s2)
    800041b0:	0284d793          	srli	a5,s1,0x28
    800041b4:	00f906a3          	sb	a5,13(s2)
    800041b8:	0304d793          	srli	a5,s1,0x30
    800041bc:	00f90723          	sb	a5,14(s2)
    800041c0:	0384d793          	srli	a5,s1,0x38
    800041c4:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    800041c8:	0004c783          	lbu	a5,0(s1)
    800041cc:	0014c703          	lbu	a4,1(s1)
    800041d0:	00871713          	slli	a4,a4,0x8
    800041d4:	00f76733          	or	a4,a4,a5
    800041d8:	0024c783          	lbu	a5,2(s1)
    800041dc:	01079793          	slli	a5,a5,0x10
    800041e0:	00e7e733          	or	a4,a5,a4
    800041e4:	0034c783          	lbu	a5,3(s1)
    800041e8:	01879793          	slli	a5,a5,0x18
    800041ec:	00e7e7b3          	or	a5,a5,a4
    800041f0:	0044c703          	lbu	a4,4(s1)
    800041f4:	02071713          	slli	a4,a4,0x20
    800041f8:	00f767b3          	or	a5,a4,a5
    800041fc:	0054c703          	lbu	a4,5(s1)
    80004200:	02871713          	slli	a4,a4,0x28
    80004204:	00f76733          	or	a4,a4,a5
    80004208:	0064c783          	lbu	a5,6(s1)
    8000420c:	03079793          	slli	a5,a5,0x30
    80004210:	00e7e733          	or	a4,a5,a4
    80004214:	0074c783          	lbu	a5,7(s1)
    80004218:	03879793          	slli	a5,a5,0x38
    8000421c:	00e7e7b3          	or	a5,a5,a4
    80004220:	04078063          	beqz	a5,80004260 <_ZN11HeapManager8heapFreeEPv+0x4f8>
            pInsert->pNext->pPrev = pFree;
    80004224:	01278423          	sb	s2,8(a5)
    80004228:	00895713          	srli	a4,s2,0x8
    8000422c:	00e784a3          	sb	a4,9(a5)
    80004230:	01095713          	srli	a4,s2,0x10
    80004234:	00e78523          	sb	a4,10(a5)
    80004238:	0189571b          	srliw	a4,s2,0x18
    8000423c:	00e785a3          	sb	a4,11(a5)
    80004240:	02095713          	srli	a4,s2,0x20
    80004244:	00e78623          	sb	a4,12(a5)
    80004248:	02895713          	srli	a4,s2,0x28
    8000424c:	00e786a3          	sb	a4,13(a5)
    80004250:	03095713          	srli	a4,s2,0x30
    80004254:	00e78723          	sb	a4,14(a5)
    80004258:	03895713          	srli	a4,s2,0x38
    8000425c:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    80004260:	01248023          	sb	s2,0(s1)
    80004264:	00895793          	srli	a5,s2,0x8
    80004268:	00f480a3          	sb	a5,1(s1)
    8000426c:	01095793          	srli	a5,s2,0x10
    80004270:	00f48123          	sb	a5,2(s1)
    80004274:	0189579b          	srliw	a5,s2,0x18
    80004278:	00f481a3          	sb	a5,3(s1)
    8000427c:	02095793          	srli	a5,s2,0x20
    80004280:	00f48223          	sb	a5,4(s1)
    80004284:	02895793          	srli	a5,s2,0x28
    80004288:	00f482a3          	sb	a5,5(s1)
    8000428c:	03095793          	srli	a5,s2,0x30
    80004290:	00f48323          	sb	a5,6(s1)
    80004294:	03895793          	srli	a5,s2,0x38
    80004298:	00f483a3          	sb	a5,7(s1)
    8000429c:	bc5ff06f          	j	80003e60 <_ZN11HeapManager8heapFreeEPv+0xf8>
        pFree->pPrev->nSize += pFree->nSize + 1;
    800042a0:	01094683          	lbu	a3,16(s2)
    800042a4:	01194603          	lbu	a2,17(s2)
    800042a8:	00861613          	slli	a2,a2,0x8
    800042ac:	00d66633          	or	a2,a2,a3
    800042b0:	01294683          	lbu	a3,18(s2)
    800042b4:	01069693          	slli	a3,a3,0x10
    800042b8:	00c6e633          	or	a2,a3,a2
    800042bc:	01394683          	lbu	a3,19(s2)
    800042c0:	01869693          	slli	a3,a3,0x18
    800042c4:	00c6e6b3          	or	a3,a3,a2
    800042c8:	01494603          	lbu	a2,20(s2)
    800042cc:	02061613          	slli	a2,a2,0x20
    800042d0:	00d666b3          	or	a3,a2,a3
    800042d4:	01594603          	lbu	a2,21(s2)
    800042d8:	02861613          	slli	a2,a2,0x28
    800042dc:	00d66633          	or	a2,a2,a3
    800042e0:	01694683          	lbu	a3,22(s2)
    800042e4:	03069693          	slli	a3,a3,0x30
    800042e8:	00c6e633          	or	a2,a3,a2
    800042ec:	01794683          	lbu	a3,23(s2)
    800042f0:	03869693          	slli	a3,a3,0x38
    800042f4:	00c6e6b3          	or	a3,a3,a2
    800042f8:	00d70733          	add	a4,a4,a3
    800042fc:	00170713          	addi	a4,a4,1
    80004300:	00e78823          	sb	a4,16(a5)
    80004304:	00875693          	srli	a3,a4,0x8
    80004308:	00d788a3          	sb	a3,17(a5)
    8000430c:	01075693          	srli	a3,a4,0x10
    80004310:	00d78923          	sb	a3,18(a5)
    80004314:	0187569b          	srliw	a3,a4,0x18
    80004318:	00d789a3          	sb	a3,19(a5)
    8000431c:	02075693          	srli	a3,a4,0x20
    80004320:	00d78a23          	sb	a3,20(a5)
    80004324:	02875693          	srli	a3,a4,0x28
    80004328:	00d78aa3          	sb	a3,21(a5)
    8000432c:	03075693          	srli	a3,a4,0x30
    80004330:	00d78b23          	sb	a3,22(a5)
    80004334:	03875713          	srli	a4,a4,0x38
    80004338:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    8000433c:	00894703          	lbu	a4,8(s2)
    80004340:	00994783          	lbu	a5,9(s2)
    80004344:	00879793          	slli	a5,a5,0x8
    80004348:	00e7e7b3          	or	a5,a5,a4
    8000434c:	00a94703          	lbu	a4,10(s2)
    80004350:	01071713          	slli	a4,a4,0x10
    80004354:	00f767b3          	or	a5,a4,a5
    80004358:	00b94703          	lbu	a4,11(s2)
    8000435c:	01871713          	slli	a4,a4,0x18
    80004360:	00f76733          	or	a4,a4,a5
    80004364:	00c94783          	lbu	a5,12(s2)
    80004368:	02079793          	slli	a5,a5,0x20
    8000436c:	00e7e733          	or	a4,a5,a4
    80004370:	00d94783          	lbu	a5,13(s2)
    80004374:	02879793          	slli	a5,a5,0x28
    80004378:	00e7e7b3          	or	a5,a5,a4
    8000437c:	00e94703          	lbu	a4,14(s2)
    80004380:	03071713          	slli	a4,a4,0x30
    80004384:	00f767b3          	or	a5,a4,a5
    80004388:	00f94703          	lbu	a4,15(s2)
    8000438c:	03871713          	slli	a4,a4,0x38
    80004390:	00f76733          	or	a4,a4,a5
    80004394:	fc0a4783          	lbu	a5,-64(s4)
    80004398:	00194683          	lbu	a3,1(s2)
    8000439c:	00869693          	slli	a3,a3,0x8
    800043a0:	00f6e7b3          	or	a5,a3,a5
    800043a4:	00294683          	lbu	a3,2(s2)
    800043a8:	01069693          	slli	a3,a3,0x10
    800043ac:	00f6e6b3          	or	a3,a3,a5
    800043b0:	00394783          	lbu	a5,3(s2)
    800043b4:	01879793          	slli	a5,a5,0x18
    800043b8:	00d7e6b3          	or	a3,a5,a3
    800043bc:	00494783          	lbu	a5,4(s2)
    800043c0:	02079793          	slli	a5,a5,0x20
    800043c4:	00d7e7b3          	or	a5,a5,a3
    800043c8:	00594683          	lbu	a3,5(s2)
    800043cc:	02869693          	slli	a3,a3,0x28
    800043d0:	00f6e7b3          	or	a5,a3,a5
    800043d4:	00694683          	lbu	a3,6(s2)
    800043d8:	03069693          	slli	a3,a3,0x30
    800043dc:	00f6e6b3          	or	a3,a3,a5
    800043e0:	00794783          	lbu	a5,7(s2)
    800043e4:	03879793          	slli	a5,a5,0x38
    800043e8:	00d7e7b3          	or	a5,a5,a3
    800043ec:	00d70023          	sb	a3,0(a4)
    800043f0:	0087d693          	srli	a3,a5,0x8
    800043f4:	00d700a3          	sb	a3,1(a4)
    800043f8:	0107d693          	srli	a3,a5,0x10
    800043fc:	00d70123          	sb	a3,2(a4)
    80004400:	0187d69b          	srliw	a3,a5,0x18
    80004404:	00d701a3          	sb	a3,3(a4)
    80004408:	0207d693          	srli	a3,a5,0x20
    8000440c:	00d70223          	sb	a3,4(a4)
    80004410:	0287d693          	srli	a3,a5,0x28
    80004414:	00d702a3          	sb	a3,5(a4)
    80004418:	0307d693          	srli	a3,a5,0x30
    8000441c:	00d70323          	sb	a3,6(a4)
    80004420:	0387d793          	srli	a5,a5,0x38
    80004424:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    80004428:	fc0a4783          	lbu	a5,-64(s4)
    8000442c:	00194703          	lbu	a4,1(s2)
    80004430:	00871713          	slli	a4,a4,0x8
    80004434:	00f76733          	or	a4,a4,a5
    80004438:	00294783          	lbu	a5,2(s2)
    8000443c:	01079793          	slli	a5,a5,0x10
    80004440:	00e7e733          	or	a4,a5,a4
    80004444:	00394783          	lbu	a5,3(s2)
    80004448:	01879793          	slli	a5,a5,0x18
    8000444c:	00e7e7b3          	or	a5,a5,a4
    80004450:	00494703          	lbu	a4,4(s2)
    80004454:	02071713          	slli	a4,a4,0x20
    80004458:	00f767b3          	or	a5,a4,a5
    8000445c:	00594703          	lbu	a4,5(s2)
    80004460:	02871713          	slli	a4,a4,0x28
    80004464:	00f76733          	or	a4,a4,a5
    80004468:	00694783          	lbu	a5,6(s2)
    8000446c:	03079793          	slli	a5,a5,0x30
    80004470:	00e7e733          	or	a4,a5,a4
    80004474:	00794783          	lbu	a5,7(s2)
    80004478:	03879793          	slli	a5,a5,0x38
    8000447c:	00e7e7b3          	or	a5,a5,a4
    80004480:	08078c63          	beqz	a5,80004518 <_ZN11HeapManager8heapFreeEPv+0x7b0>
            pFree->pNext->pPrev = pFree->pPrev;
    80004484:	00894703          	lbu	a4,8(s2)
    80004488:	00994683          	lbu	a3,9(s2)
    8000448c:	00869693          	slli	a3,a3,0x8
    80004490:	00e6e733          	or	a4,a3,a4
    80004494:	00a94683          	lbu	a3,10(s2)
    80004498:	01069693          	slli	a3,a3,0x10
    8000449c:	00e6e6b3          	or	a3,a3,a4
    800044a0:	00b94703          	lbu	a4,11(s2)
    800044a4:	01871713          	slli	a4,a4,0x18
    800044a8:	00d766b3          	or	a3,a4,a3
    800044ac:	00c94703          	lbu	a4,12(s2)
    800044b0:	02071713          	slli	a4,a4,0x20
    800044b4:	00d76733          	or	a4,a4,a3
    800044b8:	00d94683          	lbu	a3,13(s2)
    800044bc:	02869693          	slli	a3,a3,0x28
    800044c0:	00e6e733          	or	a4,a3,a4
    800044c4:	00e94683          	lbu	a3,14(s2)
    800044c8:	03069693          	slli	a3,a3,0x30
    800044cc:	00e6e6b3          	or	a3,a3,a4
    800044d0:	00f94703          	lbu	a4,15(s2)
    800044d4:	03871713          	slli	a4,a4,0x38
    800044d8:	00d76733          	or	a4,a4,a3
    800044dc:	00d78423          	sb	a3,8(a5)
    800044e0:	00875693          	srli	a3,a4,0x8
    800044e4:	00d784a3          	sb	a3,9(a5)
    800044e8:	01075693          	srli	a3,a4,0x10
    800044ec:	00d78523          	sb	a3,10(a5)
    800044f0:	0187569b          	srliw	a3,a4,0x18
    800044f4:	00d785a3          	sb	a3,11(a5)
    800044f8:	02075693          	srli	a3,a4,0x20
    800044fc:	00d78623          	sb	a3,12(a5)
    80004500:	02875693          	srli	a3,a4,0x28
    80004504:	00d786a3          	sb	a3,13(a5)
    80004508:	03075693          	srli	a3,a4,0x30
    8000450c:	00d78723          	sb	a3,14(a5)
    80004510:	03875713          	srli	a4,a4,0x38
    80004514:	00e787a3          	sb	a4,15(a5)
        pFree = pFree->pPrev;
    80004518:	00894983          	lbu	s3,8(s2)
    8000451c:	00994783          	lbu	a5,9(s2)
    80004520:	00879793          	slli	a5,a5,0x8
    80004524:	0137e7b3          	or	a5,a5,s3
    80004528:	00a94983          	lbu	s3,10(s2)
    8000452c:	01099993          	slli	s3,s3,0x10
    80004530:	00f9e7b3          	or	a5,s3,a5
    80004534:	00b94983          	lbu	s3,11(s2)
    80004538:	01899993          	slli	s3,s3,0x18
    8000453c:	00f9e9b3          	or	s3,s3,a5
    80004540:	00c94783          	lbu	a5,12(s2)
    80004544:	02079793          	slli	a5,a5,0x20
    80004548:	0137e9b3          	or	s3,a5,s3
    8000454c:	00d94783          	lbu	a5,13(s2)
    80004550:	02879793          	slli	a5,a5,0x28
    80004554:	0137e7b3          	or	a5,a5,s3
    80004558:	00e94983          	lbu	s3,14(s2)
    8000455c:	03099993          	slli	s3,s3,0x30
    80004560:	00f9e7b3          	or	a5,s3,a5
    80004564:	00f94983          	lbu	s3,15(s2)
    80004568:	03899993          	slli	s3,s3,0x38
    8000456c:	00f9e9b3          	or	s3,s3,a5
    80004570:	9b5ff06f          	j	80003f24 <_ZN11HeapManager8heapFreeEPv+0x1bc>
        pFree->nSize += pFree->pNext->nSize + 1;
    80004574:	0107c683          	lbu	a3,16(a5)
    80004578:	0117c603          	lbu	a2,17(a5)
    8000457c:	00861613          	slli	a2,a2,0x8
    80004580:	00d66633          	or	a2,a2,a3
    80004584:	0127c683          	lbu	a3,18(a5)
    80004588:	01069693          	slli	a3,a3,0x10
    8000458c:	00c6e633          	or	a2,a3,a2
    80004590:	0137c683          	lbu	a3,19(a5)
    80004594:	01869693          	slli	a3,a3,0x18
    80004598:	00c6e6b3          	or	a3,a3,a2
    8000459c:	0147c603          	lbu	a2,20(a5)
    800045a0:	02061613          	slli	a2,a2,0x20
    800045a4:	00d666b3          	or	a3,a2,a3
    800045a8:	0157c603          	lbu	a2,21(a5)
    800045ac:	02861613          	slli	a2,a2,0x28
    800045b0:	00d66633          	or	a2,a2,a3
    800045b4:	0167c683          	lbu	a3,22(a5)
    800045b8:	03069693          	slli	a3,a3,0x30
    800045bc:	00c6e633          	or	a2,a3,a2
    800045c0:	0177c683          	lbu	a3,23(a5)
    800045c4:	03869693          	slli	a3,a3,0x38
    800045c8:	00c6e6b3          	or	a3,a3,a2
    800045cc:	00d70733          	add	a4,a4,a3
    800045d0:	00170713          	addi	a4,a4,1
    800045d4:	00e98823          	sb	a4,16(s3)
    800045d8:	00875693          	srli	a3,a4,0x8
    800045dc:	00d988a3          	sb	a3,17(s3)
    800045e0:	01075693          	srli	a3,a4,0x10
    800045e4:	00d98923          	sb	a3,18(s3)
    800045e8:	0187569b          	srliw	a3,a4,0x18
    800045ec:	00d989a3          	sb	a3,19(s3)
    800045f0:	02075693          	srli	a3,a4,0x20
    800045f4:	00d98a23          	sb	a3,20(s3)
    800045f8:	02875693          	srli	a3,a4,0x28
    800045fc:	00d98aa3          	sb	a3,21(s3)
    80004600:	03075693          	srli	a3,a4,0x30
    80004604:	00d98b23          	sb	a3,22(s3)
    80004608:	03875713          	srli	a4,a4,0x38
    8000460c:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80004610:	0007c683          	lbu	a3,0(a5)
    80004614:	0017c703          	lbu	a4,1(a5)
    80004618:	00871713          	slli	a4,a4,0x8
    8000461c:	00d766b3          	or	a3,a4,a3
    80004620:	0027c703          	lbu	a4,2(a5)
    80004624:	01071713          	slli	a4,a4,0x10
    80004628:	00d76733          	or	a4,a4,a3
    8000462c:	0037c683          	lbu	a3,3(a5)
    80004630:	01869693          	slli	a3,a3,0x18
    80004634:	00e6e733          	or	a4,a3,a4
    80004638:	0047c683          	lbu	a3,4(a5)
    8000463c:	02069693          	slli	a3,a3,0x20
    80004640:	00e6e6b3          	or	a3,a3,a4
    80004644:	0057c703          	lbu	a4,5(a5)
    80004648:	02871713          	slli	a4,a4,0x28
    8000464c:	00d766b3          	or	a3,a4,a3
    80004650:	0067c703          	lbu	a4,6(a5)
    80004654:	03071713          	slli	a4,a4,0x30
    80004658:	00d76733          	or	a4,a4,a3
    8000465c:	0077c783          	lbu	a5,7(a5)
    80004660:	03879793          	slli	a5,a5,0x38
    80004664:	00e7e7b3          	or	a5,a5,a4
    80004668:	00e98023          	sb	a4,0(s3)
    8000466c:	0087d713          	srli	a4,a5,0x8
    80004670:	00e980a3          	sb	a4,1(s3)
    80004674:	0107d713          	srli	a4,a5,0x10
    80004678:	00e98123          	sb	a4,2(s3)
    8000467c:	0187d71b          	srliw	a4,a5,0x18
    80004680:	00e981a3          	sb	a4,3(s3)
    80004684:	0207d713          	srli	a4,a5,0x20
    80004688:	00e98223          	sb	a4,4(s3)
    8000468c:	0287d713          	srli	a4,a5,0x28
    80004690:	00e982a3          	sb	a4,5(s3)
    80004694:	0307d713          	srli	a4,a5,0x30
    80004698:	00e98323          	sb	a4,6(s3)
    8000469c:	0387d713          	srli	a4,a5,0x38
    800046a0:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    800046a4:	04078c63          	beqz	a5,800046fc <_ZN11HeapManager8heapFreeEPv+0x994>
            pFree->pNext->pPrev = pFree;
    800046a8:	01378423          	sb	s3,8(a5)
    800046ac:	0089d713          	srli	a4,s3,0x8
    800046b0:	00e784a3          	sb	a4,9(a5)
    800046b4:	0109d713          	srli	a4,s3,0x10
    800046b8:	00e78523          	sb	a4,10(a5)
    800046bc:	0189d71b          	srliw	a4,s3,0x18
    800046c0:	00e785a3          	sb	a4,11(a5)
    800046c4:	0209d713          	srli	a4,s3,0x20
    800046c8:	00e78623          	sb	a4,12(a5)
    800046cc:	0289d713          	srli	a4,s3,0x28
    800046d0:	00e786a3          	sb	a4,13(a5)
    800046d4:	0309d713          	srli	a4,s3,0x30
    800046d8:	00e78723          	sb	a4,14(a5)
    800046dc:	0389d993          	srli	s3,s3,0x38
    800046e0:	013787a3          	sb	s3,15(a5)
    return 0;
    800046e4:	00000513          	li	a0,0
    800046e8:	905ff06f          	j	80003fec <_ZN11HeapManager8heapFreeEPv+0x284>
        return -1;
    800046ec:	fff00513          	li	a0,-1
}
    800046f0:	00008067          	ret
    return 0;
    800046f4:	00000513          	li	a0,0
    800046f8:	8f5ff06f          	j	80003fec <_ZN11HeapManager8heapFreeEPv+0x284>
    800046fc:	00000513          	li	a0,0
    80004700:	8edff06f          	j	80003fec <_ZN11HeapManager8heapFreeEPv+0x284>

0000000080004704 <exceptionHandler>:
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    80004704:	fb010113          	addi	sp,sp,-80
    80004708:	04113423          	sd	ra,72(sp)
    8000470c:	04813023          	sd	s0,64(sp)
    80004710:	02913c23          	sd	s1,56(sp)
    80004714:	03213823          	sd	s2,48(sp)
    80004718:	03313423          	sd	s3,40(sp)
    8000471c:	03413023          	sd	s4,32(sp)
    80004720:	01513c23          	sd	s5,24(sp)
    80004724:	01613823          	sd	s6,16(sp)
    80004728:	01713423          	sd	s7,8(sp)
    8000472c:	05010413          	addi	s0,sp,80
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80004730:	00070b93          	mv	s7,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80004734:	00068b13          	mv	s6,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80004738:	00060a93          	mv	s5,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    8000473c:	00058a13          	mv	s4,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80004740:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80004744:	14202973          	csrr	s2,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80004748:	100029f3          	csrr	s3,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    8000474c:	141024f3          	csrr	s1,sepc


    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004750:	ff890693          	addi	a3,s2,-8
    80004754:	00100713          	li	a4,1
    80004758:	06d77463          	bgeu	a4,a3,800047c0 <exceptionHandler+0xbc>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    8000475c:	00500793          	li	a5,5
    80004760:	1ef90c63          	beq	s2,a5,80004958 <exceptionHandler+0x254>
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80004764:	00700793          	li	a5,7
    80004768:	3af90a63          	beq	s2,a5,80004b1c <exceptionHandler+0x418>
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    8000476c:	fff00793          	li	a5,-1
    80004770:	03f79793          	slli	a5,a5,0x3f
    80004774:	00178793          	addi	a5,a5,1
    80004778:	56f90a63          	beq	s2,a5,80004cec <exceptionHandler+0x5e8>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    8000477c:	fff00793          	li	a5,-1
    80004780:	03f79793          	slli	a5,a5,0x3f
    80004784:	00978793          	addi	a5,a5,9
    80004788:	08f91263          	bne	s2,a5,8000480c <exceptionHandler+0x108>
    {   
        int irq = plic_claim();
    8000478c:	00005097          	auipc	ra,0x5
    80004790:	3b8080e7          	jalr	952(ra) # 80009b44 <plic_claim>
    80004794:	00050913          	mv	s2,a0
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004798:	00a00793          	li	a5,10
    8000479c:	5af50863          	beq	a0,a5,80004d4c <exceptionHandler+0x648>
        plic_complete(irq);
    800047a0:	00090513          	mv	a0,s2
    800047a4:	00005097          	auipc	ra,0x5
    800047a8:	3d8080e7          	jalr	984(ra) # 80009b7c <plic_complete>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    800047ac:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800047b0:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 9));
    800047b4:	20000793          	li	a5,512
    800047b8:	1447b073          	csrc	sip,a5
    }
    800047bc:	0500006f          	j	8000480c <exceptionHandler+0x108>
        switch(a0){
    800047c0:	04200713          	li	a4,66
    800047c4:	18f76663          	bltu	a4,a5,80004950 <exceptionHandler+0x24c>
    800047c8:	00279793          	slli	a5,a5,0x2
    800047cc:	00008717          	auipc	a4,0x8
    800047d0:	bd070713          	addi	a4,a4,-1072 # 8000c39c <_ZTV9Semaphore+0x354>
    800047d4:	00e787b3          	add	a5,a5,a4
    800047d8:	0007a783          	lw	a5,0(a5)
    800047dc:	00e787b3          	add	a5,a5,a4
    800047e0:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800047e4:	000a0593          	mv	a1,s4
    800047e8:	0000b517          	auipc	a0,0xb
    800047ec:	a2053503          	ld	a0,-1504(a0) # 8000f208 <_ZN11HeapManager8instanceE>
    800047f0:	fffff097          	auipc	ra,0xfffff
    800047f4:	e7c080e7          	jalr	-388(ra) # 8000366c <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
    800047f8:	14291073          	csrw	scause,s2
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800047fc:	00448493          	addi	s1,s1,4
    80004800:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004804:	10099073          	csrw	sstatus,s3
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004808:	00050513          	mv	a0,a0
    8000480c:	04813083          	ld	ra,72(sp)
    80004810:	04013403          	ld	s0,64(sp)
    80004814:	03813483          	ld	s1,56(sp)
    80004818:	03013903          	ld	s2,48(sp)
    8000481c:	02813983          	ld	s3,40(sp)
    80004820:	02013a03          	ld	s4,32(sp)
    80004824:	01813a83          	ld	s5,24(sp)
    80004828:	01013b03          	ld	s6,16(sp)
    8000482c:	00813b83          	ld	s7,8(sp)
    80004830:	05010113          	addi	sp,sp,80
    80004834:	00008067          	ret
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80004838:	000a0593          	mv	a1,s4
    8000483c:	0000b517          	auipc	a0,0xb
    80004840:	9cc53503          	ld	a0,-1588(a0) # 8000f208 <_ZN11HeapManager8instanceE>
    80004844:	fffff097          	auipc	ra,0xfffff
    80004848:	524080e7          	jalr	1316(ra) # 80003d68 <_ZN11HeapManager8heapFreeEPv>
                break;
    8000484c:	fadff06f          	j	800047f8 <exceptionHandler+0xf4>
                ConsoleManager::putc('\0'); /// removing this line causes everything to break
    80004850:	00000513          	li	a0,0
    80004854:	fffff097          	auipc	ra,0xfffff
    80004858:	960080e7          	jalr	-1696(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    8000485c:	00100713          	li	a4,1
    80004860:	000b8693          	mv	a3,s7
    80004864:	000b0613          	mv	a2,s6
    80004868:	000a8593          	mv	a1,s5
    8000486c:	000a0513          	mv	a0,s4
    80004870:	ffffe097          	auipc	ra,0xffffe
    80004874:	d44080e7          	jalr	-700(ra) # 800025b4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004878:	f81ff06f          	j	800047f8 <exceptionHandler+0xf4>
                returnVal = _thread::currentThread->exit();
    8000487c:	ffffe097          	auipc	ra,0xffffe
    80004880:	230080e7          	jalr	560(ra) # 80002aac <_ZN7_thread4exitEv>
                break;
    80004884:	f75ff06f          	j	800047f8 <exceptionHandler+0xf4>
                _thread::dispatch();
    80004888:	ffffe097          	auipc	ra,0xffffe
    8000488c:	f8c080e7          	jalr	-116(ra) # 80002814 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80004890:	00000513          	li	a0,0
                break;
    80004894:	f65ff06f          	j	800047f8 <exceptionHandler+0xf4>
                _thread::currentThread->join((thread_t)a1);
    80004898:	000a0593          	mv	a1,s4
    8000489c:	0000b517          	auipc	a0,0xb
    800048a0:	95c53503          	ld	a0,-1700(a0) # 8000f1f8 <_ZN7_thread13currentThreadE>
    800048a4:	ffffe097          	auipc	ra,0xffffe
    800048a8:	05c080e7          	jalr	92(ra) # 80002900 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    800048ac:	00000513          	li	a0,0
                break;
    800048b0:	f49ff06f          	j	800047f8 <exceptionHandler+0xf4>
                _sem::open((sem_t*)a1, unsigned(a2));
    800048b4:	000a859b          	sext.w	a1,s5
    800048b8:	000a0513          	mv	a0,s4
    800048bc:	00001097          	auipc	ra,0x1
    800048c0:	a10080e7          	jalr	-1520(ra) # 800052cc <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800048c4:	00000513          	li	a0,0
                break;
    800048c8:	f31ff06f          	j	800047f8 <exceptionHandler+0xf4>
                _sem::close((sem_t)a1);
    800048cc:	000a0513          	mv	a0,s4
    800048d0:	00001097          	auipc	ra,0x1
    800048d4:	a58080e7          	jalr	-1448(ra) # 80005328 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800048d8:	00000513          	li	a0,0
                break;
    800048dc:	f1dff06f          	j	800047f8 <exceptionHandler+0xf4>
                _sem::wait((sem_t)a1);
    800048e0:	000a0513          	mv	a0,s4
    800048e4:	00001097          	auipc	ra,0x1
    800048e8:	aac080e7          	jalr	-1364(ra) # 80005390 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800048ec:	00000513          	li	a0,0
                break;
    800048f0:	f09ff06f          	j	800047f8 <exceptionHandler+0xf4>
                _sem::signal((sem_t)a1);
    800048f4:	000a0513          	mv	a0,s4
    800048f8:	00001097          	auipc	ra,0x1
    800048fc:	b30080e7          	jalr	-1232(ra) # 80005428 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004900:	00000513          	li	a0,0
                break;
    80004904:	ef5ff06f          	j	800047f8 <exceptionHandler+0xf4>
                returnVal = _sem::trywait((sem_t)a1);
    80004908:	000a0513          	mv	a0,s4
    8000490c:	00001097          	auipc	ra,0x1
    80004910:	b98080e7          	jalr	-1128(ra) # 800054a4 <_ZN4_sem7trywaitEPS_>
                break;
    80004914:	ee5ff06f          	j	800047f8 <exceptionHandler+0xf4>
                returnVal = Timer::getInstance().sleep(a1);
    80004918:	00000097          	auipc	ra,0x0
    8000491c:	4f8080e7          	jalr	1272(ra) # 80004e10 <_ZN5Timer11getInstanceEv>
    80004920:	000a0593          	mv	a1,s4
    80004924:	00000097          	auipc	ra,0x0
    80004928:	5dc080e7          	jalr	1500(ra) # 80004f00 <_ZN5Timer5sleepEm>
                break;
    8000492c:	ecdff06f          	j	800047f8 <exceptionHandler+0xf4>
                returnVal = ConsoleManager::getc();
    80004930:	fffff097          	auipc	ra,0xfffff
    80004934:	8bc080e7          	jalr	-1860(ra) # 800031ec <_ZN14ConsoleManager4getcEv>
                break;
    80004938:	ec1ff06f          	j	800047f8 <exceptionHandler+0xf4>
                ConsoleManager::putc(a1);
    8000493c:	0ffa7513          	andi	a0,s4,255
    80004940:	fffff097          	auipc	ra,0xfffff
    80004944:	874080e7          	jalr	-1932(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
    uint64 returnVal = 0;
    80004948:	00000513          	li	a0,0
                break;
    8000494c:	eadff06f          	j	800047f8 <exceptionHandler+0xf4>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004950:	00000513          	li	a0,0
    80004954:	ea5ff06f          	j	800047f8 <exceptionHandler+0xf4>
        ConsoleManager::putc('\n');
    80004958:	00a00513          	li	a0,10
    8000495c:	fffff097          	auipc	ra,0xfffff
    80004960:	858080e7          	jalr	-1960(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004964:	04500513          	li	a0,69
    80004968:	fffff097          	auipc	ra,0xfffff
    8000496c:	84c080e7          	jalr	-1972(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004970:	07200513          	li	a0,114
    80004974:	fffff097          	auipc	ra,0xfffff
    80004978:	840080e7          	jalr	-1984(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    8000497c:	07200513          	li	a0,114
    80004980:	fffff097          	auipc	ra,0xfffff
    80004984:	834080e7          	jalr	-1996(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004988:	06f00513          	li	a0,111
    8000498c:	fffff097          	auipc	ra,0xfffff
    80004990:	828080e7          	jalr	-2008(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004994:	07200513          	li	a0,114
    80004998:	fffff097          	auipc	ra,0xfffff
    8000499c:	81c080e7          	jalr	-2020(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    800049a0:	03a00513          	li	a0,58
    800049a4:	fffff097          	auipc	ra,0xfffff
    800049a8:	810080e7          	jalr	-2032(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800049ac:	02000513          	li	a0,32
    800049b0:	fffff097          	auipc	ra,0xfffff
    800049b4:	804080e7          	jalr	-2044(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    800049b8:	06900513          	li	a0,105
    800049bc:	ffffe097          	auipc	ra,0xffffe
    800049c0:	7f8080e7          	jalr	2040(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    800049c4:	06c00513          	li	a0,108
    800049c8:	ffffe097          	auipc	ra,0xffffe
    800049cc:	7ec080e7          	jalr	2028(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    800049d0:	06c00513          	li	a0,108
    800049d4:	ffffe097          	auipc	ra,0xffffe
    800049d8:	7e0080e7          	jalr	2016(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    800049dc:	06500513          	li	a0,101
    800049e0:	ffffe097          	auipc	ra,0xffffe
    800049e4:	7d4080e7          	jalr	2004(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    800049e8:	06700513          	li	a0,103
    800049ec:	ffffe097          	auipc	ra,0xffffe
    800049f0:	7c8080e7          	jalr	1992(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    800049f4:	06100513          	li	a0,97
    800049f8:	ffffe097          	auipc	ra,0xffffe
    800049fc:	7bc080e7          	jalr	1980(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004a00:	06c00513          	li	a0,108
    80004a04:	ffffe097          	auipc	ra,0xffffe
    80004a08:	7b0080e7          	jalr	1968(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004a0c:	02000513          	li	a0,32
    80004a10:	ffffe097          	auipc	ra,0xffffe
    80004a14:	7a4080e7          	jalr	1956(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004a18:	07200513          	li	a0,114
    80004a1c:	ffffe097          	auipc	ra,0xffffe
    80004a20:	798080e7          	jalr	1944(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004a24:	06500513          	li	a0,101
    80004a28:	ffffe097          	auipc	ra,0xffffe
    80004a2c:	78c080e7          	jalr	1932(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004a30:	06100513          	li	a0,97
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	780080e7          	jalr	1920(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('d');
    80004a3c:	06400513          	li	a0,100
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	774080e7          	jalr	1908(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    80004a48:	02100513          	li	a0,33
    80004a4c:	ffffe097          	auipc	ra,0xffffe
    80004a50:	768080e7          	jalr	1896(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004a54:	00a00513          	li	a0,10
    80004a58:	ffffe097          	auipc	ra,0xffffe
    80004a5c:	75c080e7          	jalr	1884(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004a60:	05000513          	li	a0,80
    80004a64:	ffffe097          	auipc	ra,0xffffe
    80004a68:	750080e7          	jalr	1872(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004a6c:	04300513          	li	a0,67
    80004a70:	ffffe097          	auipc	ra,0xffffe
    80004a74:	744080e7          	jalr	1860(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004a78:	03a00513          	li	a0,58
    80004a7c:	ffffe097          	auipc	ra,0xffffe
    80004a80:	738080e7          	jalr	1848(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004a84:	02000513          	li	a0,32
    80004a88:	ffffe097          	auipc	ra,0xffffe
    80004a8c:	72c080e7          	jalr	1836(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004a90:	03000513          	li	a0,48
    80004a94:	ffffe097          	auipc	ra,0xffffe
    80004a98:	720080e7          	jalr	1824(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004a9c:	07800513          	li	a0,120
    80004aa0:	ffffe097          	auipc	ra,0xffffe
    80004aa4:	714080e7          	jalr	1812(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004aa8:	00f00913          	li	s2,15
    80004aac:	0140006f          	j	80004ac0 <exceptionHandler+0x3bc>
                ConsoleManager::putc('A' + tmp - 10);
    80004ab0:	03750513          	addi	a0,a0,55
    80004ab4:	ffffe097          	auipc	ra,0xffffe
    80004ab8:	700080e7          	jalr	1792(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004abc:	fff9091b          	addiw	s2,s2,-1
    80004ac0:	02094463          	bltz	s2,80004ae8 <exceptionHandler+0x3e4>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004ac4:	0029151b          	slliw	a0,s2,0x2
    80004ac8:	00a4d533          	srl	a0,s1,a0
    80004acc:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004ad0:	00900793          	li	a5,9
    80004ad4:	fca7eee3          	bltu	a5,a0,80004ab0 <exceptionHandler+0x3ac>
                ConsoleManager::putc('0' + tmp);
    80004ad8:	03050513          	addi	a0,a0,48
    80004adc:	ffffe097          	auipc	ra,0xffffe
    80004ae0:	6d8080e7          	jalr	1752(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
    80004ae4:	fd9ff06f          	j	80004abc <exceptionHandler+0x3b8>
        ConsoleManager::putc('\n');
    80004ae8:	00a00513          	li	a0,10
    80004aec:	ffffe097          	auipc	ra,0xffffe
    80004af0:	6c8080e7          	jalr	1736(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        assert(false);
    80004af4:	00008697          	auipc	a3,0x8
    80004af8:	84468693          	addi	a3,a3,-1980 # 8000c338 <_ZTV9Semaphore+0x2f0>
    80004afc:	08700613          	li	a2,135
    80004b00:	00008597          	auipc	a1,0x8
    80004b04:	85058593          	addi	a1,a1,-1968 # 8000c350 <_ZTV9Semaphore+0x308>
    80004b08:	00008517          	auipc	a0,0x8
    80004b0c:	86850513          	addi	a0,a0,-1944 # 8000c370 <_ZTV9Semaphore+0x328>
    80004b10:	00001097          	auipc	ra,0x1
    80004b14:	ba0080e7          	jalr	-1120(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80004b18:	cf5ff06f          	j	8000480c <exceptionHandler+0x108>
        ConsoleManager::putc('\n');
    80004b1c:	00a00513          	li	a0,10
    80004b20:	ffffe097          	auipc	ra,0xffffe
    80004b24:	694080e7          	jalr	1684(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004b28:	04500513          	li	a0,69
    80004b2c:	ffffe097          	auipc	ra,0xffffe
    80004b30:	688080e7          	jalr	1672(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004b34:	07200513          	li	a0,114
    80004b38:	ffffe097          	auipc	ra,0xffffe
    80004b3c:	67c080e7          	jalr	1660(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004b40:	07200513          	li	a0,114
    80004b44:	ffffe097          	auipc	ra,0xffffe
    80004b48:	670080e7          	jalr	1648(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004b4c:	06f00513          	li	a0,111
    80004b50:	ffffe097          	auipc	ra,0xffffe
    80004b54:	664080e7          	jalr	1636(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004b58:	07200513          	li	a0,114
    80004b5c:	ffffe097          	auipc	ra,0xffffe
    80004b60:	658080e7          	jalr	1624(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004b64:	03a00513          	li	a0,58
    80004b68:	ffffe097          	auipc	ra,0xffffe
    80004b6c:	64c080e7          	jalr	1612(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004b70:	02000513          	li	a0,32
    80004b74:	ffffe097          	auipc	ra,0xffffe
    80004b78:	640080e7          	jalr	1600(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004b7c:	06900513          	li	a0,105
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	634080e7          	jalr	1588(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004b88:	06c00513          	li	a0,108
    80004b8c:	ffffe097          	auipc	ra,0xffffe
    80004b90:	628080e7          	jalr	1576(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004b94:	06c00513          	li	a0,108
    80004b98:	ffffe097          	auipc	ra,0xffffe
    80004b9c:	61c080e7          	jalr	1564(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004ba0:	06500513          	li	a0,101
    80004ba4:	ffffe097          	auipc	ra,0xffffe
    80004ba8:	610080e7          	jalr	1552(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004bac:	06700513          	li	a0,103
    80004bb0:	ffffe097          	auipc	ra,0xffffe
    80004bb4:	604080e7          	jalr	1540(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004bb8:	06100513          	li	a0,97
    80004bbc:	ffffe097          	auipc	ra,0xffffe
    80004bc0:	5f8080e7          	jalr	1528(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004bc4:	06c00513          	li	a0,108
    80004bc8:	ffffe097          	auipc	ra,0xffffe
    80004bcc:	5ec080e7          	jalr	1516(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004bd0:	02000513          	li	a0,32
    80004bd4:	ffffe097          	auipc	ra,0xffffe
    80004bd8:	5e0080e7          	jalr	1504(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('w');
    80004bdc:	07700513          	li	a0,119
    80004be0:	ffffe097          	auipc	ra,0xffffe
    80004be4:	5d4080e7          	jalr	1492(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004be8:	07200513          	li	a0,114
    80004bec:	ffffe097          	auipc	ra,0xffffe
    80004bf0:	5c8080e7          	jalr	1480(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004bf4:	06900513          	li	a0,105
    80004bf8:	ffffe097          	auipc	ra,0xffffe
    80004bfc:	5bc080e7          	jalr	1468(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('t');
    80004c00:	07400513          	li	a0,116
    80004c04:	ffffe097          	auipc	ra,0xffffe
    80004c08:	5b0080e7          	jalr	1456(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004c0c:	06500513          	li	a0,101
    80004c10:	ffffe097          	auipc	ra,0xffffe
    80004c14:	5a4080e7          	jalr	1444(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    80004c18:	02100513          	li	a0,33
    80004c1c:	ffffe097          	auipc	ra,0xffffe
    80004c20:	598080e7          	jalr	1432(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004c24:	00a00513          	li	a0,10
    80004c28:	ffffe097          	auipc	ra,0xffffe
    80004c2c:	58c080e7          	jalr	1420(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004c30:	05000513          	li	a0,80
    80004c34:	ffffe097          	auipc	ra,0xffffe
    80004c38:	580080e7          	jalr	1408(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004c3c:	04300513          	li	a0,67
    80004c40:	ffffe097          	auipc	ra,0xffffe
    80004c44:	574080e7          	jalr	1396(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004c48:	03a00513          	li	a0,58
    80004c4c:	ffffe097          	auipc	ra,0xffffe
    80004c50:	568080e7          	jalr	1384(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004c54:	02000513          	li	a0,32
    80004c58:	ffffe097          	auipc	ra,0xffffe
    80004c5c:	55c080e7          	jalr	1372(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004c60:	03000513          	li	a0,48
    80004c64:	ffffe097          	auipc	ra,0xffffe
    80004c68:	550080e7          	jalr	1360(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004c6c:	07800513          	li	a0,120
    80004c70:	ffffe097          	auipc	ra,0xffffe
    80004c74:	544080e7          	jalr	1348(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004c78:	00f00913          	li	s2,15
    80004c7c:	0140006f          	j	80004c90 <exceptionHandler+0x58c>
                ConsoleManager::putc('A' + tmp - 10);
    80004c80:	03750513          	addi	a0,a0,55
    80004c84:	ffffe097          	auipc	ra,0xffffe
    80004c88:	530080e7          	jalr	1328(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004c8c:	fff9091b          	addiw	s2,s2,-1
    80004c90:	02094463          	bltz	s2,80004cb8 <exceptionHandler+0x5b4>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004c94:	0029151b          	slliw	a0,s2,0x2
    80004c98:	00a4d533          	srl	a0,s1,a0
    80004c9c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004ca0:	00900793          	li	a5,9
    80004ca4:	fca7eee3          	bltu	a5,a0,80004c80 <exceptionHandler+0x57c>
                ConsoleManager::putc('0' + tmp);
    80004ca8:	03050513          	addi	a0,a0,48
    80004cac:	ffffe097          	auipc	ra,0xffffe
    80004cb0:	508080e7          	jalr	1288(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
    80004cb4:	fd9ff06f          	j	80004c8c <exceptionHandler+0x588>
        ConsoleManager::putc('\n');
    80004cb8:	00a00513          	li	a0,10
    80004cbc:	ffffe097          	auipc	ra,0xffffe
    80004cc0:	4f8080e7          	jalr	1272(ra) # 800031b4 <_ZN14ConsoleManager4putcEc>
        assert(false);
    80004cc4:	00007697          	auipc	a3,0x7
    80004cc8:	67468693          	addi	a3,a3,1652 # 8000c338 <_ZTV9Semaphore+0x2f0>
    80004ccc:	0b000613          	li	a2,176
    80004cd0:	00007597          	auipc	a1,0x7
    80004cd4:	68058593          	addi	a1,a1,1664 # 8000c350 <_ZTV9Semaphore+0x308>
    80004cd8:	00007517          	auipc	a0,0x7
    80004cdc:	69850513          	addi	a0,a0,1688 # 8000c370 <_ZTV9Semaphore+0x328>
    80004ce0:	00001097          	auipc	ra,0x1
    80004ce4:	9d0080e7          	jalr	-1584(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80004ce8:	b25ff06f          	j	8000480c <exceptionHandler+0x108>
        Timer::getInstance().tick();
    80004cec:	00000097          	auipc	ra,0x0
    80004cf0:	124080e7          	jalr	292(ra) # 80004e10 <_ZN5Timer11getInstanceEv>
    80004cf4:	00000097          	auipc	ra,0x0
    80004cf8:	180080e7          	jalr	384(ra) # 80004e74 <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80004cfc:	0000a517          	auipc	a0,0xa
    80004d00:	4fc53503          	ld	a0,1276(a0) # 8000f1f8 <_ZN7_thread13currentThreadE>
    80004d04:	ffffe097          	auipc	ra,0xffffe
    80004d08:	d18080e7          	jalr	-744(ra) # 80002a1c <_ZN7_thread4tickEv>
    80004d0c:	00051c63          	bnez	a0,80004d24 <exceptionHandler+0x620>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004d10:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004d14:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004d18:	00200793          	li	a5,2
    80004d1c:	1447b073          	csrc	sip,a5
    80004d20:	aedff06f          	j	8000480c <exceptionHandler+0x108>
        assert(_thread::currentThread->tick() == 0);
    80004d24:	00007697          	auipc	a3,0x7
    80004d28:	61468693          	addi	a3,a3,1556 # 8000c338 <_ZTV9Semaphore+0x2f0>
    80004d2c:	0b400613          	li	a2,180
    80004d30:	00007597          	auipc	a1,0x7
    80004d34:	62058593          	addi	a1,a1,1568 # 8000c350 <_ZTV9Semaphore+0x308>
    80004d38:	00007517          	auipc	a0,0x7
    80004d3c:	64050513          	addi	a0,a0,1600 # 8000c378 <_ZTV9Semaphore+0x330>
    80004d40:	00001097          	auipc	ra,0x1
    80004d44:	970080e7          	jalr	-1680(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80004d48:	fc9ff06f          	j	80004d10 <exceptionHandler+0x60c>
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004d4c:	ffffe097          	auipc	ra,0xffffe
    80004d50:	5b8080e7          	jalr	1464(ra) # 80003304 <_ZN14ConsoleManager12inputHandlerEv>
    80004d54:	a4dff06f          	j	800047a0 <exceptionHandler+0x9c>

0000000080004d58 <_ZN5TimerC1Ev>:
#include "syscall_c.h"


Timer* Timer::instance = 0;

Timer::Timer(){
    80004d58:	fe010113          	addi	sp,sp,-32
    80004d5c:	00113c23          	sd	ra,24(sp)
    80004d60:	00813823          	sd	s0,16(sp)
    80004d64:	00913423          	sd	s1,8(sp)
    80004d68:	02010413          	addi	s0,sp,32
    80004d6c:	00050493          	mv	s1,a0
    assert(instance == 0);
    80004d70:	0000a797          	auipc	a5,0xa
    80004d74:	4a07b783          	ld	a5,1184(a5) # 8000f210 <_ZN5Timer8instanceE>
    80004d78:	02079463          	bnez	a5,80004da0 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80004d7c:	0000a797          	auipc	a5,0xa
    80004d80:	4897ba23          	sd	s1,1172(a5) # 8000f210 <_ZN5Timer8instanceE>
    sleepingHead = 0;
    80004d84:	0004b023          	sd	zero,0(s1)
    time = 0;
    80004d88:	0004b423          	sd	zero,8(s1)
}
    80004d8c:	01813083          	ld	ra,24(sp)
    80004d90:	01013403          	ld	s0,16(sp)
    80004d94:	00813483          	ld	s1,8(sp)
    80004d98:	02010113          	addi	sp,sp,32
    80004d9c:	00008067          	ret
    assert(instance == 0);
    80004da0:	00007697          	auipc	a3,0x7
    80004da4:	70868693          	addi	a3,a3,1800 # 8000c4a8 <_ZTV9Semaphore+0x460>
    80004da8:	01700613          	li	a2,23
    80004dac:	00007597          	auipc	a1,0x7
    80004db0:	70c58593          	addi	a1,a1,1804 # 8000c4b8 <_ZTV9Semaphore+0x470>
    80004db4:	00007517          	auipc	a0,0x7
    80004db8:	3fc50513          	addi	a0,a0,1020 # 8000c1b0 <_ZTV9Semaphore+0x168>
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	8f4080e7          	jalr	-1804(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80004dc4:	fb9ff06f          	j	80004d7c <_ZN5TimerC1Ev+0x24>

0000000080004dc8 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    80004dc8:	00053503          	ld	a0,0(a0)
    while(current != 0){
    80004dcc:	04050063          	beqz	a0,80004e0c <_ZN5TimerD1Ev+0x44>
Timer::~Timer(){
    80004dd0:	fe010113          	addi	sp,sp,-32
    80004dd4:	00113c23          	sd	ra,24(sp)
    80004dd8:	00813823          	sd	s0,16(sp)
    80004ddc:	00913423          	sd	s1,8(sp)
    80004de0:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    80004de4:	01053483          	ld	s1,16(a0)
        mem_free(current);
    80004de8:	00000097          	auipc	ra,0x0
    80004dec:	248080e7          	jalr	584(ra) # 80005030 <_Z8mem_freePv>
        current = next;
    80004df0:	00048513          	mv	a0,s1
    while(current != 0){
    80004df4:	fe0498e3          	bnez	s1,80004de4 <_ZN5TimerD1Ev+0x1c>
    }
}
    80004df8:	01813083          	ld	ra,24(sp)
    80004dfc:	01013403          	ld	s0,16(sp)
    80004e00:	00813483          	ld	s1,8(sp)
    80004e04:	02010113          	addi	sp,sp,32
    80004e08:	00008067          	ret
    80004e0c:	00008067          	ret

0000000080004e10 <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    80004e10:	0000a797          	auipc	a5,0xa
    80004e14:	4007b783          	ld	a5,1024(a5) # 8000f210 <_ZN5Timer8instanceE>
    80004e18:	00078863          	beqz	a5,80004e28 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    80004e1c:	0000a517          	auipc	a0,0xa
    80004e20:	3f453503          	ld	a0,1012(a0) # 8000f210 <_ZN5Timer8instanceE>
    80004e24:	00008067          	ret
Timer& Timer::getInstance(){
    80004e28:	ff010113          	addi	sp,sp,-16
    80004e2c:	00113423          	sd	ra,8(sp)
    80004e30:	00813023          	sd	s0,0(sp)
    80004e34:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80004e38:	00007697          	auipc	a3,0x7
    80004e3c:	69068693          	addi	a3,a3,1680 # 8000c4c8 <_ZTV9Semaphore+0x480>
    80004e40:	02700613          	li	a2,39
    80004e44:	00007597          	auipc	a1,0x7
    80004e48:	67458593          	addi	a1,a1,1652 # 8000c4b8 <_ZTV9Semaphore+0x470>
    80004e4c:	00007517          	auipc	a0,0x7
    80004e50:	32c50513          	addi	a0,a0,812 # 8000c178 <_ZTV9Semaphore+0x130>
    80004e54:	00001097          	auipc	ra,0x1
    80004e58:	85c080e7          	jalr	-1956(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
}
    80004e5c:	0000a517          	auipc	a0,0xa
    80004e60:	3b453503          	ld	a0,948(a0) # 8000f210 <_ZN5Timer8instanceE>
    80004e64:	00813083          	ld	ra,8(sp)
    80004e68:	00013403          	ld	s0,0(sp)
    80004e6c:	01010113          	addi	sp,sp,16
    80004e70:	00008067          	ret

0000000080004e74 <_ZN5Timer4tickEv>:

void Timer::tick(){
    80004e74:	fe010113          	addi	sp,sp,-32
    80004e78:	00113c23          	sd	ra,24(sp)
    80004e7c:	00813823          	sd	s0,16(sp)
    80004e80:	00913423          	sd	s1,8(sp)
    80004e84:	01213023          	sd	s2,0(sp)
    80004e88:	02010413          	addi	s0,sp,32
    80004e8c:	00050493          	mv	s1,a0
    time += 1;
    80004e90:	00853783          	ld	a5,8(a0)
    80004e94:	00178793          	addi	a5,a5,1
    80004e98:	00f53423          	sd	a5,8(a0)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80004e9c:	0004b783          	ld	a5,0(s1)
    80004ea0:	04078463          	beqz	a5,80004ee8 <_ZN5Timer4tickEv+0x74>
    80004ea4:	0087b683          	ld	a3,8(a5)
    80004ea8:	0084b703          	ld	a4,8(s1)
    80004eac:	02d76e63          	bltu	a4,a3,80004ee8 <_ZN5Timer4tickEv+0x74>
        sleepingHead->thread->setSleeping(false);
    80004eb0:	00000593          	li	a1,0
    80004eb4:	0007b503          	ld	a0,0(a5)
    80004eb8:	ffffe097          	auipc	ra,0xffffe
    80004ebc:	92c080e7          	jalr	-1748(ra) # 800027e4 <_ZN7_thread11setSleepingEb>
        Scheduler::put(sleepingHead->thread);
    80004ec0:	0004b783          	ld	a5,0(s1)
    80004ec4:	0007b503          	ld	a0,0(a5)
    80004ec8:	00000097          	auipc	ra,0x0
    80004ecc:	6b8080e7          	jalr	1720(ra) # 80005580 <_ZN9Scheduler3putEP7_thread>
        threadSleepWrapper* next = sleepingHead->next;
    80004ed0:	0004b503          	ld	a0,0(s1)
    80004ed4:	01053903          	ld	s2,16(a0)
        mem_free(sleepingHead);
    80004ed8:	00000097          	auipc	ra,0x0
    80004edc:	158080e7          	jalr	344(ra) # 80005030 <_Z8mem_freePv>
        sleepingHead = next;
    80004ee0:	0124b023          	sd	s2,0(s1)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80004ee4:	fb9ff06f          	j	80004e9c <_ZN5Timer4tickEv+0x28>
    }
}
    80004ee8:	01813083          	ld	ra,24(sp)
    80004eec:	01013403          	ld	s0,16(sp)
    80004ef0:	00813483          	ld	s1,8(sp)
    80004ef4:	00013903          	ld	s2,0(sp)
    80004ef8:	02010113          	addi	sp,sp,32
    80004efc:	00008067          	ret

0000000080004f00 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80004f00:	fd010113          	addi	sp,sp,-48
    80004f04:	02113423          	sd	ra,40(sp)
    80004f08:	02813023          	sd	s0,32(sp)
    80004f0c:	00913c23          	sd	s1,24(sp)
    80004f10:	01213823          	sd	s2,16(sp)
    80004f14:	01313423          	sd	s3,8(sp)
    80004f18:	03010413          	addi	s0,sp,48
    80004f1c:	00050493          	mv	s1,a0
    80004f20:	00058913          	mv	s2,a1

    thread_t thread = _thread::currentThread;
    80004f24:	0000a997          	auipc	s3,0xa
    80004f28:	2d49b983          	ld	s3,724(s3) # 8000f1f8 <_ZN7_thread13currentThreadE>
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    80004f2c:	01800513          	li	a0,24
    80004f30:	00000097          	auipc	ra,0x0
    80004f34:	0d0080e7          	jalr	208(ra) # 80005000 <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    80004f38:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    80004f3c:	0084b783          	ld	a5,8(s1)
    80004f40:	012785b3          	add	a1,a5,s2
    80004f44:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    80004f48:	00053823          	sd	zero,16(a0)
    if(sleepingHead == 0){
    80004f4c:	0004b783          	ld	a5,0(s1)
    80004f50:	06078063          	beqz	a5,80004fb0 <_ZN5Timer5sleepEm+0xb0>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80004f54:	00078693          	mv	a3,a5
    80004f58:	0107b783          	ld	a5,16(a5)
    80004f5c:	00078663          	beqz	a5,80004f68 <_ZN5Timer5sleepEm+0x68>
    80004f60:	0087b703          	ld	a4,8(a5)
    80004f64:	feb768e3          	bltu	a4,a1,80004f54 <_ZN5Timer5sleepEm+0x54>
            current = current->next;
        }
        if(current->wakeUpTime > newSleepingThread->wakeUpTime){
    80004f68:	0086b703          	ld	a4,8(a3)
    80004f6c:	04e5f663          	bgeu	a1,a4,80004fb8 <_ZN5Timer5sleepEm+0xb8>
            sleepingHead = newSleepingThread;
    80004f70:	00a4b023          	sd	a0,0(s1)
            newSleepingThread->next = current;
    80004f74:	00d53823          	sd	a3,16(a0)
        }else{
            newSleepingThread->next = current->next;
            current->next = newSleepingThread;
        }
    }
    thread->setSleeping(true);
    80004f78:	00100593          	li	a1,1
    80004f7c:	00098513          	mv	a0,s3
    80004f80:	ffffe097          	auipc	ra,0xffffe
    80004f84:	864080e7          	jalr	-1948(ra) # 800027e4 <_ZN7_thread11setSleepingEb>
    _thread::dispatch();
    80004f88:	ffffe097          	auipc	ra,0xffffe
    80004f8c:	88c080e7          	jalr	-1908(ra) # 80002814 <_ZN7_thread8dispatchEv>
    return 0;
}
    80004f90:	00000513          	li	a0,0
    80004f94:	02813083          	ld	ra,40(sp)
    80004f98:	02013403          	ld	s0,32(sp)
    80004f9c:	01813483          	ld	s1,24(sp)
    80004fa0:	01013903          	ld	s2,16(sp)
    80004fa4:	00813983          	ld	s3,8(sp)
    80004fa8:	03010113          	addi	sp,sp,48
    80004fac:	00008067          	ret
        sleepingHead = newSleepingThread;
    80004fb0:	00a4b023          	sd	a0,0(s1)
    80004fb4:	fc5ff06f          	j	80004f78 <_ZN5Timer5sleepEm+0x78>
            newSleepingThread->next = current->next;
    80004fb8:	00f53823          	sd	a5,16(a0)
            current->next = newSleepingThread;
    80004fbc:	00a6b823          	sd	a0,16(a3)
    80004fc0:	fb9ff06f          	j	80004f78 <_ZN5Timer5sleepEm+0x78>

0000000080004fc4 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80004fc4:	ff010113          	addi	sp,sp,-16
    80004fc8:	00813423          	sd	s0,8(sp)
    80004fcc:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    80004fd0:	00053503          	ld	a0,0(a0)
}
    80004fd4:	00153513          	seqz	a0,a0
    80004fd8:	00813403          	ld	s0,8(sp)
    80004fdc:	01010113          	addi	sp,sp,16
    80004fe0:	00008067          	ret

0000000080004fe4 <_ZN5Timer7getTimeEv>:

time_t Timer::getTime(){
    80004fe4:	ff010113          	addi	sp,sp,-16
    80004fe8:	00813423          	sd	s0,8(sp)
    80004fec:	01010413          	addi	s0,sp,16
    return time;
    80004ff0:	00853503          	ld	a0,8(a0)
    80004ff4:	00813403          	ld	s0,8(sp)
    80004ff8:	01010113          	addi	sp,sp,16
    80004ffc:	00008067          	ret

0000000080005000 <_Z9mem_allocm>:
 * 
 */

#include "syscall_c.h"
#include "consoleManager.h"
void* mem_alloc ( size_t nSize ){
    80005000:	ff010113          	addi	sp,sp,-16
    80005004:	00813423          	sd	s0,8(sp)
    80005008:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000500c:	03f50513          	addi	a0,a0,63
    80005010:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80005014:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80005018:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    8000501c:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80005020:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    80005024:	00813403          	ld	s0,8(sp)
    80005028:	01010113          	addi	sp,sp,16
    8000502c:	00008067          	ret

0000000080005030 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    80005030:	ff010113          	addi	sp,sp,-16
    80005034:	00813423          	sd	s0,8(sp)
    80005038:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    8000503c:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    80005040:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    80005044:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    80005048:	00050513          	mv	a0,a0
    return nResult;

}
    8000504c:	0005051b          	sext.w	a0,a0
    80005050:	00813403          	ld	s0,8(sp)
    80005054:	01010113          	addi	sp,sp,16
    80005058:	00008067          	ret

000000008000505c <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    8000505c:	fd010113          	addi	sp,sp,-48
    80005060:	02113423          	sd	ra,40(sp)
    80005064:	02813023          	sd	s0,32(sp)
    80005068:	00913c23          	sd	s1,24(sp)
    8000506c:	01213823          	sd	s2,16(sp)
    80005070:	01313423          	sd	s3,8(sp)
    80005074:	03010413          	addi	s0,sp,48
    80005078:	00050493          	mv	s1,a0
    8000507c:	00058913          	mv	s2,a1
    80005080:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE * 16);
    80005084:	00010537          	lui	a0,0x10
    80005088:	00000097          	auipc	ra,0x0
    8000508c:	f78080e7          	jalr	-136(ra) # 80005000 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    80005090:	000017b7          	lui	a5,0x1
    80005094:	00f50533          	add	a0,a0,a5
    80005098:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    8000509c:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    800050a0:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    800050a4:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    800050a8:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800050ac:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800050b0:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800050b4:	0005051b          	sext.w	a0,a0
    800050b8:	02813083          	ld	ra,40(sp)
    800050bc:	02013403          	ld	s0,32(sp)
    800050c0:	01813483          	ld	s1,24(sp)
    800050c4:	01013903          	ld	s2,16(sp)
    800050c8:	00813983          	ld	s3,8(sp)
    800050cc:	03010113          	addi	sp,sp,48
    800050d0:	00008067          	ret

00000000800050d4 <_Z11thread_exitv>:

int thread_exit (){
    800050d4:	ff010113          	addi	sp,sp,-16
    800050d8:	00813423          	sd	s0,8(sp)
    800050dc:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    800050e0:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    800050e4:	00000073          	ecall
    return 0;
}
    800050e8:	00000513          	li	a0,0
    800050ec:	00813403          	ld	s0,8(sp)
    800050f0:	01010113          	addi	sp,sp,16
    800050f4:	00008067          	ret

00000000800050f8 <_Z15thread_dispatchv>:

void thread_dispatch () {
    800050f8:	ff010113          	addi	sp,sp,-16
    800050fc:	00813423          	sd	s0,8(sp)
    80005100:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80005104:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80005108:	00000073          	ecall
    return;
}
    8000510c:	00813403          	ld	s0,8(sp)
    80005110:	01010113          	addi	sp,sp,16
    80005114:	00008067          	ret

0000000080005118 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    80005118:	ff010113          	addi	sp,sp,-16
    8000511c:	00813423          	sd	s0,8(sp)
    80005120:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    80005124:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    80005128:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    8000512c:	00000073          	ecall
}
    80005130:	00813403          	ld	s0,8(sp)
    80005134:	01010113          	addi	sp,sp,16
    80005138:	00008067          	ret

000000008000513c <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    8000513c:	ff010113          	addi	sp,sp,-16
    80005140:	00813423          	sd	s0,8(sp)
    80005144:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    80005148:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    8000514c:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80005150:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80005154:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80005158:	0005051b          	sext.w	a0,a0
    8000515c:	00813403          	ld	s0,8(sp)
    80005160:	01010113          	addi	sp,sp,16
    80005164:	00008067          	ret

0000000080005168 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    80005168:	ff010113          	addi	sp,sp,-16
    8000516c:	00813423          	sd	s0,8(sp)
    80005170:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80005174:	02059593          	slli	a1,a1,0x20
    80005178:	0205d593          	srli	a1,a1,0x20
    8000517c:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80005180:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80005184:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80005188:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000518c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80005190:	0005051b          	sext.w	a0,a0
    80005194:	00813403          	ld	s0,8(sp)
    80005198:	01010113          	addi	sp,sp,16
    8000519c:	00008067          	ret

00000000800051a0 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    800051a0:	ff010113          	addi	sp,sp,-16
    800051a4:	00813423          	sd	s0,8(sp)
    800051a8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800051ac:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    800051b0:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800051b4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800051b8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800051bc:	0005051b          	sext.w	a0,a0
    800051c0:	00813403          	ld	s0,8(sp)
    800051c4:	01010113          	addi	sp,sp,16
    800051c8:	00008067          	ret

00000000800051cc <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    800051cc:	ff010113          	addi	sp,sp,-16
    800051d0:	00813423          	sd	s0,8(sp)
    800051d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800051d8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    800051dc:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    800051e0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800051e4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800051e8:	0005051b          	sext.w	a0,a0
    800051ec:	00813403          	ld	s0,8(sp)
    800051f0:	01010113          	addi	sp,sp,16
    800051f4:	00008067          	ret

00000000800051f8 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    800051f8:	ff010113          	addi	sp,sp,-16
    800051fc:	00813423          	sd	s0,8(sp)
    80005200:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80005204:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80005208:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    8000520c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80005210:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80005214:	0005051b          	sext.w	a0,a0
    80005218:	00813403          	ld	s0,8(sp)
    8000521c:	01010113          	addi	sp,sp,16
    80005220:	00008067          	ret

0000000080005224 <_Z11sem_trywaitP4_sem>:

int sem_trywait ( sem_t handle ) {
    80005224:	ff010113          	addi	sp,sp,-16
    80005228:	00813423          	sd	s0,8(sp)
    8000522c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80005230:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x26");
    80005234:	02600513          	li	a0,38
    __asm__ volatile("ecall");
    80005238:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000523c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80005240:	0005051b          	sext.w	a0,a0
    80005244:	00813403          	ld	s0,8(sp)
    80005248:	01010113          	addi	sp,sp,16
    8000524c:	00008067          	ret

0000000080005250 <_Z13sem_timedwaitP4_semm>:

int sem_timedwait ( sem_t handle, time_t duration ) {
    80005250:	ff010113          	addi	sp,sp,-16
    80005254:	00813423          	sd	s0,8(sp)
    80005258:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    8000525c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a2,%0"::"r"((uint64)duration));
    80005260:	00058613          	mv	a2,a1
    __asm__ volatile("li a0,0x25");
    80005264:	02500513          	li	a0,37
    __asm__ volatile("ecall");
    80005268:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000526c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80005270:	0005051b          	sext.w	a0,a0
    80005274:	00813403          	ld	s0,8(sp)
    80005278:	01010113          	addi	sp,sp,16
    8000527c:	00008067          	ret

0000000080005280 <_Z4getcv>:

char getc() {
    80005280:	ff010113          	addi	sp,sp,-16
    80005284:	00813423          	sd	s0,8(sp)
    80005288:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    8000528c:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80005290:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80005294:	00050513          	mv	a0,a0
    return chr;
}
    80005298:	0ff57513          	andi	a0,a0,255
    8000529c:	00813403          	ld	s0,8(sp)
    800052a0:	01010113          	addi	sp,sp,16
    800052a4:	00008067          	ret

00000000800052a8 <_Z4putcc>:

#include "consoleManager.h"

void putc(char chr ) {
    800052a8:	ff010113          	addi	sp,sp,-16
    800052ac:	00813423          	sd	s0,8(sp)
    800052b0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    800052b4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    800052b8:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    800052bc:	00000073          	ecall
    800052c0:	00813403          	ld	s0,8(sp)
    800052c4:	01010113          	addi	sp,sp,16
    800052c8:	00008067          	ret

00000000800052cc <_ZN4_sem4openEPPS_j>:
#include "syscall_c.h"

#include "consoleManager.h"


void _sem::open(_sem** handle, unsigned init){
    800052cc:	fe010113          	addi	sp,sp,-32
    800052d0:	00113c23          	sd	ra,24(sp)
    800052d4:	00813823          	sd	s0,16(sp)
    800052d8:	00913423          	sd	s1,8(sp)
    800052dc:	01213023          	sd	s2,0(sp)
    800052e0:	02010413          	addi	s0,sp,32
    800052e4:	00050493          	mv	s1,a0
    800052e8:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    800052ec:	01800513          	li	a0,24
    800052f0:	00000097          	auipc	ra,0x0
    800052f4:	d10080e7          	jalr	-752(ra) # 80005000 <_Z9mem_allocm>
    800052f8:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    800052fc:	00053023          	sd	zero,0(a0) # 10000 <_entry-0x7fff0000>
    (*handle)->blockTail = 0;
    80005300:	0004b783          	ld	a5,0(s1)
    80005304:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    80005308:	0004b783          	ld	a5,0(s1)
    8000530c:	0127a823          	sw	s2,16(a5)
}
    80005310:	01813083          	ld	ra,24(sp)
    80005314:	01013403          	ld	s0,16(sp)
    80005318:	00813483          	ld	s1,8(sp)
    8000531c:	00013903          	ld	s2,0(sp)
    80005320:	02010113          	addi	sp,sp,32
    80005324:	00008067          	ret

0000000080005328 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    80005328:	fe010113          	addi	sp,sp,-32
    8000532c:	00113c23          	sd	ra,24(sp)
    80005330:	00813823          	sd	s0,16(sp)
    80005334:	00913423          	sd	s1,8(sp)
    80005338:	02010413          	addi	s0,sp,32
    8000533c:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80005340:	0004b783          	ld	a5,0(s1)
    80005344:	02078c63          	beqz	a5,8000537c <_ZN4_sem5closeEPS_+0x54>
        id->blockHead->pThread->setClosed(true);
    80005348:	00100593          	li	a1,1
    8000534c:	0007b503          	ld	a0,0(a5)
    80005350:	ffffd097          	auipc	ra,0xffffd
    80005354:	468080e7          	jalr	1128(ra) # 800027b8 <_ZN7_thread9setClosedEb>
        HeapManager::getInstance().heapFree(id->blockHead);
    80005358:	0004b583          	ld	a1,0(s1)
    8000535c:	0000a517          	auipc	a0,0xa
    80005360:	eac53503          	ld	a0,-340(a0) # 8000f208 <_ZN11HeapManager8instanceE>
    80005364:	fffff097          	auipc	ra,0xfffff
    80005368:	a04080e7          	jalr	-1532(ra) # 80003d68 <_ZN11HeapManager8heapFreeEPv>
        id->blockHead = id->blockHead->pNext;
    8000536c:	0004b783          	ld	a5,0(s1)
    80005370:	0087b783          	ld	a5,8(a5)
    80005374:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80005378:	fc9ff06f          	j	80005340 <_ZN4_sem5closeEPS_+0x18>
    }
}
    8000537c:	01813083          	ld	ra,24(sp)
    80005380:	01013403          	ld	s0,16(sp)
    80005384:	00813483          	ld	s1,8(sp)
    80005388:	02010113          	addi	sp,sp,32
    8000538c:	00008067          	ret

0000000080005390 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    if(id->value-- <= 0){
    80005390:	01052783          	lw	a5,16(a0)
    80005394:	fff7871b          	addiw	a4,a5,-1
    80005398:	00e52823          	sw	a4,16(a0)
    8000539c:	00f05463          	blez	a5,800053a4 <_ZN4_sem4waitEPS_+0x14>
    800053a0:	00008067          	ret
void _sem::wait(sem_t id){
    800053a4:	fe010113          	addi	sp,sp,-32
    800053a8:	00113c23          	sd	ra,24(sp)
    800053ac:	00813823          	sd	s0,16(sp)
    800053b0:	00913423          	sd	s1,8(sp)
    800053b4:	02010413          	addi	s0,sp,32
    800053b8:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    800053bc:	01000513          	li	a0,16
    800053c0:	00000097          	auipc	ra,0x0
    800053c4:	c40080e7          	jalr	-960(ra) # 80005000 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    800053c8:	0000a797          	auipc	a5,0xa
    800053cc:	e307b783          	ld	a5,-464(a5) # 8000f1f8 <_ZN7_thread13currentThreadE>
    800053d0:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    800053d4:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    800053d8:	0004b783          	ld	a5,0(s1)
    800053dc:	04078063          	beqz	a5,8000541c <_ZN4_sem4waitEPS_+0x8c>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    800053e0:	0084b783          	ld	a5,8(s1)
    800053e4:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    800053e8:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    800053ec:	00100593          	li	a1,1
    800053f0:	0000a517          	auipc	a0,0xa
    800053f4:	e0853503          	ld	a0,-504(a0) # 8000f1f8 <_ZN7_thread13currentThreadE>
    800053f8:	ffffd097          	auipc	ra,0xffffd
    800053fc:	390080e7          	jalr	912(ra) # 80002788 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    80005400:	ffffd097          	auipc	ra,0xffffd
    80005404:	414080e7          	jalr	1044(ra) # 80002814 <_ZN7_thread8dispatchEv>
    }
}
    80005408:	01813083          	ld	ra,24(sp)
    8000540c:	01013403          	ld	s0,16(sp)
    80005410:	00813483          	ld	s1,8(sp)
    80005414:	02010113          	addi	sp,sp,32
    80005418:	00008067          	ret
            id->blockHead = pNewBlock;
    8000541c:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80005420:	00a4b423          	sd	a0,8(s1)
    80005424:	fc9ff06f          	j	800053ec <_ZN4_sem4waitEPS_+0x5c>

0000000080005428 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    if(id->value++ < 0){
    80005428:	01052783          	lw	a5,16(a0)
    8000542c:	0017871b          	addiw	a4,a5,1
    80005430:	00e52823          	sw	a4,16(a0)
    80005434:	0007c463          	bltz	a5,8000543c <_ZN4_sem6signalEPS_+0x14>
    80005438:	00008067          	ret
void _sem::signal(sem_t id){
    8000543c:	fe010113          	addi	sp,sp,-32
    80005440:	00113c23          	sd	ra,24(sp)
    80005444:	00813823          	sd	s0,16(sp)
    80005448:	00913423          	sd	s1,8(sp)
    8000544c:	02010413          	addi	s0,sp,32
        
        blockedThreadList* pUnblock = id->blockHead;
    80005450:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80005454:	0084b783          	ld	a5,8(s1)
    80005458:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    8000545c:	04078063          	beqz	a5,8000549c <_ZN4_sem6signalEPS_+0x74>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    80005460:	00000593          	li	a1,0
    80005464:	0004b503          	ld	a0,0(s1)
    80005468:	ffffd097          	auipc	ra,0xffffd
    8000546c:	320080e7          	jalr	800(ra) # 80002788 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    80005470:	00048513          	mv	a0,s1
    80005474:	00000097          	auipc	ra,0x0
    80005478:	bbc080e7          	jalr	-1092(ra) # 80005030 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    8000547c:	0004b503          	ld	a0,0(s1)
    80005480:	00000097          	auipc	ra,0x0
    80005484:	100080e7          	jalr	256(ra) # 80005580 <_ZN9Scheduler3putEP7_thread>
    }
}
    80005488:	01813083          	ld	ra,24(sp)
    8000548c:	01013403          	ld	s0,16(sp)
    80005490:	00813483          	ld	s1,8(sp)
    80005494:	02010113          	addi	sp,sp,32
    80005498:	00008067          	ret
            id->blockTail = 0;
    8000549c:	00053423          	sd	zero,8(a0)
    800054a0:	fc1ff06f          	j	80005460 <_ZN4_sem6signalEPS_+0x38>

00000000800054a4 <_ZN4_sem7trywaitEPS_>:

int _sem::trywait(sem_t id){
    800054a4:	ff010113          	addi	sp,sp,-16
    800054a8:	00813423          	sd	s0,8(sp)
    800054ac:	01010413          	addi	s0,sp,16
    if(id->value <= 0){
    800054b0:	01052783          	lw	a5,16(a0)
    800054b4:	00f05e63          	blez	a5,800054d0 <_ZN4_sem7trywaitEPS_+0x2c>
        return 0;
    }else{
        id->value--;
    800054b8:	fff7879b          	addiw	a5,a5,-1
    800054bc:	00f52823          	sw	a5,16(a0)
        return 1;
    800054c0:	00100513          	li	a0,1
    }
    800054c4:	00813403          	ld	s0,8(sp)
    800054c8:	01010113          	addi	sp,sp,16
    800054cc:	00008067          	ret
        return 0;
    800054d0:	00000513          	li	a0,0
    800054d4:	ff1ff06f          	j	800054c4 <_ZN4_sem7trywaitEPS_+0x20>

00000000800054d8 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    800054d8:	fe010113          	addi	sp,sp,-32
    800054dc:	00113c23          	sd	ra,24(sp)
    800054e0:	00813823          	sd	s0,16(sp)
    800054e4:	00913423          	sd	s1,8(sp)
    800054e8:	02010413          	addi	s0,sp,32
    800054ec:	00050493          	mv	s1,a0
    assert(singleton == 0);
    800054f0:	0000a797          	auipc	a5,0xa
    800054f4:	d287b783          	ld	a5,-728(a5) # 8000f218 <_ZN9Scheduler9singletonE>
    800054f8:	02079463          	bnez	a5,80005520 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    800054fc:	0000a797          	auipc	a5,0xa
    80005500:	d097be23          	sd	s1,-740(a5) # 8000f218 <_ZN9Scheduler9singletonE>
    head = 0;
    80005504:	1004a023          	sw	zero,256(s1)
    tail = 0;
    80005508:	1004a223          	sw	zero,260(s1)
}
    8000550c:	01813083          	ld	ra,24(sp)
    80005510:	01013403          	ld	s0,16(sp)
    80005514:	00813483          	ld	s1,8(sp)
    80005518:	02010113          	addi	sp,sp,32
    8000551c:	00008067          	ret
    assert(singleton == 0);
    80005520:	00007697          	auipc	a3,0x7
    80005524:	fd068693          	addi	a3,a3,-48 # 8000c4f0 <_ZTV9Semaphore+0x4a8>
    80005528:	01b00613          	li	a2,27
    8000552c:	00007597          	auipc	a1,0x7
    80005530:	fdc58593          	addi	a1,a1,-36 # 8000c508 <_ZTV9Semaphore+0x4c0>
    80005534:	00007517          	auipc	a0,0x7
    80005538:	fe450513          	addi	a0,a0,-28 # 8000c518 <_ZTV9Semaphore+0x4d0>
    8000553c:	00000097          	auipc	ra,0x0
    80005540:	174080e7          	jalr	372(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
    80005544:	fb9ff06f          	j	800054fc <_ZN9SchedulerC1Ev+0x24>

0000000080005548 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80005548:	ff010113          	addi	sp,sp,-16
    8000554c:	00813423          	sd	s0,8(sp)
    80005550:	01010413          	addi	s0,sp,16
    if(singleton->head == singleton->tail){
    80005554:	0000a797          	auipc	a5,0xa
    80005558:	cc47b783          	ld	a5,-828(a5) # 8000f218 <_ZN9Scheduler9singletonE>
    8000555c:	1007a703          	lw	a4,256(a5)
    80005560:	1047a783          	lw	a5,260(a5)
    80005564:	00f70a63          	beq	a4,a5,80005578 <_ZN9Scheduler7isEmptyEv+0x30>
        return true;
    }
    return false;
    80005568:	00000513          	li	a0,0
}
    8000556c:	00813403          	ld	s0,8(sp)
    80005570:	01010113          	addi	sp,sp,16
    80005574:	00008067          	ret
        return true;
    80005578:	00100513          	li	a0,1
    8000557c:	ff1ff06f          	j	8000556c <_ZN9Scheduler7isEmptyEv+0x24>

0000000080005580 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    Scheduler* scheduler = singleton;
    80005580:	0000a717          	auipc	a4,0xa
    80005584:	c9873703          	ld	a4,-872(a4) # 8000f218 <_ZN9Scheduler9singletonE>
    scheduler->threads[scheduler->tail] = thread;
    80005588:	10472783          	lw	a5,260(a4)
    8000558c:	00379693          	slli	a3,a5,0x3
    80005590:	00d706b3          	add	a3,a4,a3
    80005594:	00a6b023          	sd	a0,0(a3)
    scheduler->tail = (scheduler->tail + 1) % SCHED_MAX_THREADS;
    80005598:	0017879b          	addiw	a5,a5,1
    8000559c:	41f7d69b          	sraiw	a3,a5,0x1f
    800055a0:	01b6d69b          	srliw	a3,a3,0x1b
    800055a4:	00d787bb          	addw	a5,a5,a3
    800055a8:	01f7f793          	andi	a5,a5,31
    800055ac:	40d787bb          	subw	a5,a5,a3
    800055b0:	0007869b          	sext.w	a3,a5
    800055b4:	10f72223          	sw	a5,260(a4)
    assert(scheduler->tail != scheduler->head);
    800055b8:	10072783          	lw	a5,256(a4)
    800055bc:	00f68463          	beq	a3,a5,800055c4 <_ZN9Scheduler3putEP7_thread+0x44>
    800055c0:	00008067          	ret
void Scheduler::put(thread_t thread){
    800055c4:	ff010113          	addi	sp,sp,-16
    800055c8:	00113423          	sd	ra,8(sp)
    800055cc:	00813023          	sd	s0,0(sp)
    800055d0:	01010413          	addi	s0,sp,16
    assert(scheduler->tail != scheduler->head);
    800055d4:	00007697          	auipc	a3,0x7
    800055d8:	f5468693          	addi	a3,a3,-172 # 8000c528 <_ZTV9Semaphore+0x4e0>
    800055dc:	02c00613          	li	a2,44
    800055e0:	00007597          	auipc	a1,0x7
    800055e4:	f2858593          	addi	a1,a1,-216 # 8000c508 <_ZTV9Semaphore+0x4c0>
    800055e8:	00007517          	auipc	a0,0x7
    800055ec:	f6850513          	addi	a0,a0,-152 # 8000c550 <_ZTV9Semaphore+0x508>
    800055f0:	00000097          	auipc	ra,0x0
    800055f4:	0c0080e7          	jalr	192(ra) # 800056b0 <_Z13assert_failedPKcS0_jS0_>
}
    800055f8:	00813083          	ld	ra,8(sp)
    800055fc:	00013403          	ld	s0,0(sp)
    80005600:	01010113          	addi	sp,sp,16
    80005604:	00008067          	ret

0000000080005608 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80005608:	ff010113          	addi	sp,sp,-16
    8000560c:	00113423          	sd	ra,8(sp)
    80005610:	00813023          	sd	s0,0(sp)
    80005614:	01010413          	addi	s0,sp,16
    if(isEmpty()){
    80005618:	00000097          	auipc	ra,0x0
    8000561c:	f30080e7          	jalr	-208(ra) # 80005548 <_ZN9Scheduler7isEmptyEv>
    80005620:	04051463          	bnez	a0,80005668 <_ZN9Scheduler3getEv+0x60>
        return 0;
    }
    Scheduler* scheduler = singleton;
    80005624:	0000a697          	auipc	a3,0xa
    80005628:	bf46b683          	ld	a3,-1036(a3) # 8000f218 <_ZN9Scheduler9singletonE>
    thread_t thread = scheduler->threads[scheduler->head];
    8000562c:	1006a783          	lw	a5,256(a3)
    80005630:	00379713          	slli	a4,a5,0x3
    80005634:	00e68733          	add	a4,a3,a4
    80005638:	00073503          	ld	a0,0(a4)
    scheduler->head = (scheduler->head + 1) % SCHED_MAX_THREADS;
    8000563c:	0017879b          	addiw	a5,a5,1
    80005640:	41f7d71b          	sraiw	a4,a5,0x1f
    80005644:	01b7571b          	srliw	a4,a4,0x1b
    80005648:	00e787bb          	addw	a5,a5,a4
    8000564c:	01f7f793          	andi	a5,a5,31
    80005650:	40e787bb          	subw	a5,a5,a4
    80005654:	10f6a023          	sw	a5,256(a3)
    return thread;
}
    80005658:	00813083          	ld	ra,8(sp)
    8000565c:	00013403          	ld	s0,0(sp)
    80005660:	01010113          	addi	sp,sp,16
    80005664:	00008067          	ret
        return 0;
    80005668:	00000513          	li	a0,0
    8000566c:	fedff06f          	j	80005658 <_ZN9Scheduler3getEv+0x50>

0000000080005670 <_ZN9Scheduler8getCountEv>:

int Scheduler::getCount(){
    80005670:	ff010113          	addi	sp,sp,-16
    80005674:	00813423          	sd	s0,8(sp)
    80005678:	01010413          	addi	s0,sp,16
    int count = 0;
    if(singleton->head <= singleton->tail){
    8000567c:	0000a717          	auipc	a4,0xa
    80005680:	b9c73703          	ld	a4,-1124(a4) # 8000f218 <_ZN9Scheduler9singletonE>
    80005684:	10072783          	lw	a5,256(a4)
    80005688:	10472503          	lw	a0,260(a4)
    8000568c:	00f54a63          	blt	a0,a5,800056a0 <_ZN9Scheduler8getCountEv+0x30>
        count = singleton->tail - singleton->head;
    80005690:	40f5053b          	subw	a0,a0,a5
    }else{
        count = SCHED_MAX_THREADS - singleton->head + singleton->tail;
    }
    return count;
    80005694:	00813403          	ld	s0,8(sp)
    80005698:	01010113          	addi	sp,sp,16
    8000569c:	00008067          	ret
        count = SCHED_MAX_THREADS - singleton->head + singleton->tail;
    800056a0:	02000713          	li	a4,32
    800056a4:	40f707bb          	subw	a5,a4,a5
    800056a8:	00a7853b          	addw	a0,a5,a0
    800056ac:	fe9ff06f          	j	80005694 <_ZN9Scheduler8getCountEv+0x24>

00000000800056b0 <_Z13assert_failedPKcS0_jS0_>:
 */
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    800056b0:	fb010113          	addi	sp,sp,-80
    800056b4:	04113423          	sd	ra,72(sp)
    800056b8:	04813023          	sd	s0,64(sp)
    800056bc:	02913c23          	sd	s1,56(sp)
    800056c0:	03213823          	sd	s2,48(sp)
    800056c4:	03313423          	sd	s3,40(sp)
    800056c8:	03413023          	sd	s4,32(sp)
    800056cc:	05010413          	addi	s0,sp,80
    800056d0:	00050993          	mv	s3,a0
    800056d4:	00058493          	mv	s1,a1
    800056d8:	00060913          	mv	s2,a2
    800056dc:	00068a13          	mv	s4,a3
    putc('\n');
    800056e0:	00a00513          	li	a0,10
    800056e4:	00000097          	auipc	ra,0x0
    800056e8:	bc4080e7          	jalr	-1084(ra) # 800052a8 <_Z4putcc>
    putc('A');
    800056ec:	04100513          	li	a0,65
    800056f0:	00000097          	auipc	ra,0x0
    800056f4:	bb8080e7          	jalr	-1096(ra) # 800052a8 <_Z4putcc>
    putc('s');
    800056f8:	07300513          	li	a0,115
    800056fc:	00000097          	auipc	ra,0x0
    80005700:	bac080e7          	jalr	-1108(ra) # 800052a8 <_Z4putcc>
    putc('s');
    80005704:	07300513          	li	a0,115
    80005708:	00000097          	auipc	ra,0x0
    8000570c:	ba0080e7          	jalr	-1120(ra) # 800052a8 <_Z4putcc>
    putc('e');
    80005710:	06500513          	li	a0,101
    80005714:	00000097          	auipc	ra,0x0
    80005718:	b94080e7          	jalr	-1132(ra) # 800052a8 <_Z4putcc>
    putc('r');
    8000571c:	07200513          	li	a0,114
    80005720:	00000097          	auipc	ra,0x0
    80005724:	b88080e7          	jalr	-1144(ra) # 800052a8 <_Z4putcc>
    putc('t');
    80005728:	07400513          	li	a0,116
    8000572c:	00000097          	auipc	ra,0x0
    80005730:	b7c080e7          	jalr	-1156(ra) # 800052a8 <_Z4putcc>
    putc('i');
    80005734:	06900513          	li	a0,105
    80005738:	00000097          	auipc	ra,0x0
    8000573c:	b70080e7          	jalr	-1168(ra) # 800052a8 <_Z4putcc>
    putc('o');
    80005740:	06f00513          	li	a0,111
    80005744:	00000097          	auipc	ra,0x0
    80005748:	b64080e7          	jalr	-1180(ra) # 800052a8 <_Z4putcc>
    putc('n');
    8000574c:	06e00513          	li	a0,110
    80005750:	00000097          	auipc	ra,0x0
    80005754:	b58080e7          	jalr	-1192(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80005758:	02000513          	li	a0,32
    8000575c:	00000097          	auipc	ra,0x0
    80005760:	b4c080e7          	jalr	-1204(ra) # 800052a8 <_Z4putcc>
    putc('\'');
    80005764:	02700513          	li	a0,39
    80005768:	00000097          	auipc	ra,0x0
    8000576c:	b40080e7          	jalr	-1216(ra) # 800052a8 <_Z4putcc>
    while(*__assertion != 0){
    80005770:	0009c503          	lbu	a0,0(s3)
    80005774:	00050a63          	beqz	a0,80005788 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80005778:	00000097          	auipc	ra,0x0
    8000577c:	b30080e7          	jalr	-1232(ra) # 800052a8 <_Z4putcc>
        __assertion++;
    80005780:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80005784:	fedff06f          	j	80005770 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80005788:	02700513          	li	a0,39
    8000578c:	00000097          	auipc	ra,0x0
    80005790:	b1c080e7          	jalr	-1252(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80005794:	02000513          	li	a0,32
    80005798:	00000097          	auipc	ra,0x0
    8000579c:	b10080e7          	jalr	-1264(ra) # 800052a8 <_Z4putcc>
    putc('f');
    800057a0:	06600513          	li	a0,102
    800057a4:	00000097          	auipc	ra,0x0
    800057a8:	b04080e7          	jalr	-1276(ra) # 800052a8 <_Z4putcc>
    putc('a');
    800057ac:	06100513          	li	a0,97
    800057b0:	00000097          	auipc	ra,0x0
    800057b4:	af8080e7          	jalr	-1288(ra) # 800052a8 <_Z4putcc>
    putc('i');
    800057b8:	06900513          	li	a0,105
    800057bc:	00000097          	auipc	ra,0x0
    800057c0:	aec080e7          	jalr	-1300(ra) # 800052a8 <_Z4putcc>
    putc('l');
    800057c4:	06c00513          	li	a0,108
    800057c8:	00000097          	auipc	ra,0x0
    800057cc:	ae0080e7          	jalr	-1312(ra) # 800052a8 <_Z4putcc>
    putc('e');
    800057d0:	06500513          	li	a0,101
    800057d4:	00000097          	auipc	ra,0x0
    800057d8:	ad4080e7          	jalr	-1324(ra) # 800052a8 <_Z4putcc>
    putc('d');
    800057dc:	06400513          	li	a0,100
    800057e0:	00000097          	auipc	ra,0x0
    800057e4:	ac8080e7          	jalr	-1336(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    800057e8:	02000513          	li	a0,32
    800057ec:	00000097          	auipc	ra,0x0
    800057f0:	abc080e7          	jalr	-1348(ra) # 800052a8 <_Z4putcc>
    putc('i');
    800057f4:	06900513          	li	a0,105
    800057f8:	00000097          	auipc	ra,0x0
    800057fc:	ab0080e7          	jalr	-1360(ra) # 800052a8 <_Z4putcc>
    putc('n');
    80005800:	06e00513          	li	a0,110
    80005804:	00000097          	auipc	ra,0x0
    80005808:	aa4080e7          	jalr	-1372(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    8000580c:	02000513          	li	a0,32
    80005810:	00000097          	auipc	ra,0x0
    80005814:	a98080e7          	jalr	-1384(ra) # 800052a8 <_Z4putcc>
    putc('f');
    80005818:	06600513          	li	a0,102
    8000581c:	00000097          	auipc	ra,0x0
    80005820:	a8c080e7          	jalr	-1396(ra) # 800052a8 <_Z4putcc>
    putc('i');
    80005824:	06900513          	li	a0,105
    80005828:	00000097          	auipc	ra,0x0
    8000582c:	a80080e7          	jalr	-1408(ra) # 800052a8 <_Z4putcc>
    putc('l');
    80005830:	06c00513          	li	a0,108
    80005834:	00000097          	auipc	ra,0x0
    80005838:	a74080e7          	jalr	-1420(ra) # 800052a8 <_Z4putcc>
    putc('e');
    8000583c:	06500513          	li	a0,101
    80005840:	00000097          	auipc	ra,0x0
    80005844:	a68080e7          	jalr	-1432(ra) # 800052a8 <_Z4putcc>
    putc(':');
    80005848:	03a00513          	li	a0,58
    8000584c:	00000097          	auipc	ra,0x0
    80005850:	a5c080e7          	jalr	-1444(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80005854:	02000513          	li	a0,32
    80005858:	00000097          	auipc	ra,0x0
    8000585c:	a50080e7          	jalr	-1456(ra) # 800052a8 <_Z4putcc>
    while(*__file != 0){
    80005860:	0004c503          	lbu	a0,0(s1)
    80005864:	00050a63          	beqz	a0,80005878 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80005868:	00000097          	auipc	ra,0x0
    8000586c:	a40080e7          	jalr	-1472(ra) # 800052a8 <_Z4putcc>
        __file++;
    80005870:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80005874:	fedff06f          	j	80005860 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80005878:	00a00513          	li	a0,10
    8000587c:	00000097          	auipc	ra,0x0
    80005880:	a2c080e7          	jalr	-1492(ra) # 800052a8 <_Z4putcc>
    putc('l');
    80005884:	06c00513          	li	a0,108
    80005888:	00000097          	auipc	ra,0x0
    8000588c:	a20080e7          	jalr	-1504(ra) # 800052a8 <_Z4putcc>
    putc('i');
    80005890:	06900513          	li	a0,105
    80005894:	00000097          	auipc	ra,0x0
    80005898:	a14080e7          	jalr	-1516(ra) # 800052a8 <_Z4putcc>
    putc('n');
    8000589c:	06e00513          	li	a0,110
    800058a0:	00000097          	auipc	ra,0x0
    800058a4:	a08080e7          	jalr	-1528(ra) # 800052a8 <_Z4putcc>
    putc('e');
    800058a8:	06500513          	li	a0,101
    800058ac:	00000097          	auipc	ra,0x0
    800058b0:	9fc080e7          	jalr	-1540(ra) # 800052a8 <_Z4putcc>
    putc(':');
    800058b4:	03a00513          	li	a0,58
    800058b8:	00000097          	auipc	ra,0x0
    800058bc:	9f0080e7          	jalr	-1552(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    800058c0:	02000513          	li	a0,32
    800058c4:	00000097          	auipc	ra,0x0
    800058c8:	9e4080e7          	jalr	-1564(ra) # 800052a8 <_Z4putcc>
    char buffer[20];
    int i = 0;
    800058cc:	00000493          	li	s1,0
    while(__line != 0){
    800058d0:	02090463          	beqz	s2,800058f8 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    800058d4:	00a00713          	li	a4,10
    800058d8:	02e977bb          	remuw	a5,s2,a4
    800058dc:	0307879b          	addiw	a5,a5,48
    800058e0:	fd040693          	addi	a3,s0,-48
    800058e4:	009686b3          	add	a3,a3,s1
    800058e8:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    800058ec:	02e9593b          	divuw	s2,s2,a4
        i++;
    800058f0:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    800058f4:	fddff06f          	j	800058d0 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    800058f8:	02048063          	beqz	s1,80005918 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    800058fc:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80005900:	fd040793          	addi	a5,s0,-48
    80005904:	009787b3          	add	a5,a5,s1
    80005908:	fe87c503          	lbu	a0,-24(a5)
    8000590c:	00000097          	auipc	ra,0x0
    80005910:	99c080e7          	jalr	-1636(ra) # 800052a8 <_Z4putcc>
    80005914:	fe5ff06f          	j	800058f8 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80005918:	00a00513          	li	a0,10
    8000591c:	00000097          	auipc	ra,0x0
    80005920:	98c080e7          	jalr	-1652(ra) # 800052a8 <_Z4putcc>
    putc('f');
    80005924:	06600513          	li	a0,102
    80005928:	00000097          	auipc	ra,0x0
    8000592c:	980080e7          	jalr	-1664(ra) # 800052a8 <_Z4putcc>
    putc('u');
    80005930:	07500513          	li	a0,117
    80005934:	00000097          	auipc	ra,0x0
    80005938:	974080e7          	jalr	-1676(ra) # 800052a8 <_Z4putcc>
    putc('n');
    8000593c:	06e00513          	li	a0,110
    80005940:	00000097          	auipc	ra,0x0
    80005944:	968080e7          	jalr	-1688(ra) # 800052a8 <_Z4putcc>
    putc('c');
    80005948:	06300513          	li	a0,99
    8000594c:	00000097          	auipc	ra,0x0
    80005950:	95c080e7          	jalr	-1700(ra) # 800052a8 <_Z4putcc>
    putc('t');
    80005954:	07400513          	li	a0,116
    80005958:	00000097          	auipc	ra,0x0
    8000595c:	950080e7          	jalr	-1712(ra) # 800052a8 <_Z4putcc>
    putc('i');
    80005960:	06900513          	li	a0,105
    80005964:	00000097          	auipc	ra,0x0
    80005968:	944080e7          	jalr	-1724(ra) # 800052a8 <_Z4putcc>
    putc('o');
    8000596c:	06f00513          	li	a0,111
    80005970:	00000097          	auipc	ra,0x0
    80005974:	938080e7          	jalr	-1736(ra) # 800052a8 <_Z4putcc>
    putc('n');
    80005978:	06e00513          	li	a0,110
    8000597c:	00000097          	auipc	ra,0x0
    80005980:	92c080e7          	jalr	-1748(ra) # 800052a8 <_Z4putcc>
    putc(':');
    80005984:	03a00513          	li	a0,58
    80005988:	00000097          	auipc	ra,0x0
    8000598c:	920080e7          	jalr	-1760(ra) # 800052a8 <_Z4putcc>
    putc(' ');
    80005990:	02000513          	li	a0,32
    80005994:	00000097          	auipc	ra,0x0
    80005998:	914080e7          	jalr	-1772(ra) # 800052a8 <_Z4putcc>
    putc('\'');
    8000599c:	02700513          	li	a0,39
    800059a0:	00000097          	auipc	ra,0x0
    800059a4:	908080e7          	jalr	-1784(ra) # 800052a8 <_Z4putcc>
    while(*__function != 0){
    800059a8:	000a4503          	lbu	a0,0(s4)
    800059ac:	00050a63          	beqz	a0,800059c0 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    800059b0:	00000097          	auipc	ra,0x0
    800059b4:	8f8080e7          	jalr	-1800(ra) # 800052a8 <_Z4putcc>
        __function ++;
    800059b8:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    800059bc:	fedff06f          	j	800059a8 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    800059c0:	02700513          	li	a0,39
    800059c4:	00000097          	auipc	ra,0x0
    800059c8:	8e4080e7          	jalr	-1820(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    800059cc:	00a00513          	li	a0,10
    800059d0:	00000097          	auipc	ra,0x0
    800059d4:	8d8080e7          	jalr	-1832(ra) # 800052a8 <_Z4putcc>
    while(1);
    800059d8:	0000006f          	j	800059d8 <_Z13assert_failedPKcS0_jS0_+0x328>

00000000800059dc <_Z4testPv>:
    console.getInstance().init();

    return;
}

void test(void* arg){
    800059dc:	fe010113          	addi	sp,sp,-32
    800059e0:	00113c23          	sd	ra,24(sp)
    800059e4:	00813823          	sd	s0,16(sp)
    800059e8:	00913423          	sd	s1,8(sp)
    800059ec:	02010413          	addi	s0,sp,32
    800059f0:	00050493          	mv	s1,a0
    usermain(arg);       /// This is my c api test
    800059f4:	ffffd097          	auipc	ra,0xffffd
    800059f8:	800080e7          	jalr	-2048(ra) # 800021f4 <_Z8usermainPv>
    usermainCPP(arg);    /// This is my c++ api test 
    800059fc:	00048513          	mv	a0,s1
    80005a00:	ffffc097          	auipc	ra,0xffffc
    80005a04:	038080e7          	jalr	56(ra) # 80001a38 <_Z11usermainCPPPv>
    for(int i = 0; i < 7; i++){
    80005a08:	00000493          	li	s1,0
    80005a0c:	0100006f          	j	80005a1c <_Z4testPv+0x40>
        userMain();             /// This is the public test
    80005a10:	00001097          	auipc	ra,0x1
    80005a14:	3f4080e7          	jalr	1012(ra) # 80006e04 <_Z8userMainv>
    for(int i = 0; i < 7; i++){
    80005a18:	0014849b          	addiw	s1,s1,1
    80005a1c:	00600793          	li	a5,6
    80005a20:	fe97d8e3          	bge	a5,s1,80005a10 <_Z4testPv+0x34>
    }
}
    80005a24:	01813083          	ld	ra,24(sp)
    80005a28:	01013403          	ld	s0,16(sp)
    80005a2c:	00813483          	ld	s1,8(sp)
    80005a30:	02010113          	addi	sp,sp,32
    80005a34:	00008067          	ret

0000000080005a38 <_Z15consoleConsumerPv>:


void consoleConsumer(void* arg){
    80005a38:	ff010113          	addi	sp,sp,-16
    80005a3c:	00113423          	sd	ra,8(sp)
    80005a40:	00813023          	sd	s0,0(sp)
    80005a44:	01010413          	addi	s0,sp,16
    ConsoleManager::outputHandler();
    80005a48:	ffffe097          	auipc	ra,0xffffe
    80005a4c:	850080e7          	jalr	-1968(ra) # 80003298 <_ZN14ConsoleManager13outputHandlerEv>
}
    80005a50:	00813083          	ld	ra,8(sp)
    80005a54:	00013403          	ld	s0,0(sp)
    80005a58:	01010113          	addi	sp,sp,16
    80005a5c:	00008067          	ret

0000000080005a60 <_ZN6KernelC1Ev>:
Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80005a60:	fd010113          	addi	sp,sp,-48
    80005a64:	02113423          	sd	ra,40(sp)
    80005a68:	02813023          	sd	s0,32(sp)
    80005a6c:	00913c23          	sd	s1,24(sp)
    80005a70:	01213823          	sd	s2,16(sp)
    80005a74:	01313423          	sd	s3,8(sp)
    80005a78:	03010413          	addi	s0,sp,48
    80005a7c:	00050493          	mv	s1,a0
    80005a80:	ffffe097          	auipc	ra,0xffffe
    80005a84:	8ec080e7          	jalr	-1812(ra) # 8000336c <_ZN11HeapManagerC1Ev>
    80005a88:	00848513          	addi	a0,s1,8
    80005a8c:	00000097          	auipc	ra,0x0
    80005a90:	a4c080e7          	jalr	-1460(ra) # 800054d8 <_ZN9SchedulerC1Ev>
    80005a94:	11048913          	addi	s2,s1,272
    80005a98:	00090513          	mv	a0,s2
    80005a9c:	fffff097          	auipc	ra,0xfffff
    80005aa0:	2bc080e7          	jalr	700(ra) # 80004d58 <_ZN5TimerC1Ev>
    80005aa4:	12048513          	addi	a0,s1,288
    80005aa8:	ffffd097          	auipc	ra,0xffffd
    80005aac:	4ac080e7          	jalr	1196(ra) # 80002f54 <_ZN14ConsoleManagerC1Ev>
    80005ab0:	0380006f          	j	80005ae8 <_ZN6KernelC1Ev+0x88>
    80005ab4:	00050993          	mv	s3,a0
    80005ab8:	00090513          	mv	a0,s2
    80005abc:	fffff097          	auipc	ra,0xfffff
    80005ac0:	30c080e7          	jalr	780(ra) # 80004dc8 <_ZN5TimerD1Ev>
    80005ac4:	00098913          	mv	s2,s3
    80005ac8:	00048513          	mv	a0,s1
    80005acc:	ffffe097          	auipc	ra,0xffffe
    80005ad0:	908080e7          	jalr	-1784(ra) # 800033d4 <_ZN11HeapManagerD1Ev>
    80005ad4:	00090513          	mv	a0,s2
    80005ad8:	0000b097          	auipc	ra,0xb
    80005adc:	890080e7          	jalr	-1904(ra) # 80010368 <_Unwind_Resume>
    80005ae0:	00050913          	mv	s2,a0
    80005ae4:	fe5ff06f          	j	80005ac8 <_ZN6KernelC1Ev+0x68>
    80005ae8:	02813083          	ld	ra,40(sp)
    80005aec:	02013403          	ld	s0,32(sp)
    80005af0:	01813483          	ld	s1,24(sp)
    80005af4:	01013903          	ld	s2,16(sp)
    80005af8:	00813983          	ld	s3,8(sp)
    80005afc:	03010113          	addi	sp,sp,48
    80005b00:	00008067          	ret

0000000080005b04 <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    80005b04:	ff010113          	addi	sp,sp,-16
    80005b08:	00113423          	sd	ra,8(sp)
    80005b0c:	00813023          	sd	s0,0(sp)
    80005b10:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"((uint64)trap));
    80005b14:	ffffb797          	auipc	a5,0xffffb
    80005b18:	4ec78793          	addi	a5,a5,1260 # 80001000 <trap>
    80005b1c:	10579073          	csrw	stvec,a5
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    80005b20:	00009617          	auipc	a2,0x9
    80005b24:	64863603          	ld	a2,1608(a2) # 8000f168 <HEAP_END_ADDR>
    80005b28:	00009597          	auipc	a1,0x9
    80005b2c:	6485b583          	ld	a1,1608(a1) # 8000f170 <HEAP_START_ADDR>
    80005b30:	ffffe097          	auipc	ra,0xffffe
    80005b34:	8bc080e7          	jalr	-1860(ra) # 800033ec <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    80005b38:	ffffd097          	auipc	ra,0xffffd
    80005b3c:	38c080e7          	jalr	908(ra) # 80002ec4 <_ZN14ConsoleManager11getInstanceEv>
    80005b40:	ffffd097          	auipc	ra,0xffffd
    80005b44:	540080e7          	jalr	1344(ra) # 80003080 <_ZN14ConsoleManager4initEv>
}
    80005b48:	00813083          	ld	ra,8(sp)
    80005b4c:	00013403          	ld	s0,0(sp)
    80005b50:	01010113          	addi	sp,sp,16
    80005b54:	00008067          	ret

0000000080005b58 <_Z16switchToUserModev>:

void switchToUserMode() __attribute__((naked));
void switchToUserMode(){
    __asm__ volatile ("csrc sstatus, %0" :: "r"(1<<8));
    80005b58:	10000793          	li	a5,256
    80005b5c:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("csrw sepc, ra");
    80005b60:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80005b64:	10200073          	sret

0000000080005b68 <_ZN6Kernel3runEv>:
}

Kernel::EXIT_CODE Kernel::run(){
    80005b68:	fd010113          	addi	sp,sp,-48
    80005b6c:	02113423          	sd	ra,40(sp)
    80005b70:	02813023          	sd	s0,32(sp)
    80005b74:	03010413          	addi	s0,sp,48

    thread_t kernelThread;
    
    thread_create(&kernelThread, 0, 0);
    80005b78:	00000613          	li	a2,0
    80005b7c:	00000593          	li	a1,0
    80005b80:	fe840513          	addi	a0,s0,-24
    80005b84:	fffff097          	auipc	ra,0xfffff
    80005b88:	4d8080e7          	jalr	1240(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80005b8c:	00000097          	auipc	ra,0x0
    80005b90:	a7c080e7          	jalr	-1412(ra) # 80005608 <_ZN9Scheduler3getEv>
    80005b94:	00009797          	auipc	a5,0x9
    80005b98:	66a7b223          	sd	a0,1636(a5) # 8000f1f8 <_ZN7_thread13currentThreadE>

    thread_t consoleThread;
    thread_create(&consoleThread, consoleConsumer, 0);
    80005b9c:	00000613          	li	a2,0
    80005ba0:	00000597          	auipc	a1,0x0
    80005ba4:	e9858593          	addi	a1,a1,-360 # 80005a38 <_Z15consoleConsumerPv>
    80005ba8:	fe040513          	addi	a0,s0,-32
    80005bac:	fffff097          	auipc	ra,0xfffff
    80005bb0:	4b0080e7          	jalr	1200(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>

    switchToUserMode();
    80005bb4:	00000097          	auipc	ra,0x0
    80005bb8:	fa4080e7          	jalr	-92(ra) # 80005b58 <_Z16switchToUserModev>

    thread_t userThread;
    thread_create(&userThread, test, 0);
    80005bbc:	00000613          	li	a2,0
    80005bc0:	00000597          	auipc	a1,0x0
    80005bc4:	e1c58593          	addi	a1,a1,-484 # 800059dc <_Z4testPv>
    80005bc8:	fd840513          	addi	a0,s0,-40
    80005bcc:	fffff097          	auipc	ra,0xfffff
    80005bd0:	490080e7          	jalr	1168(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    80005bd4:	00c0006f          	j	80005be0 <_ZN6Kernel3runEv+0x78>
    while(!ConsoleManager::getInstance().finished() || !Timer::getInstance().noSleepingThreads() || !Scheduler::isEmpty()){
        thread_dispatch();
    80005bd8:	fffff097          	auipc	ra,0xfffff
    80005bdc:	520080e7          	jalr	1312(ra) # 800050f8 <_Z15thread_dispatchv>
    while(!ConsoleManager::getInstance().finished() || !Timer::getInstance().noSleepingThreads() || !Scheduler::isEmpty()){
    80005be0:	ffffd097          	auipc	ra,0xffffd
    80005be4:	2e4080e7          	jalr	740(ra) # 80002ec4 <_ZN14ConsoleManager11getInstanceEv>
    80005be8:	ffffd097          	auipc	ra,0xffffd
    80005bec:	65c080e7          	jalr	1628(ra) # 80003244 <_ZN14ConsoleManager8finishedEv>
    80005bf0:	fe0504e3          	beqz	a0,80005bd8 <_ZN6Kernel3runEv+0x70>
    80005bf4:	fffff097          	auipc	ra,0xfffff
    80005bf8:	21c080e7          	jalr	540(ra) # 80004e10 <_ZN5Timer11getInstanceEv>
    80005bfc:	fffff097          	auipc	ra,0xfffff
    80005c00:	3c8080e7          	jalr	968(ra) # 80004fc4 <_ZN5Timer17noSleepingThreadsEv>
    80005c04:	fc050ae3          	beqz	a0,80005bd8 <_ZN6Kernel3runEv+0x70>
    80005c08:	00000097          	auipc	ra,0x0
    80005c0c:	940080e7          	jalr	-1728(ra) # 80005548 <_ZN9Scheduler7isEmptyEv>
    80005c10:	fc0504e3          	beqz	a0,80005bd8 <_ZN6Kernel3runEv+0x70>
    }

    return EXIT_SUCCESS;
}
    80005c14:	00000513          	li	a0,0
    80005c18:	02813083          	ld	ra,40(sp)
    80005c1c:	02013403          	ld	s0,32(sp)
    80005c20:	03010113          	addi	sp,sp,48
    80005c24:	00008067          	ret

0000000080005c28 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005c28:	fe010113          	addi	sp,sp,-32
    80005c2c:	00113c23          	sd	ra,24(sp)
    80005c30:	00813823          	sd	s0,16(sp)
    80005c34:	00913423          	sd	s1,8(sp)
    80005c38:	01213023          	sd	s2,0(sp)
    80005c3c:	02010413          	addi	s0,sp,32
    80005c40:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005c44:	00100793          	li	a5,1
    80005c48:	02a7f863          	bgeu	a5,a0,80005c78 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005c4c:	00a00793          	li	a5,10
    80005c50:	02f577b3          	remu	a5,a0,a5
    80005c54:	02078e63          	beqz	a5,80005c90 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005c58:	fff48513          	addi	a0,s1,-1
    80005c5c:	00000097          	auipc	ra,0x0
    80005c60:	fcc080e7          	jalr	-52(ra) # 80005c28 <_ZL9fibonaccim>
    80005c64:	00050913          	mv	s2,a0
    80005c68:	ffe48513          	addi	a0,s1,-2
    80005c6c:	00000097          	auipc	ra,0x0
    80005c70:	fbc080e7          	jalr	-68(ra) # 80005c28 <_ZL9fibonaccim>
    80005c74:	00a90533          	add	a0,s2,a0
}
    80005c78:	01813083          	ld	ra,24(sp)
    80005c7c:	01013403          	ld	s0,16(sp)
    80005c80:	00813483          	ld	s1,8(sp)
    80005c84:	00013903          	ld	s2,0(sp)
    80005c88:	02010113          	addi	sp,sp,32
    80005c8c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005c90:	fffff097          	auipc	ra,0xfffff
    80005c94:	468080e7          	jalr	1128(ra) # 800050f8 <_Z15thread_dispatchv>
    80005c98:	fc1ff06f          	j	80005c58 <_ZL9fibonaccim+0x30>

0000000080005c9c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005c9c:	fe010113          	addi	sp,sp,-32
    80005ca0:	00113c23          	sd	ra,24(sp)
    80005ca4:	00813823          	sd	s0,16(sp)
    80005ca8:	00913423          	sd	s1,8(sp)
    80005cac:	01213023          	sd	s2,0(sp)
    80005cb0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005cb4:	00a00493          	li	s1,10
    80005cb8:	0400006f          	j	80005cf8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005cbc:	00007517          	auipc	a0,0x7
    80005cc0:	8bc50513          	addi	a0,a0,-1860 # 8000c578 <_ZTV9Semaphore+0x530>
    80005cc4:	00001097          	auipc	ra,0x1
    80005cc8:	68c080e7          	jalr	1676(ra) # 80007350 <_Z11printStringPKc>
    80005ccc:	00000613          	li	a2,0
    80005cd0:	00a00593          	li	a1,10
    80005cd4:	00048513          	mv	a0,s1
    80005cd8:	00002097          	auipc	ra,0x2
    80005cdc:	828080e7          	jalr	-2008(ra) # 80007500 <_Z8printIntiii>
    80005ce0:	00007517          	auipc	a0,0x7
    80005ce4:	bc850513          	addi	a0,a0,-1080 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005ce8:	00001097          	auipc	ra,0x1
    80005cec:	668080e7          	jalr	1640(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005cf0:	0014849b          	addiw	s1,s1,1
    80005cf4:	0ff4f493          	andi	s1,s1,255
    80005cf8:	00c00793          	li	a5,12
    80005cfc:	fc97f0e3          	bgeu	a5,s1,80005cbc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005d00:	00007517          	auipc	a0,0x7
    80005d04:	88050513          	addi	a0,a0,-1920 # 8000c580 <_ZTV9Semaphore+0x538>
    80005d08:	00001097          	auipc	ra,0x1
    80005d0c:	648080e7          	jalr	1608(ra) # 80007350 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005d10:	00500313          	li	t1,5
    thread_dispatch();
    80005d14:	fffff097          	auipc	ra,0xfffff
    80005d18:	3e4080e7          	jalr	996(ra) # 800050f8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005d1c:	01000513          	li	a0,16
    80005d20:	00000097          	auipc	ra,0x0
    80005d24:	f08080e7          	jalr	-248(ra) # 80005c28 <_ZL9fibonaccim>
    80005d28:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005d2c:	00007517          	auipc	a0,0x7
    80005d30:	86450513          	addi	a0,a0,-1948 # 8000c590 <_ZTV9Semaphore+0x548>
    80005d34:	00001097          	auipc	ra,0x1
    80005d38:	61c080e7          	jalr	1564(ra) # 80007350 <_Z11printStringPKc>
    80005d3c:	00000613          	li	a2,0
    80005d40:	00a00593          	li	a1,10
    80005d44:	0009051b          	sext.w	a0,s2
    80005d48:	00001097          	auipc	ra,0x1
    80005d4c:	7b8080e7          	jalr	1976(ra) # 80007500 <_Z8printIntiii>
    80005d50:	00007517          	auipc	a0,0x7
    80005d54:	b5850513          	addi	a0,a0,-1192 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005d58:	00001097          	auipc	ra,0x1
    80005d5c:	5f8080e7          	jalr	1528(ra) # 80007350 <_Z11printStringPKc>
    80005d60:	0400006f          	j	80005da0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005d64:	00007517          	auipc	a0,0x7
    80005d68:	81450513          	addi	a0,a0,-2028 # 8000c578 <_ZTV9Semaphore+0x530>
    80005d6c:	00001097          	auipc	ra,0x1
    80005d70:	5e4080e7          	jalr	1508(ra) # 80007350 <_Z11printStringPKc>
    80005d74:	00000613          	li	a2,0
    80005d78:	00a00593          	li	a1,10
    80005d7c:	00048513          	mv	a0,s1
    80005d80:	00001097          	auipc	ra,0x1
    80005d84:	780080e7          	jalr	1920(ra) # 80007500 <_Z8printIntiii>
    80005d88:	00007517          	auipc	a0,0x7
    80005d8c:	b2050513          	addi	a0,a0,-1248 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005d90:	00001097          	auipc	ra,0x1
    80005d94:	5c0080e7          	jalr	1472(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005d98:	0014849b          	addiw	s1,s1,1
    80005d9c:	0ff4f493          	andi	s1,s1,255
    80005da0:	00f00793          	li	a5,15
    80005da4:	fc97f0e3          	bgeu	a5,s1,80005d64 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005da8:	00006517          	auipc	a0,0x6
    80005dac:	7f850513          	addi	a0,a0,2040 # 8000c5a0 <_ZTV9Semaphore+0x558>
    80005db0:	00001097          	auipc	ra,0x1
    80005db4:	5a0080e7          	jalr	1440(ra) # 80007350 <_Z11printStringPKc>
    finishedD = true;
    80005db8:	00100793          	li	a5,1
    80005dbc:	00009717          	auipc	a4,0x9
    80005dc0:	46f70223          	sb	a5,1124(a4) # 8000f220 <_ZL9finishedD>
    thread_dispatch();
    80005dc4:	fffff097          	auipc	ra,0xfffff
    80005dc8:	334080e7          	jalr	820(ra) # 800050f8 <_Z15thread_dispatchv>
}
    80005dcc:	01813083          	ld	ra,24(sp)
    80005dd0:	01013403          	ld	s0,16(sp)
    80005dd4:	00813483          	ld	s1,8(sp)
    80005dd8:	00013903          	ld	s2,0(sp)
    80005ddc:	02010113          	addi	sp,sp,32
    80005de0:	00008067          	ret

0000000080005de4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005de4:	fe010113          	addi	sp,sp,-32
    80005de8:	00113c23          	sd	ra,24(sp)
    80005dec:	00813823          	sd	s0,16(sp)
    80005df0:	00913423          	sd	s1,8(sp)
    80005df4:	01213023          	sd	s2,0(sp)
    80005df8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005dfc:	00000493          	li	s1,0
    80005e00:	0400006f          	j	80005e40 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005e04:	00006517          	auipc	a0,0x6
    80005e08:	7ac50513          	addi	a0,a0,1964 # 8000c5b0 <_ZTV9Semaphore+0x568>
    80005e0c:	00001097          	auipc	ra,0x1
    80005e10:	544080e7          	jalr	1348(ra) # 80007350 <_Z11printStringPKc>
    80005e14:	00000613          	li	a2,0
    80005e18:	00a00593          	li	a1,10
    80005e1c:	00048513          	mv	a0,s1
    80005e20:	00001097          	auipc	ra,0x1
    80005e24:	6e0080e7          	jalr	1760(ra) # 80007500 <_Z8printIntiii>
    80005e28:	00007517          	auipc	a0,0x7
    80005e2c:	a8050513          	addi	a0,a0,-1408 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005e30:	00001097          	auipc	ra,0x1
    80005e34:	520080e7          	jalr	1312(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005e38:	0014849b          	addiw	s1,s1,1
    80005e3c:	0ff4f493          	andi	s1,s1,255
    80005e40:	00200793          	li	a5,2
    80005e44:	fc97f0e3          	bgeu	a5,s1,80005e04 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005e48:	00006517          	auipc	a0,0x6
    80005e4c:	77050513          	addi	a0,a0,1904 # 8000c5b8 <_ZTV9Semaphore+0x570>
    80005e50:	00001097          	auipc	ra,0x1
    80005e54:	500080e7          	jalr	1280(ra) # 80007350 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005e58:	00700313          	li	t1,7
    thread_dispatch();
    80005e5c:	fffff097          	auipc	ra,0xfffff
    80005e60:	29c080e7          	jalr	668(ra) # 800050f8 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005e64:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005e68:	00006517          	auipc	a0,0x6
    80005e6c:	76050513          	addi	a0,a0,1888 # 8000c5c8 <_ZTV9Semaphore+0x580>
    80005e70:	00001097          	auipc	ra,0x1
    80005e74:	4e0080e7          	jalr	1248(ra) # 80007350 <_Z11printStringPKc>
    80005e78:	00000613          	li	a2,0
    80005e7c:	00a00593          	li	a1,10
    80005e80:	0009051b          	sext.w	a0,s2
    80005e84:	00001097          	auipc	ra,0x1
    80005e88:	67c080e7          	jalr	1660(ra) # 80007500 <_Z8printIntiii>
    80005e8c:	00007517          	auipc	a0,0x7
    80005e90:	a1c50513          	addi	a0,a0,-1508 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005e94:	00001097          	auipc	ra,0x1
    80005e98:	4bc080e7          	jalr	1212(ra) # 80007350 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005e9c:	00c00513          	li	a0,12
    80005ea0:	00000097          	auipc	ra,0x0
    80005ea4:	d88080e7          	jalr	-632(ra) # 80005c28 <_ZL9fibonaccim>
    80005ea8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005eac:	00006517          	auipc	a0,0x6
    80005eb0:	72450513          	addi	a0,a0,1828 # 8000c5d0 <_ZTV9Semaphore+0x588>
    80005eb4:	00001097          	auipc	ra,0x1
    80005eb8:	49c080e7          	jalr	1180(ra) # 80007350 <_Z11printStringPKc>
    80005ebc:	00000613          	li	a2,0
    80005ec0:	00a00593          	li	a1,10
    80005ec4:	0009051b          	sext.w	a0,s2
    80005ec8:	00001097          	auipc	ra,0x1
    80005ecc:	638080e7          	jalr	1592(ra) # 80007500 <_Z8printIntiii>
    80005ed0:	00007517          	auipc	a0,0x7
    80005ed4:	9d850513          	addi	a0,a0,-1576 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005ed8:	00001097          	auipc	ra,0x1
    80005edc:	478080e7          	jalr	1144(ra) # 80007350 <_Z11printStringPKc>
    80005ee0:	0400006f          	j	80005f20 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005ee4:	00006517          	auipc	a0,0x6
    80005ee8:	6cc50513          	addi	a0,a0,1740 # 8000c5b0 <_ZTV9Semaphore+0x568>
    80005eec:	00001097          	auipc	ra,0x1
    80005ef0:	464080e7          	jalr	1124(ra) # 80007350 <_Z11printStringPKc>
    80005ef4:	00000613          	li	a2,0
    80005ef8:	00a00593          	li	a1,10
    80005efc:	00048513          	mv	a0,s1
    80005f00:	00001097          	auipc	ra,0x1
    80005f04:	600080e7          	jalr	1536(ra) # 80007500 <_Z8printIntiii>
    80005f08:	00007517          	auipc	a0,0x7
    80005f0c:	9a050513          	addi	a0,a0,-1632 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005f10:	00001097          	auipc	ra,0x1
    80005f14:	440080e7          	jalr	1088(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005f18:	0014849b          	addiw	s1,s1,1
    80005f1c:	0ff4f493          	andi	s1,s1,255
    80005f20:	00500793          	li	a5,5
    80005f24:	fc97f0e3          	bgeu	a5,s1,80005ee4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005f28:	00006517          	auipc	a0,0x6
    80005f2c:	6b850513          	addi	a0,a0,1720 # 8000c5e0 <_ZTV9Semaphore+0x598>
    80005f30:	00001097          	auipc	ra,0x1
    80005f34:	420080e7          	jalr	1056(ra) # 80007350 <_Z11printStringPKc>
    finishedC = true;
    80005f38:	00100793          	li	a5,1
    80005f3c:	00009717          	auipc	a4,0x9
    80005f40:	2ef702a3          	sb	a5,741(a4) # 8000f221 <_ZL9finishedC>
    thread_dispatch();
    80005f44:	fffff097          	auipc	ra,0xfffff
    80005f48:	1b4080e7          	jalr	436(ra) # 800050f8 <_Z15thread_dispatchv>
}
    80005f4c:	01813083          	ld	ra,24(sp)
    80005f50:	01013403          	ld	s0,16(sp)
    80005f54:	00813483          	ld	s1,8(sp)
    80005f58:	00013903          	ld	s2,0(sp)
    80005f5c:	02010113          	addi	sp,sp,32
    80005f60:	00008067          	ret

0000000080005f64 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005f64:	fe010113          	addi	sp,sp,-32
    80005f68:	00113c23          	sd	ra,24(sp)
    80005f6c:	00813823          	sd	s0,16(sp)
    80005f70:	00913423          	sd	s1,8(sp)
    80005f74:	01213023          	sd	s2,0(sp)
    80005f78:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005f7c:	00000913          	li	s2,0
    80005f80:	0400006f          	j	80005fc0 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005f84:	fffff097          	auipc	ra,0xfffff
    80005f88:	174080e7          	jalr	372(ra) # 800050f8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005f8c:	00148493          	addi	s1,s1,1
    80005f90:	000027b7          	lui	a5,0x2
    80005f94:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005f98:	0097ee63          	bltu	a5,s1,80005fb4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005f9c:	00000713          	li	a4,0
    80005fa0:	000077b7          	lui	a5,0x7
    80005fa4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005fa8:	fce7eee3          	bltu	a5,a4,80005f84 <_ZL11workerBodyBPv+0x20>
    80005fac:	00170713          	addi	a4,a4,1
    80005fb0:	ff1ff06f          	j	80005fa0 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80005fb4:	00a00793          	li	a5,10
    80005fb8:	04f90663          	beq	s2,a5,80006004 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80005fbc:	00190913          	addi	s2,s2,1
    80005fc0:	00f00793          	li	a5,15
    80005fc4:	0527e463          	bltu	a5,s2,8000600c <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80005fc8:	00006517          	auipc	a0,0x6
    80005fcc:	62850513          	addi	a0,a0,1576 # 8000c5f0 <_ZTV9Semaphore+0x5a8>
    80005fd0:	00001097          	auipc	ra,0x1
    80005fd4:	380080e7          	jalr	896(ra) # 80007350 <_Z11printStringPKc>
    80005fd8:	00000613          	li	a2,0
    80005fdc:	00a00593          	li	a1,10
    80005fe0:	0009051b          	sext.w	a0,s2
    80005fe4:	00001097          	auipc	ra,0x1
    80005fe8:	51c080e7          	jalr	1308(ra) # 80007500 <_Z8printIntiii>
    80005fec:	00007517          	auipc	a0,0x7
    80005ff0:	8bc50513          	addi	a0,a0,-1860 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80005ff4:	00001097          	auipc	ra,0x1
    80005ff8:	35c080e7          	jalr	860(ra) # 80007350 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005ffc:	00000493          	li	s1,0
    80006000:	f91ff06f          	j	80005f90 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006004:	14102ff3          	csrr	t6,sepc
    80006008:	fb5ff06f          	j	80005fbc <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    8000600c:	00006517          	auipc	a0,0x6
    80006010:	5ec50513          	addi	a0,a0,1516 # 8000c5f8 <_ZTV9Semaphore+0x5b0>
    80006014:	00001097          	auipc	ra,0x1
    80006018:	33c080e7          	jalr	828(ra) # 80007350 <_Z11printStringPKc>
    finishedB = true;
    8000601c:	00100793          	li	a5,1
    80006020:	00009717          	auipc	a4,0x9
    80006024:	20f70123          	sb	a5,514(a4) # 8000f222 <_ZL9finishedB>
    thread_dispatch();
    80006028:	fffff097          	auipc	ra,0xfffff
    8000602c:	0d0080e7          	jalr	208(ra) # 800050f8 <_Z15thread_dispatchv>
}
    80006030:	01813083          	ld	ra,24(sp)
    80006034:	01013403          	ld	s0,16(sp)
    80006038:	00813483          	ld	s1,8(sp)
    8000603c:	00013903          	ld	s2,0(sp)
    80006040:	02010113          	addi	sp,sp,32
    80006044:	00008067          	ret

0000000080006048 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006048:	fe010113          	addi	sp,sp,-32
    8000604c:	00113c23          	sd	ra,24(sp)
    80006050:	00813823          	sd	s0,16(sp)
    80006054:	00913423          	sd	s1,8(sp)
    80006058:	01213023          	sd	s2,0(sp)
    8000605c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006060:	00000913          	li	s2,0
    80006064:	0380006f          	j	8000609c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006068:	fffff097          	auipc	ra,0xfffff
    8000606c:	090080e7          	jalr	144(ra) # 800050f8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006070:	00148493          	addi	s1,s1,1
    80006074:	000027b7          	lui	a5,0x2
    80006078:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000607c:	0097ee63          	bltu	a5,s1,80006098 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006080:	00000713          	li	a4,0
    80006084:	000077b7          	lui	a5,0x7
    80006088:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000608c:	fce7eee3          	bltu	a5,a4,80006068 <_ZL11workerBodyAPv+0x20>
    80006090:	00170713          	addi	a4,a4,1
    80006094:	ff1ff06f          	j	80006084 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006098:	00190913          	addi	s2,s2,1
    8000609c:	00900793          	li	a5,9
    800060a0:	0527e063          	bltu	a5,s2,800060e0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800060a4:	00006517          	auipc	a0,0x6
    800060a8:	56450513          	addi	a0,a0,1380 # 8000c608 <_ZTV9Semaphore+0x5c0>
    800060ac:	00001097          	auipc	ra,0x1
    800060b0:	2a4080e7          	jalr	676(ra) # 80007350 <_Z11printStringPKc>
    800060b4:	00000613          	li	a2,0
    800060b8:	00a00593          	li	a1,10
    800060bc:	0009051b          	sext.w	a0,s2
    800060c0:	00001097          	auipc	ra,0x1
    800060c4:	440080e7          	jalr	1088(ra) # 80007500 <_Z8printIntiii>
    800060c8:	00006517          	auipc	a0,0x6
    800060cc:	7e050513          	addi	a0,a0,2016 # 8000c8a8 <_ZTV9Semaphore+0x860>
    800060d0:	00001097          	auipc	ra,0x1
    800060d4:	280080e7          	jalr	640(ra) # 80007350 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800060d8:	00000493          	li	s1,0
    800060dc:	f99ff06f          	j	80006074 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800060e0:	00006517          	auipc	a0,0x6
    800060e4:	50050513          	addi	a0,a0,1280 # 8000c5e0 <_ZTV9Semaphore+0x598>
    800060e8:	00001097          	auipc	ra,0x1
    800060ec:	268080e7          	jalr	616(ra) # 80007350 <_Z11printStringPKc>
    finishedA = true;
    800060f0:	00100793          	li	a5,1
    800060f4:	00009717          	auipc	a4,0x9
    800060f8:	12f707a3          	sb	a5,303(a4) # 8000f223 <_ZL9finishedA>
}
    800060fc:	01813083          	ld	ra,24(sp)
    80006100:	01013403          	ld	s0,16(sp)
    80006104:	00813483          	ld	s1,8(sp)
    80006108:	00013903          	ld	s2,0(sp)
    8000610c:	02010113          	addi	sp,sp,32
    80006110:	00008067          	ret

0000000080006114 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006114:	fd010113          	addi	sp,sp,-48
    80006118:	02113423          	sd	ra,40(sp)
    8000611c:	02813023          	sd	s0,32(sp)
    80006120:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006124:	00000613          	li	a2,0
    80006128:	00000597          	auipc	a1,0x0
    8000612c:	f2058593          	addi	a1,a1,-224 # 80006048 <_ZL11workerBodyAPv>
    80006130:	fd040513          	addi	a0,s0,-48
    80006134:	fffff097          	auipc	ra,0xfffff
    80006138:	f28080e7          	jalr	-216(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    8000613c:	00006517          	auipc	a0,0x6
    80006140:	4d450513          	addi	a0,a0,1236 # 8000c610 <_ZTV9Semaphore+0x5c8>
    80006144:	00001097          	auipc	ra,0x1
    80006148:	20c080e7          	jalr	524(ra) # 80007350 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000614c:	00000613          	li	a2,0
    80006150:	00000597          	auipc	a1,0x0
    80006154:	e1458593          	addi	a1,a1,-492 # 80005f64 <_ZL11workerBodyBPv>
    80006158:	fd840513          	addi	a0,s0,-40
    8000615c:	fffff097          	auipc	ra,0xfffff
    80006160:	f00080e7          	jalr	-256(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006164:	00006517          	auipc	a0,0x6
    80006168:	4c450513          	addi	a0,a0,1220 # 8000c628 <_ZTV9Semaphore+0x5e0>
    8000616c:	00001097          	auipc	ra,0x1
    80006170:	1e4080e7          	jalr	484(ra) # 80007350 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006174:	00000613          	li	a2,0
    80006178:	00000597          	auipc	a1,0x0
    8000617c:	c6c58593          	addi	a1,a1,-916 # 80005de4 <_ZL11workerBodyCPv>
    80006180:	fe040513          	addi	a0,s0,-32
    80006184:	fffff097          	auipc	ra,0xfffff
    80006188:	ed8080e7          	jalr	-296(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    8000618c:	00006517          	auipc	a0,0x6
    80006190:	4b450513          	addi	a0,a0,1204 # 8000c640 <_ZTV9Semaphore+0x5f8>
    80006194:	00001097          	auipc	ra,0x1
    80006198:	1bc080e7          	jalr	444(ra) # 80007350 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000619c:	00000613          	li	a2,0
    800061a0:	00000597          	auipc	a1,0x0
    800061a4:	afc58593          	addi	a1,a1,-1284 # 80005c9c <_ZL11workerBodyDPv>
    800061a8:	fe840513          	addi	a0,s0,-24
    800061ac:	fffff097          	auipc	ra,0xfffff
    800061b0:	eb0080e7          	jalr	-336(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    800061b4:	00006517          	auipc	a0,0x6
    800061b8:	4a450513          	addi	a0,a0,1188 # 8000c658 <_ZTV9Semaphore+0x610>
    800061bc:	00001097          	auipc	ra,0x1
    800061c0:	194080e7          	jalr	404(ra) # 80007350 <_Z11printStringPKc>
    800061c4:	00c0006f          	j	800061d0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800061c8:	fffff097          	auipc	ra,0xfffff
    800061cc:	f30080e7          	jalr	-208(ra) # 800050f8 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800061d0:	00009797          	auipc	a5,0x9
    800061d4:	0537c783          	lbu	a5,83(a5) # 8000f223 <_ZL9finishedA>
    800061d8:	fe0788e3          	beqz	a5,800061c8 <_Z16System_Mode_testv+0xb4>
    800061dc:	00009797          	auipc	a5,0x9
    800061e0:	0467c783          	lbu	a5,70(a5) # 8000f222 <_ZL9finishedB>
    800061e4:	fe0782e3          	beqz	a5,800061c8 <_Z16System_Mode_testv+0xb4>
    800061e8:	00009797          	auipc	a5,0x9
    800061ec:	0397c783          	lbu	a5,57(a5) # 8000f221 <_ZL9finishedC>
    800061f0:	fc078ce3          	beqz	a5,800061c8 <_Z16System_Mode_testv+0xb4>
    800061f4:	00009797          	auipc	a5,0x9
    800061f8:	02c7c783          	lbu	a5,44(a5) # 8000f220 <_ZL9finishedD>
    800061fc:	fc0786e3          	beqz	a5,800061c8 <_Z16System_Mode_testv+0xb4>
    }

}
    80006200:	02813083          	ld	ra,40(sp)
    80006204:	02013403          	ld	s0,32(sp)
    80006208:	03010113          	addi	sp,sp,48
    8000620c:	00008067          	ret

0000000080006210 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006210:	fe010113          	addi	sp,sp,-32
    80006214:	00113c23          	sd	ra,24(sp)
    80006218:	00813823          	sd	s0,16(sp)
    8000621c:	00913423          	sd	s1,8(sp)
    80006220:	01213023          	sd	s2,0(sp)
    80006224:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006228:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000622c:	00600493          	li	s1,6
    while (--i > 0) {
    80006230:	fff4849b          	addiw	s1,s1,-1
    80006234:	04905463          	blez	s1,8000627c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006238:	00006517          	auipc	a0,0x6
    8000623c:	43850513          	addi	a0,a0,1080 # 8000c670 <_ZTV9Semaphore+0x628>
    80006240:	00001097          	auipc	ra,0x1
    80006244:	110080e7          	jalr	272(ra) # 80007350 <_Z11printStringPKc>
        printInt(sleep_time);
    80006248:	00000613          	li	a2,0
    8000624c:	00a00593          	li	a1,10
    80006250:	0009051b          	sext.w	a0,s2
    80006254:	00001097          	auipc	ra,0x1
    80006258:	2ac080e7          	jalr	684(ra) # 80007500 <_Z8printIntiii>
        printString(" !\n");
    8000625c:	00006517          	auipc	a0,0x6
    80006260:	41c50513          	addi	a0,a0,1052 # 8000c678 <_ZTV9Semaphore+0x630>
    80006264:	00001097          	auipc	ra,0x1
    80006268:	0ec080e7          	jalr	236(ra) # 80007350 <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000626c:	00090513          	mv	a0,s2
    80006270:	fffff097          	auipc	ra,0xfffff
    80006274:	ecc080e7          	jalr	-308(ra) # 8000513c <_Z10time_sleepm>
    while (--i > 0) {
    80006278:	fb9ff06f          	j	80006230 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    8000627c:	00a00793          	li	a5,10
    80006280:	02f95933          	divu	s2,s2,a5
    80006284:	fff90913          	addi	s2,s2,-1
    80006288:	00009797          	auipc	a5,0x9
    8000628c:	fa078793          	addi	a5,a5,-96 # 8000f228 <_ZL8finished>
    80006290:	01278933          	add	s2,a5,s2
    80006294:	00100793          	li	a5,1
    80006298:	00f90023          	sb	a5,0(s2)
}
    8000629c:	01813083          	ld	ra,24(sp)
    800062a0:	01013403          	ld	s0,16(sp)
    800062a4:	00813483          	ld	s1,8(sp)
    800062a8:	00013903          	ld	s2,0(sp)
    800062ac:	02010113          	addi	sp,sp,32
    800062b0:	00008067          	ret

00000000800062b4 <_Z12testSleepingv>:

void testSleeping() {
    800062b4:	fc010113          	addi	sp,sp,-64
    800062b8:	02113c23          	sd	ra,56(sp)
    800062bc:	02813823          	sd	s0,48(sp)
    800062c0:	02913423          	sd	s1,40(sp)
    800062c4:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800062c8:	00a00793          	li	a5,10
    800062cc:	fcf43823          	sd	a5,-48(s0)
    800062d0:	01400793          	li	a5,20
    800062d4:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800062d8:	00000493          	li	s1,0
    800062dc:	02c0006f          	j	80006308 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800062e0:	00349513          	slli	a0,s1,0x3
    800062e4:	fd040793          	addi	a5,s0,-48
    800062e8:	00a78633          	add	a2,a5,a0
    800062ec:	00000597          	auipc	a1,0x0
    800062f0:	f2458593          	addi	a1,a1,-220 # 80006210 <_ZL9sleepyRunPv>
    800062f4:	fc040793          	addi	a5,s0,-64
    800062f8:	00a78533          	add	a0,a5,a0
    800062fc:	fffff097          	auipc	ra,0xfffff
    80006300:	d60080e7          	jalr	-672(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006304:	0014849b          	addiw	s1,s1,1
    80006308:	00100793          	li	a5,1
    8000630c:	fc97dae3          	bge	a5,s1,800062e0 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006310:	00009797          	auipc	a5,0x9
    80006314:	f187c783          	lbu	a5,-232(a5) # 8000f228 <_ZL8finished>
    80006318:	fe078ce3          	beqz	a5,80006310 <_Z12testSleepingv+0x5c>
    8000631c:	00009797          	auipc	a5,0x9
    80006320:	f0d7c783          	lbu	a5,-243(a5) # 8000f229 <_ZL8finished+0x1>
    80006324:	fe0786e3          	beqz	a5,80006310 <_Z12testSleepingv+0x5c>
}
    80006328:	03813083          	ld	ra,56(sp)
    8000632c:	03013403          	ld	s0,48(sp)
    80006330:	02813483          	ld	s1,40(sp)
    80006334:	04010113          	addi	sp,sp,64
    80006338:	00008067          	ret

000000008000633c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000633c:	fe010113          	addi	sp,sp,-32
    80006340:	00113c23          	sd	ra,24(sp)
    80006344:	00813823          	sd	s0,16(sp)
    80006348:	00913423          	sd	s1,8(sp)
    8000634c:	01213023          	sd	s2,0(sp)
    80006350:	02010413          	addi	s0,sp,32
    80006354:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80006358:	00000913          	li	s2,0
    8000635c:	00c0006f          	j	80006368 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80006360:	fffff097          	auipc	ra,0xfffff
    80006364:	d98080e7          	jalr	-616(ra) # 800050f8 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80006368:	fffff097          	auipc	ra,0xfffff
    8000636c:	f18080e7          	jalr	-232(ra) # 80005280 <_Z4getcv>
    80006370:	0005059b          	sext.w	a1,a0
    80006374:	01b00793          	li	a5,27
    80006378:	02f58a63          	beq	a1,a5,800063ac <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000637c:	0084b503          	ld	a0,8(s1)
    80006380:	00001097          	auipc	ra,0x1
    80006384:	33c080e7          	jalr	828(ra) # 800076bc <_ZN6Buffer3putEi>
        i++;
    80006388:	0019071b          	addiw	a4,s2,1
    8000638c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80006390:	0004a683          	lw	a3,0(s1)
    80006394:	0026979b          	slliw	a5,a3,0x2
    80006398:	00d787bb          	addw	a5,a5,a3
    8000639c:	0017979b          	slliw	a5,a5,0x1
    800063a0:	02f767bb          	remw	a5,a4,a5
    800063a4:	fc0792e3          	bnez	a5,80006368 <_ZL16producerKeyboardPv+0x2c>
    800063a8:	fb9ff06f          	j	80006360 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800063ac:	00100793          	li	a5,1
    800063b0:	00009717          	auipc	a4,0x9
    800063b4:	e8f72023          	sw	a5,-384(a4) # 8000f230 <_ZL9threadEnd>
    data->buffer->put('!');
    800063b8:	02100593          	li	a1,33
    800063bc:	0084b503          	ld	a0,8(s1)
    800063c0:	00001097          	auipc	ra,0x1
    800063c4:	2fc080e7          	jalr	764(ra) # 800076bc <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800063c8:	0104b503          	ld	a0,16(s1)
    800063cc:	fffff097          	auipc	ra,0xfffff
    800063d0:	e2c080e7          	jalr	-468(ra) # 800051f8 <_Z10sem_signalP4_sem>
}
    800063d4:	01813083          	ld	ra,24(sp)
    800063d8:	01013403          	ld	s0,16(sp)
    800063dc:	00813483          	ld	s1,8(sp)
    800063e0:	00013903          	ld	s2,0(sp)
    800063e4:	02010113          	addi	sp,sp,32
    800063e8:	00008067          	ret

00000000800063ec <_ZL8producerPv>:

static void producer(void *arg) {
    800063ec:	fe010113          	addi	sp,sp,-32
    800063f0:	00113c23          	sd	ra,24(sp)
    800063f4:	00813823          	sd	s0,16(sp)
    800063f8:	00913423          	sd	s1,8(sp)
    800063fc:	01213023          	sd	s2,0(sp)
    80006400:	02010413          	addi	s0,sp,32
    80006404:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80006408:	00000913          	li	s2,0
    8000640c:	00c0006f          	j	80006418 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80006410:	fffff097          	auipc	ra,0xfffff
    80006414:	ce8080e7          	jalr	-792(ra) # 800050f8 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80006418:	00009797          	auipc	a5,0x9
    8000641c:	e187a783          	lw	a5,-488(a5) # 8000f230 <_ZL9threadEnd>
    80006420:	02079e63          	bnez	a5,8000645c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80006424:	0004a583          	lw	a1,0(s1)
    80006428:	0305859b          	addiw	a1,a1,48
    8000642c:	0084b503          	ld	a0,8(s1)
    80006430:	00001097          	auipc	ra,0x1
    80006434:	28c080e7          	jalr	652(ra) # 800076bc <_ZN6Buffer3putEi>
        i++;
    80006438:	0019071b          	addiw	a4,s2,1
    8000643c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80006440:	0004a683          	lw	a3,0(s1)
    80006444:	0026979b          	slliw	a5,a3,0x2
    80006448:	00d787bb          	addw	a5,a5,a3
    8000644c:	0017979b          	slliw	a5,a5,0x1
    80006450:	02f767bb          	remw	a5,a4,a5
    80006454:	fc0792e3          	bnez	a5,80006418 <_ZL8producerPv+0x2c>
    80006458:	fb9ff06f          	j	80006410 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000645c:	0104b503          	ld	a0,16(s1)
    80006460:	fffff097          	auipc	ra,0xfffff
    80006464:	d98080e7          	jalr	-616(ra) # 800051f8 <_Z10sem_signalP4_sem>
}
    80006468:	01813083          	ld	ra,24(sp)
    8000646c:	01013403          	ld	s0,16(sp)
    80006470:	00813483          	ld	s1,8(sp)
    80006474:	00013903          	ld	s2,0(sp)
    80006478:	02010113          	addi	sp,sp,32
    8000647c:	00008067          	ret

0000000080006480 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80006480:	fd010113          	addi	sp,sp,-48
    80006484:	02113423          	sd	ra,40(sp)
    80006488:	02813023          	sd	s0,32(sp)
    8000648c:	00913c23          	sd	s1,24(sp)
    80006490:	01213823          	sd	s2,16(sp)
    80006494:	01313423          	sd	s3,8(sp)
    80006498:	03010413          	addi	s0,sp,48
    8000649c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800064a0:	00000993          	li	s3,0
    800064a4:	01c0006f          	j	800064c0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800064a8:	fffff097          	auipc	ra,0xfffff
    800064ac:	c50080e7          	jalr	-944(ra) # 800050f8 <_Z15thread_dispatchv>
    800064b0:	0500006f          	j	80006500 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800064b4:	00a00513          	li	a0,10
    800064b8:	fffff097          	auipc	ra,0xfffff
    800064bc:	df0080e7          	jalr	-528(ra) # 800052a8 <_Z4putcc>
    while (!threadEnd) {
    800064c0:	00009797          	auipc	a5,0x9
    800064c4:	d707a783          	lw	a5,-656(a5) # 8000f230 <_ZL9threadEnd>
    800064c8:	06079063          	bnez	a5,80006528 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800064cc:	00893503          	ld	a0,8(s2)
    800064d0:	00001097          	auipc	ra,0x1
    800064d4:	27c080e7          	jalr	636(ra) # 8000774c <_ZN6Buffer3getEv>
        i++;
    800064d8:	0019849b          	addiw	s1,s3,1
    800064dc:	0004899b          	sext.w	s3,s1
        putc(key);
    800064e0:	0ff57513          	andi	a0,a0,255
    800064e4:	fffff097          	auipc	ra,0xfffff
    800064e8:	dc4080e7          	jalr	-572(ra) # 800052a8 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800064ec:	00092703          	lw	a4,0(s2)
    800064f0:	0027179b          	slliw	a5,a4,0x2
    800064f4:	00e787bb          	addw	a5,a5,a4
    800064f8:	02f4e7bb          	remw	a5,s1,a5
    800064fc:	fa0786e3          	beqz	a5,800064a8 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80006500:	05000793          	li	a5,80
    80006504:	02f4e4bb          	remw	s1,s1,a5
    80006508:	fa049ce3          	bnez	s1,800064c0 <_ZL8consumerPv+0x40>
    8000650c:	fa9ff06f          	j	800064b4 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80006510:	00893503          	ld	a0,8(s2)
    80006514:	00001097          	auipc	ra,0x1
    80006518:	238080e7          	jalr	568(ra) # 8000774c <_ZN6Buffer3getEv>
        putc(key);
    8000651c:	0ff57513          	andi	a0,a0,255
    80006520:	fffff097          	auipc	ra,0xfffff
    80006524:	d88080e7          	jalr	-632(ra) # 800052a8 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80006528:	00893503          	ld	a0,8(s2)
    8000652c:	00001097          	auipc	ra,0x1
    80006530:	2ac080e7          	jalr	684(ra) # 800077d8 <_ZN6Buffer6getCntEv>
    80006534:	fca04ee3          	bgtz	a0,80006510 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80006538:	01093503          	ld	a0,16(s2)
    8000653c:	fffff097          	auipc	ra,0xfffff
    80006540:	cbc080e7          	jalr	-836(ra) # 800051f8 <_Z10sem_signalP4_sem>
}
    80006544:	02813083          	ld	ra,40(sp)
    80006548:	02013403          	ld	s0,32(sp)
    8000654c:	01813483          	ld	s1,24(sp)
    80006550:	01013903          	ld	s2,16(sp)
    80006554:	00813983          	ld	s3,8(sp)
    80006558:	03010113          	addi	sp,sp,48
    8000655c:	00008067          	ret

0000000080006560 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80006560:	f9010113          	addi	sp,sp,-112
    80006564:	06113423          	sd	ra,104(sp)
    80006568:	06813023          	sd	s0,96(sp)
    8000656c:	04913c23          	sd	s1,88(sp)
    80006570:	05213823          	sd	s2,80(sp)
    80006574:	05313423          	sd	s3,72(sp)
    80006578:	05413023          	sd	s4,64(sp)
    8000657c:	03513c23          	sd	s5,56(sp)
    80006580:	03613823          	sd	s6,48(sp)
    80006584:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80006588:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    8000658c:	00006517          	auipc	a0,0x6
    80006590:	0f450513          	addi	a0,a0,244 # 8000c680 <_ZTV9Semaphore+0x638>
    80006594:	00001097          	auipc	ra,0x1
    80006598:	dbc080e7          	jalr	-580(ra) # 80007350 <_Z11printStringPKc>
    getString(input, 30);
    8000659c:	01e00593          	li	a1,30
    800065a0:	fa040513          	addi	a0,s0,-96
    800065a4:	00001097          	auipc	ra,0x1
    800065a8:	e34080e7          	jalr	-460(ra) # 800073d8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800065ac:	fa040513          	addi	a0,s0,-96
    800065b0:	00001097          	auipc	ra,0x1
    800065b4:	f00080e7          	jalr	-256(ra) # 800074b0 <_Z11stringToIntPKc>
    800065b8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800065bc:	00006517          	auipc	a0,0x6
    800065c0:	0e450513          	addi	a0,a0,228 # 8000c6a0 <_ZTV9Semaphore+0x658>
    800065c4:	00001097          	auipc	ra,0x1
    800065c8:	d8c080e7          	jalr	-628(ra) # 80007350 <_Z11printStringPKc>
    getString(input, 30);
    800065cc:	01e00593          	li	a1,30
    800065d0:	fa040513          	addi	a0,s0,-96
    800065d4:	00001097          	auipc	ra,0x1
    800065d8:	e04080e7          	jalr	-508(ra) # 800073d8 <_Z9getStringPci>
    n = stringToInt(input);
    800065dc:	fa040513          	addi	a0,s0,-96
    800065e0:	00001097          	auipc	ra,0x1
    800065e4:	ed0080e7          	jalr	-304(ra) # 800074b0 <_Z11stringToIntPKc>
    800065e8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800065ec:	00006517          	auipc	a0,0x6
    800065f0:	0d450513          	addi	a0,a0,212 # 8000c6c0 <_ZTV9Semaphore+0x678>
    800065f4:	00001097          	auipc	ra,0x1
    800065f8:	d5c080e7          	jalr	-676(ra) # 80007350 <_Z11printStringPKc>
    800065fc:	00000613          	li	a2,0
    80006600:	00a00593          	li	a1,10
    80006604:	00090513          	mv	a0,s2
    80006608:	00001097          	auipc	ra,0x1
    8000660c:	ef8080e7          	jalr	-264(ra) # 80007500 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80006610:	00006517          	auipc	a0,0x6
    80006614:	0c850513          	addi	a0,a0,200 # 8000c6d8 <_ZTV9Semaphore+0x690>
    80006618:	00001097          	auipc	ra,0x1
    8000661c:	d38080e7          	jalr	-712(ra) # 80007350 <_Z11printStringPKc>
    80006620:	00000613          	li	a2,0
    80006624:	00a00593          	li	a1,10
    80006628:	00048513          	mv	a0,s1
    8000662c:	00001097          	auipc	ra,0x1
    80006630:	ed4080e7          	jalr	-300(ra) # 80007500 <_Z8printIntiii>
    printString(".\n");
    80006634:	00006517          	auipc	a0,0x6
    80006638:	0bc50513          	addi	a0,a0,188 # 8000c6f0 <_ZTV9Semaphore+0x6a8>
    8000663c:	00001097          	auipc	ra,0x1
    80006640:	d14080e7          	jalr	-748(ra) # 80007350 <_Z11printStringPKc>
    if(threadNum > n) {
    80006644:	0324c463          	blt	s1,s2,8000666c <_Z22producerConsumer_C_APIv+0x10c>
    } else if (threadNum < 1) {
    80006648:	03205c63          	blez	s2,80006680 <_Z22producerConsumer_C_APIv+0x120>
    Buffer *buffer = new Buffer(n);
    8000664c:	03800513          	li	a0,56
    80006650:	ffffb097          	auipc	ra,0xffffb
    80006654:	b4c080e7          	jalr	-1204(ra) # 8000119c <_Znwm>
    80006658:	00050a13          	mv	s4,a0
    8000665c:	00048593          	mv	a1,s1
    80006660:	00001097          	auipc	ra,0x1
    80006664:	fc0080e7          	jalr	-64(ra) # 80007620 <_ZN6BufferC1Ei>
    80006668:	0300006f          	j	80006698 <_Z22producerConsumer_C_APIv+0x138>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000666c:	00006517          	auipc	a0,0x6
    80006670:	08c50513          	addi	a0,a0,140 # 8000c6f8 <_ZTV9Semaphore+0x6b0>
    80006674:	00001097          	auipc	ra,0x1
    80006678:	cdc080e7          	jalr	-804(ra) # 80007350 <_Z11printStringPKc>
        return;
    8000667c:	0140006f          	j	80006690 <_Z22producerConsumer_C_APIv+0x130>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80006680:	00006517          	auipc	a0,0x6
    80006684:	0b850513          	addi	a0,a0,184 # 8000c738 <_ZTV9Semaphore+0x6f0>
    80006688:	00001097          	auipc	ra,0x1
    8000668c:	cc8080e7          	jalr	-824(ra) # 80007350 <_Z11printStringPKc>
        return;
    80006690:	000b0113          	mv	sp,s6
    80006694:	1500006f          	j	800067e4 <_Z22producerConsumer_C_APIv+0x284>
    sem_open(&waitForAll, 0);
    80006698:	00000593          	li	a1,0
    8000669c:	00009517          	auipc	a0,0x9
    800066a0:	b9c50513          	addi	a0,a0,-1124 # 8000f238 <_ZL10waitForAll>
    800066a4:	fffff097          	auipc	ra,0xfffff
    800066a8:	ac4080e7          	jalr	-1340(ra) # 80005168 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    800066ac:	00391793          	slli	a5,s2,0x3
    800066b0:	00f78793          	addi	a5,a5,15
    800066b4:	ff07f793          	andi	a5,a5,-16
    800066b8:	40f10133          	sub	sp,sp,a5
    800066bc:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800066c0:	0019071b          	addiw	a4,s2,1
    800066c4:	00171793          	slli	a5,a4,0x1
    800066c8:	00e787b3          	add	a5,a5,a4
    800066cc:	00379793          	slli	a5,a5,0x3
    800066d0:	00f78793          	addi	a5,a5,15
    800066d4:	ff07f793          	andi	a5,a5,-16
    800066d8:	40f10133          	sub	sp,sp,a5
    800066dc:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800066e0:	00191613          	slli	a2,s2,0x1
    800066e4:	012607b3          	add	a5,a2,s2
    800066e8:	00379793          	slli	a5,a5,0x3
    800066ec:	00f987b3          	add	a5,s3,a5
    800066f0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800066f4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800066f8:	00009717          	auipc	a4,0x9
    800066fc:	b4073703          	ld	a4,-1216(a4) # 8000f238 <_ZL10waitForAll>
    80006700:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80006704:	00078613          	mv	a2,a5
    80006708:	00000597          	auipc	a1,0x0
    8000670c:	d7858593          	addi	a1,a1,-648 # 80006480 <_ZL8consumerPv>
    80006710:	f9840513          	addi	a0,s0,-104
    80006714:	fffff097          	auipc	ra,0xfffff
    80006718:	948080e7          	jalr	-1720(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000671c:	00000493          	li	s1,0
    80006720:	0280006f          	j	80006748 <_Z22producerConsumer_C_APIv+0x1e8>
        thread_create(threads + i,
    80006724:	00000597          	auipc	a1,0x0
    80006728:	c1858593          	addi	a1,a1,-1000 # 8000633c <_ZL16producerKeyboardPv>
                      data + i);
    8000672c:	00179613          	slli	a2,a5,0x1
    80006730:	00f60633          	add	a2,a2,a5
    80006734:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80006738:	00c98633          	add	a2,s3,a2
    8000673c:	fffff097          	auipc	ra,0xfffff
    80006740:	920080e7          	jalr	-1760(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80006744:	0014849b          	addiw	s1,s1,1
    80006748:	0524d263          	bge	s1,s2,8000678c <_Z22producerConsumer_C_APIv+0x22c>
        data[i].id = i;
    8000674c:	00149793          	slli	a5,s1,0x1
    80006750:	009787b3          	add	a5,a5,s1
    80006754:	00379793          	slli	a5,a5,0x3
    80006758:	00f987b3          	add	a5,s3,a5
    8000675c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80006760:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80006764:	00009717          	auipc	a4,0x9
    80006768:	ad473703          	ld	a4,-1324(a4) # 8000f238 <_ZL10waitForAll>
    8000676c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80006770:	00048793          	mv	a5,s1
    80006774:	00349513          	slli	a0,s1,0x3
    80006778:	00aa8533          	add	a0,s5,a0
    8000677c:	fa9054e3          	blez	s1,80006724 <_Z22producerConsumer_C_APIv+0x1c4>
    80006780:	00000597          	auipc	a1,0x0
    80006784:	c6c58593          	addi	a1,a1,-916 # 800063ec <_ZL8producerPv>
    80006788:	fa5ff06f          	j	8000672c <_Z22producerConsumer_C_APIv+0x1cc>
    thread_dispatch();
    8000678c:	fffff097          	auipc	ra,0xfffff
    80006790:	96c080e7          	jalr	-1684(ra) # 800050f8 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80006794:	00000493          	li	s1,0
    80006798:	00994e63          	blt	s2,s1,800067b4 <_Z22producerConsumer_C_APIv+0x254>
        sem_wait(waitForAll);
    8000679c:	00009517          	auipc	a0,0x9
    800067a0:	a9c53503          	ld	a0,-1380(a0) # 8000f238 <_ZL10waitForAll>
    800067a4:	fffff097          	auipc	ra,0xfffff
    800067a8:	a28080e7          	jalr	-1496(ra) # 800051cc <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    800067ac:	0014849b          	addiw	s1,s1,1
    800067b0:	fe9ff06f          	j	80006798 <_Z22producerConsumer_C_APIv+0x238>
    sem_close(waitForAll);
    800067b4:	00009517          	auipc	a0,0x9
    800067b8:	a8453503          	ld	a0,-1404(a0) # 8000f238 <_ZL10waitForAll>
    800067bc:	fffff097          	auipc	ra,0xfffff
    800067c0:	9e4080e7          	jalr	-1564(ra) # 800051a0 <_Z9sem_closeP4_sem>
    delete buffer;
    800067c4:	000a0e63          	beqz	s4,800067e0 <_Z22producerConsumer_C_APIv+0x280>
    800067c8:	000a0513          	mv	a0,s4
    800067cc:	00001097          	auipc	ra,0x1
    800067d0:	094080e7          	jalr	148(ra) # 80007860 <_ZN6BufferD1Ev>
    800067d4:	000a0513          	mv	a0,s4
    800067d8:	ffffb097          	auipc	ra,0xffffb
    800067dc:	9ec080e7          	jalr	-1556(ra) # 800011c4 <_ZdlPv>
    800067e0:	000b0113          	mv	sp,s6

}
    800067e4:	f9040113          	addi	sp,s0,-112
    800067e8:	06813083          	ld	ra,104(sp)
    800067ec:	06013403          	ld	s0,96(sp)
    800067f0:	05813483          	ld	s1,88(sp)
    800067f4:	05013903          	ld	s2,80(sp)
    800067f8:	04813983          	ld	s3,72(sp)
    800067fc:	04013a03          	ld	s4,64(sp)
    80006800:	03813a83          	ld	s5,56(sp)
    80006804:	03013b03          	ld	s6,48(sp)
    80006808:	07010113          	addi	sp,sp,112
    8000680c:	00008067          	ret
    80006810:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80006814:	000a0513          	mv	a0,s4
    80006818:	ffffb097          	auipc	ra,0xffffb
    8000681c:	9ac080e7          	jalr	-1620(ra) # 800011c4 <_ZdlPv>
    80006820:	00048513          	mv	a0,s1
    80006824:	0000a097          	auipc	ra,0xa
    80006828:	b44080e7          	jalr	-1212(ra) # 80010368 <_Unwind_Resume>

000000008000682c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000682c:	fe010113          	addi	sp,sp,-32
    80006830:	00113c23          	sd	ra,24(sp)
    80006834:	00813823          	sd	s0,16(sp)
    80006838:	00913423          	sd	s1,8(sp)
    8000683c:	01213023          	sd	s2,0(sp)
    80006840:	02010413          	addi	s0,sp,32
    80006844:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006848:	00100793          	li	a5,1
    8000684c:	02a7f863          	bgeu	a5,a0,8000687c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006850:	00a00793          	li	a5,10
    80006854:	02f577b3          	remu	a5,a0,a5
    80006858:	02078e63          	beqz	a5,80006894 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000685c:	fff48513          	addi	a0,s1,-1
    80006860:	00000097          	auipc	ra,0x0
    80006864:	fcc080e7          	jalr	-52(ra) # 8000682c <_ZL9fibonaccim>
    80006868:	00050913          	mv	s2,a0
    8000686c:	ffe48513          	addi	a0,s1,-2
    80006870:	00000097          	auipc	ra,0x0
    80006874:	fbc080e7          	jalr	-68(ra) # 8000682c <_ZL9fibonaccim>
    80006878:	00a90533          	add	a0,s2,a0
}
    8000687c:	01813083          	ld	ra,24(sp)
    80006880:	01013403          	ld	s0,16(sp)
    80006884:	00813483          	ld	s1,8(sp)
    80006888:	00013903          	ld	s2,0(sp)
    8000688c:	02010113          	addi	sp,sp,32
    80006890:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006894:	fffff097          	auipc	ra,0xfffff
    80006898:	864080e7          	jalr	-1948(ra) # 800050f8 <_Z15thread_dispatchv>
    8000689c:	fc1ff06f          	j	8000685c <_ZL9fibonaccim+0x30>

00000000800068a0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800068a0:	fe010113          	addi	sp,sp,-32
    800068a4:	00113c23          	sd	ra,24(sp)
    800068a8:	00813823          	sd	s0,16(sp)
    800068ac:	00913423          	sd	s1,8(sp)
    800068b0:	01213023          	sd	s2,0(sp)
    800068b4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800068b8:	00a00493          	li	s1,10
    800068bc:	0400006f          	j	800068fc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800068c0:	00006517          	auipc	a0,0x6
    800068c4:	cb850513          	addi	a0,a0,-840 # 8000c578 <_ZTV9Semaphore+0x530>
    800068c8:	00001097          	auipc	ra,0x1
    800068cc:	a88080e7          	jalr	-1400(ra) # 80007350 <_Z11printStringPKc>
    800068d0:	00000613          	li	a2,0
    800068d4:	00a00593          	li	a1,10
    800068d8:	00048513          	mv	a0,s1
    800068dc:	00001097          	auipc	ra,0x1
    800068e0:	c24080e7          	jalr	-988(ra) # 80007500 <_Z8printIntiii>
    800068e4:	00006517          	auipc	a0,0x6
    800068e8:	fc450513          	addi	a0,a0,-60 # 8000c8a8 <_ZTV9Semaphore+0x860>
    800068ec:	00001097          	auipc	ra,0x1
    800068f0:	a64080e7          	jalr	-1436(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800068f4:	0014849b          	addiw	s1,s1,1
    800068f8:	0ff4f493          	andi	s1,s1,255
    800068fc:	00c00793          	li	a5,12
    80006900:	fc97f0e3          	bgeu	a5,s1,800068c0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006904:	00006517          	auipc	a0,0x6
    80006908:	c7c50513          	addi	a0,a0,-900 # 8000c580 <_ZTV9Semaphore+0x538>
    8000690c:	00001097          	auipc	ra,0x1
    80006910:	a44080e7          	jalr	-1468(ra) # 80007350 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006914:	00500313          	li	t1,5
    thread_dispatch();
    80006918:	ffffe097          	auipc	ra,0xffffe
    8000691c:	7e0080e7          	jalr	2016(ra) # 800050f8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006920:	01000513          	li	a0,16
    80006924:	00000097          	auipc	ra,0x0
    80006928:	f08080e7          	jalr	-248(ra) # 8000682c <_ZL9fibonaccim>
    8000692c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006930:	00006517          	auipc	a0,0x6
    80006934:	c6050513          	addi	a0,a0,-928 # 8000c590 <_ZTV9Semaphore+0x548>
    80006938:	00001097          	auipc	ra,0x1
    8000693c:	a18080e7          	jalr	-1512(ra) # 80007350 <_Z11printStringPKc>
    80006940:	00000613          	li	a2,0
    80006944:	00a00593          	li	a1,10
    80006948:	0009051b          	sext.w	a0,s2
    8000694c:	00001097          	auipc	ra,0x1
    80006950:	bb4080e7          	jalr	-1100(ra) # 80007500 <_Z8printIntiii>
    80006954:	00006517          	auipc	a0,0x6
    80006958:	f5450513          	addi	a0,a0,-172 # 8000c8a8 <_ZTV9Semaphore+0x860>
    8000695c:	00001097          	auipc	ra,0x1
    80006960:	9f4080e7          	jalr	-1548(ra) # 80007350 <_Z11printStringPKc>
    80006964:	0400006f          	j	800069a4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006968:	00006517          	auipc	a0,0x6
    8000696c:	c1050513          	addi	a0,a0,-1008 # 8000c578 <_ZTV9Semaphore+0x530>
    80006970:	00001097          	auipc	ra,0x1
    80006974:	9e0080e7          	jalr	-1568(ra) # 80007350 <_Z11printStringPKc>
    80006978:	00000613          	li	a2,0
    8000697c:	00a00593          	li	a1,10
    80006980:	00048513          	mv	a0,s1
    80006984:	00001097          	auipc	ra,0x1
    80006988:	b7c080e7          	jalr	-1156(ra) # 80007500 <_Z8printIntiii>
    8000698c:	00006517          	auipc	a0,0x6
    80006990:	f1c50513          	addi	a0,a0,-228 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80006994:	00001097          	auipc	ra,0x1
    80006998:	9bc080e7          	jalr	-1604(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000699c:	0014849b          	addiw	s1,s1,1
    800069a0:	0ff4f493          	andi	s1,s1,255
    800069a4:	00f00793          	li	a5,15
    800069a8:	fc97f0e3          	bgeu	a5,s1,80006968 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800069ac:	00006517          	auipc	a0,0x6
    800069b0:	bf450513          	addi	a0,a0,-1036 # 8000c5a0 <_ZTV9Semaphore+0x558>
    800069b4:	00001097          	auipc	ra,0x1
    800069b8:	99c080e7          	jalr	-1636(ra) # 80007350 <_Z11printStringPKc>
    finishedD = true;
    800069bc:	00100793          	li	a5,1
    800069c0:	00009717          	auipc	a4,0x9
    800069c4:	88f70023          	sb	a5,-1920(a4) # 8000f240 <_ZL9finishedD>
    thread_dispatch();
    800069c8:	ffffe097          	auipc	ra,0xffffe
    800069cc:	730080e7          	jalr	1840(ra) # 800050f8 <_Z15thread_dispatchv>
}
    800069d0:	01813083          	ld	ra,24(sp)
    800069d4:	01013403          	ld	s0,16(sp)
    800069d8:	00813483          	ld	s1,8(sp)
    800069dc:	00013903          	ld	s2,0(sp)
    800069e0:	02010113          	addi	sp,sp,32
    800069e4:	00008067          	ret

00000000800069e8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800069e8:	fe010113          	addi	sp,sp,-32
    800069ec:	00113c23          	sd	ra,24(sp)
    800069f0:	00813823          	sd	s0,16(sp)
    800069f4:	00913423          	sd	s1,8(sp)
    800069f8:	01213023          	sd	s2,0(sp)
    800069fc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006a00:	00000493          	li	s1,0
    80006a04:	0400006f          	j	80006a44 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006a08:	00006517          	auipc	a0,0x6
    80006a0c:	ba850513          	addi	a0,a0,-1112 # 8000c5b0 <_ZTV9Semaphore+0x568>
    80006a10:	00001097          	auipc	ra,0x1
    80006a14:	940080e7          	jalr	-1728(ra) # 80007350 <_Z11printStringPKc>
    80006a18:	00000613          	li	a2,0
    80006a1c:	00a00593          	li	a1,10
    80006a20:	00048513          	mv	a0,s1
    80006a24:	00001097          	auipc	ra,0x1
    80006a28:	adc080e7          	jalr	-1316(ra) # 80007500 <_Z8printIntiii>
    80006a2c:	00006517          	auipc	a0,0x6
    80006a30:	e7c50513          	addi	a0,a0,-388 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80006a34:	00001097          	auipc	ra,0x1
    80006a38:	91c080e7          	jalr	-1764(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006a3c:	0014849b          	addiw	s1,s1,1
    80006a40:	0ff4f493          	andi	s1,s1,255
    80006a44:	00200793          	li	a5,2
    80006a48:	fc97f0e3          	bgeu	a5,s1,80006a08 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006a4c:	00006517          	auipc	a0,0x6
    80006a50:	b6c50513          	addi	a0,a0,-1172 # 8000c5b8 <_ZTV9Semaphore+0x570>
    80006a54:	00001097          	auipc	ra,0x1
    80006a58:	8fc080e7          	jalr	-1796(ra) # 80007350 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006a5c:	00700313          	li	t1,7
    thread_dispatch();
    80006a60:	ffffe097          	auipc	ra,0xffffe
    80006a64:	698080e7          	jalr	1688(ra) # 800050f8 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006a68:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006a6c:	00006517          	auipc	a0,0x6
    80006a70:	b5c50513          	addi	a0,a0,-1188 # 8000c5c8 <_ZTV9Semaphore+0x580>
    80006a74:	00001097          	auipc	ra,0x1
    80006a78:	8dc080e7          	jalr	-1828(ra) # 80007350 <_Z11printStringPKc>
    80006a7c:	00000613          	li	a2,0
    80006a80:	00a00593          	li	a1,10
    80006a84:	0009051b          	sext.w	a0,s2
    80006a88:	00001097          	auipc	ra,0x1
    80006a8c:	a78080e7          	jalr	-1416(ra) # 80007500 <_Z8printIntiii>
    80006a90:	00006517          	auipc	a0,0x6
    80006a94:	e1850513          	addi	a0,a0,-488 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80006a98:	00001097          	auipc	ra,0x1
    80006a9c:	8b8080e7          	jalr	-1864(ra) # 80007350 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006aa0:	00c00513          	li	a0,12
    80006aa4:	00000097          	auipc	ra,0x0
    80006aa8:	d88080e7          	jalr	-632(ra) # 8000682c <_ZL9fibonaccim>
    80006aac:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006ab0:	00006517          	auipc	a0,0x6
    80006ab4:	b2050513          	addi	a0,a0,-1248 # 8000c5d0 <_ZTV9Semaphore+0x588>
    80006ab8:	00001097          	auipc	ra,0x1
    80006abc:	898080e7          	jalr	-1896(ra) # 80007350 <_Z11printStringPKc>
    80006ac0:	00000613          	li	a2,0
    80006ac4:	00a00593          	li	a1,10
    80006ac8:	0009051b          	sext.w	a0,s2
    80006acc:	00001097          	auipc	ra,0x1
    80006ad0:	a34080e7          	jalr	-1484(ra) # 80007500 <_Z8printIntiii>
    80006ad4:	00006517          	auipc	a0,0x6
    80006ad8:	dd450513          	addi	a0,a0,-556 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80006adc:	00001097          	auipc	ra,0x1
    80006ae0:	874080e7          	jalr	-1932(ra) # 80007350 <_Z11printStringPKc>
    80006ae4:	0400006f          	j	80006b24 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006ae8:	00006517          	auipc	a0,0x6
    80006aec:	ac850513          	addi	a0,a0,-1336 # 8000c5b0 <_ZTV9Semaphore+0x568>
    80006af0:	00001097          	auipc	ra,0x1
    80006af4:	860080e7          	jalr	-1952(ra) # 80007350 <_Z11printStringPKc>
    80006af8:	00000613          	li	a2,0
    80006afc:	00a00593          	li	a1,10
    80006b00:	00048513          	mv	a0,s1
    80006b04:	00001097          	auipc	ra,0x1
    80006b08:	9fc080e7          	jalr	-1540(ra) # 80007500 <_Z8printIntiii>
    80006b0c:	00006517          	auipc	a0,0x6
    80006b10:	d9c50513          	addi	a0,a0,-612 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80006b14:	00001097          	auipc	ra,0x1
    80006b18:	83c080e7          	jalr	-1988(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006b1c:	0014849b          	addiw	s1,s1,1
    80006b20:	0ff4f493          	andi	s1,s1,255
    80006b24:	00500793          	li	a5,5
    80006b28:	fc97f0e3          	bgeu	a5,s1,80006ae8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006b2c:	00006517          	auipc	a0,0x6
    80006b30:	ab450513          	addi	a0,a0,-1356 # 8000c5e0 <_ZTV9Semaphore+0x598>
    80006b34:	00001097          	auipc	ra,0x1
    80006b38:	81c080e7          	jalr	-2020(ra) # 80007350 <_Z11printStringPKc>
    finishedC = true;
    80006b3c:	00100793          	li	a5,1
    80006b40:	00008717          	auipc	a4,0x8
    80006b44:	70f700a3          	sb	a5,1793(a4) # 8000f241 <_ZL9finishedC>
    thread_dispatch();
    80006b48:	ffffe097          	auipc	ra,0xffffe
    80006b4c:	5b0080e7          	jalr	1456(ra) # 800050f8 <_Z15thread_dispatchv>
}
    80006b50:	01813083          	ld	ra,24(sp)
    80006b54:	01013403          	ld	s0,16(sp)
    80006b58:	00813483          	ld	s1,8(sp)
    80006b5c:	00013903          	ld	s2,0(sp)
    80006b60:	02010113          	addi	sp,sp,32
    80006b64:	00008067          	ret

0000000080006b68 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006b68:	fe010113          	addi	sp,sp,-32
    80006b6c:	00113c23          	sd	ra,24(sp)
    80006b70:	00813823          	sd	s0,16(sp)
    80006b74:	00913423          	sd	s1,8(sp)
    80006b78:	01213023          	sd	s2,0(sp)
    80006b7c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006b80:	00000913          	li	s2,0
    80006b84:	0380006f          	j	80006bbc <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80006b88:	ffffe097          	auipc	ra,0xffffe
    80006b8c:	570080e7          	jalr	1392(ra) # 800050f8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006b90:	00148493          	addi	s1,s1,1
    80006b94:	000027b7          	lui	a5,0x2
    80006b98:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006b9c:	0097ee63          	bltu	a5,s1,80006bb8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006ba0:	00000713          	li	a4,0
    80006ba4:	000077b7          	lui	a5,0x7
    80006ba8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006bac:	fce7eee3          	bltu	a5,a4,80006b88 <_ZL11workerBodyBPv+0x20>
    80006bb0:	00170713          	addi	a4,a4,1
    80006bb4:	ff1ff06f          	j	80006ba4 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006bb8:	00190913          	addi	s2,s2,1
    80006bbc:	00f00793          	li	a5,15
    80006bc0:	0527e063          	bltu	a5,s2,80006c00 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006bc4:	00006517          	auipc	a0,0x6
    80006bc8:	a2c50513          	addi	a0,a0,-1492 # 8000c5f0 <_ZTV9Semaphore+0x5a8>
    80006bcc:	00000097          	auipc	ra,0x0
    80006bd0:	784080e7          	jalr	1924(ra) # 80007350 <_Z11printStringPKc>
    80006bd4:	00000613          	li	a2,0
    80006bd8:	00a00593          	li	a1,10
    80006bdc:	0009051b          	sext.w	a0,s2
    80006be0:	00001097          	auipc	ra,0x1
    80006be4:	920080e7          	jalr	-1760(ra) # 80007500 <_Z8printIntiii>
    80006be8:	00006517          	auipc	a0,0x6
    80006bec:	cc050513          	addi	a0,a0,-832 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80006bf0:	00000097          	auipc	ra,0x0
    80006bf4:	760080e7          	jalr	1888(ra) # 80007350 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006bf8:	00000493          	li	s1,0
    80006bfc:	f99ff06f          	j	80006b94 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80006c00:	00006517          	auipc	a0,0x6
    80006c04:	9f850513          	addi	a0,a0,-1544 # 8000c5f8 <_ZTV9Semaphore+0x5b0>
    80006c08:	00000097          	auipc	ra,0x0
    80006c0c:	748080e7          	jalr	1864(ra) # 80007350 <_Z11printStringPKc>
    finishedB = true;
    80006c10:	00100793          	li	a5,1
    80006c14:	00008717          	auipc	a4,0x8
    80006c18:	62f70723          	sb	a5,1582(a4) # 8000f242 <_ZL9finishedB>
    thread_dispatch();
    80006c1c:	ffffe097          	auipc	ra,0xffffe
    80006c20:	4dc080e7          	jalr	1244(ra) # 800050f8 <_Z15thread_dispatchv>
}
    80006c24:	01813083          	ld	ra,24(sp)
    80006c28:	01013403          	ld	s0,16(sp)
    80006c2c:	00813483          	ld	s1,8(sp)
    80006c30:	00013903          	ld	s2,0(sp)
    80006c34:	02010113          	addi	sp,sp,32
    80006c38:	00008067          	ret

0000000080006c3c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006c3c:	fe010113          	addi	sp,sp,-32
    80006c40:	00113c23          	sd	ra,24(sp)
    80006c44:	00813823          	sd	s0,16(sp)
    80006c48:	00913423          	sd	s1,8(sp)
    80006c4c:	01213023          	sd	s2,0(sp)
    80006c50:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006c54:	00000913          	li	s2,0
    80006c58:	0380006f          	j	80006c90 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006c5c:	ffffe097          	auipc	ra,0xffffe
    80006c60:	49c080e7          	jalr	1180(ra) # 800050f8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006c64:	00148493          	addi	s1,s1,1
    80006c68:	000027b7          	lui	a5,0x2
    80006c6c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006c70:	0097ee63          	bltu	a5,s1,80006c8c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006c74:	00000713          	li	a4,0
    80006c78:	000077b7          	lui	a5,0x7
    80006c7c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006c80:	fce7eee3          	bltu	a5,a4,80006c5c <_ZL11workerBodyAPv+0x20>
    80006c84:	00170713          	addi	a4,a4,1
    80006c88:	ff1ff06f          	j	80006c78 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006c8c:	00190913          	addi	s2,s2,1
    80006c90:	00900793          	li	a5,9
    80006c94:	0527e063          	bltu	a5,s2,80006cd4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006c98:	00006517          	auipc	a0,0x6
    80006c9c:	97050513          	addi	a0,a0,-1680 # 8000c608 <_ZTV9Semaphore+0x5c0>
    80006ca0:	00000097          	auipc	ra,0x0
    80006ca4:	6b0080e7          	jalr	1712(ra) # 80007350 <_Z11printStringPKc>
    80006ca8:	00000613          	li	a2,0
    80006cac:	00a00593          	li	a1,10
    80006cb0:	0009051b          	sext.w	a0,s2
    80006cb4:	00001097          	auipc	ra,0x1
    80006cb8:	84c080e7          	jalr	-1972(ra) # 80007500 <_Z8printIntiii>
    80006cbc:	00006517          	auipc	a0,0x6
    80006cc0:	bec50513          	addi	a0,a0,-1044 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80006cc4:	00000097          	auipc	ra,0x0
    80006cc8:	68c080e7          	jalr	1676(ra) # 80007350 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006ccc:	00000493          	li	s1,0
    80006cd0:	f99ff06f          	j	80006c68 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006cd4:	00006517          	auipc	a0,0x6
    80006cd8:	90c50513          	addi	a0,a0,-1780 # 8000c5e0 <_ZTV9Semaphore+0x598>
    80006cdc:	00000097          	auipc	ra,0x0
    80006ce0:	674080e7          	jalr	1652(ra) # 80007350 <_Z11printStringPKc>
    finishedA = true;
    80006ce4:	00100793          	li	a5,1
    80006ce8:	00008717          	auipc	a4,0x8
    80006cec:	54f70da3          	sb	a5,1371(a4) # 8000f243 <_ZL9finishedA>
}
    80006cf0:	01813083          	ld	ra,24(sp)
    80006cf4:	01013403          	ld	s0,16(sp)
    80006cf8:	00813483          	ld	s1,8(sp)
    80006cfc:	00013903          	ld	s2,0(sp)
    80006d00:	02010113          	addi	sp,sp,32
    80006d04:	00008067          	ret

0000000080006d08 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80006d08:	fd010113          	addi	sp,sp,-48
    80006d0c:	02113423          	sd	ra,40(sp)
    80006d10:	02813023          	sd	s0,32(sp)
    80006d14:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006d18:	00000613          	li	a2,0
    80006d1c:	00000597          	auipc	a1,0x0
    80006d20:	f2058593          	addi	a1,a1,-224 # 80006c3c <_ZL11workerBodyAPv>
    80006d24:	fd040513          	addi	a0,s0,-48
    80006d28:	ffffe097          	auipc	ra,0xffffe
    80006d2c:	334080e7          	jalr	820(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80006d30:	00006517          	auipc	a0,0x6
    80006d34:	8e050513          	addi	a0,a0,-1824 # 8000c610 <_ZTV9Semaphore+0x5c8>
    80006d38:	00000097          	auipc	ra,0x0
    80006d3c:	618080e7          	jalr	1560(ra) # 80007350 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006d40:	00000613          	li	a2,0
    80006d44:	00000597          	auipc	a1,0x0
    80006d48:	e2458593          	addi	a1,a1,-476 # 80006b68 <_ZL11workerBodyBPv>
    80006d4c:	fd840513          	addi	a0,s0,-40
    80006d50:	ffffe097          	auipc	ra,0xffffe
    80006d54:	30c080e7          	jalr	780(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006d58:	00006517          	auipc	a0,0x6
    80006d5c:	8d050513          	addi	a0,a0,-1840 # 8000c628 <_ZTV9Semaphore+0x5e0>
    80006d60:	00000097          	auipc	ra,0x0
    80006d64:	5f0080e7          	jalr	1520(ra) # 80007350 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006d68:	00000613          	li	a2,0
    80006d6c:	00000597          	auipc	a1,0x0
    80006d70:	c7c58593          	addi	a1,a1,-900 # 800069e8 <_ZL11workerBodyCPv>
    80006d74:	fe040513          	addi	a0,s0,-32
    80006d78:	ffffe097          	auipc	ra,0xffffe
    80006d7c:	2e4080e7          	jalr	740(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006d80:	00006517          	auipc	a0,0x6
    80006d84:	8c050513          	addi	a0,a0,-1856 # 8000c640 <_ZTV9Semaphore+0x5f8>
    80006d88:	00000097          	auipc	ra,0x0
    80006d8c:	5c8080e7          	jalr	1480(ra) # 80007350 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006d90:	00000613          	li	a2,0
    80006d94:	00000597          	auipc	a1,0x0
    80006d98:	b0c58593          	addi	a1,a1,-1268 # 800068a0 <_ZL11workerBodyDPv>
    80006d9c:	fe840513          	addi	a0,s0,-24
    80006da0:	ffffe097          	auipc	ra,0xffffe
    80006da4:	2bc080e7          	jalr	700(ra) # 8000505c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006da8:	00006517          	auipc	a0,0x6
    80006dac:	8b050513          	addi	a0,a0,-1872 # 8000c658 <_ZTV9Semaphore+0x610>
    80006db0:	00000097          	auipc	ra,0x0
    80006db4:	5a0080e7          	jalr	1440(ra) # 80007350 <_Z11printStringPKc>
    80006db8:	00c0006f          	j	80006dc4 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006dbc:	ffffe097          	auipc	ra,0xffffe
    80006dc0:	33c080e7          	jalr	828(ra) # 800050f8 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006dc4:	00008797          	auipc	a5,0x8
    80006dc8:	47f7c783          	lbu	a5,1151(a5) # 8000f243 <_ZL9finishedA>
    80006dcc:	fe0788e3          	beqz	a5,80006dbc <_Z18Threads_C_API_testv+0xb4>
    80006dd0:	00008797          	auipc	a5,0x8
    80006dd4:	4727c783          	lbu	a5,1138(a5) # 8000f242 <_ZL9finishedB>
    80006dd8:	fe0782e3          	beqz	a5,80006dbc <_Z18Threads_C_API_testv+0xb4>
    80006ddc:	00008797          	auipc	a5,0x8
    80006de0:	4657c783          	lbu	a5,1125(a5) # 8000f241 <_ZL9finishedC>
    80006de4:	fc078ce3          	beqz	a5,80006dbc <_Z18Threads_C_API_testv+0xb4>
    80006de8:	00008797          	auipc	a5,0x8
    80006dec:	4587c783          	lbu	a5,1112(a5) # 8000f240 <_ZL9finishedD>
    80006df0:	fc0786e3          	beqz	a5,80006dbc <_Z18Threads_C_API_testv+0xb4>
    }

}
    80006df4:	02813083          	ld	ra,40(sp)
    80006df8:	02013403          	ld	s0,32(sp)
    80006dfc:	03010113          	addi	sp,sp,48
    80006e00:	00008067          	ret

0000000080006e04 <_Z8userMainv>:
#include "ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006e04:	fe010113          	addi	sp,sp,-32
    80006e08:	00113c23          	sd	ra,24(sp)
    80006e0c:	00813823          	sd	s0,16(sp)
    80006e10:	00913423          	sd	s1,8(sp)
    80006e14:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006e18:	00006517          	auipc	a0,0x6
    80006e1c:	95050513          	addi	a0,a0,-1712 # 8000c768 <_ZTV9Semaphore+0x720>
    80006e20:	00000097          	auipc	ra,0x0
    80006e24:	530080e7          	jalr	1328(ra) # 80007350 <_Z11printStringPKc>
    int test = getc() - '0';
    80006e28:	ffffe097          	auipc	ra,0xffffe
    80006e2c:	458080e7          	jalr	1112(ra) # 80005280 <_Z4getcv>
    80006e30:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006e34:	ffffe097          	auipc	ra,0xffffe
    80006e38:	44c080e7          	jalr	1100(ra) # 80005280 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006e3c:	00700793          	li	a5,7
    80006e40:	1097e263          	bltu	a5,s1,80006f44 <_Z8userMainv+0x140>
    80006e44:	00249493          	slli	s1,s1,0x2
    80006e48:	00006717          	auipc	a4,0x6
    80006e4c:	b7870713          	addi	a4,a4,-1160 # 8000c9c0 <_ZTV9Semaphore+0x978>
    80006e50:	00e484b3          	add	s1,s1,a4
    80006e54:	0004a783          	lw	a5,0(s1)
    80006e58:	00e787b3          	add	a5,a5,a4
    80006e5c:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006e60:	00000097          	auipc	ra,0x0
    80006e64:	ea8080e7          	jalr	-344(ra) # 80006d08 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006e68:	00006517          	auipc	a0,0x6
    80006e6c:	92050513          	addi	a0,a0,-1760 # 8000c788 <_ZTV9Semaphore+0x740>
    80006e70:	00000097          	auipc	ra,0x0
    80006e74:	4e0080e7          	jalr	1248(ra) # 80007350 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006e78:	01813083          	ld	ra,24(sp)
    80006e7c:	01013403          	ld	s0,16(sp)
    80006e80:	00813483          	ld	s1,8(sp)
    80006e84:	02010113          	addi	sp,sp,32
    80006e88:	00008067          	ret
            Threads_CPP_API_test();
    80006e8c:	00002097          	auipc	ra,0x2
    80006e90:	818080e7          	jalr	-2024(ra) # 800086a4 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006e94:	00006517          	auipc	a0,0x6
    80006e98:	93450513          	addi	a0,a0,-1740 # 8000c7c8 <_ZTV9Semaphore+0x780>
    80006e9c:	00000097          	auipc	ra,0x0
    80006ea0:	4b4080e7          	jalr	1204(ra) # 80007350 <_Z11printStringPKc>
            break;
    80006ea4:	fd5ff06f          	j	80006e78 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006ea8:	fffff097          	auipc	ra,0xfffff
    80006eac:	6b8080e7          	jalr	1720(ra) # 80006560 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006eb0:	00006517          	auipc	a0,0x6
    80006eb4:	95850513          	addi	a0,a0,-1704 # 8000c808 <_ZTV9Semaphore+0x7c0>
    80006eb8:	00000097          	auipc	ra,0x0
    80006ebc:	498080e7          	jalr	1176(ra) # 80007350 <_Z11printStringPKc>
            break;
    80006ec0:	fb9ff06f          	j	80006e78 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006ec4:	00001097          	auipc	ra,0x1
    80006ec8:	cc4080e7          	jalr	-828(ra) # 80007b88 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006ecc:	00006517          	auipc	a0,0x6
    80006ed0:	98c50513          	addi	a0,a0,-1652 # 8000c858 <_ZTV9Semaphore+0x810>
    80006ed4:	00000097          	auipc	ra,0x0
    80006ed8:	47c080e7          	jalr	1148(ra) # 80007350 <_Z11printStringPKc>
            break;
    80006edc:	f9dff06f          	j	80006e78 <_Z8userMainv+0x74>
            testSleeping();
    80006ee0:	fffff097          	auipc	ra,0xfffff
    80006ee4:	3d4080e7          	jalr	980(ra) # 800062b4 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006ee8:	00006517          	auipc	a0,0x6
    80006eec:	9c850513          	addi	a0,a0,-1592 # 8000c8b0 <_ZTV9Semaphore+0x868>
    80006ef0:	00000097          	auipc	ra,0x0
    80006ef4:	460080e7          	jalr	1120(ra) # 80007350 <_Z11printStringPKc>
            break;
    80006ef8:	f81ff06f          	j	80006e78 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006efc:	00002097          	auipc	ra,0x2
    80006f00:	c68080e7          	jalr	-920(ra) # 80008b64 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006f04:	00006517          	auipc	a0,0x6
    80006f08:	9dc50513          	addi	a0,a0,-1572 # 8000c8e0 <_ZTV9Semaphore+0x898>
    80006f0c:	00000097          	auipc	ra,0x0
    80006f10:	444080e7          	jalr	1092(ra) # 80007350 <_Z11printStringPKc>
            break;
    80006f14:	f65ff06f          	j	80006e78 <_Z8userMainv+0x74>
            System_Mode_test();
    80006f18:	fffff097          	auipc	ra,0xfffff
    80006f1c:	1fc080e7          	jalr	508(ra) # 80006114 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006f20:	00006517          	auipc	a0,0x6
    80006f24:	a0050513          	addi	a0,a0,-1536 # 8000c920 <_ZTV9Semaphore+0x8d8>
    80006f28:	00000097          	auipc	ra,0x0
    80006f2c:	428080e7          	jalr	1064(ra) # 80007350 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006f30:	00006517          	auipc	a0,0x6
    80006f34:	a1050513          	addi	a0,a0,-1520 # 8000c940 <_ZTV9Semaphore+0x8f8>
    80006f38:	00000097          	auipc	ra,0x0
    80006f3c:	418080e7          	jalr	1048(ra) # 80007350 <_Z11printStringPKc>
            break;
    80006f40:	f39ff06f          	j	80006e78 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006f44:	00006517          	auipc	a0,0x6
    80006f48:	a5450513          	addi	a0,a0,-1452 # 8000c998 <_ZTV9Semaphore+0x950>
    80006f4c:	00000097          	auipc	ra,0x0
    80006f50:	404080e7          	jalr	1028(ra) # 80007350 <_Z11printStringPKc>
    80006f54:	f25ff06f          	j	80006e78 <_Z8userMainv+0x74>

0000000080006f58 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006f58:	fd010113          	addi	sp,sp,-48
    80006f5c:	02113423          	sd	ra,40(sp)
    80006f60:	02813023          	sd	s0,32(sp)
    80006f64:	00913c23          	sd	s1,24(sp)
    80006f68:	01213823          	sd	s2,16(sp)
    80006f6c:	01313423          	sd	s3,8(sp)
    80006f70:	03010413          	addi	s0,sp,48
    80006f74:	00050493          	mv	s1,a0
    80006f78:	00058913          	mv	s2,a1
    80006f7c:	0015879b          	addiw	a5,a1,1
    80006f80:	0007851b          	sext.w	a0,a5
    80006f84:	00f4a023          	sw	a5,0(s1)
    80006f88:	0004a823          	sw	zero,16(s1)
    80006f8c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006f90:	00251513          	slli	a0,a0,0x2
    80006f94:	ffffe097          	auipc	ra,0xffffe
    80006f98:	06c080e7          	jalr	108(ra) # 80005000 <_Z9mem_allocm>
    80006f9c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006fa0:	01000513          	li	a0,16
    80006fa4:	ffffa097          	auipc	ra,0xffffa
    80006fa8:	1f8080e7          	jalr	504(ra) # 8000119c <_Znwm>
    80006fac:	00050993          	mv	s3,a0
    80006fb0:	00000593          	li	a1,0
    80006fb4:	ffffa097          	auipc	ra,0xffffa
    80006fb8:	420080e7          	jalr	1056(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006fbc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006fc0:	01000513          	li	a0,16
    80006fc4:	ffffa097          	auipc	ra,0xffffa
    80006fc8:	1d8080e7          	jalr	472(ra) # 8000119c <_Znwm>
    80006fcc:	00050993          	mv	s3,a0
    80006fd0:	00090593          	mv	a1,s2
    80006fd4:	ffffa097          	auipc	ra,0xffffa
    80006fd8:	400080e7          	jalr	1024(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006fdc:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006fe0:	01000513          	li	a0,16
    80006fe4:	ffffa097          	auipc	ra,0xffffa
    80006fe8:	1b8080e7          	jalr	440(ra) # 8000119c <_Znwm>
    80006fec:	00050913          	mv	s2,a0
    80006ff0:	00100593          	li	a1,1
    80006ff4:	ffffa097          	auipc	ra,0xffffa
    80006ff8:	3e0080e7          	jalr	992(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006ffc:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80007000:	01000513          	li	a0,16
    80007004:	ffffa097          	auipc	ra,0xffffa
    80007008:	198080e7          	jalr	408(ra) # 8000119c <_Znwm>
    8000700c:	00050913          	mv	s2,a0
    80007010:	00100593          	li	a1,1
    80007014:	ffffa097          	auipc	ra,0xffffa
    80007018:	3c0080e7          	jalr	960(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    8000701c:	0324b823          	sd	s2,48(s1)
}
    80007020:	02813083          	ld	ra,40(sp)
    80007024:	02013403          	ld	s0,32(sp)
    80007028:	01813483          	ld	s1,24(sp)
    8000702c:	01013903          	ld	s2,16(sp)
    80007030:	00813983          	ld	s3,8(sp)
    80007034:	03010113          	addi	sp,sp,48
    80007038:	00008067          	ret
    8000703c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80007040:	00098513          	mv	a0,s3
    80007044:	ffffa097          	auipc	ra,0xffffa
    80007048:	180080e7          	jalr	384(ra) # 800011c4 <_ZdlPv>
    8000704c:	00048513          	mv	a0,s1
    80007050:	00009097          	auipc	ra,0x9
    80007054:	318080e7          	jalr	792(ra) # 80010368 <_Unwind_Resume>
    80007058:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000705c:	00098513          	mv	a0,s3
    80007060:	ffffa097          	auipc	ra,0xffffa
    80007064:	164080e7          	jalr	356(ra) # 800011c4 <_ZdlPv>
    80007068:	00048513          	mv	a0,s1
    8000706c:	00009097          	auipc	ra,0x9
    80007070:	2fc080e7          	jalr	764(ra) # 80010368 <_Unwind_Resume>
    80007074:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80007078:	00090513          	mv	a0,s2
    8000707c:	ffffa097          	auipc	ra,0xffffa
    80007080:	148080e7          	jalr	328(ra) # 800011c4 <_ZdlPv>
    80007084:	00048513          	mv	a0,s1
    80007088:	00009097          	auipc	ra,0x9
    8000708c:	2e0080e7          	jalr	736(ra) # 80010368 <_Unwind_Resume>
    80007090:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80007094:	00090513          	mv	a0,s2
    80007098:	ffffa097          	auipc	ra,0xffffa
    8000709c:	12c080e7          	jalr	300(ra) # 800011c4 <_ZdlPv>
    800070a0:	00048513          	mv	a0,s1
    800070a4:	00009097          	auipc	ra,0x9
    800070a8:	2c4080e7          	jalr	708(ra) # 80010368 <_Unwind_Resume>

00000000800070ac <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800070ac:	fe010113          	addi	sp,sp,-32
    800070b0:	00113c23          	sd	ra,24(sp)
    800070b4:	00813823          	sd	s0,16(sp)
    800070b8:	00913423          	sd	s1,8(sp)
    800070bc:	01213023          	sd	s2,0(sp)
    800070c0:	02010413          	addi	s0,sp,32
    800070c4:	00050493          	mv	s1,a0
    800070c8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800070cc:	01853503          	ld	a0,24(a0)
    800070d0:	ffffa097          	auipc	ra,0xffffa
    800070d4:	33c080e7          	jalr	828(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800070d8:	0304b503          	ld	a0,48(s1)
    800070dc:	ffffa097          	auipc	ra,0xffffa
    800070e0:	330080e7          	jalr	816(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800070e4:	0084b783          	ld	a5,8(s1)
    800070e8:	0144a703          	lw	a4,20(s1)
    800070ec:	00271713          	slli	a4,a4,0x2
    800070f0:	00e787b3          	add	a5,a5,a4
    800070f4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800070f8:	0144a783          	lw	a5,20(s1)
    800070fc:	0017879b          	addiw	a5,a5,1
    80007100:	0004a703          	lw	a4,0(s1)
    80007104:	02e7e7bb          	remw	a5,a5,a4
    80007108:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000710c:	0304b503          	ld	a0,48(s1)
    80007110:	ffffa097          	auipc	ra,0xffffa
    80007114:	328080e7          	jalr	808(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80007118:	0204b503          	ld	a0,32(s1)
    8000711c:	ffffa097          	auipc	ra,0xffffa
    80007120:	31c080e7          	jalr	796(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    80007124:	01813083          	ld	ra,24(sp)
    80007128:	01013403          	ld	s0,16(sp)
    8000712c:	00813483          	ld	s1,8(sp)
    80007130:	00013903          	ld	s2,0(sp)
    80007134:	02010113          	addi	sp,sp,32
    80007138:	00008067          	ret

000000008000713c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000713c:	fe010113          	addi	sp,sp,-32
    80007140:	00113c23          	sd	ra,24(sp)
    80007144:	00813823          	sd	s0,16(sp)
    80007148:	00913423          	sd	s1,8(sp)
    8000714c:	01213023          	sd	s2,0(sp)
    80007150:	02010413          	addi	s0,sp,32
    80007154:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80007158:	02053503          	ld	a0,32(a0)
    8000715c:	ffffa097          	auipc	ra,0xffffa
    80007160:	2b0080e7          	jalr	688(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80007164:	0284b503          	ld	a0,40(s1)
    80007168:	ffffa097          	auipc	ra,0xffffa
    8000716c:	2a4080e7          	jalr	676(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80007170:	0084b703          	ld	a4,8(s1)
    80007174:	0104a783          	lw	a5,16(s1)
    80007178:	00279693          	slli	a3,a5,0x2
    8000717c:	00d70733          	add	a4,a4,a3
    80007180:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007184:	0017879b          	addiw	a5,a5,1
    80007188:	0004a703          	lw	a4,0(s1)
    8000718c:	02e7e7bb          	remw	a5,a5,a4
    80007190:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80007194:	0284b503          	ld	a0,40(s1)
    80007198:	ffffa097          	auipc	ra,0xffffa
    8000719c:	2a0080e7          	jalr	672(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800071a0:	0184b503          	ld	a0,24(s1)
    800071a4:	ffffa097          	auipc	ra,0xffffa
    800071a8:	294080e7          	jalr	660(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    800071ac:	00090513          	mv	a0,s2
    800071b0:	01813083          	ld	ra,24(sp)
    800071b4:	01013403          	ld	s0,16(sp)
    800071b8:	00813483          	ld	s1,8(sp)
    800071bc:	00013903          	ld	s2,0(sp)
    800071c0:	02010113          	addi	sp,sp,32
    800071c4:	00008067          	ret

00000000800071c8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800071c8:	fe010113          	addi	sp,sp,-32
    800071cc:	00113c23          	sd	ra,24(sp)
    800071d0:	00813823          	sd	s0,16(sp)
    800071d4:	00913423          	sd	s1,8(sp)
    800071d8:	01213023          	sd	s2,0(sp)
    800071dc:	02010413          	addi	s0,sp,32
    800071e0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800071e4:	02853503          	ld	a0,40(a0)
    800071e8:	ffffa097          	auipc	ra,0xffffa
    800071ec:	224080e7          	jalr	548(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800071f0:	0304b503          	ld	a0,48(s1)
    800071f4:	ffffa097          	auipc	ra,0xffffa
    800071f8:	218080e7          	jalr	536(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800071fc:	0144a783          	lw	a5,20(s1)
    80007200:	0104a903          	lw	s2,16(s1)
    80007204:	0327ce63          	blt	a5,s2,80007240 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80007208:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000720c:	0304b503          	ld	a0,48(s1)
    80007210:	ffffa097          	auipc	ra,0xffffa
    80007214:	228080e7          	jalr	552(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80007218:	0284b503          	ld	a0,40(s1)
    8000721c:	ffffa097          	auipc	ra,0xffffa
    80007220:	21c080e7          	jalr	540(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80007224:	00090513          	mv	a0,s2
    80007228:	01813083          	ld	ra,24(sp)
    8000722c:	01013403          	ld	s0,16(sp)
    80007230:	00813483          	ld	s1,8(sp)
    80007234:	00013903          	ld	s2,0(sp)
    80007238:	02010113          	addi	sp,sp,32
    8000723c:	00008067          	ret
        ret = cap - head + tail;
    80007240:	0004a703          	lw	a4,0(s1)
    80007244:	4127093b          	subw	s2,a4,s2
    80007248:	00f9093b          	addw	s2,s2,a5
    8000724c:	fc1ff06f          	j	8000720c <_ZN9BufferCPP6getCntEv+0x44>

0000000080007250 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80007250:	fe010113          	addi	sp,sp,-32
    80007254:	00113c23          	sd	ra,24(sp)
    80007258:	00813823          	sd	s0,16(sp)
    8000725c:	00913423          	sd	s1,8(sp)
    80007260:	02010413          	addi	s0,sp,32
    80007264:	00050493          	mv	s1,a0
    Console::putc('\n');
    80007268:	00a00513          	li	a0,10
    8000726c:	ffffa097          	auipc	ra,0xffffa
    80007270:	220080e7          	jalr	544(ra) # 8000148c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80007274:	00005517          	auipc	a0,0x5
    80007278:	76c50513          	addi	a0,a0,1900 # 8000c9e0 <_ZTV9Semaphore+0x998>
    8000727c:	00000097          	auipc	ra,0x0
    80007280:	0d4080e7          	jalr	212(ra) # 80007350 <_Z11printStringPKc>
    while (getCnt()) {
    80007284:	00048513          	mv	a0,s1
    80007288:	00000097          	auipc	ra,0x0
    8000728c:	f40080e7          	jalr	-192(ra) # 800071c8 <_ZN9BufferCPP6getCntEv>
    80007290:	02050c63          	beqz	a0,800072c8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80007294:	0084b783          	ld	a5,8(s1)
    80007298:	0104a703          	lw	a4,16(s1)
    8000729c:	00271713          	slli	a4,a4,0x2
    800072a0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800072a4:	0007c503          	lbu	a0,0(a5)
    800072a8:	ffffa097          	auipc	ra,0xffffa
    800072ac:	1e4080e7          	jalr	484(ra) # 8000148c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800072b0:	0104a783          	lw	a5,16(s1)
    800072b4:	0017879b          	addiw	a5,a5,1
    800072b8:	0004a703          	lw	a4,0(s1)
    800072bc:	02e7e7bb          	remw	a5,a5,a4
    800072c0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800072c4:	fc1ff06f          	j	80007284 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800072c8:	02100513          	li	a0,33
    800072cc:	ffffa097          	auipc	ra,0xffffa
    800072d0:	1c0080e7          	jalr	448(ra) # 8000148c <_ZN7Console4putcEc>
    Console::putc('\n');
    800072d4:	00a00513          	li	a0,10
    800072d8:	ffffa097          	auipc	ra,0xffffa
    800072dc:	1b4080e7          	jalr	436(ra) # 8000148c <_ZN7Console4putcEc>
    mem_free(buffer);
    800072e0:	0084b503          	ld	a0,8(s1)
    800072e4:	ffffe097          	auipc	ra,0xffffe
    800072e8:	d4c080e7          	jalr	-692(ra) # 80005030 <_Z8mem_freePv>
    delete itemAvailable;
    800072ec:	0204b503          	ld	a0,32(s1)
    800072f0:	00050863          	beqz	a0,80007300 <_ZN9BufferCPPD1Ev+0xb0>
    800072f4:	00053783          	ld	a5,0(a0)
    800072f8:	0087b783          	ld	a5,8(a5)
    800072fc:	000780e7          	jalr	a5
    delete spaceAvailable;
    80007300:	0184b503          	ld	a0,24(s1)
    80007304:	00050863          	beqz	a0,80007314 <_ZN9BufferCPPD1Ev+0xc4>
    80007308:	00053783          	ld	a5,0(a0)
    8000730c:	0087b783          	ld	a5,8(a5)
    80007310:	000780e7          	jalr	a5
    delete mutexTail;
    80007314:	0304b503          	ld	a0,48(s1)
    80007318:	00050863          	beqz	a0,80007328 <_ZN9BufferCPPD1Ev+0xd8>
    8000731c:	00053783          	ld	a5,0(a0)
    80007320:	0087b783          	ld	a5,8(a5)
    80007324:	000780e7          	jalr	a5
    delete mutexHead;
    80007328:	0284b503          	ld	a0,40(s1)
    8000732c:	00050863          	beqz	a0,8000733c <_ZN9BufferCPPD1Ev+0xec>
    80007330:	00053783          	ld	a5,0(a0)
    80007334:	0087b783          	ld	a5,8(a5)
    80007338:	000780e7          	jalr	a5
}
    8000733c:	01813083          	ld	ra,24(sp)
    80007340:	01013403          	ld	s0,16(sp)
    80007344:	00813483          	ld	s1,8(sp)
    80007348:	02010113          	addi	sp,sp,32
    8000734c:	00008067          	ret

0000000080007350 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80007350:	fe010113          	addi	sp,sp,-32
    80007354:	00113c23          	sd	ra,24(sp)
    80007358:	00813823          	sd	s0,16(sp)
    8000735c:	00913423          	sd	s1,8(sp)
    80007360:	02010413          	addi	s0,sp,32
    80007364:	00050493          	mv	s1,a0
    LOCK();
    80007368:	00100613          	li	a2,1
    8000736c:	00000593          	li	a1,0
    80007370:	00008517          	auipc	a0,0x8
    80007374:	ed850513          	addi	a0,a0,-296 # 8000f248 <lockPrint>
    80007378:	ffffa097          	auipc	ra,0xffffa
    8000737c:	db4080e7          	jalr	-588(ra) # 8000112c <copy_and_swap>
    80007380:	00050863          	beqz	a0,80007390 <_Z11printStringPKc+0x40>
    80007384:	ffffe097          	auipc	ra,0xffffe
    80007388:	d74080e7          	jalr	-652(ra) # 800050f8 <_Z15thread_dispatchv>
    8000738c:	fddff06f          	j	80007368 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80007390:	0004c503          	lbu	a0,0(s1)
    80007394:	00050a63          	beqz	a0,800073a8 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80007398:	ffffe097          	auipc	ra,0xffffe
    8000739c:	f10080e7          	jalr	-240(ra) # 800052a8 <_Z4putcc>
        string++;
    800073a0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800073a4:	fedff06f          	j	80007390 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800073a8:	00000613          	li	a2,0
    800073ac:	00100593          	li	a1,1
    800073b0:	00008517          	auipc	a0,0x8
    800073b4:	e9850513          	addi	a0,a0,-360 # 8000f248 <lockPrint>
    800073b8:	ffffa097          	auipc	ra,0xffffa
    800073bc:	d74080e7          	jalr	-652(ra) # 8000112c <copy_and_swap>
    800073c0:	fe0514e3          	bnez	a0,800073a8 <_Z11printStringPKc+0x58>
}
    800073c4:	01813083          	ld	ra,24(sp)
    800073c8:	01013403          	ld	s0,16(sp)
    800073cc:	00813483          	ld	s1,8(sp)
    800073d0:	02010113          	addi	sp,sp,32
    800073d4:	00008067          	ret

00000000800073d8 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800073d8:	fd010113          	addi	sp,sp,-48
    800073dc:	02113423          	sd	ra,40(sp)
    800073e0:	02813023          	sd	s0,32(sp)
    800073e4:	00913c23          	sd	s1,24(sp)
    800073e8:	01213823          	sd	s2,16(sp)
    800073ec:	01313423          	sd	s3,8(sp)
    800073f0:	01413023          	sd	s4,0(sp)
    800073f4:	03010413          	addi	s0,sp,48
    800073f8:	00050993          	mv	s3,a0
    800073fc:	00058a13          	mv	s4,a1
    LOCK();
    80007400:	00100613          	li	a2,1
    80007404:	00000593          	li	a1,0
    80007408:	00008517          	auipc	a0,0x8
    8000740c:	e4050513          	addi	a0,a0,-448 # 8000f248 <lockPrint>
    80007410:	ffffa097          	auipc	ra,0xffffa
    80007414:	d1c080e7          	jalr	-740(ra) # 8000112c <copy_and_swap>
    80007418:	00050863          	beqz	a0,80007428 <_Z9getStringPci+0x50>
    8000741c:	ffffe097          	auipc	ra,0xffffe
    80007420:	cdc080e7          	jalr	-804(ra) # 800050f8 <_Z15thread_dispatchv>
    80007424:	fddff06f          	j	80007400 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80007428:	00000913          	li	s2,0
    8000742c:	00090493          	mv	s1,s2
    80007430:	0019091b          	addiw	s2,s2,1
    80007434:	03495a63          	bge	s2,s4,80007468 <_Z9getStringPci+0x90>
        cc = getc();
    80007438:	ffffe097          	auipc	ra,0xffffe
    8000743c:	e48080e7          	jalr	-440(ra) # 80005280 <_Z4getcv>
        if(cc < 1)
    80007440:	02050463          	beqz	a0,80007468 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007444:	009984b3          	add	s1,s3,s1
    80007448:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000744c:	00a00793          	li	a5,10
    80007450:	00f50a63          	beq	a0,a5,80007464 <_Z9getStringPci+0x8c>
    80007454:	00d00793          	li	a5,13
    80007458:	fcf51ae3          	bne	a0,a5,8000742c <_Z9getStringPci+0x54>
        buf[i++] = c;
    8000745c:	00090493          	mv	s1,s2
    80007460:	0080006f          	j	80007468 <_Z9getStringPci+0x90>
    80007464:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007468:	009984b3          	add	s1,s3,s1
    8000746c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80007470:	00000613          	li	a2,0
    80007474:	00100593          	li	a1,1
    80007478:	00008517          	auipc	a0,0x8
    8000747c:	dd050513          	addi	a0,a0,-560 # 8000f248 <lockPrint>
    80007480:	ffffa097          	auipc	ra,0xffffa
    80007484:	cac080e7          	jalr	-852(ra) # 8000112c <copy_and_swap>
    80007488:	fe0514e3          	bnez	a0,80007470 <_Z9getStringPci+0x98>
    return buf;
}
    8000748c:	00098513          	mv	a0,s3
    80007490:	02813083          	ld	ra,40(sp)
    80007494:	02013403          	ld	s0,32(sp)
    80007498:	01813483          	ld	s1,24(sp)
    8000749c:	01013903          	ld	s2,16(sp)
    800074a0:	00813983          	ld	s3,8(sp)
    800074a4:	00013a03          	ld	s4,0(sp)
    800074a8:	03010113          	addi	sp,sp,48
    800074ac:	00008067          	ret

00000000800074b0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800074b0:	ff010113          	addi	sp,sp,-16
    800074b4:	00813423          	sd	s0,8(sp)
    800074b8:	01010413          	addi	s0,sp,16
    800074bc:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800074c0:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800074c4:	0006c603          	lbu	a2,0(a3)
    800074c8:	fd06071b          	addiw	a4,a2,-48
    800074cc:	0ff77713          	andi	a4,a4,255
    800074d0:	00900793          	li	a5,9
    800074d4:	02e7e063          	bltu	a5,a4,800074f4 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800074d8:	0025179b          	slliw	a5,a0,0x2
    800074dc:	00a787bb          	addw	a5,a5,a0
    800074e0:	0017979b          	slliw	a5,a5,0x1
    800074e4:	00168693          	addi	a3,a3,1
    800074e8:	00c787bb          	addw	a5,a5,a2
    800074ec:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800074f0:	fd5ff06f          	j	800074c4 <_Z11stringToIntPKc+0x14>
    return n;
}
    800074f4:	00813403          	ld	s0,8(sp)
    800074f8:	01010113          	addi	sp,sp,16
    800074fc:	00008067          	ret

0000000080007500 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80007500:	fc010113          	addi	sp,sp,-64
    80007504:	02113c23          	sd	ra,56(sp)
    80007508:	02813823          	sd	s0,48(sp)
    8000750c:	02913423          	sd	s1,40(sp)
    80007510:	03213023          	sd	s2,32(sp)
    80007514:	01313c23          	sd	s3,24(sp)
    80007518:	04010413          	addi	s0,sp,64
    8000751c:	00050493          	mv	s1,a0
    80007520:	00058913          	mv	s2,a1
    80007524:	00060993          	mv	s3,a2
    LOCK();
    80007528:	00100613          	li	a2,1
    8000752c:	00000593          	li	a1,0
    80007530:	00008517          	auipc	a0,0x8
    80007534:	d1850513          	addi	a0,a0,-744 # 8000f248 <lockPrint>
    80007538:	ffffa097          	auipc	ra,0xffffa
    8000753c:	bf4080e7          	jalr	-1036(ra) # 8000112c <copy_and_swap>
    80007540:	00050863          	beqz	a0,80007550 <_Z8printIntiii+0x50>
    80007544:	ffffe097          	auipc	ra,0xffffe
    80007548:	bb4080e7          	jalr	-1100(ra) # 800050f8 <_Z15thread_dispatchv>
    8000754c:	fddff06f          	j	80007528 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80007550:	00098463          	beqz	s3,80007558 <_Z8printIntiii+0x58>
    80007554:	0804c463          	bltz	s1,800075dc <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80007558:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000755c:	00000593          	li	a1,0
    }

    i = 0;
    80007560:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007564:	0009079b          	sext.w	a5,s2
    80007568:	0325773b          	remuw	a4,a0,s2
    8000756c:	00048613          	mv	a2,s1
    80007570:	0014849b          	addiw	s1,s1,1
    80007574:	02071693          	slli	a3,a4,0x20
    80007578:	0206d693          	srli	a3,a3,0x20
    8000757c:	00008717          	auipc	a4,0x8
    80007580:	c0470713          	addi	a4,a4,-1020 # 8000f180 <digits>
    80007584:	00d70733          	add	a4,a4,a3
    80007588:	00074683          	lbu	a3,0(a4)
    8000758c:	fd040713          	addi	a4,s0,-48
    80007590:	00c70733          	add	a4,a4,a2
    80007594:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80007598:	0005071b          	sext.w	a4,a0
    8000759c:	0325553b          	divuw	a0,a0,s2
    800075a0:	fcf772e3          	bgeu	a4,a5,80007564 <_Z8printIntiii+0x64>
    if(neg)
    800075a4:	00058c63          	beqz	a1,800075bc <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800075a8:	fd040793          	addi	a5,s0,-48
    800075ac:	009784b3          	add	s1,a5,s1
    800075b0:	02d00793          	li	a5,45
    800075b4:	fef48823          	sb	a5,-16(s1)
    800075b8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800075bc:	fff4849b          	addiw	s1,s1,-1
    800075c0:	0204c463          	bltz	s1,800075e8 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800075c4:	fd040793          	addi	a5,s0,-48
    800075c8:	009787b3          	add	a5,a5,s1
    800075cc:	ff07c503          	lbu	a0,-16(a5)
    800075d0:	ffffe097          	auipc	ra,0xffffe
    800075d4:	cd8080e7          	jalr	-808(ra) # 800052a8 <_Z4putcc>
    800075d8:	fe5ff06f          	j	800075bc <_Z8printIntiii+0xbc>
        x = -xx;
    800075dc:	4090053b          	negw	a0,s1
        neg = 1;
    800075e0:	00100593          	li	a1,1
        x = -xx;
    800075e4:	f7dff06f          	j	80007560 <_Z8printIntiii+0x60>

    UNLOCK();
    800075e8:	00000613          	li	a2,0
    800075ec:	00100593          	li	a1,1
    800075f0:	00008517          	auipc	a0,0x8
    800075f4:	c5850513          	addi	a0,a0,-936 # 8000f248 <lockPrint>
    800075f8:	ffffa097          	auipc	ra,0xffffa
    800075fc:	b34080e7          	jalr	-1228(ra) # 8000112c <copy_and_swap>
    80007600:	fe0514e3          	bnez	a0,800075e8 <_Z8printIntiii+0xe8>
    80007604:	03813083          	ld	ra,56(sp)
    80007608:	03013403          	ld	s0,48(sp)
    8000760c:	02813483          	ld	s1,40(sp)
    80007610:	02013903          	ld	s2,32(sp)
    80007614:	01813983          	ld	s3,24(sp)
    80007618:	04010113          	addi	sp,sp,64
    8000761c:	00008067          	ret

0000000080007620 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80007620:	fe010113          	addi	sp,sp,-32
    80007624:	00113c23          	sd	ra,24(sp)
    80007628:	00813823          	sd	s0,16(sp)
    8000762c:	00913423          	sd	s1,8(sp)
    80007630:	01213023          	sd	s2,0(sp)
    80007634:	02010413          	addi	s0,sp,32
    80007638:	00050493          	mv	s1,a0
    8000763c:	00058913          	mv	s2,a1
    80007640:	0015879b          	addiw	a5,a1,1
    80007644:	0007851b          	sext.w	a0,a5
    80007648:	00f4a023          	sw	a5,0(s1)
    8000764c:	0004a823          	sw	zero,16(s1)
    80007650:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80007654:	00251513          	slli	a0,a0,0x2
    80007658:	ffffe097          	auipc	ra,0xffffe
    8000765c:	9a8080e7          	jalr	-1624(ra) # 80005000 <_Z9mem_allocm>
    80007660:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80007664:	00000593          	li	a1,0
    80007668:	02048513          	addi	a0,s1,32
    8000766c:	ffffe097          	auipc	ra,0xffffe
    80007670:	afc080e7          	jalr	-1284(ra) # 80005168 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80007674:	00090593          	mv	a1,s2
    80007678:	01848513          	addi	a0,s1,24
    8000767c:	ffffe097          	auipc	ra,0xffffe
    80007680:	aec080e7          	jalr	-1300(ra) # 80005168 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80007684:	00100593          	li	a1,1
    80007688:	02848513          	addi	a0,s1,40
    8000768c:	ffffe097          	auipc	ra,0xffffe
    80007690:	adc080e7          	jalr	-1316(ra) # 80005168 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80007694:	00100593          	li	a1,1
    80007698:	03048513          	addi	a0,s1,48
    8000769c:	ffffe097          	auipc	ra,0xffffe
    800076a0:	acc080e7          	jalr	-1332(ra) # 80005168 <_Z8sem_openPP4_semj>
}
    800076a4:	01813083          	ld	ra,24(sp)
    800076a8:	01013403          	ld	s0,16(sp)
    800076ac:	00813483          	ld	s1,8(sp)
    800076b0:	00013903          	ld	s2,0(sp)
    800076b4:	02010113          	addi	sp,sp,32
    800076b8:	00008067          	ret

00000000800076bc <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800076bc:	fe010113          	addi	sp,sp,-32
    800076c0:	00113c23          	sd	ra,24(sp)
    800076c4:	00813823          	sd	s0,16(sp)
    800076c8:	00913423          	sd	s1,8(sp)
    800076cc:	01213023          	sd	s2,0(sp)
    800076d0:	02010413          	addi	s0,sp,32
    800076d4:	00050493          	mv	s1,a0
    800076d8:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800076dc:	01853503          	ld	a0,24(a0)
    800076e0:	ffffe097          	auipc	ra,0xffffe
    800076e4:	aec080e7          	jalr	-1300(ra) # 800051cc <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800076e8:	0304b503          	ld	a0,48(s1)
    800076ec:	ffffe097          	auipc	ra,0xffffe
    800076f0:	ae0080e7          	jalr	-1312(ra) # 800051cc <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800076f4:	0084b783          	ld	a5,8(s1)
    800076f8:	0144a703          	lw	a4,20(s1)
    800076fc:	00271713          	slli	a4,a4,0x2
    80007700:	00e787b3          	add	a5,a5,a4
    80007704:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80007708:	0144a783          	lw	a5,20(s1)
    8000770c:	0017879b          	addiw	a5,a5,1
    80007710:	0004a703          	lw	a4,0(s1)
    80007714:	02e7e7bb          	remw	a5,a5,a4
    80007718:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    8000771c:	0304b503          	ld	a0,48(s1)
    80007720:	ffffe097          	auipc	ra,0xffffe
    80007724:	ad8080e7          	jalr	-1320(ra) # 800051f8 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80007728:	0204b503          	ld	a0,32(s1)
    8000772c:	ffffe097          	auipc	ra,0xffffe
    80007730:	acc080e7          	jalr	-1332(ra) # 800051f8 <_Z10sem_signalP4_sem>

}
    80007734:	01813083          	ld	ra,24(sp)
    80007738:	01013403          	ld	s0,16(sp)
    8000773c:	00813483          	ld	s1,8(sp)
    80007740:	00013903          	ld	s2,0(sp)
    80007744:	02010113          	addi	sp,sp,32
    80007748:	00008067          	ret

000000008000774c <_ZN6Buffer3getEv>:

int Buffer::get() {
    8000774c:	fe010113          	addi	sp,sp,-32
    80007750:	00113c23          	sd	ra,24(sp)
    80007754:	00813823          	sd	s0,16(sp)
    80007758:	00913423          	sd	s1,8(sp)
    8000775c:	01213023          	sd	s2,0(sp)
    80007760:	02010413          	addi	s0,sp,32
    80007764:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80007768:	02053503          	ld	a0,32(a0)
    8000776c:	ffffe097          	auipc	ra,0xffffe
    80007770:	a60080e7          	jalr	-1440(ra) # 800051cc <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80007774:	0284b503          	ld	a0,40(s1)
    80007778:	ffffe097          	auipc	ra,0xffffe
    8000777c:	a54080e7          	jalr	-1452(ra) # 800051cc <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80007780:	0084b703          	ld	a4,8(s1)
    80007784:	0104a783          	lw	a5,16(s1)
    80007788:	00279693          	slli	a3,a5,0x2
    8000778c:	00d70733          	add	a4,a4,a3
    80007790:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007794:	0017879b          	addiw	a5,a5,1
    80007798:	0004a703          	lw	a4,0(s1)
    8000779c:	02e7e7bb          	remw	a5,a5,a4
    800077a0:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800077a4:	0284b503          	ld	a0,40(s1)
    800077a8:	ffffe097          	auipc	ra,0xffffe
    800077ac:	a50080e7          	jalr	-1456(ra) # 800051f8 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    800077b0:	0184b503          	ld	a0,24(s1)
    800077b4:	ffffe097          	auipc	ra,0xffffe
    800077b8:	a44080e7          	jalr	-1468(ra) # 800051f8 <_Z10sem_signalP4_sem>

    return ret;
}
    800077bc:	00090513          	mv	a0,s2
    800077c0:	01813083          	ld	ra,24(sp)
    800077c4:	01013403          	ld	s0,16(sp)
    800077c8:	00813483          	ld	s1,8(sp)
    800077cc:	00013903          	ld	s2,0(sp)
    800077d0:	02010113          	addi	sp,sp,32
    800077d4:	00008067          	ret

00000000800077d8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800077d8:	fe010113          	addi	sp,sp,-32
    800077dc:	00113c23          	sd	ra,24(sp)
    800077e0:	00813823          	sd	s0,16(sp)
    800077e4:	00913423          	sd	s1,8(sp)
    800077e8:	01213023          	sd	s2,0(sp)
    800077ec:	02010413          	addi	s0,sp,32
    800077f0:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800077f4:	02853503          	ld	a0,40(a0)
    800077f8:	ffffe097          	auipc	ra,0xffffe
    800077fc:	9d4080e7          	jalr	-1580(ra) # 800051cc <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80007800:	0304b503          	ld	a0,48(s1)
    80007804:	ffffe097          	auipc	ra,0xffffe
    80007808:	9c8080e7          	jalr	-1592(ra) # 800051cc <_Z8sem_waitP4_sem>

    if (tail >= head) {
    8000780c:	0144a783          	lw	a5,20(s1)
    80007810:	0104a903          	lw	s2,16(s1)
    80007814:	0327ce63          	blt	a5,s2,80007850 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80007818:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    8000781c:	0304b503          	ld	a0,48(s1)
    80007820:	ffffe097          	auipc	ra,0xffffe
    80007824:	9d8080e7          	jalr	-1576(ra) # 800051f8 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80007828:	0284b503          	ld	a0,40(s1)
    8000782c:	ffffe097          	auipc	ra,0xffffe
    80007830:	9cc080e7          	jalr	-1588(ra) # 800051f8 <_Z10sem_signalP4_sem>

    return ret;
}
    80007834:	00090513          	mv	a0,s2
    80007838:	01813083          	ld	ra,24(sp)
    8000783c:	01013403          	ld	s0,16(sp)
    80007840:	00813483          	ld	s1,8(sp)
    80007844:	00013903          	ld	s2,0(sp)
    80007848:	02010113          	addi	sp,sp,32
    8000784c:	00008067          	ret
        ret = cap - head + tail;
    80007850:	0004a703          	lw	a4,0(s1)
    80007854:	4127093b          	subw	s2,a4,s2
    80007858:	00f9093b          	addw	s2,s2,a5
    8000785c:	fc1ff06f          	j	8000781c <_ZN6Buffer6getCntEv+0x44>

0000000080007860 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80007860:	fe010113          	addi	sp,sp,-32
    80007864:	00113c23          	sd	ra,24(sp)
    80007868:	00813823          	sd	s0,16(sp)
    8000786c:	00913423          	sd	s1,8(sp)
    80007870:	02010413          	addi	s0,sp,32
    80007874:	00050493          	mv	s1,a0
    putc('\n');
    80007878:	00a00513          	li	a0,10
    8000787c:	ffffe097          	auipc	ra,0xffffe
    80007880:	a2c080e7          	jalr	-1492(ra) # 800052a8 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007884:	00005517          	auipc	a0,0x5
    80007888:	15c50513          	addi	a0,a0,348 # 8000c9e0 <_ZTV9Semaphore+0x998>
    8000788c:	00000097          	auipc	ra,0x0
    80007890:	ac4080e7          	jalr	-1340(ra) # 80007350 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007894:	00048513          	mv	a0,s1
    80007898:	00000097          	auipc	ra,0x0
    8000789c:	f40080e7          	jalr	-192(ra) # 800077d8 <_ZN6Buffer6getCntEv>
    800078a0:	02a05c63          	blez	a0,800078d8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800078a4:	0084b783          	ld	a5,8(s1)
    800078a8:	0104a703          	lw	a4,16(s1)
    800078ac:	00271713          	slli	a4,a4,0x2
    800078b0:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800078b4:	0007c503          	lbu	a0,0(a5)
    800078b8:	ffffe097          	auipc	ra,0xffffe
    800078bc:	9f0080e7          	jalr	-1552(ra) # 800052a8 <_Z4putcc>
        head = (head + 1) % cap;
    800078c0:	0104a783          	lw	a5,16(s1)
    800078c4:	0017879b          	addiw	a5,a5,1
    800078c8:	0004a703          	lw	a4,0(s1)
    800078cc:	02e7e7bb          	remw	a5,a5,a4
    800078d0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800078d4:	fc1ff06f          	j	80007894 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800078d8:	02100513          	li	a0,33
    800078dc:	ffffe097          	auipc	ra,0xffffe
    800078e0:	9cc080e7          	jalr	-1588(ra) # 800052a8 <_Z4putcc>
    putc('\n');
    800078e4:	00a00513          	li	a0,10
    800078e8:	ffffe097          	auipc	ra,0xffffe
    800078ec:	9c0080e7          	jalr	-1600(ra) # 800052a8 <_Z4putcc>
    mem_free(buffer);
    800078f0:	0084b503          	ld	a0,8(s1)
    800078f4:	ffffd097          	auipc	ra,0xffffd
    800078f8:	73c080e7          	jalr	1852(ra) # 80005030 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800078fc:	0204b503          	ld	a0,32(s1)
    80007900:	ffffe097          	auipc	ra,0xffffe
    80007904:	8a0080e7          	jalr	-1888(ra) # 800051a0 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80007908:	0184b503          	ld	a0,24(s1)
    8000790c:	ffffe097          	auipc	ra,0xffffe
    80007910:	894080e7          	jalr	-1900(ra) # 800051a0 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80007914:	0304b503          	ld	a0,48(s1)
    80007918:	ffffe097          	auipc	ra,0xffffe
    8000791c:	888080e7          	jalr	-1912(ra) # 800051a0 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80007920:	0284b503          	ld	a0,40(s1)
    80007924:	ffffe097          	auipc	ra,0xffffe
    80007928:	87c080e7          	jalr	-1924(ra) # 800051a0 <_Z9sem_closeP4_sem>
}
    8000792c:	01813083          	ld	ra,24(sp)
    80007930:	01013403          	ld	s0,16(sp)
    80007934:	00813483          	ld	s1,8(sp)
    80007938:	02010113          	addi	sp,sp,32
    8000793c:	00008067          	ret

0000000080007940 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80007940:	fd010113          	addi	sp,sp,-48
    80007944:	02113423          	sd	ra,40(sp)
    80007948:	02813023          	sd	s0,32(sp)
    8000794c:	00913c23          	sd	s1,24(sp)
    80007950:	01213823          	sd	s2,16(sp)
    80007954:	01313423          	sd	s3,8(sp)
    80007958:	03010413          	addi	s0,sp,48
    8000795c:	00050993          	mv	s3,a0
    80007960:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80007964:	00000913          	li	s2,0
    80007968:	00c0006f          	j	80007974 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000796c:	ffffa097          	auipc	ra,0xffffa
    80007970:	9e8080e7          	jalr	-1560(ra) # 80001354 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007974:	ffffe097          	auipc	ra,0xffffe
    80007978:	90c080e7          	jalr	-1780(ra) # 80005280 <_Z4getcv>
    8000797c:	0005059b          	sext.w	a1,a0
    80007980:	01b00793          	li	a5,27
    80007984:	02f58a63          	beq	a1,a5,800079b8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80007988:	0084b503          	ld	a0,8(s1)
    8000798c:	fffff097          	auipc	ra,0xfffff
    80007990:	720080e7          	jalr	1824(ra) # 800070ac <_ZN9BufferCPP3putEi>
        i++;
    80007994:	0019071b          	addiw	a4,s2,1
    80007998:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000799c:	0004a683          	lw	a3,0(s1)
    800079a0:	0026979b          	slliw	a5,a3,0x2
    800079a4:	00d787bb          	addw	a5,a5,a3
    800079a8:	0017979b          	slliw	a5,a5,0x1
    800079ac:	02f767bb          	remw	a5,a4,a5
    800079b0:	fc0792e3          	bnez	a5,80007974 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800079b4:	fb9ff06f          	j	8000796c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800079b8:	00100793          	li	a5,1
    800079bc:	00008717          	auipc	a4,0x8
    800079c0:	88f72a23          	sw	a5,-1900(a4) # 8000f250 <_ZL9threadEnd>
    td->buffer->put('!');
    800079c4:	0209b783          	ld	a5,32(s3)
    800079c8:	02100593          	li	a1,33
    800079cc:	0087b503          	ld	a0,8(a5)
    800079d0:	fffff097          	auipc	ra,0xfffff
    800079d4:	6dc080e7          	jalr	1756(ra) # 800070ac <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800079d8:	0104b503          	ld	a0,16(s1)
    800079dc:	ffffa097          	auipc	ra,0xffffa
    800079e0:	a5c080e7          	jalr	-1444(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    800079e4:	02813083          	ld	ra,40(sp)
    800079e8:	02013403          	ld	s0,32(sp)
    800079ec:	01813483          	ld	s1,24(sp)
    800079f0:	01013903          	ld	s2,16(sp)
    800079f4:	00813983          	ld	s3,8(sp)
    800079f8:	03010113          	addi	sp,sp,48
    800079fc:	00008067          	ret

0000000080007a00 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80007a00:	fe010113          	addi	sp,sp,-32
    80007a04:	00113c23          	sd	ra,24(sp)
    80007a08:	00813823          	sd	s0,16(sp)
    80007a0c:	00913423          	sd	s1,8(sp)
    80007a10:	01213023          	sd	s2,0(sp)
    80007a14:	02010413          	addi	s0,sp,32
    80007a18:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007a1c:	00000913          	li	s2,0
    80007a20:	00c0006f          	j	80007a2c <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007a24:	ffffa097          	auipc	ra,0xffffa
    80007a28:	930080e7          	jalr	-1744(ra) # 80001354 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007a2c:	00008797          	auipc	a5,0x8
    80007a30:	8247a783          	lw	a5,-2012(a5) # 8000f250 <_ZL9threadEnd>
    80007a34:	02079e63          	bnez	a5,80007a70 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80007a38:	0004a583          	lw	a1,0(s1)
    80007a3c:	0305859b          	addiw	a1,a1,48
    80007a40:	0084b503          	ld	a0,8(s1)
    80007a44:	fffff097          	auipc	ra,0xfffff
    80007a48:	668080e7          	jalr	1640(ra) # 800070ac <_ZN9BufferCPP3putEi>
        i++;
    80007a4c:	0019071b          	addiw	a4,s2,1
    80007a50:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007a54:	0004a683          	lw	a3,0(s1)
    80007a58:	0026979b          	slliw	a5,a3,0x2
    80007a5c:	00d787bb          	addw	a5,a5,a3
    80007a60:	0017979b          	slliw	a5,a5,0x1
    80007a64:	02f767bb          	remw	a5,a4,a5
    80007a68:	fc0792e3          	bnez	a5,80007a2c <_ZN12ProducerSync8producerEPv+0x2c>
    80007a6c:	fb9ff06f          	j	80007a24 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80007a70:	0104b503          	ld	a0,16(s1)
    80007a74:	ffffa097          	auipc	ra,0xffffa
    80007a78:	9c4080e7          	jalr	-1596(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007a7c:	01813083          	ld	ra,24(sp)
    80007a80:	01013403          	ld	s0,16(sp)
    80007a84:	00813483          	ld	s1,8(sp)
    80007a88:	00013903          	ld	s2,0(sp)
    80007a8c:	02010113          	addi	sp,sp,32
    80007a90:	00008067          	ret

0000000080007a94 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80007a94:	fd010113          	addi	sp,sp,-48
    80007a98:	02113423          	sd	ra,40(sp)
    80007a9c:	02813023          	sd	s0,32(sp)
    80007aa0:	00913c23          	sd	s1,24(sp)
    80007aa4:	01213823          	sd	s2,16(sp)
    80007aa8:	01313423          	sd	s3,8(sp)
    80007aac:	01413023          	sd	s4,0(sp)
    80007ab0:	03010413          	addi	s0,sp,48
    80007ab4:	00050993          	mv	s3,a0
    80007ab8:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007abc:	00000a13          	li	s4,0
    80007ac0:	01c0006f          	j	80007adc <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80007ac4:	ffffa097          	auipc	ra,0xffffa
    80007ac8:	890080e7          	jalr	-1904(ra) # 80001354 <_ZN6Thread8dispatchEv>
    80007acc:	0500006f          	j	80007b1c <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80007ad0:	00a00513          	li	a0,10
    80007ad4:	ffffd097          	auipc	ra,0xffffd
    80007ad8:	7d4080e7          	jalr	2004(ra) # 800052a8 <_Z4putcc>
    while (!threadEnd) {
    80007adc:	00007797          	auipc	a5,0x7
    80007ae0:	7747a783          	lw	a5,1908(a5) # 8000f250 <_ZL9threadEnd>
    80007ae4:	06079263          	bnez	a5,80007b48 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80007ae8:	00893503          	ld	a0,8(s2)
    80007aec:	fffff097          	auipc	ra,0xfffff
    80007af0:	650080e7          	jalr	1616(ra) # 8000713c <_ZN9BufferCPP3getEv>
        i++;
    80007af4:	001a049b          	addiw	s1,s4,1
    80007af8:	00048a1b          	sext.w	s4,s1
        putc(key);
    80007afc:	0ff57513          	andi	a0,a0,255
    80007b00:	ffffd097          	auipc	ra,0xffffd
    80007b04:	7a8080e7          	jalr	1960(ra) # 800052a8 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80007b08:	00092703          	lw	a4,0(s2)
    80007b0c:	0027179b          	slliw	a5,a4,0x2
    80007b10:	00e787bb          	addw	a5,a5,a4
    80007b14:	02f4e7bb          	remw	a5,s1,a5
    80007b18:	fa0786e3          	beqz	a5,80007ac4 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80007b1c:	05000793          	li	a5,80
    80007b20:	02f4e4bb          	remw	s1,s1,a5
    80007b24:	fa049ce3          	bnez	s1,80007adc <_ZN12ConsumerSync8consumerEPv+0x48>
    80007b28:	fa9ff06f          	j	80007ad0 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80007b2c:	0209b783          	ld	a5,32(s3)
    80007b30:	0087b503          	ld	a0,8(a5)
    80007b34:	fffff097          	auipc	ra,0xfffff
    80007b38:	608080e7          	jalr	1544(ra) # 8000713c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007b3c:	0ff57513          	andi	a0,a0,255
    80007b40:	ffffa097          	auipc	ra,0xffffa
    80007b44:	94c080e7          	jalr	-1716(ra) # 8000148c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80007b48:	0209b783          	ld	a5,32(s3)
    80007b4c:	0087b503          	ld	a0,8(a5)
    80007b50:	fffff097          	auipc	ra,0xfffff
    80007b54:	678080e7          	jalr	1656(ra) # 800071c8 <_ZN9BufferCPP6getCntEv>
    80007b58:	fca04ae3          	bgtz	a0,80007b2c <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007b5c:	01093503          	ld	a0,16(s2)
    80007b60:	ffffa097          	auipc	ra,0xffffa
    80007b64:	8d8080e7          	jalr	-1832(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007b68:	02813083          	ld	ra,40(sp)
    80007b6c:	02013403          	ld	s0,32(sp)
    80007b70:	01813483          	ld	s1,24(sp)
    80007b74:	01013903          	ld	s2,16(sp)
    80007b78:	00813983          	ld	s3,8(sp)
    80007b7c:	00013a03          	ld	s4,0(sp)
    80007b80:	03010113          	addi	sp,sp,48
    80007b84:	00008067          	ret

0000000080007b88 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80007b88:	f8010113          	addi	sp,sp,-128
    80007b8c:	06113c23          	sd	ra,120(sp)
    80007b90:	06813823          	sd	s0,112(sp)
    80007b94:	06913423          	sd	s1,104(sp)
    80007b98:	07213023          	sd	s2,96(sp)
    80007b9c:	05313c23          	sd	s3,88(sp)
    80007ba0:	05413823          	sd	s4,80(sp)
    80007ba4:	05513423          	sd	s5,72(sp)
    80007ba8:	05613023          	sd	s6,64(sp)
    80007bac:	03713c23          	sd	s7,56(sp)
    80007bb0:	03813823          	sd	s8,48(sp)
    80007bb4:	03913423          	sd	s9,40(sp)
    80007bb8:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80007bbc:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80007bc0:	00005517          	auipc	a0,0x5
    80007bc4:	ac050513          	addi	a0,a0,-1344 # 8000c680 <_ZTV9Semaphore+0x638>
    80007bc8:	fffff097          	auipc	ra,0xfffff
    80007bcc:	788080e7          	jalr	1928(ra) # 80007350 <_Z11printStringPKc>
    getString(input, 30);
    80007bd0:	01e00593          	li	a1,30
    80007bd4:	f8040513          	addi	a0,s0,-128
    80007bd8:	00000097          	auipc	ra,0x0
    80007bdc:	800080e7          	jalr	-2048(ra) # 800073d8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80007be0:	f8040513          	addi	a0,s0,-128
    80007be4:	00000097          	auipc	ra,0x0
    80007be8:	8cc080e7          	jalr	-1844(ra) # 800074b0 <_Z11stringToIntPKc>
    80007bec:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80007bf0:	00005517          	auipc	a0,0x5
    80007bf4:	ab050513          	addi	a0,a0,-1360 # 8000c6a0 <_ZTV9Semaphore+0x658>
    80007bf8:	fffff097          	auipc	ra,0xfffff
    80007bfc:	758080e7          	jalr	1880(ra) # 80007350 <_Z11printStringPKc>
    getString(input, 30);
    80007c00:	01e00593          	li	a1,30
    80007c04:	f8040513          	addi	a0,s0,-128
    80007c08:	fffff097          	auipc	ra,0xfffff
    80007c0c:	7d0080e7          	jalr	2000(ra) # 800073d8 <_Z9getStringPci>
    n = stringToInt(input);
    80007c10:	f8040513          	addi	a0,s0,-128
    80007c14:	00000097          	auipc	ra,0x0
    80007c18:	89c080e7          	jalr	-1892(ra) # 800074b0 <_Z11stringToIntPKc>
    80007c1c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80007c20:	00005517          	auipc	a0,0x5
    80007c24:	aa050513          	addi	a0,a0,-1376 # 8000c6c0 <_ZTV9Semaphore+0x678>
    80007c28:	fffff097          	auipc	ra,0xfffff
    80007c2c:	728080e7          	jalr	1832(ra) # 80007350 <_Z11printStringPKc>
    80007c30:	00000613          	li	a2,0
    80007c34:	00a00593          	li	a1,10
    80007c38:	00090513          	mv	a0,s2
    80007c3c:	00000097          	auipc	ra,0x0
    80007c40:	8c4080e7          	jalr	-1852(ra) # 80007500 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007c44:	00005517          	auipc	a0,0x5
    80007c48:	a9450513          	addi	a0,a0,-1388 # 8000c6d8 <_ZTV9Semaphore+0x690>
    80007c4c:	fffff097          	auipc	ra,0xfffff
    80007c50:	704080e7          	jalr	1796(ra) # 80007350 <_Z11printStringPKc>
    80007c54:	00000613          	li	a2,0
    80007c58:	00a00593          	li	a1,10
    80007c5c:	00048513          	mv	a0,s1
    80007c60:	00000097          	auipc	ra,0x0
    80007c64:	8a0080e7          	jalr	-1888(ra) # 80007500 <_Z8printIntiii>
    printString(".\n");
    80007c68:	00005517          	auipc	a0,0x5
    80007c6c:	a8850513          	addi	a0,a0,-1400 # 8000c6f0 <_ZTV9Semaphore+0x6a8>
    80007c70:	fffff097          	auipc	ra,0xfffff
    80007c74:	6e0080e7          	jalr	1760(ra) # 80007350 <_Z11printStringPKc>
    if(threadNum > n) {
    80007c78:	0324c463          	blt	s1,s2,80007ca0 <_Z29producerConsumer_CPP_Sync_APIv+0x118>
    } else if (threadNum < 1) {
    80007c7c:	03205c63          	blez	s2,80007cb4 <_Z29producerConsumer_CPP_Sync_APIv+0x12c>
    BufferCPP *buffer = new BufferCPP(n);
    80007c80:	03800513          	li	a0,56
    80007c84:	ffff9097          	auipc	ra,0xffff9
    80007c88:	518080e7          	jalr	1304(ra) # 8000119c <_Znwm>
    80007c8c:	00050a93          	mv	s5,a0
    80007c90:	00048593          	mv	a1,s1
    80007c94:	fffff097          	auipc	ra,0xfffff
    80007c98:	2c4080e7          	jalr	708(ra) # 80006f58 <_ZN9BufferCPPC1Ei>
    80007c9c:	0300006f          	j	80007ccc <_Z29producerConsumer_CPP_Sync_APIv+0x144>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007ca0:	00005517          	auipc	a0,0x5
    80007ca4:	a5850513          	addi	a0,a0,-1448 # 8000c6f8 <_ZTV9Semaphore+0x6b0>
    80007ca8:	fffff097          	auipc	ra,0xfffff
    80007cac:	6a8080e7          	jalr	1704(ra) # 80007350 <_Z11printStringPKc>
        return;
    80007cb0:	0140006f          	j	80007cc4 <_Z29producerConsumer_CPP_Sync_APIv+0x13c>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007cb4:	00005517          	auipc	a0,0x5
    80007cb8:	a8450513          	addi	a0,a0,-1404 # 8000c738 <_ZTV9Semaphore+0x6f0>
    80007cbc:	fffff097          	auipc	ra,0xfffff
    80007cc0:	694080e7          	jalr	1684(ra) # 80007350 <_Z11printStringPKc>
        return;
    80007cc4:	000b8113          	mv	sp,s7
    80007cc8:	2380006f          	j	80007f00 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    waitForAll = new Semaphore(0);
    80007ccc:	01000513          	li	a0,16
    80007cd0:	ffff9097          	auipc	ra,0xffff9
    80007cd4:	4cc080e7          	jalr	1228(ra) # 8000119c <_Znwm>
    80007cd8:	00050493          	mv	s1,a0
    80007cdc:	00000593          	li	a1,0
    80007ce0:	ffff9097          	auipc	ra,0xffff9
    80007ce4:	6f4080e7          	jalr	1780(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80007ce8:	00007797          	auipc	a5,0x7
    80007cec:	5697b823          	sd	s1,1392(a5) # 8000f258 <_ZL10waitForAll>
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
    80007d48:	458080e7          	jalr	1112(ra) # 8000119c <_Znwm>
    80007d4c:	00050b13          	mv	s6,a0
    80007d50:	012c0c33          	add	s8,s8,s2
    80007d54:	003c1c13          	slli	s8,s8,0x3
    80007d58:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80007d5c:	ffff9097          	auipc	ra,0xffff9
    80007d60:	620080e7          	jalr	1568(ra) # 8000137c <_ZN6ThreadC1Ev>
    80007d64:	00005797          	auipc	a5,0x5
    80007d68:	cf478793          	addi	a5,a5,-780 # 8000ca58 <_ZTV12ConsumerSync+0x10>
    80007d6c:	00fb3023          	sd	a5,0(s6)
    80007d70:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80007d74:	000b0513          	mv	a0,s6
    80007d78:	ffff9097          	auipc	ra,0xffff9
    80007d7c:	55c080e7          	jalr	1372(ra) # 800012d4 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007d80:	00000493          	li	s1,0
    80007d84:	0380006f          	j	80007dbc <_Z29producerConsumer_CPP_Sync_APIv+0x234>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007d88:	00005797          	auipc	a5,0x5
    80007d8c:	ca878793          	addi	a5,a5,-856 # 8000ca30 <_ZTV12ProducerSync+0x10>
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
    80007db4:	524080e7          	jalr	1316(ra) # 800012d4 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007db8:	0014849b          	addiw	s1,s1,1
    80007dbc:	0b24d063          	bge	s1,s2,80007e5c <_Z29producerConsumer_CPP_Sync_APIv+0x2d4>
        data[i].id = i;
    80007dc0:	00149793          	slli	a5,s1,0x1
    80007dc4:	009787b3          	add	a5,a5,s1
    80007dc8:	00379793          	slli	a5,a5,0x3
    80007dcc:	00fa07b3          	add	a5,s4,a5
    80007dd0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80007dd4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80007dd8:	00007717          	auipc	a4,0x7
    80007ddc:	48073703          	ld	a4,1152(a4) # 8000f258 <_ZL10waitForAll>
    80007de0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80007de4:	02905863          	blez	s1,80007e14 <_Z29producerConsumer_CPP_Sync_APIv+0x28c>
            threads[i] = new ProducerSync(data+i);
    80007de8:	02800513          	li	a0,40
    80007dec:	ffff9097          	auipc	ra,0xffff9
    80007df0:	3b0080e7          	jalr	944(ra) # 8000119c <_Znwm>
    80007df4:	00050c93          	mv	s9,a0
    80007df8:	00149c13          	slli	s8,s1,0x1
    80007dfc:	009c0c33          	add	s8,s8,s1
    80007e00:	003c1c13          	slli	s8,s8,0x3
    80007e04:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007e08:	ffff9097          	auipc	ra,0xffff9
    80007e0c:	574080e7          	jalr	1396(ra) # 8000137c <_ZN6ThreadC1Ev>
    80007e10:	f79ff06f          	j	80007d88 <_Z29producerConsumer_CPP_Sync_APIv+0x200>
            threads[i] = new ProducerKeyboard(data+i);
    80007e14:	02800513          	li	a0,40
    80007e18:	ffff9097          	auipc	ra,0xffff9
    80007e1c:	384080e7          	jalr	900(ra) # 8000119c <_Znwm>
    80007e20:	00050c93          	mv	s9,a0
    80007e24:	00149c13          	slli	s8,s1,0x1
    80007e28:	009c0c33          	add	s8,s8,s1
    80007e2c:	003c1c13          	slli	s8,s8,0x3
    80007e30:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80007e34:	ffff9097          	auipc	ra,0xffff9
    80007e38:	548080e7          	jalr	1352(ra) # 8000137c <_ZN6ThreadC1Ev>
    80007e3c:	00005797          	auipc	a5,0x5
    80007e40:	bcc78793          	addi	a5,a5,-1076 # 8000ca08 <_ZTV16ProducerKeyboard+0x10>
    80007e44:	00fcb023          	sd	a5,0(s9)
    80007e48:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80007e4c:	00349793          	slli	a5,s1,0x3
    80007e50:	00f987b3          	add	a5,s3,a5
    80007e54:	0197b023          	sd	s9,0(a5)
    80007e58:	f4dff06f          	j	80007da4 <_Z29producerConsumer_CPP_Sync_APIv+0x21c>
    Thread::dispatch();
    80007e5c:	ffff9097          	auipc	ra,0xffff9
    80007e60:	4f8080e7          	jalr	1272(ra) # 80001354 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80007e64:	00000493          	li	s1,0
    80007e68:	00994e63          	blt	s2,s1,80007e84 <_Z29producerConsumer_CPP_Sync_APIv+0x2fc>
        waitForAll->wait();
    80007e6c:	00007517          	auipc	a0,0x7
    80007e70:	3ec53503          	ld	a0,1004(a0) # 8000f258 <_ZL10waitForAll>
    80007e74:	ffff9097          	auipc	ra,0xffff9
    80007e78:	598080e7          	jalr	1432(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80007e7c:	0014849b          	addiw	s1,s1,1
    80007e80:	fe9ff06f          	j	80007e68 <_Z29producerConsumer_CPP_Sync_APIv+0x2e0>
    for (int i = 0; i < threadNum; i++) {
    80007e84:	00000493          	li	s1,0
    80007e88:	0080006f          	j	80007e90 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80007e8c:	0014849b          	addiw	s1,s1,1
    80007e90:	0324d263          	bge	s1,s2,80007eb4 <_Z29producerConsumer_CPP_Sync_APIv+0x32c>
        delete threads[i];
    80007e94:	00349793          	slli	a5,s1,0x3
    80007e98:	00f987b3          	add	a5,s3,a5
    80007e9c:	0007b503          	ld	a0,0(a5)
    80007ea0:	fe0506e3          	beqz	a0,80007e8c <_Z29producerConsumer_CPP_Sync_APIv+0x304>
    80007ea4:	00053783          	ld	a5,0(a0)
    80007ea8:	0087b783          	ld	a5,8(a5)
    80007eac:	000780e7          	jalr	a5
    80007eb0:	fddff06f          	j	80007e8c <_Z29producerConsumer_CPP_Sync_APIv+0x304>
    delete consumerThread;
    80007eb4:	000b0a63          	beqz	s6,80007ec8 <_Z29producerConsumer_CPP_Sync_APIv+0x340>
    80007eb8:	000b3783          	ld	a5,0(s6)
    80007ebc:	0087b783          	ld	a5,8(a5)
    80007ec0:	000b0513          	mv	a0,s6
    80007ec4:	000780e7          	jalr	a5
    delete waitForAll;
    80007ec8:	00007517          	auipc	a0,0x7
    80007ecc:	39053503          	ld	a0,912(a0) # 8000f258 <_ZL10waitForAll>
    80007ed0:	00050863          	beqz	a0,80007ee0 <_Z29producerConsumer_CPP_Sync_APIv+0x358>
    80007ed4:	00053783          	ld	a5,0(a0)
    80007ed8:	0087b783          	ld	a5,8(a5)
    80007edc:	000780e7          	jalr	a5
    delete buffer;
    80007ee0:	000a8e63          	beqz	s5,80007efc <_Z29producerConsumer_CPP_Sync_APIv+0x374>
    80007ee4:	000a8513          	mv	a0,s5
    80007ee8:	fffff097          	auipc	ra,0xfffff
    80007eec:	368080e7          	jalr	872(ra) # 80007250 <_ZN9BufferCPPD1Ev>
    80007ef0:	000a8513          	mv	a0,s5
    80007ef4:	ffff9097          	auipc	ra,0xffff9
    80007ef8:	2d0080e7          	jalr	720(ra) # 800011c4 <_ZdlPv>
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
    80007f44:	284080e7          	jalr	644(ra) # 800011c4 <_ZdlPv>
    80007f48:	00048513          	mv	a0,s1
    80007f4c:	00008097          	auipc	ra,0x8
    80007f50:	41c080e7          	jalr	1052(ra) # 80010368 <_Unwind_Resume>
    80007f54:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80007f58:	00048513          	mv	a0,s1
    80007f5c:	ffff9097          	auipc	ra,0xffff9
    80007f60:	268080e7          	jalr	616(ra) # 800011c4 <_ZdlPv>
    80007f64:	00090513          	mv	a0,s2
    80007f68:	00008097          	auipc	ra,0x8
    80007f6c:	400080e7          	jalr	1024(ra) # 80010368 <_Unwind_Resume>
    80007f70:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80007f74:	000b0513          	mv	a0,s6
    80007f78:	ffff9097          	auipc	ra,0xffff9
    80007f7c:	24c080e7          	jalr	588(ra) # 800011c4 <_ZdlPv>
    80007f80:	00048513          	mv	a0,s1
    80007f84:	00008097          	auipc	ra,0x8
    80007f88:	3e4080e7          	jalr	996(ra) # 80010368 <_Unwind_Resume>
    80007f8c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80007f90:	000c8513          	mv	a0,s9
    80007f94:	ffff9097          	auipc	ra,0xffff9
    80007f98:	230080e7          	jalr	560(ra) # 800011c4 <_ZdlPv>
    80007f9c:	00048513          	mv	a0,s1
    80007fa0:	00008097          	auipc	ra,0x8
    80007fa4:	3c8080e7          	jalr	968(ra) # 80010368 <_Unwind_Resume>
    80007fa8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80007fac:	000c8513          	mv	a0,s9
    80007fb0:	ffff9097          	auipc	ra,0xffff9
    80007fb4:	214080e7          	jalr	532(ra) # 800011c4 <_ZdlPv>
    80007fb8:	00048513          	mv	a0,s1
    80007fbc:	00008097          	auipc	ra,0x8
    80007fc0:	3ac080e7          	jalr	940(ra) # 80010368 <_Unwind_Resume>

0000000080007fc4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80007fc4:	ff010113          	addi	sp,sp,-16
    80007fc8:	00113423          	sd	ra,8(sp)
    80007fcc:	00813023          	sd	s0,0(sp)
    80007fd0:	01010413          	addi	s0,sp,16
    80007fd4:	00005797          	auipc	a5,0x5
    80007fd8:	a8478793          	addi	a5,a5,-1404 # 8000ca58 <_ZTV12ConsumerSync+0x10>
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
    80008010:	00005797          	auipc	a5,0x5
    80008014:	a4878793          	addi	a5,a5,-1464 # 8000ca58 <_ZTV12ConsumerSync+0x10>
    80008018:	00f53023          	sd	a5,0(a0)
    8000801c:	ffff9097          	auipc	ra,0xffff9
    80008020:	130080e7          	jalr	304(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008024:	00048513          	mv	a0,s1
    80008028:	ffff9097          	auipc	ra,0xffff9
    8000802c:	19c080e7          	jalr	412(ra) # 800011c4 <_ZdlPv>
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
    80008054:	00005797          	auipc	a5,0x5
    80008058:	9dc78793          	addi	a5,a5,-1572 # 8000ca30 <_ZTV12ProducerSync+0x10>
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
    80008090:	00005797          	auipc	a5,0x5
    80008094:	9a078793          	addi	a5,a5,-1632 # 8000ca30 <_ZTV12ProducerSync+0x10>
    80008098:	00f53023          	sd	a5,0(a0)
    8000809c:	ffff9097          	auipc	ra,0xffff9
    800080a0:	0b0080e7          	jalr	176(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080a4:	00048513          	mv	a0,s1
    800080a8:	ffff9097          	auipc	ra,0xffff9
    800080ac:	11c080e7          	jalr	284(ra) # 800011c4 <_ZdlPv>
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
    800080d4:	00005797          	auipc	a5,0x5
    800080d8:	93478793          	addi	a5,a5,-1740 # 8000ca08 <_ZTV16ProducerKeyboard+0x10>
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
    80008110:	00005797          	auipc	a5,0x5
    80008114:	8f878793          	addi	a5,a5,-1800 # 8000ca08 <_ZTV16ProducerKeyboard+0x10>
    80008118:	00f53023          	sd	a5,0(a0)
    8000811c:	ffff9097          	auipc	ra,0xffff9
    80008120:	030080e7          	jalr	48(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008124:	00048513          	mv	a0,s1
    80008128:	ffff9097          	auipc	ra,0xffff9
    8000812c:	09c080e7          	jalr	156(ra) # 800011c4 <_ZdlPv>
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
    8000815c:	7e8080e7          	jalr	2024(ra) # 80007940 <_ZN16ProducerKeyboard16producerKeyboardEPv>
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
    80008188:	87c080e7          	jalr	-1924(ra) # 80007a00 <_ZN12ProducerSync8producerEPv>
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
    800081b4:	8e4080e7          	jalr	-1820(ra) # 80007a94 <_ZN12ConsumerSync8consumerEPv>
    }
    800081b8:	00813083          	ld	ra,8(sp)
    800081bc:	00013403          	ld	s0,0(sp)
    800081c0:	01010113          	addi	sp,sp,16
    800081c4:	00008067          	ret

00000000800081c8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800081c8:	fe010113          	addi	sp,sp,-32
    800081cc:	00113c23          	sd	ra,24(sp)
    800081d0:	00813823          	sd	s0,16(sp)
    800081d4:	00913423          	sd	s1,8(sp)
    800081d8:	01213023          	sd	s2,0(sp)
    800081dc:	02010413          	addi	s0,sp,32
    800081e0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800081e4:	00100793          	li	a5,1
    800081e8:	02a7f863          	bgeu	a5,a0,80008218 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800081ec:	00a00793          	li	a5,10
    800081f0:	02f577b3          	remu	a5,a0,a5
    800081f4:	02078e63          	beqz	a5,80008230 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800081f8:	fff48513          	addi	a0,s1,-1
    800081fc:	00000097          	auipc	ra,0x0
    80008200:	fcc080e7          	jalr	-52(ra) # 800081c8 <_ZL9fibonaccim>
    80008204:	00050913          	mv	s2,a0
    80008208:	ffe48513          	addi	a0,s1,-2
    8000820c:	00000097          	auipc	ra,0x0
    80008210:	fbc080e7          	jalr	-68(ra) # 800081c8 <_ZL9fibonaccim>
    80008214:	00a90533          	add	a0,s2,a0
}
    80008218:	01813083          	ld	ra,24(sp)
    8000821c:	01013403          	ld	s0,16(sp)
    80008220:	00813483          	ld	s1,8(sp)
    80008224:	00013903          	ld	s2,0(sp)
    80008228:	02010113          	addi	sp,sp,32
    8000822c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80008230:	ffffd097          	auipc	ra,0xffffd
    80008234:	ec8080e7          	jalr	-312(ra) # 800050f8 <_Z15thread_dispatchv>
    80008238:	fc1ff06f          	j	800081f8 <_ZL9fibonaccim+0x30>

000000008000823c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000823c:	fe010113          	addi	sp,sp,-32
    80008240:	00113c23          	sd	ra,24(sp)
    80008244:	00813823          	sd	s0,16(sp)
    80008248:	00913423          	sd	s1,8(sp)
    8000824c:	01213023          	sd	s2,0(sp)
    80008250:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80008254:	00000913          	li	s2,0
    80008258:	0380006f          	j	80008290 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000825c:	ffffd097          	auipc	ra,0xffffd
    80008260:	e9c080e7          	jalr	-356(ra) # 800050f8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80008264:	00148493          	addi	s1,s1,1
    80008268:	000027b7          	lui	a5,0x2
    8000826c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80008270:	0097ee63          	bltu	a5,s1,8000828c <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80008274:	00000713          	li	a4,0
    80008278:	000077b7          	lui	a5,0x7
    8000827c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80008280:	fce7eee3          	bltu	a5,a4,8000825c <_ZN7WorkerA11workerBodyAEPv+0x20>
    80008284:	00170713          	addi	a4,a4,1
    80008288:	ff1ff06f          	j	80008278 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000828c:	00190913          	addi	s2,s2,1
    80008290:	00900793          	li	a5,9
    80008294:	0527e063          	bltu	a5,s2,800082d4 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80008298:	00004517          	auipc	a0,0x4
    8000829c:	37050513          	addi	a0,a0,880 # 8000c608 <_ZTV9Semaphore+0x5c0>
    800082a0:	fffff097          	auipc	ra,0xfffff
    800082a4:	0b0080e7          	jalr	176(ra) # 80007350 <_Z11printStringPKc>
    800082a8:	00000613          	li	a2,0
    800082ac:	00a00593          	li	a1,10
    800082b0:	0009051b          	sext.w	a0,s2
    800082b4:	fffff097          	auipc	ra,0xfffff
    800082b8:	24c080e7          	jalr	588(ra) # 80007500 <_Z8printIntiii>
    800082bc:	00004517          	auipc	a0,0x4
    800082c0:	5ec50513          	addi	a0,a0,1516 # 8000c8a8 <_ZTV9Semaphore+0x860>
    800082c4:	fffff097          	auipc	ra,0xfffff
    800082c8:	08c080e7          	jalr	140(ra) # 80007350 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800082cc:	00000493          	li	s1,0
    800082d0:	f99ff06f          	j	80008268 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800082d4:	00004517          	auipc	a0,0x4
    800082d8:	30c50513          	addi	a0,a0,780 # 8000c5e0 <_ZTV9Semaphore+0x598>
    800082dc:	fffff097          	auipc	ra,0xfffff
    800082e0:	074080e7          	jalr	116(ra) # 80007350 <_Z11printStringPKc>
    finishedA = true;
    800082e4:	00100793          	li	a5,1
    800082e8:	00007717          	auipc	a4,0x7
    800082ec:	f6f70da3          	sb	a5,-133(a4) # 8000f263 <_ZL9finishedA>
}
    800082f0:	01813083          	ld	ra,24(sp)
    800082f4:	01013403          	ld	s0,16(sp)
    800082f8:	00813483          	ld	s1,8(sp)
    800082fc:	00013903          	ld	s2,0(sp)
    80008300:	02010113          	addi	sp,sp,32
    80008304:	00008067          	ret

0000000080008308 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80008308:	fe010113          	addi	sp,sp,-32
    8000830c:	00113c23          	sd	ra,24(sp)
    80008310:	00813823          	sd	s0,16(sp)
    80008314:	00913423          	sd	s1,8(sp)
    80008318:	01213023          	sd	s2,0(sp)
    8000831c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80008320:	00000913          	li	s2,0
    80008324:	0380006f          	j	8000835c <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80008328:	ffffd097          	auipc	ra,0xffffd
    8000832c:	dd0080e7          	jalr	-560(ra) # 800050f8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80008330:	00148493          	addi	s1,s1,1
    80008334:	000027b7          	lui	a5,0x2
    80008338:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000833c:	0097ee63          	bltu	a5,s1,80008358 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80008340:	00000713          	li	a4,0
    80008344:	000077b7          	lui	a5,0x7
    80008348:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000834c:	fce7eee3          	bltu	a5,a4,80008328 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80008350:	00170713          	addi	a4,a4,1
    80008354:	ff1ff06f          	j	80008344 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80008358:	00190913          	addi	s2,s2,1
    8000835c:	00f00793          	li	a5,15
    80008360:	0527e063          	bltu	a5,s2,800083a0 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80008364:	00004517          	auipc	a0,0x4
    80008368:	28c50513          	addi	a0,a0,652 # 8000c5f0 <_ZTV9Semaphore+0x5a8>
    8000836c:	fffff097          	auipc	ra,0xfffff
    80008370:	fe4080e7          	jalr	-28(ra) # 80007350 <_Z11printStringPKc>
    80008374:	00000613          	li	a2,0
    80008378:	00a00593          	li	a1,10
    8000837c:	0009051b          	sext.w	a0,s2
    80008380:	fffff097          	auipc	ra,0xfffff
    80008384:	180080e7          	jalr	384(ra) # 80007500 <_Z8printIntiii>
    80008388:	00004517          	auipc	a0,0x4
    8000838c:	52050513          	addi	a0,a0,1312 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80008390:	fffff097          	auipc	ra,0xfffff
    80008394:	fc0080e7          	jalr	-64(ra) # 80007350 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80008398:	00000493          	li	s1,0
    8000839c:	f99ff06f          	j	80008334 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800083a0:	00004517          	auipc	a0,0x4
    800083a4:	25850513          	addi	a0,a0,600 # 8000c5f8 <_ZTV9Semaphore+0x5b0>
    800083a8:	fffff097          	auipc	ra,0xfffff
    800083ac:	fa8080e7          	jalr	-88(ra) # 80007350 <_Z11printStringPKc>
    finishedB = true;
    800083b0:	00100793          	li	a5,1
    800083b4:	00007717          	auipc	a4,0x7
    800083b8:	eaf70723          	sb	a5,-338(a4) # 8000f262 <_ZL9finishedB>
    thread_dispatch();
    800083bc:	ffffd097          	auipc	ra,0xffffd
    800083c0:	d3c080e7          	jalr	-708(ra) # 800050f8 <_Z15thread_dispatchv>
}
    800083c4:	01813083          	ld	ra,24(sp)
    800083c8:	01013403          	ld	s0,16(sp)
    800083cc:	00813483          	ld	s1,8(sp)
    800083d0:	00013903          	ld	s2,0(sp)
    800083d4:	02010113          	addi	sp,sp,32
    800083d8:	00008067          	ret

00000000800083dc <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800083dc:	fe010113          	addi	sp,sp,-32
    800083e0:	00113c23          	sd	ra,24(sp)
    800083e4:	00813823          	sd	s0,16(sp)
    800083e8:	00913423          	sd	s1,8(sp)
    800083ec:	01213023          	sd	s2,0(sp)
    800083f0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800083f4:	00000493          	li	s1,0
    800083f8:	0400006f          	j	80008438 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800083fc:	00004517          	auipc	a0,0x4
    80008400:	1b450513          	addi	a0,a0,436 # 8000c5b0 <_ZTV9Semaphore+0x568>
    80008404:	fffff097          	auipc	ra,0xfffff
    80008408:	f4c080e7          	jalr	-180(ra) # 80007350 <_Z11printStringPKc>
    8000840c:	00000613          	li	a2,0
    80008410:	00a00593          	li	a1,10
    80008414:	00048513          	mv	a0,s1
    80008418:	fffff097          	auipc	ra,0xfffff
    8000841c:	0e8080e7          	jalr	232(ra) # 80007500 <_Z8printIntiii>
    80008420:	00004517          	auipc	a0,0x4
    80008424:	48850513          	addi	a0,a0,1160 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80008428:	fffff097          	auipc	ra,0xfffff
    8000842c:	f28080e7          	jalr	-216(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80008430:	0014849b          	addiw	s1,s1,1
    80008434:	0ff4f493          	andi	s1,s1,255
    80008438:	00200793          	li	a5,2
    8000843c:	fc97f0e3          	bgeu	a5,s1,800083fc <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80008440:	00004517          	auipc	a0,0x4
    80008444:	17850513          	addi	a0,a0,376 # 8000c5b8 <_ZTV9Semaphore+0x570>
    80008448:	fffff097          	auipc	ra,0xfffff
    8000844c:	f08080e7          	jalr	-248(ra) # 80007350 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80008450:	00700313          	li	t1,7
    thread_dispatch();
    80008454:	ffffd097          	auipc	ra,0xffffd
    80008458:	ca4080e7          	jalr	-860(ra) # 800050f8 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000845c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80008460:	00004517          	auipc	a0,0x4
    80008464:	16850513          	addi	a0,a0,360 # 8000c5c8 <_ZTV9Semaphore+0x580>
    80008468:	fffff097          	auipc	ra,0xfffff
    8000846c:	ee8080e7          	jalr	-280(ra) # 80007350 <_Z11printStringPKc>
    80008470:	00000613          	li	a2,0
    80008474:	00a00593          	li	a1,10
    80008478:	0009051b          	sext.w	a0,s2
    8000847c:	fffff097          	auipc	ra,0xfffff
    80008480:	084080e7          	jalr	132(ra) # 80007500 <_Z8printIntiii>
    80008484:	00004517          	auipc	a0,0x4
    80008488:	42450513          	addi	a0,a0,1060 # 8000c8a8 <_ZTV9Semaphore+0x860>
    8000848c:	fffff097          	auipc	ra,0xfffff
    80008490:	ec4080e7          	jalr	-316(ra) # 80007350 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80008494:	00c00513          	li	a0,12
    80008498:	00000097          	auipc	ra,0x0
    8000849c:	d30080e7          	jalr	-720(ra) # 800081c8 <_ZL9fibonaccim>
    800084a0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800084a4:	00004517          	auipc	a0,0x4
    800084a8:	12c50513          	addi	a0,a0,300 # 8000c5d0 <_ZTV9Semaphore+0x588>
    800084ac:	fffff097          	auipc	ra,0xfffff
    800084b0:	ea4080e7          	jalr	-348(ra) # 80007350 <_Z11printStringPKc>
    800084b4:	00000613          	li	a2,0
    800084b8:	00a00593          	li	a1,10
    800084bc:	0009051b          	sext.w	a0,s2
    800084c0:	fffff097          	auipc	ra,0xfffff
    800084c4:	040080e7          	jalr	64(ra) # 80007500 <_Z8printIntiii>
    800084c8:	00004517          	auipc	a0,0x4
    800084cc:	3e050513          	addi	a0,a0,992 # 8000c8a8 <_ZTV9Semaphore+0x860>
    800084d0:	fffff097          	auipc	ra,0xfffff
    800084d4:	e80080e7          	jalr	-384(ra) # 80007350 <_Z11printStringPKc>
    800084d8:	0400006f          	j	80008518 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800084dc:	00004517          	auipc	a0,0x4
    800084e0:	0d450513          	addi	a0,a0,212 # 8000c5b0 <_ZTV9Semaphore+0x568>
    800084e4:	fffff097          	auipc	ra,0xfffff
    800084e8:	e6c080e7          	jalr	-404(ra) # 80007350 <_Z11printStringPKc>
    800084ec:	00000613          	li	a2,0
    800084f0:	00a00593          	li	a1,10
    800084f4:	00048513          	mv	a0,s1
    800084f8:	fffff097          	auipc	ra,0xfffff
    800084fc:	008080e7          	jalr	8(ra) # 80007500 <_Z8printIntiii>
    80008500:	00004517          	auipc	a0,0x4
    80008504:	3a850513          	addi	a0,a0,936 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80008508:	fffff097          	auipc	ra,0xfffff
    8000850c:	e48080e7          	jalr	-440(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80008510:	0014849b          	addiw	s1,s1,1
    80008514:	0ff4f493          	andi	s1,s1,255
    80008518:	00500793          	li	a5,5
    8000851c:	fc97f0e3          	bgeu	a5,s1,800084dc <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80008520:	00004517          	auipc	a0,0x4
    80008524:	0c050513          	addi	a0,a0,192 # 8000c5e0 <_ZTV9Semaphore+0x598>
    80008528:	fffff097          	auipc	ra,0xfffff
    8000852c:	e28080e7          	jalr	-472(ra) # 80007350 <_Z11printStringPKc>
    finishedC = true;
    80008530:	00100793          	li	a5,1
    80008534:	00007717          	auipc	a4,0x7
    80008538:	d2f706a3          	sb	a5,-723(a4) # 8000f261 <_ZL9finishedC>
    thread_dispatch();
    8000853c:	ffffd097          	auipc	ra,0xffffd
    80008540:	bbc080e7          	jalr	-1092(ra) # 800050f8 <_Z15thread_dispatchv>
}
    80008544:	01813083          	ld	ra,24(sp)
    80008548:	01013403          	ld	s0,16(sp)
    8000854c:	00813483          	ld	s1,8(sp)
    80008550:	00013903          	ld	s2,0(sp)
    80008554:	02010113          	addi	sp,sp,32
    80008558:	00008067          	ret

000000008000855c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000855c:	fe010113          	addi	sp,sp,-32
    80008560:	00113c23          	sd	ra,24(sp)
    80008564:	00813823          	sd	s0,16(sp)
    80008568:	00913423          	sd	s1,8(sp)
    8000856c:	01213023          	sd	s2,0(sp)
    80008570:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80008574:	00a00493          	li	s1,10
    80008578:	0400006f          	j	800085b8 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000857c:	00004517          	auipc	a0,0x4
    80008580:	ffc50513          	addi	a0,a0,-4 # 8000c578 <_ZTV9Semaphore+0x530>
    80008584:	fffff097          	auipc	ra,0xfffff
    80008588:	dcc080e7          	jalr	-564(ra) # 80007350 <_Z11printStringPKc>
    8000858c:	00000613          	li	a2,0
    80008590:	00a00593          	li	a1,10
    80008594:	00048513          	mv	a0,s1
    80008598:	fffff097          	auipc	ra,0xfffff
    8000859c:	f68080e7          	jalr	-152(ra) # 80007500 <_Z8printIntiii>
    800085a0:	00004517          	auipc	a0,0x4
    800085a4:	30850513          	addi	a0,a0,776 # 8000c8a8 <_ZTV9Semaphore+0x860>
    800085a8:	fffff097          	auipc	ra,0xfffff
    800085ac:	da8080e7          	jalr	-600(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800085b0:	0014849b          	addiw	s1,s1,1
    800085b4:	0ff4f493          	andi	s1,s1,255
    800085b8:	00c00793          	li	a5,12
    800085bc:	fc97f0e3          	bgeu	a5,s1,8000857c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800085c0:	00004517          	auipc	a0,0x4
    800085c4:	fc050513          	addi	a0,a0,-64 # 8000c580 <_ZTV9Semaphore+0x538>
    800085c8:	fffff097          	auipc	ra,0xfffff
    800085cc:	d88080e7          	jalr	-632(ra) # 80007350 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800085d0:	00500313          	li	t1,5
    thread_dispatch();
    800085d4:	ffffd097          	auipc	ra,0xffffd
    800085d8:	b24080e7          	jalr	-1244(ra) # 800050f8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800085dc:	01000513          	li	a0,16
    800085e0:	00000097          	auipc	ra,0x0
    800085e4:	be8080e7          	jalr	-1048(ra) # 800081c8 <_ZL9fibonaccim>
    800085e8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800085ec:	00004517          	auipc	a0,0x4
    800085f0:	fa450513          	addi	a0,a0,-92 # 8000c590 <_ZTV9Semaphore+0x548>
    800085f4:	fffff097          	auipc	ra,0xfffff
    800085f8:	d5c080e7          	jalr	-676(ra) # 80007350 <_Z11printStringPKc>
    800085fc:	00000613          	li	a2,0
    80008600:	00a00593          	li	a1,10
    80008604:	0009051b          	sext.w	a0,s2
    80008608:	fffff097          	auipc	ra,0xfffff
    8000860c:	ef8080e7          	jalr	-264(ra) # 80007500 <_Z8printIntiii>
    80008610:	00004517          	auipc	a0,0x4
    80008614:	29850513          	addi	a0,a0,664 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80008618:	fffff097          	auipc	ra,0xfffff
    8000861c:	d38080e7          	jalr	-712(ra) # 80007350 <_Z11printStringPKc>
    80008620:	0400006f          	j	80008660 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80008624:	00004517          	auipc	a0,0x4
    80008628:	f5450513          	addi	a0,a0,-172 # 8000c578 <_ZTV9Semaphore+0x530>
    8000862c:	fffff097          	auipc	ra,0xfffff
    80008630:	d24080e7          	jalr	-732(ra) # 80007350 <_Z11printStringPKc>
    80008634:	00000613          	li	a2,0
    80008638:	00a00593          	li	a1,10
    8000863c:	00048513          	mv	a0,s1
    80008640:	fffff097          	auipc	ra,0xfffff
    80008644:	ec0080e7          	jalr	-320(ra) # 80007500 <_Z8printIntiii>
    80008648:	00004517          	auipc	a0,0x4
    8000864c:	26050513          	addi	a0,a0,608 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80008650:	fffff097          	auipc	ra,0xfffff
    80008654:	d00080e7          	jalr	-768(ra) # 80007350 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80008658:	0014849b          	addiw	s1,s1,1
    8000865c:	0ff4f493          	andi	s1,s1,255
    80008660:	00f00793          	li	a5,15
    80008664:	fc97f0e3          	bgeu	a5,s1,80008624 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80008668:	00004517          	auipc	a0,0x4
    8000866c:	f3850513          	addi	a0,a0,-200 # 8000c5a0 <_ZTV9Semaphore+0x558>
    80008670:	fffff097          	auipc	ra,0xfffff
    80008674:	ce0080e7          	jalr	-800(ra) # 80007350 <_Z11printStringPKc>
    finishedD = true;
    80008678:	00100793          	li	a5,1
    8000867c:	00007717          	auipc	a4,0x7
    80008680:	bef70223          	sb	a5,-1052(a4) # 8000f260 <_ZL9finishedD>
    thread_dispatch();
    80008684:	ffffd097          	auipc	ra,0xffffd
    80008688:	a74080e7          	jalr	-1420(ra) # 800050f8 <_Z15thread_dispatchv>
}
    8000868c:	01813083          	ld	ra,24(sp)
    80008690:	01013403          	ld	s0,16(sp)
    80008694:	00813483          	ld	s1,8(sp)
    80008698:	00013903          	ld	s2,0(sp)
    8000869c:	02010113          	addi	sp,sp,32
    800086a0:	00008067          	ret

00000000800086a4 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800086a4:	fc010113          	addi	sp,sp,-64
    800086a8:	02113c23          	sd	ra,56(sp)
    800086ac:	02813823          	sd	s0,48(sp)
    800086b0:	02913423          	sd	s1,40(sp)
    800086b4:	03213023          	sd	s2,32(sp)
    800086b8:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800086bc:	02000513          	li	a0,32
    800086c0:	ffff9097          	auipc	ra,0xffff9
    800086c4:	adc080e7          	jalr	-1316(ra) # 8000119c <_Znwm>
    800086c8:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800086cc:	ffff9097          	auipc	ra,0xffff9
    800086d0:	cb0080e7          	jalr	-848(ra) # 8000137c <_ZN6ThreadC1Ev>
    800086d4:	00004797          	auipc	a5,0x4
    800086d8:	3ac78793          	addi	a5,a5,940 # 8000ca80 <_ZTV7WorkerA+0x10>
    800086dc:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800086e0:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800086e4:	00004517          	auipc	a0,0x4
    800086e8:	f2c50513          	addi	a0,a0,-212 # 8000c610 <_ZTV9Semaphore+0x5c8>
    800086ec:	fffff097          	auipc	ra,0xfffff
    800086f0:	c64080e7          	jalr	-924(ra) # 80007350 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800086f4:	02000513          	li	a0,32
    800086f8:	ffff9097          	auipc	ra,0xffff9
    800086fc:	aa4080e7          	jalr	-1372(ra) # 8000119c <_Znwm>
    80008700:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80008704:	ffff9097          	auipc	ra,0xffff9
    80008708:	c78080e7          	jalr	-904(ra) # 8000137c <_ZN6ThreadC1Ev>
    8000870c:	00004797          	auipc	a5,0x4
    80008710:	39c78793          	addi	a5,a5,924 # 8000caa8 <_ZTV7WorkerB+0x10>
    80008714:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80008718:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000871c:	00004517          	auipc	a0,0x4
    80008720:	f0c50513          	addi	a0,a0,-244 # 8000c628 <_ZTV9Semaphore+0x5e0>
    80008724:	fffff097          	auipc	ra,0xfffff
    80008728:	c2c080e7          	jalr	-980(ra) # 80007350 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000872c:	02000513          	li	a0,32
    80008730:	ffff9097          	auipc	ra,0xffff9
    80008734:	a6c080e7          	jalr	-1428(ra) # 8000119c <_Znwm>
    80008738:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000873c:	ffff9097          	auipc	ra,0xffff9
    80008740:	c40080e7          	jalr	-960(ra) # 8000137c <_ZN6ThreadC1Ev>
    80008744:	00004797          	auipc	a5,0x4
    80008748:	38c78793          	addi	a5,a5,908 # 8000cad0 <_ZTV7WorkerC+0x10>
    8000874c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80008750:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80008754:	00004517          	auipc	a0,0x4
    80008758:	eec50513          	addi	a0,a0,-276 # 8000c640 <_ZTV9Semaphore+0x5f8>
    8000875c:	fffff097          	auipc	ra,0xfffff
    80008760:	bf4080e7          	jalr	-1036(ra) # 80007350 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80008764:	02000513          	li	a0,32
    80008768:	ffff9097          	auipc	ra,0xffff9
    8000876c:	a34080e7          	jalr	-1484(ra) # 8000119c <_Znwm>
    80008770:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80008774:	ffff9097          	auipc	ra,0xffff9
    80008778:	c08080e7          	jalr	-1016(ra) # 8000137c <_ZN6ThreadC1Ev>
    8000877c:	00004797          	auipc	a5,0x4
    80008780:	37c78793          	addi	a5,a5,892 # 8000caf8 <_ZTV7WorkerD+0x10>
    80008784:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80008788:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    8000878c:	00004517          	auipc	a0,0x4
    80008790:	ecc50513          	addi	a0,a0,-308 # 8000c658 <_ZTV9Semaphore+0x610>
    80008794:	fffff097          	auipc	ra,0xfffff
    80008798:	bbc080e7          	jalr	-1092(ra) # 80007350 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    8000879c:	00000493          	li	s1,0
    800087a0:	00300793          	li	a5,3
    800087a4:	0297c663          	blt	a5,s1,800087d0 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800087a8:	00349793          	slli	a5,s1,0x3
    800087ac:	fe040713          	addi	a4,s0,-32
    800087b0:	00f707b3          	add	a5,a4,a5
    800087b4:	fe07b503          	ld	a0,-32(a5)
    800087b8:	ffff9097          	auipc	ra,0xffff9
    800087bc:	b1c080e7          	jalr	-1252(ra) # 800012d4 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800087c0:	0014849b          	addiw	s1,s1,1
    800087c4:	fddff06f          	j	800087a0 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800087c8:	ffff9097          	auipc	ra,0xffff9
    800087cc:	b8c080e7          	jalr	-1140(ra) # 80001354 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800087d0:	00007797          	auipc	a5,0x7
    800087d4:	a937c783          	lbu	a5,-1389(a5) # 8000f263 <_ZL9finishedA>
    800087d8:	fe0788e3          	beqz	a5,800087c8 <_Z20Threads_CPP_API_testv+0x124>
    800087dc:	00007797          	auipc	a5,0x7
    800087e0:	a867c783          	lbu	a5,-1402(a5) # 8000f262 <_ZL9finishedB>
    800087e4:	fe0782e3          	beqz	a5,800087c8 <_Z20Threads_CPP_API_testv+0x124>
    800087e8:	00007797          	auipc	a5,0x7
    800087ec:	a797c783          	lbu	a5,-1415(a5) # 8000f261 <_ZL9finishedC>
    800087f0:	fc078ce3          	beqz	a5,800087c8 <_Z20Threads_CPP_API_testv+0x124>
    800087f4:	00007797          	auipc	a5,0x7
    800087f8:	a6c7c783          	lbu	a5,-1428(a5) # 8000f260 <_ZL9finishedD>
    800087fc:	fc0786e3          	beqz	a5,800087c8 <_Z20Threads_CPP_API_testv+0x124>
    80008800:	fc040493          	addi	s1,s0,-64
    80008804:	0080006f          	j	8000880c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80008808:	00848493          	addi	s1,s1,8
    8000880c:	fe040793          	addi	a5,s0,-32
    80008810:	08f48663          	beq	s1,a5,8000889c <_Z20Threads_CPP_API_testv+0x1f8>
    80008814:	0004b503          	ld	a0,0(s1)
    80008818:	fe0508e3          	beqz	a0,80008808 <_Z20Threads_CPP_API_testv+0x164>
    8000881c:	00053783          	ld	a5,0(a0)
    80008820:	0087b783          	ld	a5,8(a5)
    80008824:	000780e7          	jalr	a5
    80008828:	fe1ff06f          	j	80008808 <_Z20Threads_CPP_API_testv+0x164>
    8000882c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80008830:	00048513          	mv	a0,s1
    80008834:	ffff9097          	auipc	ra,0xffff9
    80008838:	990080e7          	jalr	-1648(ra) # 800011c4 <_ZdlPv>
    8000883c:	00090513          	mv	a0,s2
    80008840:	00008097          	auipc	ra,0x8
    80008844:	b28080e7          	jalr	-1240(ra) # 80010368 <_Unwind_Resume>
    80008848:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    8000884c:	00048513          	mv	a0,s1
    80008850:	ffff9097          	auipc	ra,0xffff9
    80008854:	974080e7          	jalr	-1676(ra) # 800011c4 <_ZdlPv>
    80008858:	00090513          	mv	a0,s2
    8000885c:	00008097          	auipc	ra,0x8
    80008860:	b0c080e7          	jalr	-1268(ra) # 80010368 <_Unwind_Resume>
    80008864:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80008868:	00048513          	mv	a0,s1
    8000886c:	ffff9097          	auipc	ra,0xffff9
    80008870:	958080e7          	jalr	-1704(ra) # 800011c4 <_ZdlPv>
    80008874:	00090513          	mv	a0,s2
    80008878:	00008097          	auipc	ra,0x8
    8000887c:	af0080e7          	jalr	-1296(ra) # 80010368 <_Unwind_Resume>
    80008880:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80008884:	00048513          	mv	a0,s1
    80008888:	ffff9097          	auipc	ra,0xffff9
    8000888c:	93c080e7          	jalr	-1732(ra) # 800011c4 <_ZdlPv>
    80008890:	00090513          	mv	a0,s2
    80008894:	00008097          	auipc	ra,0x8
    80008898:	ad4080e7          	jalr	-1324(ra) # 80010368 <_Unwind_Resume>
}
    8000889c:	03813083          	ld	ra,56(sp)
    800088a0:	03013403          	ld	s0,48(sp)
    800088a4:	02813483          	ld	s1,40(sp)
    800088a8:	02013903          	ld	s2,32(sp)
    800088ac:	04010113          	addi	sp,sp,64
    800088b0:	00008067          	ret

00000000800088b4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800088b4:	ff010113          	addi	sp,sp,-16
    800088b8:	00113423          	sd	ra,8(sp)
    800088bc:	00813023          	sd	s0,0(sp)
    800088c0:	01010413          	addi	s0,sp,16
    800088c4:	00004797          	auipc	a5,0x4
    800088c8:	1bc78793          	addi	a5,a5,444 # 8000ca80 <_ZTV7WorkerA+0x10>
    800088cc:	00f53023          	sd	a5,0(a0)
    800088d0:	ffff9097          	auipc	ra,0xffff9
    800088d4:	87c080e7          	jalr	-1924(ra) # 8000114c <_ZN6ThreadD1Ev>
    800088d8:	00813083          	ld	ra,8(sp)
    800088dc:	00013403          	ld	s0,0(sp)
    800088e0:	01010113          	addi	sp,sp,16
    800088e4:	00008067          	ret

00000000800088e8 <_ZN7WorkerAD0Ev>:
    800088e8:	fe010113          	addi	sp,sp,-32
    800088ec:	00113c23          	sd	ra,24(sp)
    800088f0:	00813823          	sd	s0,16(sp)
    800088f4:	00913423          	sd	s1,8(sp)
    800088f8:	02010413          	addi	s0,sp,32
    800088fc:	00050493          	mv	s1,a0
    80008900:	00004797          	auipc	a5,0x4
    80008904:	18078793          	addi	a5,a5,384 # 8000ca80 <_ZTV7WorkerA+0x10>
    80008908:	00f53023          	sd	a5,0(a0)
    8000890c:	ffff9097          	auipc	ra,0xffff9
    80008910:	840080e7          	jalr	-1984(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008914:	00048513          	mv	a0,s1
    80008918:	ffff9097          	auipc	ra,0xffff9
    8000891c:	8ac080e7          	jalr	-1876(ra) # 800011c4 <_ZdlPv>
    80008920:	01813083          	ld	ra,24(sp)
    80008924:	01013403          	ld	s0,16(sp)
    80008928:	00813483          	ld	s1,8(sp)
    8000892c:	02010113          	addi	sp,sp,32
    80008930:	00008067          	ret

0000000080008934 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80008934:	ff010113          	addi	sp,sp,-16
    80008938:	00113423          	sd	ra,8(sp)
    8000893c:	00813023          	sd	s0,0(sp)
    80008940:	01010413          	addi	s0,sp,16
    80008944:	00004797          	auipc	a5,0x4
    80008948:	16478793          	addi	a5,a5,356 # 8000caa8 <_ZTV7WorkerB+0x10>
    8000894c:	00f53023          	sd	a5,0(a0)
    80008950:	ffff8097          	auipc	ra,0xffff8
    80008954:	7fc080e7          	jalr	2044(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008958:	00813083          	ld	ra,8(sp)
    8000895c:	00013403          	ld	s0,0(sp)
    80008960:	01010113          	addi	sp,sp,16
    80008964:	00008067          	ret

0000000080008968 <_ZN7WorkerBD0Ev>:
    80008968:	fe010113          	addi	sp,sp,-32
    8000896c:	00113c23          	sd	ra,24(sp)
    80008970:	00813823          	sd	s0,16(sp)
    80008974:	00913423          	sd	s1,8(sp)
    80008978:	02010413          	addi	s0,sp,32
    8000897c:	00050493          	mv	s1,a0
    80008980:	00004797          	auipc	a5,0x4
    80008984:	12878793          	addi	a5,a5,296 # 8000caa8 <_ZTV7WorkerB+0x10>
    80008988:	00f53023          	sd	a5,0(a0)
    8000898c:	ffff8097          	auipc	ra,0xffff8
    80008990:	7c0080e7          	jalr	1984(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008994:	00048513          	mv	a0,s1
    80008998:	ffff9097          	auipc	ra,0xffff9
    8000899c:	82c080e7          	jalr	-2004(ra) # 800011c4 <_ZdlPv>
    800089a0:	01813083          	ld	ra,24(sp)
    800089a4:	01013403          	ld	s0,16(sp)
    800089a8:	00813483          	ld	s1,8(sp)
    800089ac:	02010113          	addi	sp,sp,32
    800089b0:	00008067          	ret

00000000800089b4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800089b4:	ff010113          	addi	sp,sp,-16
    800089b8:	00113423          	sd	ra,8(sp)
    800089bc:	00813023          	sd	s0,0(sp)
    800089c0:	01010413          	addi	s0,sp,16
    800089c4:	00004797          	auipc	a5,0x4
    800089c8:	10c78793          	addi	a5,a5,268 # 8000cad0 <_ZTV7WorkerC+0x10>
    800089cc:	00f53023          	sd	a5,0(a0)
    800089d0:	ffff8097          	auipc	ra,0xffff8
    800089d4:	77c080e7          	jalr	1916(ra) # 8000114c <_ZN6ThreadD1Ev>
    800089d8:	00813083          	ld	ra,8(sp)
    800089dc:	00013403          	ld	s0,0(sp)
    800089e0:	01010113          	addi	sp,sp,16
    800089e4:	00008067          	ret

00000000800089e8 <_ZN7WorkerCD0Ev>:
    800089e8:	fe010113          	addi	sp,sp,-32
    800089ec:	00113c23          	sd	ra,24(sp)
    800089f0:	00813823          	sd	s0,16(sp)
    800089f4:	00913423          	sd	s1,8(sp)
    800089f8:	02010413          	addi	s0,sp,32
    800089fc:	00050493          	mv	s1,a0
    80008a00:	00004797          	auipc	a5,0x4
    80008a04:	0d078793          	addi	a5,a5,208 # 8000cad0 <_ZTV7WorkerC+0x10>
    80008a08:	00f53023          	sd	a5,0(a0)
    80008a0c:	ffff8097          	auipc	ra,0xffff8
    80008a10:	740080e7          	jalr	1856(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008a14:	00048513          	mv	a0,s1
    80008a18:	ffff8097          	auipc	ra,0xffff8
    80008a1c:	7ac080e7          	jalr	1964(ra) # 800011c4 <_ZdlPv>
    80008a20:	01813083          	ld	ra,24(sp)
    80008a24:	01013403          	ld	s0,16(sp)
    80008a28:	00813483          	ld	s1,8(sp)
    80008a2c:	02010113          	addi	sp,sp,32
    80008a30:	00008067          	ret

0000000080008a34 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80008a34:	ff010113          	addi	sp,sp,-16
    80008a38:	00113423          	sd	ra,8(sp)
    80008a3c:	00813023          	sd	s0,0(sp)
    80008a40:	01010413          	addi	s0,sp,16
    80008a44:	00004797          	auipc	a5,0x4
    80008a48:	0b478793          	addi	a5,a5,180 # 8000caf8 <_ZTV7WorkerD+0x10>
    80008a4c:	00f53023          	sd	a5,0(a0)
    80008a50:	ffff8097          	auipc	ra,0xffff8
    80008a54:	6fc080e7          	jalr	1788(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008a58:	00813083          	ld	ra,8(sp)
    80008a5c:	00013403          	ld	s0,0(sp)
    80008a60:	01010113          	addi	sp,sp,16
    80008a64:	00008067          	ret

0000000080008a68 <_ZN7WorkerDD0Ev>:
    80008a68:	fe010113          	addi	sp,sp,-32
    80008a6c:	00113c23          	sd	ra,24(sp)
    80008a70:	00813823          	sd	s0,16(sp)
    80008a74:	00913423          	sd	s1,8(sp)
    80008a78:	02010413          	addi	s0,sp,32
    80008a7c:	00050493          	mv	s1,a0
    80008a80:	00004797          	auipc	a5,0x4
    80008a84:	07878793          	addi	a5,a5,120 # 8000caf8 <_ZTV7WorkerD+0x10>
    80008a88:	00f53023          	sd	a5,0(a0)
    80008a8c:	ffff8097          	auipc	ra,0xffff8
    80008a90:	6c0080e7          	jalr	1728(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008a94:	00048513          	mv	a0,s1
    80008a98:	ffff8097          	auipc	ra,0xffff8
    80008a9c:	72c080e7          	jalr	1836(ra) # 800011c4 <_ZdlPv>
    80008aa0:	01813083          	ld	ra,24(sp)
    80008aa4:	01013403          	ld	s0,16(sp)
    80008aa8:	00813483          	ld	s1,8(sp)
    80008aac:	02010113          	addi	sp,sp,32
    80008ab0:	00008067          	ret

0000000080008ab4 <_ZN7WorkerA3runEv>:
    void run() override {
    80008ab4:	ff010113          	addi	sp,sp,-16
    80008ab8:	00113423          	sd	ra,8(sp)
    80008abc:	00813023          	sd	s0,0(sp)
    80008ac0:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80008ac4:	00000593          	li	a1,0
    80008ac8:	fffff097          	auipc	ra,0xfffff
    80008acc:	774080e7          	jalr	1908(ra) # 8000823c <_ZN7WorkerA11workerBodyAEPv>
    }
    80008ad0:	00813083          	ld	ra,8(sp)
    80008ad4:	00013403          	ld	s0,0(sp)
    80008ad8:	01010113          	addi	sp,sp,16
    80008adc:	00008067          	ret

0000000080008ae0 <_ZN7WorkerB3runEv>:
    void run() override {
    80008ae0:	ff010113          	addi	sp,sp,-16
    80008ae4:	00113423          	sd	ra,8(sp)
    80008ae8:	00813023          	sd	s0,0(sp)
    80008aec:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80008af0:	00000593          	li	a1,0
    80008af4:	00000097          	auipc	ra,0x0
    80008af8:	814080e7          	jalr	-2028(ra) # 80008308 <_ZN7WorkerB11workerBodyBEPv>
    }
    80008afc:	00813083          	ld	ra,8(sp)
    80008b00:	00013403          	ld	s0,0(sp)
    80008b04:	01010113          	addi	sp,sp,16
    80008b08:	00008067          	ret

0000000080008b0c <_ZN7WorkerC3runEv>:
    void run() override {
    80008b0c:	ff010113          	addi	sp,sp,-16
    80008b10:	00113423          	sd	ra,8(sp)
    80008b14:	00813023          	sd	s0,0(sp)
    80008b18:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80008b1c:	00000593          	li	a1,0
    80008b20:	00000097          	auipc	ra,0x0
    80008b24:	8bc080e7          	jalr	-1860(ra) # 800083dc <_ZN7WorkerC11workerBodyCEPv>
    }
    80008b28:	00813083          	ld	ra,8(sp)
    80008b2c:	00013403          	ld	s0,0(sp)
    80008b30:	01010113          	addi	sp,sp,16
    80008b34:	00008067          	ret

0000000080008b38 <_ZN7WorkerD3runEv>:
    void run() override {
    80008b38:	ff010113          	addi	sp,sp,-16
    80008b3c:	00113423          	sd	ra,8(sp)
    80008b40:	00813023          	sd	s0,0(sp)
    80008b44:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80008b48:	00000593          	li	a1,0
    80008b4c:	00000097          	auipc	ra,0x0
    80008b50:	a10080e7          	jalr	-1520(ra) # 8000855c <_ZN7WorkerD11workerBodyDEPv>
    }
    80008b54:	00813083          	ld	ra,8(sp)
    80008b58:	00013403          	ld	s0,0(sp)
    80008b5c:	01010113          	addi	sp,sp,16
    80008b60:	00008067          	ret

0000000080008b64 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80008b64:	f8010113          	addi	sp,sp,-128
    80008b68:	06113c23          	sd	ra,120(sp)
    80008b6c:	06813823          	sd	s0,112(sp)
    80008b70:	06913423          	sd	s1,104(sp)
    80008b74:	07213023          	sd	s2,96(sp)
    80008b78:	05313c23          	sd	s3,88(sp)
    80008b7c:	05413823          	sd	s4,80(sp)
    80008b80:	05513423          	sd	s5,72(sp)
    80008b84:	05613023          	sd	s6,64(sp)
    80008b88:	03713c23          	sd	s7,56(sp)
    80008b8c:	03813823          	sd	s8,48(sp)
    80008b90:	03913423          	sd	s9,40(sp)
    80008b94:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80008b98:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80008b9c:	00004517          	auipc	a0,0x4
    80008ba0:	ae450513          	addi	a0,a0,-1308 # 8000c680 <_ZTV9Semaphore+0x638>
    80008ba4:	ffffe097          	auipc	ra,0xffffe
    80008ba8:	7ac080e7          	jalr	1964(ra) # 80007350 <_Z11printStringPKc>
    getString(input, 30);
    80008bac:	01e00593          	li	a1,30
    80008bb0:	f8040513          	addi	a0,s0,-128
    80008bb4:	fffff097          	auipc	ra,0xfffff
    80008bb8:	824080e7          	jalr	-2012(ra) # 800073d8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80008bbc:	f8040513          	addi	a0,s0,-128
    80008bc0:	fffff097          	auipc	ra,0xfffff
    80008bc4:	8f0080e7          	jalr	-1808(ra) # 800074b0 <_Z11stringToIntPKc>
    80008bc8:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80008bcc:	00004517          	auipc	a0,0x4
    80008bd0:	ad450513          	addi	a0,a0,-1324 # 8000c6a0 <_ZTV9Semaphore+0x658>
    80008bd4:	ffffe097          	auipc	ra,0xffffe
    80008bd8:	77c080e7          	jalr	1916(ra) # 80007350 <_Z11printStringPKc>
    getString(input, 30);
    80008bdc:	01e00593          	li	a1,30
    80008be0:	f8040513          	addi	a0,s0,-128
    80008be4:	ffffe097          	auipc	ra,0xffffe
    80008be8:	7f4080e7          	jalr	2036(ra) # 800073d8 <_Z9getStringPci>
    n = stringToInt(input);
    80008bec:	f8040513          	addi	a0,s0,-128
    80008bf0:	fffff097          	auipc	ra,0xfffff
    80008bf4:	8c0080e7          	jalr	-1856(ra) # 800074b0 <_Z11stringToIntPKc>
    80008bf8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80008bfc:	00004517          	auipc	a0,0x4
    80008c00:	ac450513          	addi	a0,a0,-1340 # 8000c6c0 <_ZTV9Semaphore+0x678>
    80008c04:	ffffe097          	auipc	ra,0xffffe
    80008c08:	74c080e7          	jalr	1868(ra) # 80007350 <_Z11printStringPKc>
    printInt(threadNum);
    80008c0c:	00000613          	li	a2,0
    80008c10:	00a00593          	li	a1,10
    80008c14:	00098513          	mv	a0,s3
    80008c18:	fffff097          	auipc	ra,0xfffff
    80008c1c:	8e8080e7          	jalr	-1816(ra) # 80007500 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80008c20:	00004517          	auipc	a0,0x4
    80008c24:	ab850513          	addi	a0,a0,-1352 # 8000c6d8 <_ZTV9Semaphore+0x690>
    80008c28:	ffffe097          	auipc	ra,0xffffe
    80008c2c:	728080e7          	jalr	1832(ra) # 80007350 <_Z11printStringPKc>
    printInt(n);
    80008c30:	00000613          	li	a2,0
    80008c34:	00a00593          	li	a1,10
    80008c38:	00048513          	mv	a0,s1
    80008c3c:	fffff097          	auipc	ra,0xfffff
    80008c40:	8c4080e7          	jalr	-1852(ra) # 80007500 <_Z8printIntiii>
    printString(".\n");
    80008c44:	00004517          	auipc	a0,0x4
    80008c48:	aac50513          	addi	a0,a0,-1364 # 8000c6f0 <_ZTV9Semaphore+0x6a8>
    80008c4c:	ffffe097          	auipc	ra,0xffffe
    80008c50:	704080e7          	jalr	1796(ra) # 80007350 <_Z11printStringPKc>
    if (threadNum > n) {
    80008c54:	0334c463          	blt	s1,s3,80008c7c <_Z20testConsumerProducerv+0x118>
    } else if (threadNum < 1) {
    80008c58:	03305c63          	blez	s3,80008c90 <_Z20testConsumerProducerv+0x12c>
    BufferCPP *buffer = new BufferCPP(n);
    80008c5c:	03800513          	li	a0,56
    80008c60:	ffff8097          	auipc	ra,0xffff8
    80008c64:	53c080e7          	jalr	1340(ra) # 8000119c <_Znwm>
    80008c68:	00050a93          	mv	s5,a0
    80008c6c:	00048593          	mv	a1,s1
    80008c70:	ffffe097          	auipc	ra,0xffffe
    80008c74:	2e8080e7          	jalr	744(ra) # 80006f58 <_ZN9BufferCPPC1Ei>
    80008c78:	0300006f          	j	80008ca8 <_Z20testConsumerProducerv+0x144>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80008c7c:	00004517          	auipc	a0,0x4
    80008c80:	a7c50513          	addi	a0,a0,-1412 # 8000c6f8 <_ZTV9Semaphore+0x6b0>
    80008c84:	ffffe097          	auipc	ra,0xffffe
    80008c88:	6cc080e7          	jalr	1740(ra) # 80007350 <_Z11printStringPKc>
        return;
    80008c8c:	0140006f          	j	80008ca0 <_Z20testConsumerProducerv+0x13c>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80008c90:	00004517          	auipc	a0,0x4
    80008c94:	aa850513          	addi	a0,a0,-1368 # 8000c738 <_ZTV9Semaphore+0x6f0>
    80008c98:	ffffe097          	auipc	ra,0xffffe
    80008c9c:	6b8080e7          	jalr	1720(ra) # 80007350 <_Z11printStringPKc>
        return;
    80008ca0:	000c0113          	mv	sp,s8
    80008ca4:	2140006f          	j	80008eb8 <_Z20testConsumerProducerv+0x354>
    waitForAll = new Semaphore(0);
    80008ca8:	01000513          	li	a0,16
    80008cac:	ffff8097          	auipc	ra,0xffff8
    80008cb0:	4f0080e7          	jalr	1264(ra) # 8000119c <_Znwm>
    80008cb4:	00050913          	mv	s2,a0
    80008cb8:	00000593          	li	a1,0
    80008cbc:	ffff8097          	auipc	ra,0xffff8
    80008cc0:	718080e7          	jalr	1816(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80008cc4:	00006797          	auipc	a5,0x6
    80008cc8:	5b27b623          	sd	s2,1452(a5) # 8000f270 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80008ccc:	00399793          	slli	a5,s3,0x3
    80008cd0:	00f78793          	addi	a5,a5,15
    80008cd4:	ff07f793          	andi	a5,a5,-16
    80008cd8:	40f10133          	sub	sp,sp,a5
    80008cdc:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80008ce0:	0019871b          	addiw	a4,s3,1
    80008ce4:	00171793          	slli	a5,a4,0x1
    80008ce8:	00e787b3          	add	a5,a5,a4
    80008cec:	00379793          	slli	a5,a5,0x3
    80008cf0:	00f78793          	addi	a5,a5,15
    80008cf4:	ff07f793          	andi	a5,a5,-16
    80008cf8:	40f10133          	sub	sp,sp,a5
    80008cfc:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80008d00:	00199493          	slli	s1,s3,0x1
    80008d04:	013484b3          	add	s1,s1,s3
    80008d08:	00349493          	slli	s1,s1,0x3
    80008d0c:	009b04b3          	add	s1,s6,s1
    80008d10:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80008d14:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80008d18:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80008d1c:	02800513          	li	a0,40
    80008d20:	ffff8097          	auipc	ra,0xffff8
    80008d24:	47c080e7          	jalr	1148(ra) # 8000119c <_Znwm>
    80008d28:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80008d2c:	ffff8097          	auipc	ra,0xffff8
    80008d30:	650080e7          	jalr	1616(ra) # 8000137c <_ZN6ThreadC1Ev>
    80008d34:	00004797          	auipc	a5,0x4
    80008d38:	e3c78793          	addi	a5,a5,-452 # 8000cb70 <_ZTV8Consumer+0x10>
    80008d3c:	00fbb023          	sd	a5,0(s7)
    80008d40:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80008d44:	000b8513          	mv	a0,s7
    80008d48:	ffff8097          	auipc	ra,0xffff8
    80008d4c:	58c080e7          	jalr	1420(ra) # 800012d4 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80008d50:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80008d54:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80008d58:	00006797          	auipc	a5,0x6
    80008d5c:	5187b783          	ld	a5,1304(a5) # 8000f270 <_ZL10waitForAll>
    80008d60:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008d64:	02800513          	li	a0,40
    80008d68:	ffff8097          	auipc	ra,0xffff8
    80008d6c:	434080e7          	jalr	1076(ra) # 8000119c <_Znwm>
    80008d70:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80008d74:	ffff8097          	auipc	ra,0xffff8
    80008d78:	608080e7          	jalr	1544(ra) # 8000137c <_ZN6ThreadC1Ev>
    80008d7c:	00004797          	auipc	a5,0x4
    80008d80:	da478793          	addi	a5,a5,-604 # 8000cb20 <_ZTV16ProducerKeyborad+0x10>
    80008d84:	00f4b023          	sd	a5,0(s1)
    80008d88:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008d8c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80008d90:	00048513          	mv	a0,s1
    80008d94:	ffff8097          	auipc	ra,0xffff8
    80008d98:	540080e7          	jalr	1344(ra) # 800012d4 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80008d9c:	00100913          	li	s2,1
    80008da0:	0300006f          	j	80008dd0 <_Z20testConsumerProducerv+0x26c>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80008da4:	00004797          	auipc	a5,0x4
    80008da8:	da478793          	addi	a5,a5,-604 # 8000cb48 <_ZTV8Producer+0x10>
    80008dac:	00fcb023          	sd	a5,0(s9)
    80008db0:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80008db4:	00391793          	slli	a5,s2,0x3
    80008db8:	00fa07b3          	add	a5,s4,a5
    80008dbc:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80008dc0:	000c8513          	mv	a0,s9
    80008dc4:	ffff8097          	auipc	ra,0xffff8
    80008dc8:	510080e7          	jalr	1296(ra) # 800012d4 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80008dcc:	0019091b          	addiw	s2,s2,1
    80008dd0:	05395263          	bge	s2,s3,80008e14 <_Z20testConsumerProducerv+0x2b0>
        threadData[i].id = i;
    80008dd4:	00191493          	slli	s1,s2,0x1
    80008dd8:	012484b3          	add	s1,s1,s2
    80008ddc:	00349493          	slli	s1,s1,0x3
    80008de0:	009b04b3          	add	s1,s6,s1
    80008de4:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80008de8:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80008dec:	00006797          	auipc	a5,0x6
    80008df0:	4847b783          	ld	a5,1156(a5) # 8000f270 <_ZL10waitForAll>
    80008df4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80008df8:	02800513          	li	a0,40
    80008dfc:	ffff8097          	auipc	ra,0xffff8
    80008e00:	3a0080e7          	jalr	928(ra) # 8000119c <_Znwm>
    80008e04:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80008e08:	ffff8097          	auipc	ra,0xffff8
    80008e0c:	574080e7          	jalr	1396(ra) # 8000137c <_ZN6ThreadC1Ev>
    80008e10:	f95ff06f          	j	80008da4 <_Z20testConsumerProducerv+0x240>
    Thread::dispatch();
    80008e14:	ffff8097          	auipc	ra,0xffff8
    80008e18:	540080e7          	jalr	1344(ra) # 80001354 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80008e1c:	00000493          	li	s1,0
    80008e20:	0099ce63          	blt	s3,s1,80008e3c <_Z20testConsumerProducerv+0x2d8>
        waitForAll->wait();
    80008e24:	00006517          	auipc	a0,0x6
    80008e28:	44c53503          	ld	a0,1100(a0) # 8000f270 <_ZL10waitForAll>
    80008e2c:	ffff8097          	auipc	ra,0xffff8
    80008e30:	5e0080e7          	jalr	1504(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80008e34:	0014849b          	addiw	s1,s1,1
    80008e38:	fe9ff06f          	j	80008e20 <_Z20testConsumerProducerv+0x2bc>
    delete waitForAll;
    80008e3c:	00006517          	auipc	a0,0x6
    80008e40:	43453503          	ld	a0,1076(a0) # 8000f270 <_ZL10waitForAll>
    80008e44:	00050863          	beqz	a0,80008e54 <_Z20testConsumerProducerv+0x2f0>
    80008e48:	00053783          	ld	a5,0(a0)
    80008e4c:	0087b783          	ld	a5,8(a5)
    80008e50:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80008e54:	00000493          	li	s1,0
    80008e58:	0080006f          	j	80008e60 <_Z20testConsumerProducerv+0x2fc>
    for (int i = 0; i < threadNum; i++) {
    80008e5c:	0014849b          	addiw	s1,s1,1
    80008e60:	0334d263          	bge	s1,s3,80008e84 <_Z20testConsumerProducerv+0x320>
        delete producers[i];
    80008e64:	00349793          	slli	a5,s1,0x3
    80008e68:	00fa07b3          	add	a5,s4,a5
    80008e6c:	0007b503          	ld	a0,0(a5)
    80008e70:	fe0506e3          	beqz	a0,80008e5c <_Z20testConsumerProducerv+0x2f8>
    80008e74:	00053783          	ld	a5,0(a0)
    80008e78:	0087b783          	ld	a5,8(a5)
    80008e7c:	000780e7          	jalr	a5
    80008e80:	fddff06f          	j	80008e5c <_Z20testConsumerProducerv+0x2f8>
    delete consumer;
    80008e84:	000b8a63          	beqz	s7,80008e98 <_Z20testConsumerProducerv+0x334>
    80008e88:	000bb783          	ld	a5,0(s7)
    80008e8c:	0087b783          	ld	a5,8(a5)
    80008e90:	000b8513          	mv	a0,s7
    80008e94:	000780e7          	jalr	a5
    delete buffer;
    80008e98:	000a8e63          	beqz	s5,80008eb4 <_Z20testConsumerProducerv+0x350>
    80008e9c:	000a8513          	mv	a0,s5
    80008ea0:	ffffe097          	auipc	ra,0xffffe
    80008ea4:	3b0080e7          	jalr	944(ra) # 80007250 <_ZN9BufferCPPD1Ev>
    80008ea8:	000a8513          	mv	a0,s5
    80008eac:	ffff8097          	auipc	ra,0xffff8
    80008eb0:	318080e7          	jalr	792(ra) # 800011c4 <_ZdlPv>
    80008eb4:	000c0113          	mv	sp,s8
}
    80008eb8:	f8040113          	addi	sp,s0,-128
    80008ebc:	07813083          	ld	ra,120(sp)
    80008ec0:	07013403          	ld	s0,112(sp)
    80008ec4:	06813483          	ld	s1,104(sp)
    80008ec8:	06013903          	ld	s2,96(sp)
    80008ecc:	05813983          	ld	s3,88(sp)
    80008ed0:	05013a03          	ld	s4,80(sp)
    80008ed4:	04813a83          	ld	s5,72(sp)
    80008ed8:	04013b03          	ld	s6,64(sp)
    80008edc:	03813b83          	ld	s7,56(sp)
    80008ee0:	03013c03          	ld	s8,48(sp)
    80008ee4:	02813c83          	ld	s9,40(sp)
    80008ee8:	08010113          	addi	sp,sp,128
    80008eec:	00008067          	ret
    80008ef0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80008ef4:	000a8513          	mv	a0,s5
    80008ef8:	ffff8097          	auipc	ra,0xffff8
    80008efc:	2cc080e7          	jalr	716(ra) # 800011c4 <_ZdlPv>
    80008f00:	00048513          	mv	a0,s1
    80008f04:	00007097          	auipc	ra,0x7
    80008f08:	464080e7          	jalr	1124(ra) # 80010368 <_Unwind_Resume>
    80008f0c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80008f10:	00090513          	mv	a0,s2
    80008f14:	ffff8097          	auipc	ra,0xffff8
    80008f18:	2b0080e7          	jalr	688(ra) # 800011c4 <_ZdlPv>
    80008f1c:	00048513          	mv	a0,s1
    80008f20:	00007097          	auipc	ra,0x7
    80008f24:	448080e7          	jalr	1096(ra) # 80010368 <_Unwind_Resume>
    80008f28:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80008f2c:	000b8513          	mv	a0,s7
    80008f30:	ffff8097          	auipc	ra,0xffff8
    80008f34:	294080e7          	jalr	660(ra) # 800011c4 <_ZdlPv>
    80008f38:	00048513          	mv	a0,s1
    80008f3c:	00007097          	auipc	ra,0x7
    80008f40:	42c080e7          	jalr	1068(ra) # 80010368 <_Unwind_Resume>
    80008f44:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008f48:	00048513          	mv	a0,s1
    80008f4c:	ffff8097          	auipc	ra,0xffff8
    80008f50:	278080e7          	jalr	632(ra) # 800011c4 <_ZdlPv>
    80008f54:	00090513          	mv	a0,s2
    80008f58:	00007097          	auipc	ra,0x7
    80008f5c:	410080e7          	jalr	1040(ra) # 80010368 <_Unwind_Resume>
    80008f60:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80008f64:	000c8513          	mv	a0,s9
    80008f68:	ffff8097          	auipc	ra,0xffff8
    80008f6c:	25c080e7          	jalr	604(ra) # 800011c4 <_ZdlPv>
    80008f70:	00048513          	mv	a0,s1
    80008f74:	00007097          	auipc	ra,0x7
    80008f78:	3f4080e7          	jalr	1012(ra) # 80010368 <_Unwind_Resume>

0000000080008f7c <_ZN8Consumer3runEv>:
    void run() override {
    80008f7c:	fd010113          	addi	sp,sp,-48
    80008f80:	02113423          	sd	ra,40(sp)
    80008f84:	02813023          	sd	s0,32(sp)
    80008f88:	00913c23          	sd	s1,24(sp)
    80008f8c:	01213823          	sd	s2,16(sp)
    80008f90:	01313423          	sd	s3,8(sp)
    80008f94:	03010413          	addi	s0,sp,48
    80008f98:	00050913          	mv	s2,a0
        int i = 0;
    80008f9c:	00000993          	li	s3,0
    80008fa0:	0100006f          	j	80008fb0 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80008fa4:	00a00513          	li	a0,10
    80008fa8:	ffff8097          	auipc	ra,0xffff8
    80008fac:	4e4080e7          	jalr	1252(ra) # 8000148c <_ZN7Console4putcEc>
        while (!threadEnd) {
    80008fb0:	00006797          	auipc	a5,0x6
    80008fb4:	2b87a783          	lw	a5,696(a5) # 8000f268 <_ZL9threadEnd>
    80008fb8:	04079a63          	bnez	a5,8000900c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80008fbc:	02093783          	ld	a5,32(s2)
    80008fc0:	0087b503          	ld	a0,8(a5)
    80008fc4:	ffffe097          	auipc	ra,0xffffe
    80008fc8:	178080e7          	jalr	376(ra) # 8000713c <_ZN9BufferCPP3getEv>
            i++;
    80008fcc:	0019849b          	addiw	s1,s3,1
    80008fd0:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80008fd4:	0ff57513          	andi	a0,a0,255
    80008fd8:	ffff8097          	auipc	ra,0xffff8
    80008fdc:	4b4080e7          	jalr	1204(ra) # 8000148c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80008fe0:	05000793          	li	a5,80
    80008fe4:	02f4e4bb          	remw	s1,s1,a5
    80008fe8:	fc0494e3          	bnez	s1,80008fb0 <_ZN8Consumer3runEv+0x34>
    80008fec:	fb9ff06f          	j	80008fa4 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80008ff0:	02093783          	ld	a5,32(s2)
    80008ff4:	0087b503          	ld	a0,8(a5)
    80008ff8:	ffffe097          	auipc	ra,0xffffe
    80008ffc:	144080e7          	jalr	324(ra) # 8000713c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80009000:	0ff57513          	andi	a0,a0,255
    80009004:	ffff8097          	auipc	ra,0xffff8
    80009008:	488080e7          	jalr	1160(ra) # 8000148c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000900c:	02093783          	ld	a5,32(s2)
    80009010:	0087b503          	ld	a0,8(a5)
    80009014:	ffffe097          	auipc	ra,0xffffe
    80009018:	1b4080e7          	jalr	436(ra) # 800071c8 <_ZN9BufferCPP6getCntEv>
    8000901c:	fca04ae3          	bgtz	a0,80008ff0 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80009020:	02093783          	ld	a5,32(s2)
    80009024:	0107b503          	ld	a0,16(a5)
    80009028:	ffff8097          	auipc	ra,0xffff8
    8000902c:	410080e7          	jalr	1040(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80009030:	02813083          	ld	ra,40(sp)
    80009034:	02013403          	ld	s0,32(sp)
    80009038:	01813483          	ld	s1,24(sp)
    8000903c:	01013903          	ld	s2,16(sp)
    80009040:	00813983          	ld	s3,8(sp)
    80009044:	03010113          	addi	sp,sp,48
    80009048:	00008067          	ret

000000008000904c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    8000904c:	ff010113          	addi	sp,sp,-16
    80009050:	00113423          	sd	ra,8(sp)
    80009054:	00813023          	sd	s0,0(sp)
    80009058:	01010413          	addi	s0,sp,16
    8000905c:	00004797          	auipc	a5,0x4
    80009060:	b1478793          	addi	a5,a5,-1260 # 8000cb70 <_ZTV8Consumer+0x10>
    80009064:	00f53023          	sd	a5,0(a0)
    80009068:	ffff8097          	auipc	ra,0xffff8
    8000906c:	0e4080e7          	jalr	228(ra) # 8000114c <_ZN6ThreadD1Ev>
    80009070:	00813083          	ld	ra,8(sp)
    80009074:	00013403          	ld	s0,0(sp)
    80009078:	01010113          	addi	sp,sp,16
    8000907c:	00008067          	ret

0000000080009080 <_ZN8ConsumerD0Ev>:
    80009080:	fe010113          	addi	sp,sp,-32
    80009084:	00113c23          	sd	ra,24(sp)
    80009088:	00813823          	sd	s0,16(sp)
    8000908c:	00913423          	sd	s1,8(sp)
    80009090:	02010413          	addi	s0,sp,32
    80009094:	00050493          	mv	s1,a0
    80009098:	00004797          	auipc	a5,0x4
    8000909c:	ad878793          	addi	a5,a5,-1320 # 8000cb70 <_ZTV8Consumer+0x10>
    800090a0:	00f53023          	sd	a5,0(a0)
    800090a4:	ffff8097          	auipc	ra,0xffff8
    800090a8:	0a8080e7          	jalr	168(ra) # 8000114c <_ZN6ThreadD1Ev>
    800090ac:	00048513          	mv	a0,s1
    800090b0:	ffff8097          	auipc	ra,0xffff8
    800090b4:	114080e7          	jalr	276(ra) # 800011c4 <_ZdlPv>
    800090b8:	01813083          	ld	ra,24(sp)
    800090bc:	01013403          	ld	s0,16(sp)
    800090c0:	00813483          	ld	s1,8(sp)
    800090c4:	02010113          	addi	sp,sp,32
    800090c8:	00008067          	ret

00000000800090cc <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800090cc:	ff010113          	addi	sp,sp,-16
    800090d0:	00113423          	sd	ra,8(sp)
    800090d4:	00813023          	sd	s0,0(sp)
    800090d8:	01010413          	addi	s0,sp,16
    800090dc:	00004797          	auipc	a5,0x4
    800090e0:	a4478793          	addi	a5,a5,-1468 # 8000cb20 <_ZTV16ProducerKeyborad+0x10>
    800090e4:	00f53023          	sd	a5,0(a0)
    800090e8:	ffff8097          	auipc	ra,0xffff8
    800090ec:	064080e7          	jalr	100(ra) # 8000114c <_ZN6ThreadD1Ev>
    800090f0:	00813083          	ld	ra,8(sp)
    800090f4:	00013403          	ld	s0,0(sp)
    800090f8:	01010113          	addi	sp,sp,16
    800090fc:	00008067          	ret

0000000080009100 <_ZN16ProducerKeyboradD0Ev>:
    80009100:	fe010113          	addi	sp,sp,-32
    80009104:	00113c23          	sd	ra,24(sp)
    80009108:	00813823          	sd	s0,16(sp)
    8000910c:	00913423          	sd	s1,8(sp)
    80009110:	02010413          	addi	s0,sp,32
    80009114:	00050493          	mv	s1,a0
    80009118:	00004797          	auipc	a5,0x4
    8000911c:	a0878793          	addi	a5,a5,-1528 # 8000cb20 <_ZTV16ProducerKeyborad+0x10>
    80009120:	00f53023          	sd	a5,0(a0)
    80009124:	ffff8097          	auipc	ra,0xffff8
    80009128:	028080e7          	jalr	40(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000912c:	00048513          	mv	a0,s1
    80009130:	ffff8097          	auipc	ra,0xffff8
    80009134:	094080e7          	jalr	148(ra) # 800011c4 <_ZdlPv>
    80009138:	01813083          	ld	ra,24(sp)
    8000913c:	01013403          	ld	s0,16(sp)
    80009140:	00813483          	ld	s1,8(sp)
    80009144:	02010113          	addi	sp,sp,32
    80009148:	00008067          	ret

000000008000914c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    8000914c:	ff010113          	addi	sp,sp,-16
    80009150:	00113423          	sd	ra,8(sp)
    80009154:	00813023          	sd	s0,0(sp)
    80009158:	01010413          	addi	s0,sp,16
    8000915c:	00004797          	auipc	a5,0x4
    80009160:	9ec78793          	addi	a5,a5,-1556 # 8000cb48 <_ZTV8Producer+0x10>
    80009164:	00f53023          	sd	a5,0(a0)
    80009168:	ffff8097          	auipc	ra,0xffff8
    8000916c:	fe4080e7          	jalr	-28(ra) # 8000114c <_ZN6ThreadD1Ev>
    80009170:	00813083          	ld	ra,8(sp)
    80009174:	00013403          	ld	s0,0(sp)
    80009178:	01010113          	addi	sp,sp,16
    8000917c:	00008067          	ret

0000000080009180 <_ZN8ProducerD0Ev>:
    80009180:	fe010113          	addi	sp,sp,-32
    80009184:	00113c23          	sd	ra,24(sp)
    80009188:	00813823          	sd	s0,16(sp)
    8000918c:	00913423          	sd	s1,8(sp)
    80009190:	02010413          	addi	s0,sp,32
    80009194:	00050493          	mv	s1,a0
    80009198:	00004797          	auipc	a5,0x4
    8000919c:	9b078793          	addi	a5,a5,-1616 # 8000cb48 <_ZTV8Producer+0x10>
    800091a0:	00f53023          	sd	a5,0(a0)
    800091a4:	ffff8097          	auipc	ra,0xffff8
    800091a8:	fa8080e7          	jalr	-88(ra) # 8000114c <_ZN6ThreadD1Ev>
    800091ac:	00048513          	mv	a0,s1
    800091b0:	ffff8097          	auipc	ra,0xffff8
    800091b4:	014080e7          	jalr	20(ra) # 800011c4 <_ZdlPv>
    800091b8:	01813083          	ld	ra,24(sp)
    800091bc:	01013403          	ld	s0,16(sp)
    800091c0:	00813483          	ld	s1,8(sp)
    800091c4:	02010113          	addi	sp,sp,32
    800091c8:	00008067          	ret

00000000800091cc <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800091cc:	fe010113          	addi	sp,sp,-32
    800091d0:	00113c23          	sd	ra,24(sp)
    800091d4:	00813823          	sd	s0,16(sp)
    800091d8:	00913423          	sd	s1,8(sp)
    800091dc:	02010413          	addi	s0,sp,32
    800091e0:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800091e4:	ffffc097          	auipc	ra,0xffffc
    800091e8:	09c080e7          	jalr	156(ra) # 80005280 <_Z4getcv>
    800091ec:	0005059b          	sext.w	a1,a0
    800091f0:	01b00793          	li	a5,27
    800091f4:	00f58c63          	beq	a1,a5,8000920c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    800091f8:	0204b783          	ld	a5,32(s1)
    800091fc:	0087b503          	ld	a0,8(a5)
    80009200:	ffffe097          	auipc	ra,0xffffe
    80009204:	eac080e7          	jalr	-340(ra) # 800070ac <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80009208:	fddff06f          	j	800091e4 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    8000920c:	00100793          	li	a5,1
    80009210:	00006717          	auipc	a4,0x6
    80009214:	04f72c23          	sw	a5,88(a4) # 8000f268 <_ZL9threadEnd>
        td->buffer->put('!');
    80009218:	0204b783          	ld	a5,32(s1)
    8000921c:	02100593          	li	a1,33
    80009220:	0087b503          	ld	a0,8(a5)
    80009224:	ffffe097          	auipc	ra,0xffffe
    80009228:	e88080e7          	jalr	-376(ra) # 800070ac <_ZN9BufferCPP3putEi>
        td->sem->signal();
    8000922c:	0204b783          	ld	a5,32(s1)
    80009230:	0107b503          	ld	a0,16(a5)
    80009234:	ffff8097          	auipc	ra,0xffff8
    80009238:	204080e7          	jalr	516(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    8000923c:	01813083          	ld	ra,24(sp)
    80009240:	01013403          	ld	s0,16(sp)
    80009244:	00813483          	ld	s1,8(sp)
    80009248:	02010113          	addi	sp,sp,32
    8000924c:	00008067          	ret

0000000080009250 <_ZN8Producer3runEv>:
    void run() override {
    80009250:	fe010113          	addi	sp,sp,-32
    80009254:	00113c23          	sd	ra,24(sp)
    80009258:	00813823          	sd	s0,16(sp)
    8000925c:	00913423          	sd	s1,8(sp)
    80009260:	01213023          	sd	s2,0(sp)
    80009264:	02010413          	addi	s0,sp,32
    80009268:	00050493          	mv	s1,a0
        int i = 0;
    8000926c:	00000913          	li	s2,0
        while (!threadEnd) {
    80009270:	00006797          	auipc	a5,0x6
    80009274:	ff87a783          	lw	a5,-8(a5) # 8000f268 <_ZL9threadEnd>
    80009278:	04079263          	bnez	a5,800092bc <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    8000927c:	0204b783          	ld	a5,32(s1)
    80009280:	0007a583          	lw	a1,0(a5)
    80009284:	0305859b          	addiw	a1,a1,48
    80009288:	0087b503          	ld	a0,8(a5)
    8000928c:	ffffe097          	auipc	ra,0xffffe
    80009290:	e20080e7          	jalr	-480(ra) # 800070ac <_ZN9BufferCPP3putEi>
            i++;
    80009294:	0019071b          	addiw	a4,s2,1
    80009298:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    8000929c:	0204b783          	ld	a5,32(s1)
    800092a0:	0007a783          	lw	a5,0(a5)
    800092a4:	00e787bb          	addw	a5,a5,a4
    800092a8:	00500513          	li	a0,5
    800092ac:	02a7e53b          	remw	a0,a5,a0
    800092b0:	ffff8097          	auipc	ra,0xffff8
    800092b4:	0fc080e7          	jalr	252(ra) # 800013ac <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800092b8:	fb9ff06f          	j	80009270 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800092bc:	0204b783          	ld	a5,32(s1)
    800092c0:	0107b503          	ld	a0,16(a5)
    800092c4:	ffff8097          	auipc	ra,0xffff8
    800092c8:	174080e7          	jalr	372(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    800092cc:	01813083          	ld	ra,24(sp)
    800092d0:	01013403          	ld	s0,16(sp)
    800092d4:	00813483          	ld	s1,8(sp)
    800092d8:	00013903          	ld	s2,0(sp)
    800092dc:	02010113          	addi	sp,sp,32
    800092e0:	00008067          	ret

00000000800092e4 <start>:
    800092e4:	ff010113          	addi	sp,sp,-16
    800092e8:	00813423          	sd	s0,8(sp)
    800092ec:	01010413          	addi	s0,sp,16
    800092f0:	300027f3          	csrr	a5,mstatus
    800092f4:	ffffe737          	lui	a4,0xffffe
    800092f8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffee2ff>
    800092fc:	00e7f7b3          	and	a5,a5,a4
    80009300:	00001737          	lui	a4,0x1
    80009304:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80009308:	00e7e7b3          	or	a5,a5,a4
    8000930c:	30079073          	csrw	mstatus,a5
    80009310:	00000797          	auipc	a5,0x0
    80009314:	16078793          	addi	a5,a5,352 # 80009470 <system_main>
    80009318:	34179073          	csrw	mepc,a5
    8000931c:	00000793          	li	a5,0
    80009320:	18079073          	csrw	satp,a5
    80009324:	000107b7          	lui	a5,0x10
    80009328:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000932c:	30279073          	csrw	medeleg,a5
    80009330:	30379073          	csrw	mideleg,a5
    80009334:	104027f3          	csrr	a5,sie
    80009338:	2227e793          	ori	a5,a5,546
    8000933c:	10479073          	csrw	sie,a5
    80009340:	fff00793          	li	a5,-1
    80009344:	00a7d793          	srli	a5,a5,0xa
    80009348:	3b079073          	csrw	pmpaddr0,a5
    8000934c:	00f00793          	li	a5,15
    80009350:	3a079073          	csrw	pmpcfg0,a5
    80009354:	f14027f3          	csrr	a5,mhartid
    80009358:	0200c737          	lui	a4,0x200c
    8000935c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80009360:	0007869b          	sext.w	a3,a5
    80009364:	00269713          	slli	a4,a3,0x2
    80009368:	000f4637          	lui	a2,0xf4
    8000936c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80009370:	00d70733          	add	a4,a4,a3
    80009374:	0037979b          	slliw	a5,a5,0x3
    80009378:	020046b7          	lui	a3,0x2004
    8000937c:	00d787b3          	add	a5,a5,a3
    80009380:	00c585b3          	add	a1,a1,a2
    80009384:	00371693          	slli	a3,a4,0x3
    80009388:	00006717          	auipc	a4,0x6
    8000938c:	f1870713          	addi	a4,a4,-232 # 8000f2a0 <timer_scratch>
    80009390:	00b7b023          	sd	a1,0(a5)
    80009394:	00d70733          	add	a4,a4,a3
    80009398:	00f73c23          	sd	a5,24(a4)
    8000939c:	02c73023          	sd	a2,32(a4)
    800093a0:	34071073          	csrw	mscratch,a4
    800093a4:	00000797          	auipc	a5,0x0
    800093a8:	6ec78793          	addi	a5,a5,1772 # 80009a90 <timervec>
    800093ac:	30579073          	csrw	mtvec,a5
    800093b0:	300027f3          	csrr	a5,mstatus
    800093b4:	0087e793          	ori	a5,a5,8
    800093b8:	30079073          	csrw	mstatus,a5
    800093bc:	304027f3          	csrr	a5,mie
    800093c0:	0807e793          	ori	a5,a5,128
    800093c4:	30479073          	csrw	mie,a5
    800093c8:	f14027f3          	csrr	a5,mhartid
    800093cc:	0007879b          	sext.w	a5,a5
    800093d0:	00078213          	mv	tp,a5
    800093d4:	30200073          	mret
    800093d8:	00813403          	ld	s0,8(sp)
    800093dc:	01010113          	addi	sp,sp,16
    800093e0:	00008067          	ret

00000000800093e4 <timerinit>:
    800093e4:	ff010113          	addi	sp,sp,-16
    800093e8:	00813423          	sd	s0,8(sp)
    800093ec:	01010413          	addi	s0,sp,16
    800093f0:	f14027f3          	csrr	a5,mhartid
    800093f4:	0200c737          	lui	a4,0x200c
    800093f8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800093fc:	0007869b          	sext.w	a3,a5
    80009400:	00269713          	slli	a4,a3,0x2
    80009404:	000f4637          	lui	a2,0xf4
    80009408:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000940c:	00d70733          	add	a4,a4,a3
    80009410:	0037979b          	slliw	a5,a5,0x3
    80009414:	020046b7          	lui	a3,0x2004
    80009418:	00d787b3          	add	a5,a5,a3
    8000941c:	00c585b3          	add	a1,a1,a2
    80009420:	00371693          	slli	a3,a4,0x3
    80009424:	00006717          	auipc	a4,0x6
    80009428:	e7c70713          	addi	a4,a4,-388 # 8000f2a0 <timer_scratch>
    8000942c:	00b7b023          	sd	a1,0(a5)
    80009430:	00d70733          	add	a4,a4,a3
    80009434:	00f73c23          	sd	a5,24(a4)
    80009438:	02c73023          	sd	a2,32(a4)
    8000943c:	34071073          	csrw	mscratch,a4
    80009440:	00000797          	auipc	a5,0x0
    80009444:	65078793          	addi	a5,a5,1616 # 80009a90 <timervec>
    80009448:	30579073          	csrw	mtvec,a5
    8000944c:	300027f3          	csrr	a5,mstatus
    80009450:	0087e793          	ori	a5,a5,8
    80009454:	30079073          	csrw	mstatus,a5
    80009458:	304027f3          	csrr	a5,mie
    8000945c:	0807e793          	ori	a5,a5,128
    80009460:	30479073          	csrw	mie,a5
    80009464:	00813403          	ld	s0,8(sp)
    80009468:	01010113          	addi	sp,sp,16
    8000946c:	00008067          	ret

0000000080009470 <system_main>:
    80009470:	fe010113          	addi	sp,sp,-32
    80009474:	00813823          	sd	s0,16(sp)
    80009478:	00913423          	sd	s1,8(sp)
    8000947c:	00113c23          	sd	ra,24(sp)
    80009480:	02010413          	addi	s0,sp,32
    80009484:	00000097          	auipc	ra,0x0
    80009488:	0c4080e7          	jalr	196(ra) # 80009548 <cpuid>
    8000948c:	00006497          	auipc	s1,0x6
    80009490:	dec48493          	addi	s1,s1,-532 # 8000f278 <started>
    80009494:	02050263          	beqz	a0,800094b8 <system_main+0x48>
    80009498:	0004a783          	lw	a5,0(s1)
    8000949c:	0007879b          	sext.w	a5,a5
    800094a0:	fe078ce3          	beqz	a5,80009498 <system_main+0x28>
    800094a4:	0ff0000f          	fence
    800094a8:	00003517          	auipc	a0,0x3
    800094ac:	71050513          	addi	a0,a0,1808 # 8000cbb8 <_ZTV8Consumer+0x58>
    800094b0:	00001097          	auipc	ra,0x1
    800094b4:	a7c080e7          	jalr	-1412(ra) # 80009f2c <panic>
    800094b8:	00001097          	auipc	ra,0x1
    800094bc:	9d0080e7          	jalr	-1584(ra) # 80009e88 <consoleinit>
    800094c0:	00001097          	auipc	ra,0x1
    800094c4:	15c080e7          	jalr	348(ra) # 8000a61c <printfinit>
    800094c8:	00003517          	auipc	a0,0x3
    800094cc:	3e050513          	addi	a0,a0,992 # 8000c8a8 <_ZTV9Semaphore+0x860>
    800094d0:	00001097          	auipc	ra,0x1
    800094d4:	ab8080e7          	jalr	-1352(ra) # 80009f88 <__printf>
    800094d8:	00003517          	auipc	a0,0x3
    800094dc:	6b050513          	addi	a0,a0,1712 # 8000cb88 <_ZTV8Consumer+0x28>
    800094e0:	00001097          	auipc	ra,0x1
    800094e4:	aa8080e7          	jalr	-1368(ra) # 80009f88 <__printf>
    800094e8:	00003517          	auipc	a0,0x3
    800094ec:	3c050513          	addi	a0,a0,960 # 8000c8a8 <_ZTV9Semaphore+0x860>
    800094f0:	00001097          	auipc	ra,0x1
    800094f4:	a98080e7          	jalr	-1384(ra) # 80009f88 <__printf>
    800094f8:	00001097          	auipc	ra,0x1
    800094fc:	4b0080e7          	jalr	1200(ra) # 8000a9a8 <kinit>
    80009500:	00000097          	auipc	ra,0x0
    80009504:	148080e7          	jalr	328(ra) # 80009648 <trapinit>
    80009508:	00000097          	auipc	ra,0x0
    8000950c:	16c080e7          	jalr	364(ra) # 80009674 <trapinithart>
    80009510:	00000097          	auipc	ra,0x0
    80009514:	5c0080e7          	jalr	1472(ra) # 80009ad0 <plicinit>
    80009518:	00000097          	auipc	ra,0x0
    8000951c:	5e0080e7          	jalr	1504(ra) # 80009af8 <plicinithart>
    80009520:	00000097          	auipc	ra,0x0
    80009524:	078080e7          	jalr	120(ra) # 80009598 <userinit>
    80009528:	0ff0000f          	fence
    8000952c:	00100793          	li	a5,1
    80009530:	00003517          	auipc	a0,0x3
    80009534:	67050513          	addi	a0,a0,1648 # 8000cba0 <_ZTV8Consumer+0x40>
    80009538:	00f4a023          	sw	a5,0(s1)
    8000953c:	00001097          	auipc	ra,0x1
    80009540:	a4c080e7          	jalr	-1460(ra) # 80009f88 <__printf>
    80009544:	0000006f          	j	80009544 <system_main+0xd4>

0000000080009548 <cpuid>:
    80009548:	ff010113          	addi	sp,sp,-16
    8000954c:	00813423          	sd	s0,8(sp)
    80009550:	01010413          	addi	s0,sp,16
    80009554:	00020513          	mv	a0,tp
    80009558:	00813403          	ld	s0,8(sp)
    8000955c:	0005051b          	sext.w	a0,a0
    80009560:	01010113          	addi	sp,sp,16
    80009564:	00008067          	ret

0000000080009568 <mycpu>:
    80009568:	ff010113          	addi	sp,sp,-16
    8000956c:	00813423          	sd	s0,8(sp)
    80009570:	01010413          	addi	s0,sp,16
    80009574:	00020793          	mv	a5,tp
    80009578:	00813403          	ld	s0,8(sp)
    8000957c:	0007879b          	sext.w	a5,a5
    80009580:	00779793          	slli	a5,a5,0x7
    80009584:	00007517          	auipc	a0,0x7
    80009588:	d4c50513          	addi	a0,a0,-692 # 800102d0 <cpus>
    8000958c:	00f50533          	add	a0,a0,a5
    80009590:	01010113          	addi	sp,sp,16
    80009594:	00008067          	ret

0000000080009598 <userinit>:
    80009598:	ff010113          	addi	sp,sp,-16
    8000959c:	00813423          	sd	s0,8(sp)
    800095a0:	01010413          	addi	s0,sp,16
    800095a4:	00813403          	ld	s0,8(sp)
    800095a8:	01010113          	addi	sp,sp,16
    800095ac:	ffff9317          	auipc	t1,0xffff9
    800095b0:	59830067          	jr	1432(t1) # 80002b44 <main>

00000000800095b4 <either_copyout>:
    800095b4:	ff010113          	addi	sp,sp,-16
    800095b8:	00813023          	sd	s0,0(sp)
    800095bc:	00113423          	sd	ra,8(sp)
    800095c0:	01010413          	addi	s0,sp,16
    800095c4:	02051663          	bnez	a0,800095f0 <either_copyout+0x3c>
    800095c8:	00058513          	mv	a0,a1
    800095cc:	00060593          	mv	a1,a2
    800095d0:	0006861b          	sext.w	a2,a3
    800095d4:	00002097          	auipc	ra,0x2
    800095d8:	c60080e7          	jalr	-928(ra) # 8000b234 <__memmove>
    800095dc:	00813083          	ld	ra,8(sp)
    800095e0:	00013403          	ld	s0,0(sp)
    800095e4:	00000513          	li	a0,0
    800095e8:	01010113          	addi	sp,sp,16
    800095ec:	00008067          	ret
    800095f0:	00003517          	auipc	a0,0x3
    800095f4:	5f050513          	addi	a0,a0,1520 # 8000cbe0 <_ZTV8Consumer+0x80>
    800095f8:	00001097          	auipc	ra,0x1
    800095fc:	934080e7          	jalr	-1740(ra) # 80009f2c <panic>

0000000080009600 <either_copyin>:
    80009600:	ff010113          	addi	sp,sp,-16
    80009604:	00813023          	sd	s0,0(sp)
    80009608:	00113423          	sd	ra,8(sp)
    8000960c:	01010413          	addi	s0,sp,16
    80009610:	02059463          	bnez	a1,80009638 <either_copyin+0x38>
    80009614:	00060593          	mv	a1,a2
    80009618:	0006861b          	sext.w	a2,a3
    8000961c:	00002097          	auipc	ra,0x2
    80009620:	c18080e7          	jalr	-1000(ra) # 8000b234 <__memmove>
    80009624:	00813083          	ld	ra,8(sp)
    80009628:	00013403          	ld	s0,0(sp)
    8000962c:	00000513          	li	a0,0
    80009630:	01010113          	addi	sp,sp,16
    80009634:	00008067          	ret
    80009638:	00003517          	auipc	a0,0x3
    8000963c:	5d050513          	addi	a0,a0,1488 # 8000cc08 <_ZTV8Consumer+0xa8>
    80009640:	00001097          	auipc	ra,0x1
    80009644:	8ec080e7          	jalr	-1812(ra) # 80009f2c <panic>

0000000080009648 <trapinit>:
    80009648:	ff010113          	addi	sp,sp,-16
    8000964c:	00813423          	sd	s0,8(sp)
    80009650:	01010413          	addi	s0,sp,16
    80009654:	00813403          	ld	s0,8(sp)
    80009658:	00003597          	auipc	a1,0x3
    8000965c:	5d858593          	addi	a1,a1,1496 # 8000cc30 <_ZTV8Consumer+0xd0>
    80009660:	00007517          	auipc	a0,0x7
    80009664:	cf050513          	addi	a0,a0,-784 # 80010350 <tickslock>
    80009668:	01010113          	addi	sp,sp,16
    8000966c:	00001317          	auipc	t1,0x1
    80009670:	5cc30067          	jr	1484(t1) # 8000ac38 <initlock>

0000000080009674 <trapinithart>:
    80009674:	ff010113          	addi	sp,sp,-16
    80009678:	00813423          	sd	s0,8(sp)
    8000967c:	01010413          	addi	s0,sp,16
    80009680:	00000797          	auipc	a5,0x0
    80009684:	30078793          	addi	a5,a5,768 # 80009980 <kernelvec>
    80009688:	10579073          	csrw	stvec,a5
    8000968c:	00813403          	ld	s0,8(sp)
    80009690:	01010113          	addi	sp,sp,16
    80009694:	00008067          	ret

0000000080009698 <usertrap>:
    80009698:	ff010113          	addi	sp,sp,-16
    8000969c:	00813423          	sd	s0,8(sp)
    800096a0:	01010413          	addi	s0,sp,16
    800096a4:	00813403          	ld	s0,8(sp)
    800096a8:	01010113          	addi	sp,sp,16
    800096ac:	00008067          	ret

00000000800096b0 <usertrapret>:
    800096b0:	ff010113          	addi	sp,sp,-16
    800096b4:	00813423          	sd	s0,8(sp)
    800096b8:	01010413          	addi	s0,sp,16
    800096bc:	00813403          	ld	s0,8(sp)
    800096c0:	01010113          	addi	sp,sp,16
    800096c4:	00008067          	ret

00000000800096c8 <kerneltrap>:
    800096c8:	fe010113          	addi	sp,sp,-32
    800096cc:	00813823          	sd	s0,16(sp)
    800096d0:	00113c23          	sd	ra,24(sp)
    800096d4:	00913423          	sd	s1,8(sp)
    800096d8:	02010413          	addi	s0,sp,32
    800096dc:	142025f3          	csrr	a1,scause
    800096e0:	100027f3          	csrr	a5,sstatus
    800096e4:	0027f793          	andi	a5,a5,2
    800096e8:	10079c63          	bnez	a5,80009800 <kerneltrap+0x138>
    800096ec:	142027f3          	csrr	a5,scause
    800096f0:	0207ce63          	bltz	a5,8000972c <kerneltrap+0x64>
    800096f4:	00003517          	auipc	a0,0x3
    800096f8:	58450513          	addi	a0,a0,1412 # 8000cc78 <_ZTV8Consumer+0x118>
    800096fc:	00001097          	auipc	ra,0x1
    80009700:	88c080e7          	jalr	-1908(ra) # 80009f88 <__printf>
    80009704:	141025f3          	csrr	a1,sepc
    80009708:	14302673          	csrr	a2,stval
    8000970c:	00003517          	auipc	a0,0x3
    80009710:	57c50513          	addi	a0,a0,1404 # 8000cc88 <_ZTV8Consumer+0x128>
    80009714:	00001097          	auipc	ra,0x1
    80009718:	874080e7          	jalr	-1932(ra) # 80009f88 <__printf>
    8000971c:	00003517          	auipc	a0,0x3
    80009720:	58450513          	addi	a0,a0,1412 # 8000cca0 <_ZTV8Consumer+0x140>
    80009724:	00001097          	auipc	ra,0x1
    80009728:	808080e7          	jalr	-2040(ra) # 80009f2c <panic>
    8000972c:	0ff7f713          	andi	a4,a5,255
    80009730:	00900693          	li	a3,9
    80009734:	04d70063          	beq	a4,a3,80009774 <kerneltrap+0xac>
    80009738:	fff00713          	li	a4,-1
    8000973c:	03f71713          	slli	a4,a4,0x3f
    80009740:	00170713          	addi	a4,a4,1
    80009744:	fae798e3          	bne	a5,a4,800096f4 <kerneltrap+0x2c>
    80009748:	00000097          	auipc	ra,0x0
    8000974c:	e00080e7          	jalr	-512(ra) # 80009548 <cpuid>
    80009750:	06050663          	beqz	a0,800097bc <kerneltrap+0xf4>
    80009754:	144027f3          	csrr	a5,sip
    80009758:	ffd7f793          	andi	a5,a5,-3
    8000975c:	14479073          	csrw	sip,a5
    80009760:	01813083          	ld	ra,24(sp)
    80009764:	01013403          	ld	s0,16(sp)
    80009768:	00813483          	ld	s1,8(sp)
    8000976c:	02010113          	addi	sp,sp,32
    80009770:	00008067          	ret
    80009774:	00000097          	auipc	ra,0x0
    80009778:	3d0080e7          	jalr	976(ra) # 80009b44 <plic_claim>
    8000977c:	00a00793          	li	a5,10
    80009780:	00050493          	mv	s1,a0
    80009784:	06f50863          	beq	a0,a5,800097f4 <kerneltrap+0x12c>
    80009788:	fc050ce3          	beqz	a0,80009760 <kerneltrap+0x98>
    8000978c:	00050593          	mv	a1,a0
    80009790:	00003517          	auipc	a0,0x3
    80009794:	4c850513          	addi	a0,a0,1224 # 8000cc58 <_ZTV8Consumer+0xf8>
    80009798:	00000097          	auipc	ra,0x0
    8000979c:	7f0080e7          	jalr	2032(ra) # 80009f88 <__printf>
    800097a0:	01013403          	ld	s0,16(sp)
    800097a4:	01813083          	ld	ra,24(sp)
    800097a8:	00048513          	mv	a0,s1
    800097ac:	00813483          	ld	s1,8(sp)
    800097b0:	02010113          	addi	sp,sp,32
    800097b4:	00000317          	auipc	t1,0x0
    800097b8:	3c830067          	jr	968(t1) # 80009b7c <plic_complete>
    800097bc:	00007517          	auipc	a0,0x7
    800097c0:	b9450513          	addi	a0,a0,-1132 # 80010350 <tickslock>
    800097c4:	00001097          	auipc	ra,0x1
    800097c8:	498080e7          	jalr	1176(ra) # 8000ac5c <acquire>
    800097cc:	00006717          	auipc	a4,0x6
    800097d0:	ab070713          	addi	a4,a4,-1360 # 8000f27c <ticks>
    800097d4:	00072783          	lw	a5,0(a4)
    800097d8:	00007517          	auipc	a0,0x7
    800097dc:	b7850513          	addi	a0,a0,-1160 # 80010350 <tickslock>
    800097e0:	0017879b          	addiw	a5,a5,1
    800097e4:	00f72023          	sw	a5,0(a4)
    800097e8:	00001097          	auipc	ra,0x1
    800097ec:	540080e7          	jalr	1344(ra) # 8000ad28 <release>
    800097f0:	f65ff06f          	j	80009754 <kerneltrap+0x8c>
    800097f4:	00001097          	auipc	ra,0x1
    800097f8:	09c080e7          	jalr	156(ra) # 8000a890 <uartintr>
    800097fc:	fa5ff06f          	j	800097a0 <kerneltrap+0xd8>
    80009800:	00003517          	auipc	a0,0x3
    80009804:	43850513          	addi	a0,a0,1080 # 8000cc38 <_ZTV8Consumer+0xd8>
    80009808:	00000097          	auipc	ra,0x0
    8000980c:	724080e7          	jalr	1828(ra) # 80009f2c <panic>

0000000080009810 <clockintr>:
    80009810:	fe010113          	addi	sp,sp,-32
    80009814:	00813823          	sd	s0,16(sp)
    80009818:	00913423          	sd	s1,8(sp)
    8000981c:	00113c23          	sd	ra,24(sp)
    80009820:	02010413          	addi	s0,sp,32
    80009824:	00007497          	auipc	s1,0x7
    80009828:	b2c48493          	addi	s1,s1,-1236 # 80010350 <tickslock>
    8000982c:	00048513          	mv	a0,s1
    80009830:	00001097          	auipc	ra,0x1
    80009834:	42c080e7          	jalr	1068(ra) # 8000ac5c <acquire>
    80009838:	00006717          	auipc	a4,0x6
    8000983c:	a4470713          	addi	a4,a4,-1468 # 8000f27c <ticks>
    80009840:	00072783          	lw	a5,0(a4)
    80009844:	01013403          	ld	s0,16(sp)
    80009848:	01813083          	ld	ra,24(sp)
    8000984c:	00048513          	mv	a0,s1
    80009850:	0017879b          	addiw	a5,a5,1
    80009854:	00813483          	ld	s1,8(sp)
    80009858:	00f72023          	sw	a5,0(a4)
    8000985c:	02010113          	addi	sp,sp,32
    80009860:	00001317          	auipc	t1,0x1
    80009864:	4c830067          	jr	1224(t1) # 8000ad28 <release>

0000000080009868 <devintr>:
    80009868:	142027f3          	csrr	a5,scause
    8000986c:	00000513          	li	a0,0
    80009870:	0007c463          	bltz	a5,80009878 <devintr+0x10>
    80009874:	00008067          	ret
    80009878:	fe010113          	addi	sp,sp,-32
    8000987c:	00813823          	sd	s0,16(sp)
    80009880:	00113c23          	sd	ra,24(sp)
    80009884:	00913423          	sd	s1,8(sp)
    80009888:	02010413          	addi	s0,sp,32
    8000988c:	0ff7f713          	andi	a4,a5,255
    80009890:	00900693          	li	a3,9
    80009894:	04d70c63          	beq	a4,a3,800098ec <devintr+0x84>
    80009898:	fff00713          	li	a4,-1
    8000989c:	03f71713          	slli	a4,a4,0x3f
    800098a0:	00170713          	addi	a4,a4,1
    800098a4:	00e78c63          	beq	a5,a4,800098bc <devintr+0x54>
    800098a8:	01813083          	ld	ra,24(sp)
    800098ac:	01013403          	ld	s0,16(sp)
    800098b0:	00813483          	ld	s1,8(sp)
    800098b4:	02010113          	addi	sp,sp,32
    800098b8:	00008067          	ret
    800098bc:	00000097          	auipc	ra,0x0
    800098c0:	c8c080e7          	jalr	-884(ra) # 80009548 <cpuid>
    800098c4:	06050663          	beqz	a0,80009930 <devintr+0xc8>
    800098c8:	144027f3          	csrr	a5,sip
    800098cc:	ffd7f793          	andi	a5,a5,-3
    800098d0:	14479073          	csrw	sip,a5
    800098d4:	01813083          	ld	ra,24(sp)
    800098d8:	01013403          	ld	s0,16(sp)
    800098dc:	00813483          	ld	s1,8(sp)
    800098e0:	00200513          	li	a0,2
    800098e4:	02010113          	addi	sp,sp,32
    800098e8:	00008067          	ret
    800098ec:	00000097          	auipc	ra,0x0
    800098f0:	258080e7          	jalr	600(ra) # 80009b44 <plic_claim>
    800098f4:	00a00793          	li	a5,10
    800098f8:	00050493          	mv	s1,a0
    800098fc:	06f50663          	beq	a0,a5,80009968 <devintr+0x100>
    80009900:	00100513          	li	a0,1
    80009904:	fa0482e3          	beqz	s1,800098a8 <devintr+0x40>
    80009908:	00048593          	mv	a1,s1
    8000990c:	00003517          	auipc	a0,0x3
    80009910:	34c50513          	addi	a0,a0,844 # 8000cc58 <_ZTV8Consumer+0xf8>
    80009914:	00000097          	auipc	ra,0x0
    80009918:	674080e7          	jalr	1652(ra) # 80009f88 <__printf>
    8000991c:	00048513          	mv	a0,s1
    80009920:	00000097          	auipc	ra,0x0
    80009924:	25c080e7          	jalr	604(ra) # 80009b7c <plic_complete>
    80009928:	00100513          	li	a0,1
    8000992c:	f7dff06f          	j	800098a8 <devintr+0x40>
    80009930:	00007517          	auipc	a0,0x7
    80009934:	a2050513          	addi	a0,a0,-1504 # 80010350 <tickslock>
    80009938:	00001097          	auipc	ra,0x1
    8000993c:	324080e7          	jalr	804(ra) # 8000ac5c <acquire>
    80009940:	00006717          	auipc	a4,0x6
    80009944:	93c70713          	addi	a4,a4,-1732 # 8000f27c <ticks>
    80009948:	00072783          	lw	a5,0(a4)
    8000994c:	00007517          	auipc	a0,0x7
    80009950:	a0450513          	addi	a0,a0,-1532 # 80010350 <tickslock>
    80009954:	0017879b          	addiw	a5,a5,1
    80009958:	00f72023          	sw	a5,0(a4)
    8000995c:	00001097          	auipc	ra,0x1
    80009960:	3cc080e7          	jalr	972(ra) # 8000ad28 <release>
    80009964:	f65ff06f          	j	800098c8 <devintr+0x60>
    80009968:	00001097          	auipc	ra,0x1
    8000996c:	f28080e7          	jalr	-216(ra) # 8000a890 <uartintr>
    80009970:	fadff06f          	j	8000991c <devintr+0xb4>
	...

0000000080009980 <kernelvec>:
    80009980:	f0010113          	addi	sp,sp,-256
    80009984:	00113023          	sd	ra,0(sp)
    80009988:	00213423          	sd	sp,8(sp)
    8000998c:	00313823          	sd	gp,16(sp)
    80009990:	00413c23          	sd	tp,24(sp)
    80009994:	02513023          	sd	t0,32(sp)
    80009998:	02613423          	sd	t1,40(sp)
    8000999c:	02713823          	sd	t2,48(sp)
    800099a0:	02813c23          	sd	s0,56(sp)
    800099a4:	04913023          	sd	s1,64(sp)
    800099a8:	04a13423          	sd	a0,72(sp)
    800099ac:	04b13823          	sd	a1,80(sp)
    800099b0:	04c13c23          	sd	a2,88(sp)
    800099b4:	06d13023          	sd	a3,96(sp)
    800099b8:	06e13423          	sd	a4,104(sp)
    800099bc:	06f13823          	sd	a5,112(sp)
    800099c0:	07013c23          	sd	a6,120(sp)
    800099c4:	09113023          	sd	a7,128(sp)
    800099c8:	09213423          	sd	s2,136(sp)
    800099cc:	09313823          	sd	s3,144(sp)
    800099d0:	09413c23          	sd	s4,152(sp)
    800099d4:	0b513023          	sd	s5,160(sp)
    800099d8:	0b613423          	sd	s6,168(sp)
    800099dc:	0b713823          	sd	s7,176(sp)
    800099e0:	0b813c23          	sd	s8,184(sp)
    800099e4:	0d913023          	sd	s9,192(sp)
    800099e8:	0da13423          	sd	s10,200(sp)
    800099ec:	0db13823          	sd	s11,208(sp)
    800099f0:	0dc13c23          	sd	t3,216(sp)
    800099f4:	0fd13023          	sd	t4,224(sp)
    800099f8:	0fe13423          	sd	t5,232(sp)
    800099fc:	0ff13823          	sd	t6,240(sp)
    80009a00:	cc9ff0ef          	jal	ra,800096c8 <kerneltrap>
    80009a04:	00013083          	ld	ra,0(sp)
    80009a08:	00813103          	ld	sp,8(sp)
    80009a0c:	01013183          	ld	gp,16(sp)
    80009a10:	02013283          	ld	t0,32(sp)
    80009a14:	02813303          	ld	t1,40(sp)
    80009a18:	03013383          	ld	t2,48(sp)
    80009a1c:	03813403          	ld	s0,56(sp)
    80009a20:	04013483          	ld	s1,64(sp)
    80009a24:	04813503          	ld	a0,72(sp)
    80009a28:	05013583          	ld	a1,80(sp)
    80009a2c:	05813603          	ld	a2,88(sp)
    80009a30:	06013683          	ld	a3,96(sp)
    80009a34:	06813703          	ld	a4,104(sp)
    80009a38:	07013783          	ld	a5,112(sp)
    80009a3c:	07813803          	ld	a6,120(sp)
    80009a40:	08013883          	ld	a7,128(sp)
    80009a44:	08813903          	ld	s2,136(sp)
    80009a48:	09013983          	ld	s3,144(sp)
    80009a4c:	09813a03          	ld	s4,152(sp)
    80009a50:	0a013a83          	ld	s5,160(sp)
    80009a54:	0a813b03          	ld	s6,168(sp)
    80009a58:	0b013b83          	ld	s7,176(sp)
    80009a5c:	0b813c03          	ld	s8,184(sp)
    80009a60:	0c013c83          	ld	s9,192(sp)
    80009a64:	0c813d03          	ld	s10,200(sp)
    80009a68:	0d013d83          	ld	s11,208(sp)
    80009a6c:	0d813e03          	ld	t3,216(sp)
    80009a70:	0e013e83          	ld	t4,224(sp)
    80009a74:	0e813f03          	ld	t5,232(sp)
    80009a78:	0f013f83          	ld	t6,240(sp)
    80009a7c:	10010113          	addi	sp,sp,256
    80009a80:	10200073          	sret
    80009a84:	00000013          	nop
    80009a88:	00000013          	nop
    80009a8c:	00000013          	nop

0000000080009a90 <timervec>:
    80009a90:	34051573          	csrrw	a0,mscratch,a0
    80009a94:	00b53023          	sd	a1,0(a0)
    80009a98:	00c53423          	sd	a2,8(a0)
    80009a9c:	00d53823          	sd	a3,16(a0)
    80009aa0:	01853583          	ld	a1,24(a0)
    80009aa4:	02053603          	ld	a2,32(a0)
    80009aa8:	0005b683          	ld	a3,0(a1)
    80009aac:	00c686b3          	add	a3,a3,a2
    80009ab0:	00d5b023          	sd	a3,0(a1)
    80009ab4:	00200593          	li	a1,2
    80009ab8:	14459073          	csrw	sip,a1
    80009abc:	01053683          	ld	a3,16(a0)
    80009ac0:	00853603          	ld	a2,8(a0)
    80009ac4:	00053583          	ld	a1,0(a0)
    80009ac8:	34051573          	csrrw	a0,mscratch,a0
    80009acc:	30200073          	mret

0000000080009ad0 <plicinit>:
    80009ad0:	ff010113          	addi	sp,sp,-16
    80009ad4:	00813423          	sd	s0,8(sp)
    80009ad8:	01010413          	addi	s0,sp,16
    80009adc:	00813403          	ld	s0,8(sp)
    80009ae0:	0c0007b7          	lui	a5,0xc000
    80009ae4:	00100713          	li	a4,1
    80009ae8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80009aec:	00e7a223          	sw	a4,4(a5)
    80009af0:	01010113          	addi	sp,sp,16
    80009af4:	00008067          	ret

0000000080009af8 <plicinithart>:
    80009af8:	ff010113          	addi	sp,sp,-16
    80009afc:	00813023          	sd	s0,0(sp)
    80009b00:	00113423          	sd	ra,8(sp)
    80009b04:	01010413          	addi	s0,sp,16
    80009b08:	00000097          	auipc	ra,0x0
    80009b0c:	a40080e7          	jalr	-1472(ra) # 80009548 <cpuid>
    80009b10:	0085171b          	slliw	a4,a0,0x8
    80009b14:	0c0027b7          	lui	a5,0xc002
    80009b18:	00e787b3          	add	a5,a5,a4
    80009b1c:	40200713          	li	a4,1026
    80009b20:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80009b24:	00813083          	ld	ra,8(sp)
    80009b28:	00013403          	ld	s0,0(sp)
    80009b2c:	00d5151b          	slliw	a0,a0,0xd
    80009b30:	0c2017b7          	lui	a5,0xc201
    80009b34:	00a78533          	add	a0,a5,a0
    80009b38:	00052023          	sw	zero,0(a0)
    80009b3c:	01010113          	addi	sp,sp,16
    80009b40:	00008067          	ret

0000000080009b44 <plic_claim>:
    80009b44:	ff010113          	addi	sp,sp,-16
    80009b48:	00813023          	sd	s0,0(sp)
    80009b4c:	00113423          	sd	ra,8(sp)
    80009b50:	01010413          	addi	s0,sp,16
    80009b54:	00000097          	auipc	ra,0x0
    80009b58:	9f4080e7          	jalr	-1548(ra) # 80009548 <cpuid>
    80009b5c:	00813083          	ld	ra,8(sp)
    80009b60:	00013403          	ld	s0,0(sp)
    80009b64:	00d5151b          	slliw	a0,a0,0xd
    80009b68:	0c2017b7          	lui	a5,0xc201
    80009b6c:	00a78533          	add	a0,a5,a0
    80009b70:	00452503          	lw	a0,4(a0)
    80009b74:	01010113          	addi	sp,sp,16
    80009b78:	00008067          	ret

0000000080009b7c <plic_complete>:
    80009b7c:	fe010113          	addi	sp,sp,-32
    80009b80:	00813823          	sd	s0,16(sp)
    80009b84:	00913423          	sd	s1,8(sp)
    80009b88:	00113c23          	sd	ra,24(sp)
    80009b8c:	02010413          	addi	s0,sp,32
    80009b90:	00050493          	mv	s1,a0
    80009b94:	00000097          	auipc	ra,0x0
    80009b98:	9b4080e7          	jalr	-1612(ra) # 80009548 <cpuid>
    80009b9c:	01813083          	ld	ra,24(sp)
    80009ba0:	01013403          	ld	s0,16(sp)
    80009ba4:	00d5179b          	slliw	a5,a0,0xd
    80009ba8:	0c201737          	lui	a4,0xc201
    80009bac:	00f707b3          	add	a5,a4,a5
    80009bb0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80009bb4:	00813483          	ld	s1,8(sp)
    80009bb8:	02010113          	addi	sp,sp,32
    80009bbc:	00008067          	ret

0000000080009bc0 <consolewrite>:
    80009bc0:	fb010113          	addi	sp,sp,-80
    80009bc4:	04813023          	sd	s0,64(sp)
    80009bc8:	04113423          	sd	ra,72(sp)
    80009bcc:	02913c23          	sd	s1,56(sp)
    80009bd0:	03213823          	sd	s2,48(sp)
    80009bd4:	03313423          	sd	s3,40(sp)
    80009bd8:	03413023          	sd	s4,32(sp)
    80009bdc:	01513c23          	sd	s5,24(sp)
    80009be0:	05010413          	addi	s0,sp,80
    80009be4:	06c05c63          	blez	a2,80009c5c <consolewrite+0x9c>
    80009be8:	00060993          	mv	s3,a2
    80009bec:	00050a13          	mv	s4,a0
    80009bf0:	00058493          	mv	s1,a1
    80009bf4:	00000913          	li	s2,0
    80009bf8:	fff00a93          	li	s5,-1
    80009bfc:	01c0006f          	j	80009c18 <consolewrite+0x58>
    80009c00:	fbf44503          	lbu	a0,-65(s0)
    80009c04:	0019091b          	addiw	s2,s2,1
    80009c08:	00148493          	addi	s1,s1,1
    80009c0c:	00001097          	auipc	ra,0x1
    80009c10:	a9c080e7          	jalr	-1380(ra) # 8000a6a8 <uartputc>
    80009c14:	03298063          	beq	s3,s2,80009c34 <consolewrite+0x74>
    80009c18:	00048613          	mv	a2,s1
    80009c1c:	00100693          	li	a3,1
    80009c20:	000a0593          	mv	a1,s4
    80009c24:	fbf40513          	addi	a0,s0,-65
    80009c28:	00000097          	auipc	ra,0x0
    80009c2c:	9d8080e7          	jalr	-1576(ra) # 80009600 <either_copyin>
    80009c30:	fd5518e3          	bne	a0,s5,80009c00 <consolewrite+0x40>
    80009c34:	04813083          	ld	ra,72(sp)
    80009c38:	04013403          	ld	s0,64(sp)
    80009c3c:	03813483          	ld	s1,56(sp)
    80009c40:	02813983          	ld	s3,40(sp)
    80009c44:	02013a03          	ld	s4,32(sp)
    80009c48:	01813a83          	ld	s5,24(sp)
    80009c4c:	00090513          	mv	a0,s2
    80009c50:	03013903          	ld	s2,48(sp)
    80009c54:	05010113          	addi	sp,sp,80
    80009c58:	00008067          	ret
    80009c5c:	00000913          	li	s2,0
    80009c60:	fd5ff06f          	j	80009c34 <consolewrite+0x74>

0000000080009c64 <consoleread>:
    80009c64:	f9010113          	addi	sp,sp,-112
    80009c68:	06813023          	sd	s0,96(sp)
    80009c6c:	04913c23          	sd	s1,88(sp)
    80009c70:	05213823          	sd	s2,80(sp)
    80009c74:	05313423          	sd	s3,72(sp)
    80009c78:	05413023          	sd	s4,64(sp)
    80009c7c:	03513c23          	sd	s5,56(sp)
    80009c80:	03613823          	sd	s6,48(sp)
    80009c84:	03713423          	sd	s7,40(sp)
    80009c88:	03813023          	sd	s8,32(sp)
    80009c8c:	06113423          	sd	ra,104(sp)
    80009c90:	01913c23          	sd	s9,24(sp)
    80009c94:	07010413          	addi	s0,sp,112
    80009c98:	00060b93          	mv	s7,a2
    80009c9c:	00050913          	mv	s2,a0
    80009ca0:	00058c13          	mv	s8,a1
    80009ca4:	00060b1b          	sext.w	s6,a2
    80009ca8:	00006497          	auipc	s1,0x6
    80009cac:	6d048493          	addi	s1,s1,1744 # 80010378 <cons>
    80009cb0:	00400993          	li	s3,4
    80009cb4:	fff00a13          	li	s4,-1
    80009cb8:	00a00a93          	li	s5,10
    80009cbc:	05705e63          	blez	s7,80009d18 <consoleread+0xb4>
    80009cc0:	09c4a703          	lw	a4,156(s1)
    80009cc4:	0984a783          	lw	a5,152(s1)
    80009cc8:	0007071b          	sext.w	a4,a4
    80009ccc:	08e78463          	beq	a5,a4,80009d54 <consoleread+0xf0>
    80009cd0:	07f7f713          	andi	a4,a5,127
    80009cd4:	00e48733          	add	a4,s1,a4
    80009cd8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80009cdc:	0017869b          	addiw	a3,a5,1
    80009ce0:	08d4ac23          	sw	a3,152(s1)
    80009ce4:	00070c9b          	sext.w	s9,a4
    80009ce8:	0b370663          	beq	a4,s3,80009d94 <consoleread+0x130>
    80009cec:	00100693          	li	a3,1
    80009cf0:	f9f40613          	addi	a2,s0,-97
    80009cf4:	000c0593          	mv	a1,s8
    80009cf8:	00090513          	mv	a0,s2
    80009cfc:	f8e40fa3          	sb	a4,-97(s0)
    80009d00:	00000097          	auipc	ra,0x0
    80009d04:	8b4080e7          	jalr	-1868(ra) # 800095b4 <either_copyout>
    80009d08:	01450863          	beq	a0,s4,80009d18 <consoleread+0xb4>
    80009d0c:	001c0c13          	addi	s8,s8,1
    80009d10:	fffb8b9b          	addiw	s7,s7,-1
    80009d14:	fb5c94e3          	bne	s9,s5,80009cbc <consoleread+0x58>
    80009d18:	000b851b          	sext.w	a0,s7
    80009d1c:	06813083          	ld	ra,104(sp)
    80009d20:	06013403          	ld	s0,96(sp)
    80009d24:	05813483          	ld	s1,88(sp)
    80009d28:	05013903          	ld	s2,80(sp)
    80009d2c:	04813983          	ld	s3,72(sp)
    80009d30:	04013a03          	ld	s4,64(sp)
    80009d34:	03813a83          	ld	s5,56(sp)
    80009d38:	02813b83          	ld	s7,40(sp)
    80009d3c:	02013c03          	ld	s8,32(sp)
    80009d40:	01813c83          	ld	s9,24(sp)
    80009d44:	40ab053b          	subw	a0,s6,a0
    80009d48:	03013b03          	ld	s6,48(sp)
    80009d4c:	07010113          	addi	sp,sp,112
    80009d50:	00008067          	ret
    80009d54:	00001097          	auipc	ra,0x1
    80009d58:	1d8080e7          	jalr	472(ra) # 8000af2c <push_on>
    80009d5c:	0984a703          	lw	a4,152(s1)
    80009d60:	09c4a783          	lw	a5,156(s1)
    80009d64:	0007879b          	sext.w	a5,a5
    80009d68:	fef70ce3          	beq	a4,a5,80009d60 <consoleread+0xfc>
    80009d6c:	00001097          	auipc	ra,0x1
    80009d70:	234080e7          	jalr	564(ra) # 8000afa0 <pop_on>
    80009d74:	0984a783          	lw	a5,152(s1)
    80009d78:	07f7f713          	andi	a4,a5,127
    80009d7c:	00e48733          	add	a4,s1,a4
    80009d80:	01874703          	lbu	a4,24(a4)
    80009d84:	0017869b          	addiw	a3,a5,1
    80009d88:	08d4ac23          	sw	a3,152(s1)
    80009d8c:	00070c9b          	sext.w	s9,a4
    80009d90:	f5371ee3          	bne	a4,s3,80009cec <consoleread+0x88>
    80009d94:	000b851b          	sext.w	a0,s7
    80009d98:	f96bf2e3          	bgeu	s7,s6,80009d1c <consoleread+0xb8>
    80009d9c:	08f4ac23          	sw	a5,152(s1)
    80009da0:	f7dff06f          	j	80009d1c <consoleread+0xb8>

0000000080009da4 <consputc>:
    80009da4:	10000793          	li	a5,256
    80009da8:	00f50663          	beq	a0,a5,80009db4 <consputc+0x10>
    80009dac:	00001317          	auipc	t1,0x1
    80009db0:	9f430067          	jr	-1548(t1) # 8000a7a0 <uartputc_sync>
    80009db4:	ff010113          	addi	sp,sp,-16
    80009db8:	00113423          	sd	ra,8(sp)
    80009dbc:	00813023          	sd	s0,0(sp)
    80009dc0:	01010413          	addi	s0,sp,16
    80009dc4:	00800513          	li	a0,8
    80009dc8:	00001097          	auipc	ra,0x1
    80009dcc:	9d8080e7          	jalr	-1576(ra) # 8000a7a0 <uartputc_sync>
    80009dd0:	02000513          	li	a0,32
    80009dd4:	00001097          	auipc	ra,0x1
    80009dd8:	9cc080e7          	jalr	-1588(ra) # 8000a7a0 <uartputc_sync>
    80009ddc:	00013403          	ld	s0,0(sp)
    80009de0:	00813083          	ld	ra,8(sp)
    80009de4:	00800513          	li	a0,8
    80009de8:	01010113          	addi	sp,sp,16
    80009dec:	00001317          	auipc	t1,0x1
    80009df0:	9b430067          	jr	-1612(t1) # 8000a7a0 <uartputc_sync>

0000000080009df4 <consoleintr>:
    80009df4:	fe010113          	addi	sp,sp,-32
    80009df8:	00813823          	sd	s0,16(sp)
    80009dfc:	00913423          	sd	s1,8(sp)
    80009e00:	01213023          	sd	s2,0(sp)
    80009e04:	00113c23          	sd	ra,24(sp)
    80009e08:	02010413          	addi	s0,sp,32
    80009e0c:	00006917          	auipc	s2,0x6
    80009e10:	56c90913          	addi	s2,s2,1388 # 80010378 <cons>
    80009e14:	00050493          	mv	s1,a0
    80009e18:	00090513          	mv	a0,s2
    80009e1c:	00001097          	auipc	ra,0x1
    80009e20:	e40080e7          	jalr	-448(ra) # 8000ac5c <acquire>
    80009e24:	02048c63          	beqz	s1,80009e5c <consoleintr+0x68>
    80009e28:	0a092783          	lw	a5,160(s2)
    80009e2c:	09892703          	lw	a4,152(s2)
    80009e30:	07f00693          	li	a3,127
    80009e34:	40e7873b          	subw	a4,a5,a4
    80009e38:	02e6e263          	bltu	a3,a4,80009e5c <consoleintr+0x68>
    80009e3c:	00d00713          	li	a4,13
    80009e40:	04e48063          	beq	s1,a4,80009e80 <consoleintr+0x8c>
    80009e44:	07f7f713          	andi	a4,a5,127
    80009e48:	00e90733          	add	a4,s2,a4
    80009e4c:	0017879b          	addiw	a5,a5,1
    80009e50:	0af92023          	sw	a5,160(s2)
    80009e54:	00970c23          	sb	s1,24(a4)
    80009e58:	08f92e23          	sw	a5,156(s2)
    80009e5c:	01013403          	ld	s0,16(sp)
    80009e60:	01813083          	ld	ra,24(sp)
    80009e64:	00813483          	ld	s1,8(sp)
    80009e68:	00013903          	ld	s2,0(sp)
    80009e6c:	00006517          	auipc	a0,0x6
    80009e70:	50c50513          	addi	a0,a0,1292 # 80010378 <cons>
    80009e74:	02010113          	addi	sp,sp,32
    80009e78:	00001317          	auipc	t1,0x1
    80009e7c:	eb030067          	jr	-336(t1) # 8000ad28 <release>
    80009e80:	00a00493          	li	s1,10
    80009e84:	fc1ff06f          	j	80009e44 <consoleintr+0x50>

0000000080009e88 <consoleinit>:
    80009e88:	fe010113          	addi	sp,sp,-32
    80009e8c:	00113c23          	sd	ra,24(sp)
    80009e90:	00813823          	sd	s0,16(sp)
    80009e94:	00913423          	sd	s1,8(sp)
    80009e98:	02010413          	addi	s0,sp,32
    80009e9c:	00006497          	auipc	s1,0x6
    80009ea0:	4dc48493          	addi	s1,s1,1244 # 80010378 <cons>
    80009ea4:	00048513          	mv	a0,s1
    80009ea8:	00003597          	auipc	a1,0x3
    80009eac:	e0858593          	addi	a1,a1,-504 # 8000ccb0 <_ZTV8Consumer+0x150>
    80009eb0:	00001097          	auipc	ra,0x1
    80009eb4:	d88080e7          	jalr	-632(ra) # 8000ac38 <initlock>
    80009eb8:	00000097          	auipc	ra,0x0
    80009ebc:	7ac080e7          	jalr	1964(ra) # 8000a664 <uartinit>
    80009ec0:	01813083          	ld	ra,24(sp)
    80009ec4:	01013403          	ld	s0,16(sp)
    80009ec8:	00000797          	auipc	a5,0x0
    80009ecc:	d9c78793          	addi	a5,a5,-612 # 80009c64 <consoleread>
    80009ed0:	0af4bc23          	sd	a5,184(s1)
    80009ed4:	00000797          	auipc	a5,0x0
    80009ed8:	cec78793          	addi	a5,a5,-788 # 80009bc0 <consolewrite>
    80009edc:	0cf4b023          	sd	a5,192(s1)
    80009ee0:	00813483          	ld	s1,8(sp)
    80009ee4:	02010113          	addi	sp,sp,32
    80009ee8:	00008067          	ret

0000000080009eec <console_read>:
    80009eec:	ff010113          	addi	sp,sp,-16
    80009ef0:	00813423          	sd	s0,8(sp)
    80009ef4:	01010413          	addi	s0,sp,16
    80009ef8:	00813403          	ld	s0,8(sp)
    80009efc:	00006317          	auipc	t1,0x6
    80009f00:	53433303          	ld	t1,1332(t1) # 80010430 <devsw+0x10>
    80009f04:	01010113          	addi	sp,sp,16
    80009f08:	00030067          	jr	t1

0000000080009f0c <console_write>:
    80009f0c:	ff010113          	addi	sp,sp,-16
    80009f10:	00813423          	sd	s0,8(sp)
    80009f14:	01010413          	addi	s0,sp,16
    80009f18:	00813403          	ld	s0,8(sp)
    80009f1c:	00006317          	auipc	t1,0x6
    80009f20:	51c33303          	ld	t1,1308(t1) # 80010438 <devsw+0x18>
    80009f24:	01010113          	addi	sp,sp,16
    80009f28:	00030067          	jr	t1

0000000080009f2c <panic>:
    80009f2c:	fe010113          	addi	sp,sp,-32
    80009f30:	00113c23          	sd	ra,24(sp)
    80009f34:	00813823          	sd	s0,16(sp)
    80009f38:	00913423          	sd	s1,8(sp)
    80009f3c:	02010413          	addi	s0,sp,32
    80009f40:	00050493          	mv	s1,a0
    80009f44:	00003517          	auipc	a0,0x3
    80009f48:	d7450513          	addi	a0,a0,-652 # 8000ccb8 <_ZTV8Consumer+0x158>
    80009f4c:	00006797          	auipc	a5,0x6
    80009f50:	5807a623          	sw	zero,1420(a5) # 800104d8 <pr+0x18>
    80009f54:	00000097          	auipc	ra,0x0
    80009f58:	034080e7          	jalr	52(ra) # 80009f88 <__printf>
    80009f5c:	00048513          	mv	a0,s1
    80009f60:	00000097          	auipc	ra,0x0
    80009f64:	028080e7          	jalr	40(ra) # 80009f88 <__printf>
    80009f68:	00003517          	auipc	a0,0x3
    80009f6c:	94050513          	addi	a0,a0,-1728 # 8000c8a8 <_ZTV9Semaphore+0x860>
    80009f70:	00000097          	auipc	ra,0x0
    80009f74:	018080e7          	jalr	24(ra) # 80009f88 <__printf>
    80009f78:	00100793          	li	a5,1
    80009f7c:	00005717          	auipc	a4,0x5
    80009f80:	30f72223          	sw	a5,772(a4) # 8000f280 <panicked>
    80009f84:	0000006f          	j	80009f84 <panic+0x58>

0000000080009f88 <__printf>:
    80009f88:	f3010113          	addi	sp,sp,-208
    80009f8c:	08813023          	sd	s0,128(sp)
    80009f90:	07313423          	sd	s3,104(sp)
    80009f94:	09010413          	addi	s0,sp,144
    80009f98:	05813023          	sd	s8,64(sp)
    80009f9c:	08113423          	sd	ra,136(sp)
    80009fa0:	06913c23          	sd	s1,120(sp)
    80009fa4:	07213823          	sd	s2,112(sp)
    80009fa8:	07413023          	sd	s4,96(sp)
    80009fac:	05513c23          	sd	s5,88(sp)
    80009fb0:	05613823          	sd	s6,80(sp)
    80009fb4:	05713423          	sd	s7,72(sp)
    80009fb8:	03913c23          	sd	s9,56(sp)
    80009fbc:	03a13823          	sd	s10,48(sp)
    80009fc0:	03b13423          	sd	s11,40(sp)
    80009fc4:	00006317          	auipc	t1,0x6
    80009fc8:	4fc30313          	addi	t1,t1,1276 # 800104c0 <pr>
    80009fcc:	01832c03          	lw	s8,24(t1)
    80009fd0:	00b43423          	sd	a1,8(s0)
    80009fd4:	00c43823          	sd	a2,16(s0)
    80009fd8:	00d43c23          	sd	a3,24(s0)
    80009fdc:	02e43023          	sd	a4,32(s0)
    80009fe0:	02f43423          	sd	a5,40(s0)
    80009fe4:	03043823          	sd	a6,48(s0)
    80009fe8:	03143c23          	sd	a7,56(s0)
    80009fec:	00050993          	mv	s3,a0
    80009ff0:	4a0c1663          	bnez	s8,8000a49c <__printf+0x514>
    80009ff4:	60098c63          	beqz	s3,8000a60c <__printf+0x684>
    80009ff8:	0009c503          	lbu	a0,0(s3)
    80009ffc:	00840793          	addi	a5,s0,8
    8000a000:	f6f43c23          	sd	a5,-136(s0)
    8000a004:	00000493          	li	s1,0
    8000a008:	22050063          	beqz	a0,8000a228 <__printf+0x2a0>
    8000a00c:	00002a37          	lui	s4,0x2
    8000a010:	00018ab7          	lui	s5,0x18
    8000a014:	000f4b37          	lui	s6,0xf4
    8000a018:	00989bb7          	lui	s7,0x989
    8000a01c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    8000a020:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    8000a024:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    8000a028:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000a02c:	00148c9b          	addiw	s9,s1,1
    8000a030:	02500793          	li	a5,37
    8000a034:	01998933          	add	s2,s3,s9
    8000a038:	38f51263          	bne	a0,a5,8000a3bc <__printf+0x434>
    8000a03c:	00094783          	lbu	a5,0(s2)
    8000a040:	00078c9b          	sext.w	s9,a5
    8000a044:	1e078263          	beqz	a5,8000a228 <__printf+0x2a0>
    8000a048:	0024849b          	addiw	s1,s1,2
    8000a04c:	07000713          	li	a4,112
    8000a050:	00998933          	add	s2,s3,s1
    8000a054:	38e78a63          	beq	a5,a4,8000a3e8 <__printf+0x460>
    8000a058:	20f76863          	bltu	a4,a5,8000a268 <__printf+0x2e0>
    8000a05c:	42a78863          	beq	a5,a0,8000a48c <__printf+0x504>
    8000a060:	06400713          	li	a4,100
    8000a064:	40e79663          	bne	a5,a4,8000a470 <__printf+0x4e8>
    8000a068:	f7843783          	ld	a5,-136(s0)
    8000a06c:	0007a603          	lw	a2,0(a5)
    8000a070:	00878793          	addi	a5,a5,8
    8000a074:	f6f43c23          	sd	a5,-136(s0)
    8000a078:	42064a63          	bltz	a2,8000a4ac <__printf+0x524>
    8000a07c:	00a00713          	li	a4,10
    8000a080:	02e677bb          	remuw	a5,a2,a4
    8000a084:	00003d97          	auipc	s11,0x3
    8000a088:	c5cd8d93          	addi	s11,s11,-932 # 8000cce0 <digits>
    8000a08c:	00900593          	li	a1,9
    8000a090:	0006051b          	sext.w	a0,a2
    8000a094:	00000c93          	li	s9,0
    8000a098:	02079793          	slli	a5,a5,0x20
    8000a09c:	0207d793          	srli	a5,a5,0x20
    8000a0a0:	00fd87b3          	add	a5,s11,a5
    8000a0a4:	0007c783          	lbu	a5,0(a5)
    8000a0a8:	02e656bb          	divuw	a3,a2,a4
    8000a0ac:	f8f40023          	sb	a5,-128(s0)
    8000a0b0:	14c5d863          	bge	a1,a2,8000a200 <__printf+0x278>
    8000a0b4:	06300593          	li	a1,99
    8000a0b8:	00100c93          	li	s9,1
    8000a0bc:	02e6f7bb          	remuw	a5,a3,a4
    8000a0c0:	02079793          	slli	a5,a5,0x20
    8000a0c4:	0207d793          	srli	a5,a5,0x20
    8000a0c8:	00fd87b3          	add	a5,s11,a5
    8000a0cc:	0007c783          	lbu	a5,0(a5)
    8000a0d0:	02e6d73b          	divuw	a4,a3,a4
    8000a0d4:	f8f400a3          	sb	a5,-127(s0)
    8000a0d8:	12a5f463          	bgeu	a1,a0,8000a200 <__printf+0x278>
    8000a0dc:	00a00693          	li	a3,10
    8000a0e0:	00900593          	li	a1,9
    8000a0e4:	02d777bb          	remuw	a5,a4,a3
    8000a0e8:	02079793          	slli	a5,a5,0x20
    8000a0ec:	0207d793          	srli	a5,a5,0x20
    8000a0f0:	00fd87b3          	add	a5,s11,a5
    8000a0f4:	0007c503          	lbu	a0,0(a5)
    8000a0f8:	02d757bb          	divuw	a5,a4,a3
    8000a0fc:	f8a40123          	sb	a0,-126(s0)
    8000a100:	48e5f263          	bgeu	a1,a4,8000a584 <__printf+0x5fc>
    8000a104:	06300513          	li	a0,99
    8000a108:	02d7f5bb          	remuw	a1,a5,a3
    8000a10c:	02059593          	slli	a1,a1,0x20
    8000a110:	0205d593          	srli	a1,a1,0x20
    8000a114:	00bd85b3          	add	a1,s11,a1
    8000a118:	0005c583          	lbu	a1,0(a1)
    8000a11c:	02d7d7bb          	divuw	a5,a5,a3
    8000a120:	f8b401a3          	sb	a1,-125(s0)
    8000a124:	48e57263          	bgeu	a0,a4,8000a5a8 <__printf+0x620>
    8000a128:	3e700513          	li	a0,999
    8000a12c:	02d7f5bb          	remuw	a1,a5,a3
    8000a130:	02059593          	slli	a1,a1,0x20
    8000a134:	0205d593          	srli	a1,a1,0x20
    8000a138:	00bd85b3          	add	a1,s11,a1
    8000a13c:	0005c583          	lbu	a1,0(a1)
    8000a140:	02d7d7bb          	divuw	a5,a5,a3
    8000a144:	f8b40223          	sb	a1,-124(s0)
    8000a148:	46e57663          	bgeu	a0,a4,8000a5b4 <__printf+0x62c>
    8000a14c:	02d7f5bb          	remuw	a1,a5,a3
    8000a150:	02059593          	slli	a1,a1,0x20
    8000a154:	0205d593          	srli	a1,a1,0x20
    8000a158:	00bd85b3          	add	a1,s11,a1
    8000a15c:	0005c583          	lbu	a1,0(a1)
    8000a160:	02d7d7bb          	divuw	a5,a5,a3
    8000a164:	f8b402a3          	sb	a1,-123(s0)
    8000a168:	46ea7863          	bgeu	s4,a4,8000a5d8 <__printf+0x650>
    8000a16c:	02d7f5bb          	remuw	a1,a5,a3
    8000a170:	02059593          	slli	a1,a1,0x20
    8000a174:	0205d593          	srli	a1,a1,0x20
    8000a178:	00bd85b3          	add	a1,s11,a1
    8000a17c:	0005c583          	lbu	a1,0(a1)
    8000a180:	02d7d7bb          	divuw	a5,a5,a3
    8000a184:	f8b40323          	sb	a1,-122(s0)
    8000a188:	3eeaf863          	bgeu	s5,a4,8000a578 <__printf+0x5f0>
    8000a18c:	02d7f5bb          	remuw	a1,a5,a3
    8000a190:	02059593          	slli	a1,a1,0x20
    8000a194:	0205d593          	srli	a1,a1,0x20
    8000a198:	00bd85b3          	add	a1,s11,a1
    8000a19c:	0005c583          	lbu	a1,0(a1)
    8000a1a0:	02d7d7bb          	divuw	a5,a5,a3
    8000a1a4:	f8b403a3          	sb	a1,-121(s0)
    8000a1a8:	42eb7e63          	bgeu	s6,a4,8000a5e4 <__printf+0x65c>
    8000a1ac:	02d7f5bb          	remuw	a1,a5,a3
    8000a1b0:	02059593          	slli	a1,a1,0x20
    8000a1b4:	0205d593          	srli	a1,a1,0x20
    8000a1b8:	00bd85b3          	add	a1,s11,a1
    8000a1bc:	0005c583          	lbu	a1,0(a1)
    8000a1c0:	02d7d7bb          	divuw	a5,a5,a3
    8000a1c4:	f8b40423          	sb	a1,-120(s0)
    8000a1c8:	42ebfc63          	bgeu	s7,a4,8000a600 <__printf+0x678>
    8000a1cc:	02079793          	slli	a5,a5,0x20
    8000a1d0:	0207d793          	srli	a5,a5,0x20
    8000a1d4:	00fd8db3          	add	s11,s11,a5
    8000a1d8:	000dc703          	lbu	a4,0(s11)
    8000a1dc:	00a00793          	li	a5,10
    8000a1e0:	00900c93          	li	s9,9
    8000a1e4:	f8e404a3          	sb	a4,-119(s0)
    8000a1e8:	00065c63          	bgez	a2,8000a200 <__printf+0x278>
    8000a1ec:	f9040713          	addi	a4,s0,-112
    8000a1f0:	00f70733          	add	a4,a4,a5
    8000a1f4:	02d00693          	li	a3,45
    8000a1f8:	fed70823          	sb	a3,-16(a4)
    8000a1fc:	00078c93          	mv	s9,a5
    8000a200:	f8040793          	addi	a5,s0,-128
    8000a204:	01978cb3          	add	s9,a5,s9
    8000a208:	f7f40d13          	addi	s10,s0,-129
    8000a20c:	000cc503          	lbu	a0,0(s9)
    8000a210:	fffc8c93          	addi	s9,s9,-1
    8000a214:	00000097          	auipc	ra,0x0
    8000a218:	b90080e7          	jalr	-1136(ra) # 80009da4 <consputc>
    8000a21c:	ffac98e3          	bne	s9,s10,8000a20c <__printf+0x284>
    8000a220:	00094503          	lbu	a0,0(s2)
    8000a224:	e00514e3          	bnez	a0,8000a02c <__printf+0xa4>
    8000a228:	1a0c1663          	bnez	s8,8000a3d4 <__printf+0x44c>
    8000a22c:	08813083          	ld	ra,136(sp)
    8000a230:	08013403          	ld	s0,128(sp)
    8000a234:	07813483          	ld	s1,120(sp)
    8000a238:	07013903          	ld	s2,112(sp)
    8000a23c:	06813983          	ld	s3,104(sp)
    8000a240:	06013a03          	ld	s4,96(sp)
    8000a244:	05813a83          	ld	s5,88(sp)
    8000a248:	05013b03          	ld	s6,80(sp)
    8000a24c:	04813b83          	ld	s7,72(sp)
    8000a250:	04013c03          	ld	s8,64(sp)
    8000a254:	03813c83          	ld	s9,56(sp)
    8000a258:	03013d03          	ld	s10,48(sp)
    8000a25c:	02813d83          	ld	s11,40(sp)
    8000a260:	0d010113          	addi	sp,sp,208
    8000a264:	00008067          	ret
    8000a268:	07300713          	li	a4,115
    8000a26c:	1ce78a63          	beq	a5,a4,8000a440 <__printf+0x4b8>
    8000a270:	07800713          	li	a4,120
    8000a274:	1ee79e63          	bne	a5,a4,8000a470 <__printf+0x4e8>
    8000a278:	f7843783          	ld	a5,-136(s0)
    8000a27c:	0007a703          	lw	a4,0(a5)
    8000a280:	00878793          	addi	a5,a5,8
    8000a284:	f6f43c23          	sd	a5,-136(s0)
    8000a288:	28074263          	bltz	a4,8000a50c <__printf+0x584>
    8000a28c:	00003d97          	auipc	s11,0x3
    8000a290:	a54d8d93          	addi	s11,s11,-1452 # 8000cce0 <digits>
    8000a294:	00f77793          	andi	a5,a4,15
    8000a298:	00fd87b3          	add	a5,s11,a5
    8000a29c:	0007c683          	lbu	a3,0(a5)
    8000a2a0:	00f00613          	li	a2,15
    8000a2a4:	0007079b          	sext.w	a5,a4
    8000a2a8:	f8d40023          	sb	a3,-128(s0)
    8000a2ac:	0047559b          	srliw	a1,a4,0x4
    8000a2b0:	0047569b          	srliw	a3,a4,0x4
    8000a2b4:	00000c93          	li	s9,0
    8000a2b8:	0ee65063          	bge	a2,a4,8000a398 <__printf+0x410>
    8000a2bc:	00f6f693          	andi	a3,a3,15
    8000a2c0:	00dd86b3          	add	a3,s11,a3
    8000a2c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    8000a2c8:	0087d79b          	srliw	a5,a5,0x8
    8000a2cc:	00100c93          	li	s9,1
    8000a2d0:	f8d400a3          	sb	a3,-127(s0)
    8000a2d4:	0cb67263          	bgeu	a2,a1,8000a398 <__printf+0x410>
    8000a2d8:	00f7f693          	andi	a3,a5,15
    8000a2dc:	00dd86b3          	add	a3,s11,a3
    8000a2e0:	0006c583          	lbu	a1,0(a3)
    8000a2e4:	00f00613          	li	a2,15
    8000a2e8:	0047d69b          	srliw	a3,a5,0x4
    8000a2ec:	f8b40123          	sb	a1,-126(s0)
    8000a2f0:	0047d593          	srli	a1,a5,0x4
    8000a2f4:	28f67e63          	bgeu	a2,a5,8000a590 <__printf+0x608>
    8000a2f8:	00f6f693          	andi	a3,a3,15
    8000a2fc:	00dd86b3          	add	a3,s11,a3
    8000a300:	0006c503          	lbu	a0,0(a3)
    8000a304:	0087d813          	srli	a6,a5,0x8
    8000a308:	0087d69b          	srliw	a3,a5,0x8
    8000a30c:	f8a401a3          	sb	a0,-125(s0)
    8000a310:	28b67663          	bgeu	a2,a1,8000a59c <__printf+0x614>
    8000a314:	00f6f693          	andi	a3,a3,15
    8000a318:	00dd86b3          	add	a3,s11,a3
    8000a31c:	0006c583          	lbu	a1,0(a3)
    8000a320:	00c7d513          	srli	a0,a5,0xc
    8000a324:	00c7d69b          	srliw	a3,a5,0xc
    8000a328:	f8b40223          	sb	a1,-124(s0)
    8000a32c:	29067a63          	bgeu	a2,a6,8000a5c0 <__printf+0x638>
    8000a330:	00f6f693          	andi	a3,a3,15
    8000a334:	00dd86b3          	add	a3,s11,a3
    8000a338:	0006c583          	lbu	a1,0(a3)
    8000a33c:	0107d813          	srli	a6,a5,0x10
    8000a340:	0107d69b          	srliw	a3,a5,0x10
    8000a344:	f8b402a3          	sb	a1,-123(s0)
    8000a348:	28a67263          	bgeu	a2,a0,8000a5cc <__printf+0x644>
    8000a34c:	00f6f693          	andi	a3,a3,15
    8000a350:	00dd86b3          	add	a3,s11,a3
    8000a354:	0006c683          	lbu	a3,0(a3)
    8000a358:	0147d79b          	srliw	a5,a5,0x14
    8000a35c:	f8d40323          	sb	a3,-122(s0)
    8000a360:	21067663          	bgeu	a2,a6,8000a56c <__printf+0x5e4>
    8000a364:	02079793          	slli	a5,a5,0x20
    8000a368:	0207d793          	srli	a5,a5,0x20
    8000a36c:	00fd8db3          	add	s11,s11,a5
    8000a370:	000dc683          	lbu	a3,0(s11)
    8000a374:	00800793          	li	a5,8
    8000a378:	00700c93          	li	s9,7
    8000a37c:	f8d403a3          	sb	a3,-121(s0)
    8000a380:	00075c63          	bgez	a4,8000a398 <__printf+0x410>
    8000a384:	f9040713          	addi	a4,s0,-112
    8000a388:	00f70733          	add	a4,a4,a5
    8000a38c:	02d00693          	li	a3,45
    8000a390:	fed70823          	sb	a3,-16(a4)
    8000a394:	00078c93          	mv	s9,a5
    8000a398:	f8040793          	addi	a5,s0,-128
    8000a39c:	01978cb3          	add	s9,a5,s9
    8000a3a0:	f7f40d13          	addi	s10,s0,-129
    8000a3a4:	000cc503          	lbu	a0,0(s9)
    8000a3a8:	fffc8c93          	addi	s9,s9,-1
    8000a3ac:	00000097          	auipc	ra,0x0
    8000a3b0:	9f8080e7          	jalr	-1544(ra) # 80009da4 <consputc>
    8000a3b4:	ff9d18e3          	bne	s10,s9,8000a3a4 <__printf+0x41c>
    8000a3b8:	0100006f          	j	8000a3c8 <__printf+0x440>
    8000a3bc:	00000097          	auipc	ra,0x0
    8000a3c0:	9e8080e7          	jalr	-1560(ra) # 80009da4 <consputc>
    8000a3c4:	000c8493          	mv	s1,s9
    8000a3c8:	00094503          	lbu	a0,0(s2)
    8000a3cc:	c60510e3          	bnez	a0,8000a02c <__printf+0xa4>
    8000a3d0:	e40c0ee3          	beqz	s8,8000a22c <__printf+0x2a4>
    8000a3d4:	00006517          	auipc	a0,0x6
    8000a3d8:	0ec50513          	addi	a0,a0,236 # 800104c0 <pr>
    8000a3dc:	00001097          	auipc	ra,0x1
    8000a3e0:	94c080e7          	jalr	-1716(ra) # 8000ad28 <release>
    8000a3e4:	e49ff06f          	j	8000a22c <__printf+0x2a4>
    8000a3e8:	f7843783          	ld	a5,-136(s0)
    8000a3ec:	03000513          	li	a0,48
    8000a3f0:	01000d13          	li	s10,16
    8000a3f4:	00878713          	addi	a4,a5,8
    8000a3f8:	0007bc83          	ld	s9,0(a5)
    8000a3fc:	f6e43c23          	sd	a4,-136(s0)
    8000a400:	00000097          	auipc	ra,0x0
    8000a404:	9a4080e7          	jalr	-1628(ra) # 80009da4 <consputc>
    8000a408:	07800513          	li	a0,120
    8000a40c:	00000097          	auipc	ra,0x0
    8000a410:	998080e7          	jalr	-1640(ra) # 80009da4 <consputc>
    8000a414:	00003d97          	auipc	s11,0x3
    8000a418:	8ccd8d93          	addi	s11,s11,-1844 # 8000cce0 <digits>
    8000a41c:	03ccd793          	srli	a5,s9,0x3c
    8000a420:	00fd87b3          	add	a5,s11,a5
    8000a424:	0007c503          	lbu	a0,0(a5)
    8000a428:	fffd0d1b          	addiw	s10,s10,-1
    8000a42c:	004c9c93          	slli	s9,s9,0x4
    8000a430:	00000097          	auipc	ra,0x0
    8000a434:	974080e7          	jalr	-1676(ra) # 80009da4 <consputc>
    8000a438:	fe0d12e3          	bnez	s10,8000a41c <__printf+0x494>
    8000a43c:	f8dff06f          	j	8000a3c8 <__printf+0x440>
    8000a440:	f7843783          	ld	a5,-136(s0)
    8000a444:	0007bc83          	ld	s9,0(a5)
    8000a448:	00878793          	addi	a5,a5,8
    8000a44c:	f6f43c23          	sd	a5,-136(s0)
    8000a450:	000c9a63          	bnez	s9,8000a464 <__printf+0x4dc>
    8000a454:	1080006f          	j	8000a55c <__printf+0x5d4>
    8000a458:	001c8c93          	addi	s9,s9,1
    8000a45c:	00000097          	auipc	ra,0x0
    8000a460:	948080e7          	jalr	-1720(ra) # 80009da4 <consputc>
    8000a464:	000cc503          	lbu	a0,0(s9)
    8000a468:	fe0518e3          	bnez	a0,8000a458 <__printf+0x4d0>
    8000a46c:	f5dff06f          	j	8000a3c8 <__printf+0x440>
    8000a470:	02500513          	li	a0,37
    8000a474:	00000097          	auipc	ra,0x0
    8000a478:	930080e7          	jalr	-1744(ra) # 80009da4 <consputc>
    8000a47c:	000c8513          	mv	a0,s9
    8000a480:	00000097          	auipc	ra,0x0
    8000a484:	924080e7          	jalr	-1756(ra) # 80009da4 <consputc>
    8000a488:	f41ff06f          	j	8000a3c8 <__printf+0x440>
    8000a48c:	02500513          	li	a0,37
    8000a490:	00000097          	auipc	ra,0x0
    8000a494:	914080e7          	jalr	-1772(ra) # 80009da4 <consputc>
    8000a498:	f31ff06f          	j	8000a3c8 <__printf+0x440>
    8000a49c:	00030513          	mv	a0,t1
    8000a4a0:	00000097          	auipc	ra,0x0
    8000a4a4:	7bc080e7          	jalr	1980(ra) # 8000ac5c <acquire>
    8000a4a8:	b4dff06f          	j	80009ff4 <__printf+0x6c>
    8000a4ac:	40c0053b          	negw	a0,a2
    8000a4b0:	00a00713          	li	a4,10
    8000a4b4:	02e576bb          	remuw	a3,a0,a4
    8000a4b8:	00003d97          	auipc	s11,0x3
    8000a4bc:	828d8d93          	addi	s11,s11,-2008 # 8000cce0 <digits>
    8000a4c0:	ff700593          	li	a1,-9
    8000a4c4:	02069693          	slli	a3,a3,0x20
    8000a4c8:	0206d693          	srli	a3,a3,0x20
    8000a4cc:	00dd86b3          	add	a3,s11,a3
    8000a4d0:	0006c683          	lbu	a3,0(a3)
    8000a4d4:	02e557bb          	divuw	a5,a0,a4
    8000a4d8:	f8d40023          	sb	a3,-128(s0)
    8000a4dc:	10b65e63          	bge	a2,a1,8000a5f8 <__printf+0x670>
    8000a4e0:	06300593          	li	a1,99
    8000a4e4:	02e7f6bb          	remuw	a3,a5,a4
    8000a4e8:	02069693          	slli	a3,a3,0x20
    8000a4ec:	0206d693          	srli	a3,a3,0x20
    8000a4f0:	00dd86b3          	add	a3,s11,a3
    8000a4f4:	0006c683          	lbu	a3,0(a3)
    8000a4f8:	02e7d73b          	divuw	a4,a5,a4
    8000a4fc:	00200793          	li	a5,2
    8000a500:	f8d400a3          	sb	a3,-127(s0)
    8000a504:	bca5ece3          	bltu	a1,a0,8000a0dc <__printf+0x154>
    8000a508:	ce5ff06f          	j	8000a1ec <__printf+0x264>
    8000a50c:	40e007bb          	negw	a5,a4
    8000a510:	00002d97          	auipc	s11,0x2
    8000a514:	7d0d8d93          	addi	s11,s11,2000 # 8000cce0 <digits>
    8000a518:	00f7f693          	andi	a3,a5,15
    8000a51c:	00dd86b3          	add	a3,s11,a3
    8000a520:	0006c583          	lbu	a1,0(a3)
    8000a524:	ff100613          	li	a2,-15
    8000a528:	0047d69b          	srliw	a3,a5,0x4
    8000a52c:	f8b40023          	sb	a1,-128(s0)
    8000a530:	0047d59b          	srliw	a1,a5,0x4
    8000a534:	0ac75e63          	bge	a4,a2,8000a5f0 <__printf+0x668>
    8000a538:	00f6f693          	andi	a3,a3,15
    8000a53c:	00dd86b3          	add	a3,s11,a3
    8000a540:	0006c603          	lbu	a2,0(a3)
    8000a544:	00f00693          	li	a3,15
    8000a548:	0087d79b          	srliw	a5,a5,0x8
    8000a54c:	f8c400a3          	sb	a2,-127(s0)
    8000a550:	d8b6e4e3          	bltu	a3,a1,8000a2d8 <__printf+0x350>
    8000a554:	00200793          	li	a5,2
    8000a558:	e2dff06f          	j	8000a384 <__printf+0x3fc>
    8000a55c:	00002c97          	auipc	s9,0x2
    8000a560:	764c8c93          	addi	s9,s9,1892 # 8000ccc0 <_ZTV8Consumer+0x160>
    8000a564:	02800513          	li	a0,40
    8000a568:	ef1ff06f          	j	8000a458 <__printf+0x4d0>
    8000a56c:	00700793          	li	a5,7
    8000a570:	00600c93          	li	s9,6
    8000a574:	e0dff06f          	j	8000a380 <__printf+0x3f8>
    8000a578:	00700793          	li	a5,7
    8000a57c:	00600c93          	li	s9,6
    8000a580:	c69ff06f          	j	8000a1e8 <__printf+0x260>
    8000a584:	00300793          	li	a5,3
    8000a588:	00200c93          	li	s9,2
    8000a58c:	c5dff06f          	j	8000a1e8 <__printf+0x260>
    8000a590:	00300793          	li	a5,3
    8000a594:	00200c93          	li	s9,2
    8000a598:	de9ff06f          	j	8000a380 <__printf+0x3f8>
    8000a59c:	00400793          	li	a5,4
    8000a5a0:	00300c93          	li	s9,3
    8000a5a4:	dddff06f          	j	8000a380 <__printf+0x3f8>
    8000a5a8:	00400793          	li	a5,4
    8000a5ac:	00300c93          	li	s9,3
    8000a5b0:	c39ff06f          	j	8000a1e8 <__printf+0x260>
    8000a5b4:	00500793          	li	a5,5
    8000a5b8:	00400c93          	li	s9,4
    8000a5bc:	c2dff06f          	j	8000a1e8 <__printf+0x260>
    8000a5c0:	00500793          	li	a5,5
    8000a5c4:	00400c93          	li	s9,4
    8000a5c8:	db9ff06f          	j	8000a380 <__printf+0x3f8>
    8000a5cc:	00600793          	li	a5,6
    8000a5d0:	00500c93          	li	s9,5
    8000a5d4:	dadff06f          	j	8000a380 <__printf+0x3f8>
    8000a5d8:	00600793          	li	a5,6
    8000a5dc:	00500c93          	li	s9,5
    8000a5e0:	c09ff06f          	j	8000a1e8 <__printf+0x260>
    8000a5e4:	00800793          	li	a5,8
    8000a5e8:	00700c93          	li	s9,7
    8000a5ec:	bfdff06f          	j	8000a1e8 <__printf+0x260>
    8000a5f0:	00100793          	li	a5,1
    8000a5f4:	d91ff06f          	j	8000a384 <__printf+0x3fc>
    8000a5f8:	00100793          	li	a5,1
    8000a5fc:	bf1ff06f          	j	8000a1ec <__printf+0x264>
    8000a600:	00900793          	li	a5,9
    8000a604:	00800c93          	li	s9,8
    8000a608:	be1ff06f          	j	8000a1e8 <__printf+0x260>
    8000a60c:	00002517          	auipc	a0,0x2
    8000a610:	6bc50513          	addi	a0,a0,1724 # 8000ccc8 <_ZTV8Consumer+0x168>
    8000a614:	00000097          	auipc	ra,0x0
    8000a618:	918080e7          	jalr	-1768(ra) # 80009f2c <panic>

000000008000a61c <printfinit>:
    8000a61c:	fe010113          	addi	sp,sp,-32
    8000a620:	00813823          	sd	s0,16(sp)
    8000a624:	00913423          	sd	s1,8(sp)
    8000a628:	00113c23          	sd	ra,24(sp)
    8000a62c:	02010413          	addi	s0,sp,32
    8000a630:	00006497          	auipc	s1,0x6
    8000a634:	e9048493          	addi	s1,s1,-368 # 800104c0 <pr>
    8000a638:	00048513          	mv	a0,s1
    8000a63c:	00002597          	auipc	a1,0x2
    8000a640:	69c58593          	addi	a1,a1,1692 # 8000ccd8 <_ZTV8Consumer+0x178>
    8000a644:	00000097          	auipc	ra,0x0
    8000a648:	5f4080e7          	jalr	1524(ra) # 8000ac38 <initlock>
    8000a64c:	01813083          	ld	ra,24(sp)
    8000a650:	01013403          	ld	s0,16(sp)
    8000a654:	0004ac23          	sw	zero,24(s1)
    8000a658:	00813483          	ld	s1,8(sp)
    8000a65c:	02010113          	addi	sp,sp,32
    8000a660:	00008067          	ret

000000008000a664 <uartinit>:
    8000a664:	ff010113          	addi	sp,sp,-16
    8000a668:	00813423          	sd	s0,8(sp)
    8000a66c:	01010413          	addi	s0,sp,16
    8000a670:	100007b7          	lui	a5,0x10000
    8000a674:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    8000a678:	f8000713          	li	a4,-128
    8000a67c:	00e781a3          	sb	a4,3(a5)
    8000a680:	00300713          	li	a4,3
    8000a684:	00e78023          	sb	a4,0(a5)
    8000a688:	000780a3          	sb	zero,1(a5)
    8000a68c:	00e781a3          	sb	a4,3(a5)
    8000a690:	00700693          	li	a3,7
    8000a694:	00d78123          	sb	a3,2(a5)
    8000a698:	00e780a3          	sb	a4,1(a5)
    8000a69c:	00813403          	ld	s0,8(sp)
    8000a6a0:	01010113          	addi	sp,sp,16
    8000a6a4:	00008067          	ret

000000008000a6a8 <uartputc>:
    8000a6a8:	00005797          	auipc	a5,0x5
    8000a6ac:	bd87a783          	lw	a5,-1064(a5) # 8000f280 <panicked>
    8000a6b0:	00078463          	beqz	a5,8000a6b8 <uartputc+0x10>
    8000a6b4:	0000006f          	j	8000a6b4 <uartputc+0xc>
    8000a6b8:	fd010113          	addi	sp,sp,-48
    8000a6bc:	02813023          	sd	s0,32(sp)
    8000a6c0:	00913c23          	sd	s1,24(sp)
    8000a6c4:	01213823          	sd	s2,16(sp)
    8000a6c8:	01313423          	sd	s3,8(sp)
    8000a6cc:	02113423          	sd	ra,40(sp)
    8000a6d0:	03010413          	addi	s0,sp,48
    8000a6d4:	00005917          	auipc	s2,0x5
    8000a6d8:	bb490913          	addi	s2,s2,-1100 # 8000f288 <uart_tx_r>
    8000a6dc:	00093783          	ld	a5,0(s2)
    8000a6e0:	00005497          	auipc	s1,0x5
    8000a6e4:	bb048493          	addi	s1,s1,-1104 # 8000f290 <uart_tx_w>
    8000a6e8:	0004b703          	ld	a4,0(s1)
    8000a6ec:	02078693          	addi	a3,a5,32
    8000a6f0:	00050993          	mv	s3,a0
    8000a6f4:	02e69c63          	bne	a3,a4,8000a72c <uartputc+0x84>
    8000a6f8:	00001097          	auipc	ra,0x1
    8000a6fc:	834080e7          	jalr	-1996(ra) # 8000af2c <push_on>
    8000a700:	00093783          	ld	a5,0(s2)
    8000a704:	0004b703          	ld	a4,0(s1)
    8000a708:	02078793          	addi	a5,a5,32
    8000a70c:	00e79463          	bne	a5,a4,8000a714 <uartputc+0x6c>
    8000a710:	0000006f          	j	8000a710 <uartputc+0x68>
    8000a714:	00001097          	auipc	ra,0x1
    8000a718:	88c080e7          	jalr	-1908(ra) # 8000afa0 <pop_on>
    8000a71c:	00093783          	ld	a5,0(s2)
    8000a720:	0004b703          	ld	a4,0(s1)
    8000a724:	02078693          	addi	a3,a5,32
    8000a728:	fce688e3          	beq	a3,a4,8000a6f8 <uartputc+0x50>
    8000a72c:	01f77693          	andi	a3,a4,31
    8000a730:	00006597          	auipc	a1,0x6
    8000a734:	db058593          	addi	a1,a1,-592 # 800104e0 <uart_tx_buf>
    8000a738:	00d586b3          	add	a3,a1,a3
    8000a73c:	00170713          	addi	a4,a4,1
    8000a740:	01368023          	sb	s3,0(a3)
    8000a744:	00e4b023          	sd	a4,0(s1)
    8000a748:	10000637          	lui	a2,0x10000
    8000a74c:	02f71063          	bne	a4,a5,8000a76c <uartputc+0xc4>
    8000a750:	0340006f          	j	8000a784 <uartputc+0xdc>
    8000a754:	00074703          	lbu	a4,0(a4)
    8000a758:	00f93023          	sd	a5,0(s2)
    8000a75c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    8000a760:	00093783          	ld	a5,0(s2)
    8000a764:	0004b703          	ld	a4,0(s1)
    8000a768:	00f70e63          	beq	a4,a5,8000a784 <uartputc+0xdc>
    8000a76c:	00564683          	lbu	a3,5(a2)
    8000a770:	01f7f713          	andi	a4,a5,31
    8000a774:	00e58733          	add	a4,a1,a4
    8000a778:	0206f693          	andi	a3,a3,32
    8000a77c:	00178793          	addi	a5,a5,1
    8000a780:	fc069ae3          	bnez	a3,8000a754 <uartputc+0xac>
    8000a784:	02813083          	ld	ra,40(sp)
    8000a788:	02013403          	ld	s0,32(sp)
    8000a78c:	01813483          	ld	s1,24(sp)
    8000a790:	01013903          	ld	s2,16(sp)
    8000a794:	00813983          	ld	s3,8(sp)
    8000a798:	03010113          	addi	sp,sp,48
    8000a79c:	00008067          	ret

000000008000a7a0 <uartputc_sync>:
    8000a7a0:	ff010113          	addi	sp,sp,-16
    8000a7a4:	00813423          	sd	s0,8(sp)
    8000a7a8:	01010413          	addi	s0,sp,16
    8000a7ac:	00005717          	auipc	a4,0x5
    8000a7b0:	ad472703          	lw	a4,-1324(a4) # 8000f280 <panicked>
    8000a7b4:	02071663          	bnez	a4,8000a7e0 <uartputc_sync+0x40>
    8000a7b8:	00050793          	mv	a5,a0
    8000a7bc:	100006b7          	lui	a3,0x10000
    8000a7c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    8000a7c4:	02077713          	andi	a4,a4,32
    8000a7c8:	fe070ce3          	beqz	a4,8000a7c0 <uartputc_sync+0x20>
    8000a7cc:	0ff7f793          	andi	a5,a5,255
    8000a7d0:	00f68023          	sb	a5,0(a3)
    8000a7d4:	00813403          	ld	s0,8(sp)
    8000a7d8:	01010113          	addi	sp,sp,16
    8000a7dc:	00008067          	ret
    8000a7e0:	0000006f          	j	8000a7e0 <uartputc_sync+0x40>

000000008000a7e4 <uartstart>:
    8000a7e4:	ff010113          	addi	sp,sp,-16
    8000a7e8:	00813423          	sd	s0,8(sp)
    8000a7ec:	01010413          	addi	s0,sp,16
    8000a7f0:	00005617          	auipc	a2,0x5
    8000a7f4:	a9860613          	addi	a2,a2,-1384 # 8000f288 <uart_tx_r>
    8000a7f8:	00005517          	auipc	a0,0x5
    8000a7fc:	a9850513          	addi	a0,a0,-1384 # 8000f290 <uart_tx_w>
    8000a800:	00063783          	ld	a5,0(a2)
    8000a804:	00053703          	ld	a4,0(a0)
    8000a808:	04f70263          	beq	a4,a5,8000a84c <uartstart+0x68>
    8000a80c:	100005b7          	lui	a1,0x10000
    8000a810:	00006817          	auipc	a6,0x6
    8000a814:	cd080813          	addi	a6,a6,-816 # 800104e0 <uart_tx_buf>
    8000a818:	01c0006f          	j	8000a834 <uartstart+0x50>
    8000a81c:	0006c703          	lbu	a4,0(a3)
    8000a820:	00f63023          	sd	a5,0(a2)
    8000a824:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a828:	00063783          	ld	a5,0(a2)
    8000a82c:	00053703          	ld	a4,0(a0)
    8000a830:	00f70e63          	beq	a4,a5,8000a84c <uartstart+0x68>
    8000a834:	01f7f713          	andi	a4,a5,31
    8000a838:	00e806b3          	add	a3,a6,a4
    8000a83c:	0055c703          	lbu	a4,5(a1)
    8000a840:	00178793          	addi	a5,a5,1
    8000a844:	02077713          	andi	a4,a4,32
    8000a848:	fc071ae3          	bnez	a4,8000a81c <uartstart+0x38>
    8000a84c:	00813403          	ld	s0,8(sp)
    8000a850:	01010113          	addi	sp,sp,16
    8000a854:	00008067          	ret

000000008000a858 <uartgetc>:
    8000a858:	ff010113          	addi	sp,sp,-16
    8000a85c:	00813423          	sd	s0,8(sp)
    8000a860:	01010413          	addi	s0,sp,16
    8000a864:	10000737          	lui	a4,0x10000
    8000a868:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000a86c:	0017f793          	andi	a5,a5,1
    8000a870:	00078c63          	beqz	a5,8000a888 <uartgetc+0x30>
    8000a874:	00074503          	lbu	a0,0(a4)
    8000a878:	0ff57513          	andi	a0,a0,255
    8000a87c:	00813403          	ld	s0,8(sp)
    8000a880:	01010113          	addi	sp,sp,16
    8000a884:	00008067          	ret
    8000a888:	fff00513          	li	a0,-1
    8000a88c:	ff1ff06f          	j	8000a87c <uartgetc+0x24>

000000008000a890 <uartintr>:
    8000a890:	100007b7          	lui	a5,0x10000
    8000a894:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    8000a898:	0017f793          	andi	a5,a5,1
    8000a89c:	0a078463          	beqz	a5,8000a944 <uartintr+0xb4>
    8000a8a0:	fe010113          	addi	sp,sp,-32
    8000a8a4:	00813823          	sd	s0,16(sp)
    8000a8a8:	00913423          	sd	s1,8(sp)
    8000a8ac:	00113c23          	sd	ra,24(sp)
    8000a8b0:	02010413          	addi	s0,sp,32
    8000a8b4:	100004b7          	lui	s1,0x10000
    8000a8b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000a8bc:	0ff57513          	andi	a0,a0,255
    8000a8c0:	fffff097          	auipc	ra,0xfffff
    8000a8c4:	534080e7          	jalr	1332(ra) # 80009df4 <consoleintr>
    8000a8c8:	0054c783          	lbu	a5,5(s1)
    8000a8cc:	0017f793          	andi	a5,a5,1
    8000a8d0:	fe0794e3          	bnez	a5,8000a8b8 <uartintr+0x28>
    8000a8d4:	00005617          	auipc	a2,0x5
    8000a8d8:	9b460613          	addi	a2,a2,-1612 # 8000f288 <uart_tx_r>
    8000a8dc:	00005517          	auipc	a0,0x5
    8000a8e0:	9b450513          	addi	a0,a0,-1612 # 8000f290 <uart_tx_w>
    8000a8e4:	00063783          	ld	a5,0(a2)
    8000a8e8:	00053703          	ld	a4,0(a0)
    8000a8ec:	04f70263          	beq	a4,a5,8000a930 <uartintr+0xa0>
    8000a8f0:	100005b7          	lui	a1,0x10000
    8000a8f4:	00006817          	auipc	a6,0x6
    8000a8f8:	bec80813          	addi	a6,a6,-1044 # 800104e0 <uart_tx_buf>
    8000a8fc:	01c0006f          	j	8000a918 <uartintr+0x88>
    8000a900:	0006c703          	lbu	a4,0(a3)
    8000a904:	00f63023          	sd	a5,0(a2)
    8000a908:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a90c:	00063783          	ld	a5,0(a2)
    8000a910:	00053703          	ld	a4,0(a0)
    8000a914:	00f70e63          	beq	a4,a5,8000a930 <uartintr+0xa0>
    8000a918:	01f7f713          	andi	a4,a5,31
    8000a91c:	00e806b3          	add	a3,a6,a4
    8000a920:	0055c703          	lbu	a4,5(a1)
    8000a924:	00178793          	addi	a5,a5,1
    8000a928:	02077713          	andi	a4,a4,32
    8000a92c:	fc071ae3          	bnez	a4,8000a900 <uartintr+0x70>
    8000a930:	01813083          	ld	ra,24(sp)
    8000a934:	01013403          	ld	s0,16(sp)
    8000a938:	00813483          	ld	s1,8(sp)
    8000a93c:	02010113          	addi	sp,sp,32
    8000a940:	00008067          	ret
    8000a944:	00005617          	auipc	a2,0x5
    8000a948:	94460613          	addi	a2,a2,-1724 # 8000f288 <uart_tx_r>
    8000a94c:	00005517          	auipc	a0,0x5
    8000a950:	94450513          	addi	a0,a0,-1724 # 8000f290 <uart_tx_w>
    8000a954:	00063783          	ld	a5,0(a2)
    8000a958:	00053703          	ld	a4,0(a0)
    8000a95c:	04f70263          	beq	a4,a5,8000a9a0 <uartintr+0x110>
    8000a960:	100005b7          	lui	a1,0x10000
    8000a964:	00006817          	auipc	a6,0x6
    8000a968:	b7c80813          	addi	a6,a6,-1156 # 800104e0 <uart_tx_buf>
    8000a96c:	01c0006f          	j	8000a988 <uartintr+0xf8>
    8000a970:	0006c703          	lbu	a4,0(a3)
    8000a974:	00f63023          	sd	a5,0(a2)
    8000a978:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a97c:	00063783          	ld	a5,0(a2)
    8000a980:	00053703          	ld	a4,0(a0)
    8000a984:	02f70063          	beq	a4,a5,8000a9a4 <uartintr+0x114>
    8000a988:	01f7f713          	andi	a4,a5,31
    8000a98c:	00e806b3          	add	a3,a6,a4
    8000a990:	0055c703          	lbu	a4,5(a1)
    8000a994:	00178793          	addi	a5,a5,1
    8000a998:	02077713          	andi	a4,a4,32
    8000a99c:	fc071ae3          	bnez	a4,8000a970 <uartintr+0xe0>
    8000a9a0:	00008067          	ret
    8000a9a4:	00008067          	ret

000000008000a9a8 <kinit>:
    8000a9a8:	fc010113          	addi	sp,sp,-64
    8000a9ac:	02913423          	sd	s1,40(sp)
    8000a9b0:	fffff7b7          	lui	a5,0xfffff
    8000a9b4:	00007497          	auipc	s1,0x7
    8000a9b8:	b4b48493          	addi	s1,s1,-1205 # 800114ff <end+0xfff>
    8000a9bc:	02813823          	sd	s0,48(sp)
    8000a9c0:	01313c23          	sd	s3,24(sp)
    8000a9c4:	00f4f4b3          	and	s1,s1,a5
    8000a9c8:	02113c23          	sd	ra,56(sp)
    8000a9cc:	03213023          	sd	s2,32(sp)
    8000a9d0:	01413823          	sd	s4,16(sp)
    8000a9d4:	01513423          	sd	s5,8(sp)
    8000a9d8:	04010413          	addi	s0,sp,64
    8000a9dc:	000017b7          	lui	a5,0x1
    8000a9e0:	01100993          	li	s3,17
    8000a9e4:	00f487b3          	add	a5,s1,a5
    8000a9e8:	01b99993          	slli	s3,s3,0x1b
    8000a9ec:	06f9e063          	bltu	s3,a5,8000aa4c <kinit+0xa4>
    8000a9f0:	00006a97          	auipc	s5,0x6
    8000a9f4:	b10a8a93          	addi	s5,s5,-1264 # 80010500 <end>
    8000a9f8:	0754ec63          	bltu	s1,s5,8000aa70 <kinit+0xc8>
    8000a9fc:	0734fa63          	bgeu	s1,s3,8000aa70 <kinit+0xc8>
    8000aa00:	00088a37          	lui	s4,0x88
    8000aa04:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    8000aa08:	00005917          	auipc	s2,0x5
    8000aa0c:	89090913          	addi	s2,s2,-1904 # 8000f298 <kmem>
    8000aa10:	00ca1a13          	slli	s4,s4,0xc
    8000aa14:	0140006f          	j	8000aa28 <kinit+0x80>
    8000aa18:	000017b7          	lui	a5,0x1
    8000aa1c:	00f484b3          	add	s1,s1,a5
    8000aa20:	0554e863          	bltu	s1,s5,8000aa70 <kinit+0xc8>
    8000aa24:	0534f663          	bgeu	s1,s3,8000aa70 <kinit+0xc8>
    8000aa28:	00001637          	lui	a2,0x1
    8000aa2c:	00100593          	li	a1,1
    8000aa30:	00048513          	mv	a0,s1
    8000aa34:	00000097          	auipc	ra,0x0
    8000aa38:	5e4080e7          	jalr	1508(ra) # 8000b018 <__memset>
    8000aa3c:	00093783          	ld	a5,0(s2)
    8000aa40:	00f4b023          	sd	a5,0(s1)
    8000aa44:	00993023          	sd	s1,0(s2)
    8000aa48:	fd4498e3          	bne	s1,s4,8000aa18 <kinit+0x70>
    8000aa4c:	03813083          	ld	ra,56(sp)
    8000aa50:	03013403          	ld	s0,48(sp)
    8000aa54:	02813483          	ld	s1,40(sp)
    8000aa58:	02013903          	ld	s2,32(sp)
    8000aa5c:	01813983          	ld	s3,24(sp)
    8000aa60:	01013a03          	ld	s4,16(sp)
    8000aa64:	00813a83          	ld	s5,8(sp)
    8000aa68:	04010113          	addi	sp,sp,64
    8000aa6c:	00008067          	ret
    8000aa70:	00002517          	auipc	a0,0x2
    8000aa74:	28850513          	addi	a0,a0,648 # 8000ccf8 <digits+0x18>
    8000aa78:	fffff097          	auipc	ra,0xfffff
    8000aa7c:	4b4080e7          	jalr	1204(ra) # 80009f2c <panic>

000000008000aa80 <freerange>:
    8000aa80:	fc010113          	addi	sp,sp,-64
    8000aa84:	000017b7          	lui	a5,0x1
    8000aa88:	02913423          	sd	s1,40(sp)
    8000aa8c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    8000aa90:	009504b3          	add	s1,a0,s1
    8000aa94:	fffff537          	lui	a0,0xfffff
    8000aa98:	02813823          	sd	s0,48(sp)
    8000aa9c:	02113c23          	sd	ra,56(sp)
    8000aaa0:	03213023          	sd	s2,32(sp)
    8000aaa4:	01313c23          	sd	s3,24(sp)
    8000aaa8:	01413823          	sd	s4,16(sp)
    8000aaac:	01513423          	sd	s5,8(sp)
    8000aab0:	01613023          	sd	s6,0(sp)
    8000aab4:	04010413          	addi	s0,sp,64
    8000aab8:	00a4f4b3          	and	s1,s1,a0
    8000aabc:	00f487b3          	add	a5,s1,a5
    8000aac0:	06f5e463          	bltu	a1,a5,8000ab28 <freerange+0xa8>
    8000aac4:	00006a97          	auipc	s5,0x6
    8000aac8:	a3ca8a93          	addi	s5,s5,-1476 # 80010500 <end>
    8000aacc:	0954e263          	bltu	s1,s5,8000ab50 <freerange+0xd0>
    8000aad0:	01100993          	li	s3,17
    8000aad4:	01b99993          	slli	s3,s3,0x1b
    8000aad8:	0734fc63          	bgeu	s1,s3,8000ab50 <freerange+0xd0>
    8000aadc:	00058a13          	mv	s4,a1
    8000aae0:	00004917          	auipc	s2,0x4
    8000aae4:	7b890913          	addi	s2,s2,1976 # 8000f298 <kmem>
    8000aae8:	00002b37          	lui	s6,0x2
    8000aaec:	0140006f          	j	8000ab00 <freerange+0x80>
    8000aaf0:	000017b7          	lui	a5,0x1
    8000aaf4:	00f484b3          	add	s1,s1,a5
    8000aaf8:	0554ec63          	bltu	s1,s5,8000ab50 <freerange+0xd0>
    8000aafc:	0534fa63          	bgeu	s1,s3,8000ab50 <freerange+0xd0>
    8000ab00:	00001637          	lui	a2,0x1
    8000ab04:	00100593          	li	a1,1
    8000ab08:	00048513          	mv	a0,s1
    8000ab0c:	00000097          	auipc	ra,0x0
    8000ab10:	50c080e7          	jalr	1292(ra) # 8000b018 <__memset>
    8000ab14:	00093703          	ld	a4,0(s2)
    8000ab18:	016487b3          	add	a5,s1,s6
    8000ab1c:	00e4b023          	sd	a4,0(s1)
    8000ab20:	00993023          	sd	s1,0(s2)
    8000ab24:	fcfa76e3          	bgeu	s4,a5,8000aaf0 <freerange+0x70>
    8000ab28:	03813083          	ld	ra,56(sp)
    8000ab2c:	03013403          	ld	s0,48(sp)
    8000ab30:	02813483          	ld	s1,40(sp)
    8000ab34:	02013903          	ld	s2,32(sp)
    8000ab38:	01813983          	ld	s3,24(sp)
    8000ab3c:	01013a03          	ld	s4,16(sp)
    8000ab40:	00813a83          	ld	s5,8(sp)
    8000ab44:	00013b03          	ld	s6,0(sp)
    8000ab48:	04010113          	addi	sp,sp,64
    8000ab4c:	00008067          	ret
    8000ab50:	00002517          	auipc	a0,0x2
    8000ab54:	1a850513          	addi	a0,a0,424 # 8000ccf8 <digits+0x18>
    8000ab58:	fffff097          	auipc	ra,0xfffff
    8000ab5c:	3d4080e7          	jalr	980(ra) # 80009f2c <panic>

000000008000ab60 <kfree>:
    8000ab60:	fe010113          	addi	sp,sp,-32
    8000ab64:	00813823          	sd	s0,16(sp)
    8000ab68:	00113c23          	sd	ra,24(sp)
    8000ab6c:	00913423          	sd	s1,8(sp)
    8000ab70:	02010413          	addi	s0,sp,32
    8000ab74:	03451793          	slli	a5,a0,0x34
    8000ab78:	04079c63          	bnez	a5,8000abd0 <kfree+0x70>
    8000ab7c:	00006797          	auipc	a5,0x6
    8000ab80:	98478793          	addi	a5,a5,-1660 # 80010500 <end>
    8000ab84:	00050493          	mv	s1,a0
    8000ab88:	04f56463          	bltu	a0,a5,8000abd0 <kfree+0x70>
    8000ab8c:	01100793          	li	a5,17
    8000ab90:	01b79793          	slli	a5,a5,0x1b
    8000ab94:	02f57e63          	bgeu	a0,a5,8000abd0 <kfree+0x70>
    8000ab98:	00001637          	lui	a2,0x1
    8000ab9c:	00100593          	li	a1,1
    8000aba0:	00000097          	auipc	ra,0x0
    8000aba4:	478080e7          	jalr	1144(ra) # 8000b018 <__memset>
    8000aba8:	00004797          	auipc	a5,0x4
    8000abac:	6f078793          	addi	a5,a5,1776 # 8000f298 <kmem>
    8000abb0:	0007b703          	ld	a4,0(a5)
    8000abb4:	01813083          	ld	ra,24(sp)
    8000abb8:	01013403          	ld	s0,16(sp)
    8000abbc:	00e4b023          	sd	a4,0(s1)
    8000abc0:	0097b023          	sd	s1,0(a5)
    8000abc4:	00813483          	ld	s1,8(sp)
    8000abc8:	02010113          	addi	sp,sp,32
    8000abcc:	00008067          	ret
    8000abd0:	00002517          	auipc	a0,0x2
    8000abd4:	12850513          	addi	a0,a0,296 # 8000ccf8 <digits+0x18>
    8000abd8:	fffff097          	auipc	ra,0xfffff
    8000abdc:	354080e7          	jalr	852(ra) # 80009f2c <panic>

000000008000abe0 <kalloc>:
    8000abe0:	fe010113          	addi	sp,sp,-32
    8000abe4:	00813823          	sd	s0,16(sp)
    8000abe8:	00913423          	sd	s1,8(sp)
    8000abec:	00113c23          	sd	ra,24(sp)
    8000abf0:	02010413          	addi	s0,sp,32
    8000abf4:	00004797          	auipc	a5,0x4
    8000abf8:	6a478793          	addi	a5,a5,1700 # 8000f298 <kmem>
    8000abfc:	0007b483          	ld	s1,0(a5)
    8000ac00:	02048063          	beqz	s1,8000ac20 <kalloc+0x40>
    8000ac04:	0004b703          	ld	a4,0(s1)
    8000ac08:	00001637          	lui	a2,0x1
    8000ac0c:	00500593          	li	a1,5
    8000ac10:	00048513          	mv	a0,s1
    8000ac14:	00e7b023          	sd	a4,0(a5)
    8000ac18:	00000097          	auipc	ra,0x0
    8000ac1c:	400080e7          	jalr	1024(ra) # 8000b018 <__memset>
    8000ac20:	01813083          	ld	ra,24(sp)
    8000ac24:	01013403          	ld	s0,16(sp)
    8000ac28:	00048513          	mv	a0,s1
    8000ac2c:	00813483          	ld	s1,8(sp)
    8000ac30:	02010113          	addi	sp,sp,32
    8000ac34:	00008067          	ret

000000008000ac38 <initlock>:
    8000ac38:	ff010113          	addi	sp,sp,-16
    8000ac3c:	00813423          	sd	s0,8(sp)
    8000ac40:	01010413          	addi	s0,sp,16
    8000ac44:	00813403          	ld	s0,8(sp)
    8000ac48:	00b53423          	sd	a1,8(a0)
    8000ac4c:	00052023          	sw	zero,0(a0)
    8000ac50:	00053823          	sd	zero,16(a0)
    8000ac54:	01010113          	addi	sp,sp,16
    8000ac58:	00008067          	ret

000000008000ac5c <acquire>:
    8000ac5c:	fe010113          	addi	sp,sp,-32
    8000ac60:	00813823          	sd	s0,16(sp)
    8000ac64:	00913423          	sd	s1,8(sp)
    8000ac68:	00113c23          	sd	ra,24(sp)
    8000ac6c:	01213023          	sd	s2,0(sp)
    8000ac70:	02010413          	addi	s0,sp,32
    8000ac74:	00050493          	mv	s1,a0
    8000ac78:	10002973          	csrr	s2,sstatus
    8000ac7c:	100027f3          	csrr	a5,sstatus
    8000ac80:	ffd7f793          	andi	a5,a5,-3
    8000ac84:	10079073          	csrw	sstatus,a5
    8000ac88:	fffff097          	auipc	ra,0xfffff
    8000ac8c:	8e0080e7          	jalr	-1824(ra) # 80009568 <mycpu>
    8000ac90:	07852783          	lw	a5,120(a0)
    8000ac94:	06078e63          	beqz	a5,8000ad10 <acquire+0xb4>
    8000ac98:	fffff097          	auipc	ra,0xfffff
    8000ac9c:	8d0080e7          	jalr	-1840(ra) # 80009568 <mycpu>
    8000aca0:	07852783          	lw	a5,120(a0)
    8000aca4:	0004a703          	lw	a4,0(s1)
    8000aca8:	0017879b          	addiw	a5,a5,1
    8000acac:	06f52c23          	sw	a5,120(a0)
    8000acb0:	04071063          	bnez	a4,8000acf0 <acquire+0x94>
    8000acb4:	00100713          	li	a4,1
    8000acb8:	00070793          	mv	a5,a4
    8000acbc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8000acc0:	0007879b          	sext.w	a5,a5
    8000acc4:	fe079ae3          	bnez	a5,8000acb8 <acquire+0x5c>
    8000acc8:	0ff0000f          	fence
    8000accc:	fffff097          	auipc	ra,0xfffff
    8000acd0:	89c080e7          	jalr	-1892(ra) # 80009568 <mycpu>
    8000acd4:	01813083          	ld	ra,24(sp)
    8000acd8:	01013403          	ld	s0,16(sp)
    8000acdc:	00a4b823          	sd	a0,16(s1)
    8000ace0:	00013903          	ld	s2,0(sp)
    8000ace4:	00813483          	ld	s1,8(sp)
    8000ace8:	02010113          	addi	sp,sp,32
    8000acec:	00008067          	ret
    8000acf0:	0104b903          	ld	s2,16(s1)
    8000acf4:	fffff097          	auipc	ra,0xfffff
    8000acf8:	874080e7          	jalr	-1932(ra) # 80009568 <mycpu>
    8000acfc:	faa91ce3          	bne	s2,a0,8000acb4 <acquire+0x58>
    8000ad00:	00002517          	auipc	a0,0x2
    8000ad04:	00050513          	mv	a0,a0
    8000ad08:	fffff097          	auipc	ra,0xfffff
    8000ad0c:	224080e7          	jalr	548(ra) # 80009f2c <panic>
    8000ad10:	00195913          	srli	s2,s2,0x1
    8000ad14:	fffff097          	auipc	ra,0xfffff
    8000ad18:	854080e7          	jalr	-1964(ra) # 80009568 <mycpu>
    8000ad1c:	00197913          	andi	s2,s2,1
    8000ad20:	07252e23          	sw	s2,124(a0) # 8000cd7c <digits+0x9c>
    8000ad24:	f75ff06f          	j	8000ac98 <acquire+0x3c>

000000008000ad28 <release>:
    8000ad28:	fe010113          	addi	sp,sp,-32
    8000ad2c:	00813823          	sd	s0,16(sp)
    8000ad30:	00113c23          	sd	ra,24(sp)
    8000ad34:	00913423          	sd	s1,8(sp)
    8000ad38:	01213023          	sd	s2,0(sp)
    8000ad3c:	02010413          	addi	s0,sp,32
    8000ad40:	00052783          	lw	a5,0(a0)
    8000ad44:	00079a63          	bnez	a5,8000ad58 <release+0x30>
    8000ad48:	00002517          	auipc	a0,0x2
    8000ad4c:	fc050513          	addi	a0,a0,-64 # 8000cd08 <digits+0x28>
    8000ad50:	fffff097          	auipc	ra,0xfffff
    8000ad54:	1dc080e7          	jalr	476(ra) # 80009f2c <panic>
    8000ad58:	01053903          	ld	s2,16(a0)
    8000ad5c:	00050493          	mv	s1,a0
    8000ad60:	fffff097          	auipc	ra,0xfffff
    8000ad64:	808080e7          	jalr	-2040(ra) # 80009568 <mycpu>
    8000ad68:	fea910e3          	bne	s2,a0,8000ad48 <release+0x20>
    8000ad6c:	0004b823          	sd	zero,16(s1)
    8000ad70:	0ff0000f          	fence
    8000ad74:	0f50000f          	fence	iorw,ow
    8000ad78:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000ad7c:	ffffe097          	auipc	ra,0xffffe
    8000ad80:	7ec080e7          	jalr	2028(ra) # 80009568 <mycpu>
    8000ad84:	100027f3          	csrr	a5,sstatus
    8000ad88:	0027f793          	andi	a5,a5,2
    8000ad8c:	04079a63          	bnez	a5,8000ade0 <release+0xb8>
    8000ad90:	07852783          	lw	a5,120(a0)
    8000ad94:	02f05e63          	blez	a5,8000add0 <release+0xa8>
    8000ad98:	fff7871b          	addiw	a4,a5,-1
    8000ad9c:	06e52c23          	sw	a4,120(a0)
    8000ada0:	00071c63          	bnez	a4,8000adb8 <release+0x90>
    8000ada4:	07c52783          	lw	a5,124(a0)
    8000ada8:	00078863          	beqz	a5,8000adb8 <release+0x90>
    8000adac:	100027f3          	csrr	a5,sstatus
    8000adb0:	0027e793          	ori	a5,a5,2
    8000adb4:	10079073          	csrw	sstatus,a5
    8000adb8:	01813083          	ld	ra,24(sp)
    8000adbc:	01013403          	ld	s0,16(sp)
    8000adc0:	00813483          	ld	s1,8(sp)
    8000adc4:	00013903          	ld	s2,0(sp)
    8000adc8:	02010113          	addi	sp,sp,32
    8000adcc:	00008067          	ret
    8000add0:	00002517          	auipc	a0,0x2
    8000add4:	f5850513          	addi	a0,a0,-168 # 8000cd28 <digits+0x48>
    8000add8:	fffff097          	auipc	ra,0xfffff
    8000addc:	154080e7          	jalr	340(ra) # 80009f2c <panic>
    8000ade0:	00002517          	auipc	a0,0x2
    8000ade4:	f3050513          	addi	a0,a0,-208 # 8000cd10 <digits+0x30>
    8000ade8:	fffff097          	auipc	ra,0xfffff
    8000adec:	144080e7          	jalr	324(ra) # 80009f2c <panic>

000000008000adf0 <holding>:
    8000adf0:	00052783          	lw	a5,0(a0)
    8000adf4:	00079663          	bnez	a5,8000ae00 <holding+0x10>
    8000adf8:	00000513          	li	a0,0
    8000adfc:	00008067          	ret
    8000ae00:	fe010113          	addi	sp,sp,-32
    8000ae04:	00813823          	sd	s0,16(sp)
    8000ae08:	00913423          	sd	s1,8(sp)
    8000ae0c:	00113c23          	sd	ra,24(sp)
    8000ae10:	02010413          	addi	s0,sp,32
    8000ae14:	01053483          	ld	s1,16(a0)
    8000ae18:	ffffe097          	auipc	ra,0xffffe
    8000ae1c:	750080e7          	jalr	1872(ra) # 80009568 <mycpu>
    8000ae20:	01813083          	ld	ra,24(sp)
    8000ae24:	01013403          	ld	s0,16(sp)
    8000ae28:	40a48533          	sub	a0,s1,a0
    8000ae2c:	00153513          	seqz	a0,a0
    8000ae30:	00813483          	ld	s1,8(sp)
    8000ae34:	02010113          	addi	sp,sp,32
    8000ae38:	00008067          	ret

000000008000ae3c <push_off>:
    8000ae3c:	fe010113          	addi	sp,sp,-32
    8000ae40:	00813823          	sd	s0,16(sp)
    8000ae44:	00113c23          	sd	ra,24(sp)
    8000ae48:	00913423          	sd	s1,8(sp)
    8000ae4c:	02010413          	addi	s0,sp,32
    8000ae50:	100024f3          	csrr	s1,sstatus
    8000ae54:	100027f3          	csrr	a5,sstatus
    8000ae58:	ffd7f793          	andi	a5,a5,-3
    8000ae5c:	10079073          	csrw	sstatus,a5
    8000ae60:	ffffe097          	auipc	ra,0xffffe
    8000ae64:	708080e7          	jalr	1800(ra) # 80009568 <mycpu>
    8000ae68:	07852783          	lw	a5,120(a0)
    8000ae6c:	02078663          	beqz	a5,8000ae98 <push_off+0x5c>
    8000ae70:	ffffe097          	auipc	ra,0xffffe
    8000ae74:	6f8080e7          	jalr	1784(ra) # 80009568 <mycpu>
    8000ae78:	07852783          	lw	a5,120(a0)
    8000ae7c:	01813083          	ld	ra,24(sp)
    8000ae80:	01013403          	ld	s0,16(sp)
    8000ae84:	0017879b          	addiw	a5,a5,1
    8000ae88:	06f52c23          	sw	a5,120(a0)
    8000ae8c:	00813483          	ld	s1,8(sp)
    8000ae90:	02010113          	addi	sp,sp,32
    8000ae94:	00008067          	ret
    8000ae98:	0014d493          	srli	s1,s1,0x1
    8000ae9c:	ffffe097          	auipc	ra,0xffffe
    8000aea0:	6cc080e7          	jalr	1740(ra) # 80009568 <mycpu>
    8000aea4:	0014f493          	andi	s1,s1,1
    8000aea8:	06952e23          	sw	s1,124(a0)
    8000aeac:	fc5ff06f          	j	8000ae70 <push_off+0x34>

000000008000aeb0 <pop_off>:
    8000aeb0:	ff010113          	addi	sp,sp,-16
    8000aeb4:	00813023          	sd	s0,0(sp)
    8000aeb8:	00113423          	sd	ra,8(sp)
    8000aebc:	01010413          	addi	s0,sp,16
    8000aec0:	ffffe097          	auipc	ra,0xffffe
    8000aec4:	6a8080e7          	jalr	1704(ra) # 80009568 <mycpu>
    8000aec8:	100027f3          	csrr	a5,sstatus
    8000aecc:	0027f793          	andi	a5,a5,2
    8000aed0:	04079663          	bnez	a5,8000af1c <pop_off+0x6c>
    8000aed4:	07852783          	lw	a5,120(a0)
    8000aed8:	02f05a63          	blez	a5,8000af0c <pop_off+0x5c>
    8000aedc:	fff7871b          	addiw	a4,a5,-1
    8000aee0:	06e52c23          	sw	a4,120(a0)
    8000aee4:	00071c63          	bnez	a4,8000aefc <pop_off+0x4c>
    8000aee8:	07c52783          	lw	a5,124(a0)
    8000aeec:	00078863          	beqz	a5,8000aefc <pop_off+0x4c>
    8000aef0:	100027f3          	csrr	a5,sstatus
    8000aef4:	0027e793          	ori	a5,a5,2
    8000aef8:	10079073          	csrw	sstatus,a5
    8000aefc:	00813083          	ld	ra,8(sp)
    8000af00:	00013403          	ld	s0,0(sp)
    8000af04:	01010113          	addi	sp,sp,16
    8000af08:	00008067          	ret
    8000af0c:	00002517          	auipc	a0,0x2
    8000af10:	e1c50513          	addi	a0,a0,-484 # 8000cd28 <digits+0x48>
    8000af14:	fffff097          	auipc	ra,0xfffff
    8000af18:	018080e7          	jalr	24(ra) # 80009f2c <panic>
    8000af1c:	00002517          	auipc	a0,0x2
    8000af20:	df450513          	addi	a0,a0,-524 # 8000cd10 <digits+0x30>
    8000af24:	fffff097          	auipc	ra,0xfffff
    8000af28:	008080e7          	jalr	8(ra) # 80009f2c <panic>

000000008000af2c <push_on>:
    8000af2c:	fe010113          	addi	sp,sp,-32
    8000af30:	00813823          	sd	s0,16(sp)
    8000af34:	00113c23          	sd	ra,24(sp)
    8000af38:	00913423          	sd	s1,8(sp)
    8000af3c:	02010413          	addi	s0,sp,32
    8000af40:	100024f3          	csrr	s1,sstatus
    8000af44:	100027f3          	csrr	a5,sstatus
    8000af48:	0027e793          	ori	a5,a5,2
    8000af4c:	10079073          	csrw	sstatus,a5
    8000af50:	ffffe097          	auipc	ra,0xffffe
    8000af54:	618080e7          	jalr	1560(ra) # 80009568 <mycpu>
    8000af58:	07852783          	lw	a5,120(a0)
    8000af5c:	02078663          	beqz	a5,8000af88 <push_on+0x5c>
    8000af60:	ffffe097          	auipc	ra,0xffffe
    8000af64:	608080e7          	jalr	1544(ra) # 80009568 <mycpu>
    8000af68:	07852783          	lw	a5,120(a0)
    8000af6c:	01813083          	ld	ra,24(sp)
    8000af70:	01013403          	ld	s0,16(sp)
    8000af74:	0017879b          	addiw	a5,a5,1
    8000af78:	06f52c23          	sw	a5,120(a0)
    8000af7c:	00813483          	ld	s1,8(sp)
    8000af80:	02010113          	addi	sp,sp,32
    8000af84:	00008067          	ret
    8000af88:	0014d493          	srli	s1,s1,0x1
    8000af8c:	ffffe097          	auipc	ra,0xffffe
    8000af90:	5dc080e7          	jalr	1500(ra) # 80009568 <mycpu>
    8000af94:	0014f493          	andi	s1,s1,1
    8000af98:	06952e23          	sw	s1,124(a0)
    8000af9c:	fc5ff06f          	j	8000af60 <push_on+0x34>

000000008000afa0 <pop_on>:
    8000afa0:	ff010113          	addi	sp,sp,-16
    8000afa4:	00813023          	sd	s0,0(sp)
    8000afa8:	00113423          	sd	ra,8(sp)
    8000afac:	01010413          	addi	s0,sp,16
    8000afb0:	ffffe097          	auipc	ra,0xffffe
    8000afb4:	5b8080e7          	jalr	1464(ra) # 80009568 <mycpu>
    8000afb8:	100027f3          	csrr	a5,sstatus
    8000afbc:	0027f793          	andi	a5,a5,2
    8000afc0:	04078463          	beqz	a5,8000b008 <pop_on+0x68>
    8000afc4:	07852783          	lw	a5,120(a0)
    8000afc8:	02f05863          	blez	a5,8000aff8 <pop_on+0x58>
    8000afcc:	fff7879b          	addiw	a5,a5,-1
    8000afd0:	06f52c23          	sw	a5,120(a0)
    8000afd4:	07853783          	ld	a5,120(a0)
    8000afd8:	00079863          	bnez	a5,8000afe8 <pop_on+0x48>
    8000afdc:	100027f3          	csrr	a5,sstatus
    8000afe0:	ffd7f793          	andi	a5,a5,-3
    8000afe4:	10079073          	csrw	sstatus,a5
    8000afe8:	00813083          	ld	ra,8(sp)
    8000afec:	00013403          	ld	s0,0(sp)
    8000aff0:	01010113          	addi	sp,sp,16
    8000aff4:	00008067          	ret
    8000aff8:	00002517          	auipc	a0,0x2
    8000affc:	d5850513          	addi	a0,a0,-680 # 8000cd50 <digits+0x70>
    8000b000:	fffff097          	auipc	ra,0xfffff
    8000b004:	f2c080e7          	jalr	-212(ra) # 80009f2c <panic>
    8000b008:	00002517          	auipc	a0,0x2
    8000b00c:	d2850513          	addi	a0,a0,-728 # 8000cd30 <digits+0x50>
    8000b010:	fffff097          	auipc	ra,0xfffff
    8000b014:	f1c080e7          	jalr	-228(ra) # 80009f2c <panic>

000000008000b018 <__memset>:
    8000b018:	ff010113          	addi	sp,sp,-16
    8000b01c:	00813423          	sd	s0,8(sp)
    8000b020:	01010413          	addi	s0,sp,16
    8000b024:	1a060e63          	beqz	a2,8000b1e0 <__memset+0x1c8>
    8000b028:	40a007b3          	neg	a5,a0
    8000b02c:	0077f793          	andi	a5,a5,7
    8000b030:	00778693          	addi	a3,a5,7
    8000b034:	00b00813          	li	a6,11
    8000b038:	0ff5f593          	andi	a1,a1,255
    8000b03c:	fff6071b          	addiw	a4,a2,-1
    8000b040:	1b06e663          	bltu	a3,a6,8000b1ec <__memset+0x1d4>
    8000b044:	1cd76463          	bltu	a4,a3,8000b20c <__memset+0x1f4>
    8000b048:	1a078e63          	beqz	a5,8000b204 <__memset+0x1ec>
    8000b04c:	00b50023          	sb	a1,0(a0)
    8000b050:	00100713          	li	a4,1
    8000b054:	1ae78463          	beq	a5,a4,8000b1fc <__memset+0x1e4>
    8000b058:	00b500a3          	sb	a1,1(a0)
    8000b05c:	00200713          	li	a4,2
    8000b060:	1ae78a63          	beq	a5,a4,8000b214 <__memset+0x1fc>
    8000b064:	00b50123          	sb	a1,2(a0)
    8000b068:	00300713          	li	a4,3
    8000b06c:	18e78463          	beq	a5,a4,8000b1f4 <__memset+0x1dc>
    8000b070:	00b501a3          	sb	a1,3(a0)
    8000b074:	00400713          	li	a4,4
    8000b078:	1ae78263          	beq	a5,a4,8000b21c <__memset+0x204>
    8000b07c:	00b50223          	sb	a1,4(a0)
    8000b080:	00500713          	li	a4,5
    8000b084:	1ae78063          	beq	a5,a4,8000b224 <__memset+0x20c>
    8000b088:	00b502a3          	sb	a1,5(a0)
    8000b08c:	00700713          	li	a4,7
    8000b090:	18e79e63          	bne	a5,a4,8000b22c <__memset+0x214>
    8000b094:	00b50323          	sb	a1,6(a0)
    8000b098:	00700e93          	li	t4,7
    8000b09c:	00859713          	slli	a4,a1,0x8
    8000b0a0:	00e5e733          	or	a4,a1,a4
    8000b0a4:	01059e13          	slli	t3,a1,0x10
    8000b0a8:	01c76e33          	or	t3,a4,t3
    8000b0ac:	01859313          	slli	t1,a1,0x18
    8000b0b0:	006e6333          	or	t1,t3,t1
    8000b0b4:	02059893          	slli	a7,a1,0x20
    8000b0b8:	40f60e3b          	subw	t3,a2,a5
    8000b0bc:	011368b3          	or	a7,t1,a7
    8000b0c0:	02859813          	slli	a6,a1,0x28
    8000b0c4:	0108e833          	or	a6,a7,a6
    8000b0c8:	03059693          	slli	a3,a1,0x30
    8000b0cc:	003e589b          	srliw	a7,t3,0x3
    8000b0d0:	00d866b3          	or	a3,a6,a3
    8000b0d4:	03859713          	slli	a4,a1,0x38
    8000b0d8:	00389813          	slli	a6,a7,0x3
    8000b0dc:	00f507b3          	add	a5,a0,a5
    8000b0e0:	00e6e733          	or	a4,a3,a4
    8000b0e4:	000e089b          	sext.w	a7,t3
    8000b0e8:	00f806b3          	add	a3,a6,a5
    8000b0ec:	00e7b023          	sd	a4,0(a5)
    8000b0f0:	00878793          	addi	a5,a5,8
    8000b0f4:	fed79ce3          	bne	a5,a3,8000b0ec <__memset+0xd4>
    8000b0f8:	ff8e7793          	andi	a5,t3,-8
    8000b0fc:	0007871b          	sext.w	a4,a5
    8000b100:	01d787bb          	addw	a5,a5,t4
    8000b104:	0ce88e63          	beq	a7,a4,8000b1e0 <__memset+0x1c8>
    8000b108:	00f50733          	add	a4,a0,a5
    8000b10c:	00b70023          	sb	a1,0(a4)
    8000b110:	0017871b          	addiw	a4,a5,1
    8000b114:	0cc77663          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b118:	00e50733          	add	a4,a0,a4
    8000b11c:	00b70023          	sb	a1,0(a4)
    8000b120:	0027871b          	addiw	a4,a5,2
    8000b124:	0ac77e63          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b128:	00e50733          	add	a4,a0,a4
    8000b12c:	00b70023          	sb	a1,0(a4)
    8000b130:	0037871b          	addiw	a4,a5,3
    8000b134:	0ac77663          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b138:	00e50733          	add	a4,a0,a4
    8000b13c:	00b70023          	sb	a1,0(a4)
    8000b140:	0047871b          	addiw	a4,a5,4
    8000b144:	08c77e63          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b148:	00e50733          	add	a4,a0,a4
    8000b14c:	00b70023          	sb	a1,0(a4)
    8000b150:	0057871b          	addiw	a4,a5,5
    8000b154:	08c77663          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b158:	00e50733          	add	a4,a0,a4
    8000b15c:	00b70023          	sb	a1,0(a4)
    8000b160:	0067871b          	addiw	a4,a5,6
    8000b164:	06c77e63          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b168:	00e50733          	add	a4,a0,a4
    8000b16c:	00b70023          	sb	a1,0(a4)
    8000b170:	0077871b          	addiw	a4,a5,7
    8000b174:	06c77663          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b178:	00e50733          	add	a4,a0,a4
    8000b17c:	00b70023          	sb	a1,0(a4)
    8000b180:	0087871b          	addiw	a4,a5,8
    8000b184:	04c77e63          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b188:	00e50733          	add	a4,a0,a4
    8000b18c:	00b70023          	sb	a1,0(a4)
    8000b190:	0097871b          	addiw	a4,a5,9
    8000b194:	04c77663          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b198:	00e50733          	add	a4,a0,a4
    8000b19c:	00b70023          	sb	a1,0(a4)
    8000b1a0:	00a7871b          	addiw	a4,a5,10
    8000b1a4:	02c77e63          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b1a8:	00e50733          	add	a4,a0,a4
    8000b1ac:	00b70023          	sb	a1,0(a4)
    8000b1b0:	00b7871b          	addiw	a4,a5,11
    8000b1b4:	02c77663          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b1b8:	00e50733          	add	a4,a0,a4
    8000b1bc:	00b70023          	sb	a1,0(a4)
    8000b1c0:	00c7871b          	addiw	a4,a5,12
    8000b1c4:	00c77e63          	bgeu	a4,a2,8000b1e0 <__memset+0x1c8>
    8000b1c8:	00e50733          	add	a4,a0,a4
    8000b1cc:	00b70023          	sb	a1,0(a4)
    8000b1d0:	00d7879b          	addiw	a5,a5,13
    8000b1d4:	00c7f663          	bgeu	a5,a2,8000b1e0 <__memset+0x1c8>
    8000b1d8:	00f507b3          	add	a5,a0,a5
    8000b1dc:	00b78023          	sb	a1,0(a5)
    8000b1e0:	00813403          	ld	s0,8(sp)
    8000b1e4:	01010113          	addi	sp,sp,16
    8000b1e8:	00008067          	ret
    8000b1ec:	00b00693          	li	a3,11
    8000b1f0:	e55ff06f          	j	8000b044 <__memset+0x2c>
    8000b1f4:	00300e93          	li	t4,3
    8000b1f8:	ea5ff06f          	j	8000b09c <__memset+0x84>
    8000b1fc:	00100e93          	li	t4,1
    8000b200:	e9dff06f          	j	8000b09c <__memset+0x84>
    8000b204:	00000e93          	li	t4,0
    8000b208:	e95ff06f          	j	8000b09c <__memset+0x84>
    8000b20c:	00000793          	li	a5,0
    8000b210:	ef9ff06f          	j	8000b108 <__memset+0xf0>
    8000b214:	00200e93          	li	t4,2
    8000b218:	e85ff06f          	j	8000b09c <__memset+0x84>
    8000b21c:	00400e93          	li	t4,4
    8000b220:	e7dff06f          	j	8000b09c <__memset+0x84>
    8000b224:	00500e93          	li	t4,5
    8000b228:	e75ff06f          	j	8000b09c <__memset+0x84>
    8000b22c:	00600e93          	li	t4,6
    8000b230:	e6dff06f          	j	8000b09c <__memset+0x84>

000000008000b234 <__memmove>:
    8000b234:	ff010113          	addi	sp,sp,-16
    8000b238:	00813423          	sd	s0,8(sp)
    8000b23c:	01010413          	addi	s0,sp,16
    8000b240:	0e060863          	beqz	a2,8000b330 <__memmove+0xfc>
    8000b244:	fff6069b          	addiw	a3,a2,-1
    8000b248:	0006881b          	sext.w	a6,a3
    8000b24c:	0ea5e863          	bltu	a1,a0,8000b33c <__memmove+0x108>
    8000b250:	00758713          	addi	a4,a1,7
    8000b254:	00a5e7b3          	or	a5,a1,a0
    8000b258:	40a70733          	sub	a4,a4,a0
    8000b25c:	0077f793          	andi	a5,a5,7
    8000b260:	00f73713          	sltiu	a4,a4,15
    8000b264:	00174713          	xori	a4,a4,1
    8000b268:	0017b793          	seqz	a5,a5
    8000b26c:	00e7f7b3          	and	a5,a5,a4
    8000b270:	10078863          	beqz	a5,8000b380 <__memmove+0x14c>
    8000b274:	00900793          	li	a5,9
    8000b278:	1107f463          	bgeu	a5,a6,8000b380 <__memmove+0x14c>
    8000b27c:	0036581b          	srliw	a6,a2,0x3
    8000b280:	fff8081b          	addiw	a6,a6,-1
    8000b284:	02081813          	slli	a6,a6,0x20
    8000b288:	01d85893          	srli	a7,a6,0x1d
    8000b28c:	00858813          	addi	a6,a1,8
    8000b290:	00058793          	mv	a5,a1
    8000b294:	00050713          	mv	a4,a0
    8000b298:	01088833          	add	a6,a7,a6
    8000b29c:	0007b883          	ld	a7,0(a5)
    8000b2a0:	00878793          	addi	a5,a5,8
    8000b2a4:	00870713          	addi	a4,a4,8
    8000b2a8:	ff173c23          	sd	a7,-8(a4)
    8000b2ac:	ff0798e3          	bne	a5,a6,8000b29c <__memmove+0x68>
    8000b2b0:	ff867713          	andi	a4,a2,-8
    8000b2b4:	02071793          	slli	a5,a4,0x20
    8000b2b8:	0207d793          	srli	a5,a5,0x20
    8000b2bc:	00f585b3          	add	a1,a1,a5
    8000b2c0:	40e686bb          	subw	a3,a3,a4
    8000b2c4:	00f507b3          	add	a5,a0,a5
    8000b2c8:	06e60463          	beq	a2,a4,8000b330 <__memmove+0xfc>
    8000b2cc:	0005c703          	lbu	a4,0(a1)
    8000b2d0:	00e78023          	sb	a4,0(a5)
    8000b2d4:	04068e63          	beqz	a3,8000b330 <__memmove+0xfc>
    8000b2d8:	0015c603          	lbu	a2,1(a1)
    8000b2dc:	00100713          	li	a4,1
    8000b2e0:	00c780a3          	sb	a2,1(a5)
    8000b2e4:	04e68663          	beq	a3,a4,8000b330 <__memmove+0xfc>
    8000b2e8:	0025c603          	lbu	a2,2(a1)
    8000b2ec:	00200713          	li	a4,2
    8000b2f0:	00c78123          	sb	a2,2(a5)
    8000b2f4:	02e68e63          	beq	a3,a4,8000b330 <__memmove+0xfc>
    8000b2f8:	0035c603          	lbu	a2,3(a1)
    8000b2fc:	00300713          	li	a4,3
    8000b300:	00c781a3          	sb	a2,3(a5)
    8000b304:	02e68663          	beq	a3,a4,8000b330 <__memmove+0xfc>
    8000b308:	0045c603          	lbu	a2,4(a1)
    8000b30c:	00400713          	li	a4,4
    8000b310:	00c78223          	sb	a2,4(a5)
    8000b314:	00e68e63          	beq	a3,a4,8000b330 <__memmove+0xfc>
    8000b318:	0055c603          	lbu	a2,5(a1)
    8000b31c:	00500713          	li	a4,5
    8000b320:	00c782a3          	sb	a2,5(a5)
    8000b324:	00e68663          	beq	a3,a4,8000b330 <__memmove+0xfc>
    8000b328:	0065c703          	lbu	a4,6(a1)
    8000b32c:	00e78323          	sb	a4,6(a5)
    8000b330:	00813403          	ld	s0,8(sp)
    8000b334:	01010113          	addi	sp,sp,16
    8000b338:	00008067          	ret
    8000b33c:	02061713          	slli	a4,a2,0x20
    8000b340:	02075713          	srli	a4,a4,0x20
    8000b344:	00e587b3          	add	a5,a1,a4
    8000b348:	f0f574e3          	bgeu	a0,a5,8000b250 <__memmove+0x1c>
    8000b34c:	02069613          	slli	a2,a3,0x20
    8000b350:	02065613          	srli	a2,a2,0x20
    8000b354:	fff64613          	not	a2,a2
    8000b358:	00e50733          	add	a4,a0,a4
    8000b35c:	00c78633          	add	a2,a5,a2
    8000b360:	fff7c683          	lbu	a3,-1(a5)
    8000b364:	fff78793          	addi	a5,a5,-1
    8000b368:	fff70713          	addi	a4,a4,-1
    8000b36c:	00d70023          	sb	a3,0(a4)
    8000b370:	fec798e3          	bne	a5,a2,8000b360 <__memmove+0x12c>
    8000b374:	00813403          	ld	s0,8(sp)
    8000b378:	01010113          	addi	sp,sp,16
    8000b37c:	00008067          	ret
    8000b380:	02069713          	slli	a4,a3,0x20
    8000b384:	02075713          	srli	a4,a4,0x20
    8000b388:	00170713          	addi	a4,a4,1
    8000b38c:	00e50733          	add	a4,a0,a4
    8000b390:	00050793          	mv	a5,a0
    8000b394:	0005c683          	lbu	a3,0(a1)
    8000b398:	00178793          	addi	a5,a5,1
    8000b39c:	00158593          	addi	a1,a1,1
    8000b3a0:	fed78fa3          	sb	a3,-1(a5)
    8000b3a4:	fee798e3          	bne	a5,a4,8000b394 <__memmove+0x160>
    8000b3a8:	f89ff06f          	j	8000b330 <__memmove+0xfc>
	...
