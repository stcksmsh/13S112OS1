
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	ac013103          	ld	sp,-1344(sp) # 80006ac0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7a4030ef          	jal	ra,800037c0 <start>

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
    8000107c:	204020ef          	jal	ra,80003280 <exceptionHandler>


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

0000000080001100 <_Z9mem_allocm>:
 * 
 */

#include "syscalls_c.h"

void* mem_alloc ( size_t nSize ){
    80001100:	ff010113          	addi	sp,sp,-16
    80001104:	00813423          	sd	s0,8(sp)
    80001108:	01010413          	addi	s0,sp,16
    nSize = (nSize + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    8000110c:	03f50513          	addi	a0,a0,63 # 103f <_entry-0x7fffefc1>
    80001110:	fc057513          	andi	a0,a0,-64
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80001114:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80001118:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    8000111c:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80001120:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    80001124:	00813403          	ld	s0,8(sp)
    80001128:	01010113          	addi	sp,sp,16
    8000112c:	00008067          	ret

0000000080001130 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    80001130:	ff010113          	addi	sp,sp,-16
    80001134:	00813423          	sd	s0,8(sp)
    80001138:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    8000113c:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    80001140:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    80001144:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    80001148:	00050513          	mv	a0,a0
    return nResult;

}
    8000114c:	0005051b          	sext.w	a0,a0
    80001150:	00813403          	ld	s0,8(sp)
    80001154:	01010113          	addi	sp,sp,16
    80001158:	00008067          	ret

000000008000115c <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg) {
    8000115c:	ff010113          	addi	sp,sp,-16
    80001160:	00813423          	sd	s0,8(sp)
    80001164:	01010413          	addi	s0,sp,16
    // void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    // uint64 stack_start = (uint64)stack_space + DEFAULT_STACK_SIZE -1;
    // __asm__ volatile ("mv a4, %0" : : "r"(stack_start));
    // __asm__ volatile ("mv a4, %0" : : "r"((uint64)nullptr));
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    80001168:	00060693          	mv	a3,a2
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    8000116c:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001170:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x11");
    80001174:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001178:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000117c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001180:	0005051b          	sext.w	a0,a0
    80001184:	00813403          	ld	s0,8(sp)
    80001188:	01010113          	addi	sp,sp,16
    8000118c:	00008067          	ret

0000000080001190 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    80001190:	ff010113          	addi	sp,sp,-16
    80001194:	00813423          	sd	s0,8(sp)
    80001198:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    8000119c:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    800011a0:	00000073          	ecall
    return 0;
}
    800011a4:	00000513          	li	a0,0
    800011a8:	00813403          	ld	s0,8(sp)
    800011ac:	01010113          	addi	sp,sp,16
    800011b0:	00008067          	ret

00000000800011b4 <_Z15thread_dispatchv>:

void thread_dispatch () {
    800011b4:	ff010113          	addi	sp,sp,-16
    800011b8:	00813423          	sd	s0,8(sp)
    800011bc:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    800011c0:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    800011c4:	00000073          	ecall
}
    800011c8:	00813403          	ld	s0,8(sp)
    800011cc:	01010113          	addi	sp,sp,16
    800011d0:	00008067          	ret

00000000800011d4 <_Z8sem_openPP4_semj>:

// void thread_join ( thread_t );

// int thread_sleep( time_t );

int sem_open ( sem_t* handle, unsigned init) {
    800011d4:	ff010113          	addi	sp,sp,-16
    800011d8:	00813423          	sd	s0,8(sp)
    800011dc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    800011e0:	02059593          	slli	a1,a1,0x20
    800011e4:	0205d593          	srli	a1,a1,0x20
    800011e8:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    800011ec:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    800011f0:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800011f4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800011f8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800011fc:	0005051b          	sext.w	a0,a0
    80001200:	00813403          	ld	s0,8(sp)
    80001204:	01010113          	addi	sp,sp,16
    80001208:	00008067          	ret

000000008000120c <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle) {
    8000120c:	ff010113          	addi	sp,sp,-16
    80001210:	00813423          	sd	s0,8(sp)
    80001214:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001218:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    8000121c:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001220:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001224:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001228:	0005051b          	sext.w	a0,a0
    8000122c:	00813403          	ld	s0,8(sp)
    80001230:	01010113          	addi	sp,sp,16
    80001234:	00008067          	ret

0000000080001238 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle) {
    80001238:	ff010113          	addi	sp,sp,-16
    8000123c:	00813423          	sd	s0,8(sp)
    80001240:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001244:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001248:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    8000124c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001250:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001254:	0005051b          	sext.w	a0,a0
    80001258:	00813403          	ld	s0,8(sp)
    8000125c:	01010113          	addi	sp,sp,16
    80001260:	00008067          	ret

0000000080001264 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle) {
    80001264:	ff010113          	addi	sp,sp,-16
    80001268:	00813423          	sd	s0,8(sp)
    8000126c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001270:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001274:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001278:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000127c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001280:	0005051b          	sext.w	a0,a0
    80001284:	00813403          	ld	s0,8(sp)
    80001288:	01010113          	addi	sp,sp,16
    8000128c:	00008067          	ret

0000000080001290 <_Z4getcv>:

char getc(){
    80001290:	ff010113          	addi	sp,sp,-16
    80001294:	00813423          	sd	s0,8(sp)
    80001298:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    8000129c:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    800012a0:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    800012a4:	00050513          	mv	a0,a0
    return chr;
}
    800012a8:	0ff57513          	andi	a0,a0,255
    800012ac:	00813403          	ld	s0,8(sp)
    800012b0:	01010113          	addi	sp,sp,16
    800012b4:	00008067          	ret

00000000800012b8 <_Z4putcc>:

#include "console.h"

void putc(char chr)
{
    800012b8:	ff010113          	addi	sp,sp,-16
    800012bc:	00813423          	sd	s0,8(sp)
    800012c0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    800012c4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    800012c8:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    800012cc:	00000073          	ecall
    800012d0:	00813403          	ld	s0,8(sp)
    800012d4:	01010113          	addi	sp,sp,16
    800012d8:	00008067          	ret

00000000800012dc <_ZN4_sem4openEPPS_j>:
#include "sem.h"
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"

void _sem::open(_sem** handle, unsigned init){
    800012dc:	ff010113          	addi	sp,sp,-16
    800012e0:	00813423          	sd	s0,8(sp)
    800012e4:	01010413          	addi	s0,sp,16
    (*handle)->blockHead = nullptr;
    800012e8:	00053783          	ld	a5,0(a0)
    800012ec:	0007b023          	sd	zero,0(a5)
    (*handle)->blockTail = nullptr;
    800012f0:	00053783          	ld	a5,0(a0)
    800012f4:	0007b423          	sd	zero,8(a5)
    (*handle)->value = init;
    800012f8:	00053783          	ld	a5,0(a0)
    800012fc:	00b7a823          	sw	a1,16(a5)
}
    80001300:	00813403          	ld	s0,8(sp)
    80001304:	01010113          	addi	sp,sp,16
    80001308:	00008067          	ret

000000008000130c <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    8000130c:	fe010113          	addi	sp,sp,-32
    80001310:	00113c23          	sd	ra,24(sp)
    80001314:	00813823          	sd	s0,16(sp)
    80001318:	00913423          	sd	s1,8(sp)
    8000131c:	02010413          	addi	s0,sp,32
    80001320:	00050493          	mv	s1,a0
    while(id->blockHead != nullptr){
    80001324:	0004b783          	ld	a5,0(s1)
    80001328:	02078863          	beqz	a5,80001358 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    8000132c:	00100593          	li	a1,1
    80001330:	0007b503          	ld	a0,0(a5)
    80001334:	00001097          	auipc	ra,0x1
    80001338:	8c0080e7          	jalr	-1856(ra) # 80001bf4 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    8000133c:	0004b503          	ld	a0,0(s1)
    80001340:	00000097          	auipc	ra,0x0
    80001344:	df0080e7          	jalr	-528(ra) # 80001130 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    80001348:	0004b783          	ld	a5,0(s1)
    8000134c:	0087b783          	ld	a5,8(a5)
    80001350:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != nullptr){
    80001354:	fd1ff06f          	j	80001324 <_ZN4_sem5closeEPS_+0x18>
    }
}
    80001358:	01813083          	ld	ra,24(sp)
    8000135c:	01013403          	ld	s0,16(sp)
    80001360:	00813483          	ld	s1,8(sp)
    80001364:	02010113          	addi	sp,sp,32
    80001368:	00008067          	ret

000000008000136c <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    8000136c:	01052783          	lw	a5,16(a0)
    80001370:	fff7879b          	addiw	a5,a5,-1
    80001374:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    80001378:	02079713          	slli	a4,a5,0x20
    8000137c:	00074463          	bltz	a4,80001384 <_ZN4_sem4waitEPS_+0x18>
    80001380:	00008067          	ret
void _sem::wait(sem_t id){
    80001384:	fe010113          	addi	sp,sp,-32
    80001388:	00113c23          	sd	ra,24(sp)
    8000138c:	00813823          	sd	s0,16(sp)
    80001390:	00913423          	sd	s1,8(sp)
    80001394:	02010413          	addi	s0,sp,32
    80001398:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    8000139c:	01000513          	li	a0,16
    800013a0:	00000097          	auipc	ra,0x0
    800013a4:	d60080e7          	jalr	-672(ra) # 80001100 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    800013a8:	00005797          	auipc	a5,0x5
    800013ac:	7307b783          	ld	a5,1840(a5) # 80006ad8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800013b0:	0007b783          	ld	a5,0(a5)
    800013b4:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = nullptr;
    800013b8:	00053423          	sd	zero,8(a0)
        if(id->blockHead == nullptr){
    800013bc:	0004b783          	ld	a5,0(s1)
    800013c0:	04078263          	beqz	a5,80001404 <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    800013c4:	0084b783          	ld	a5,8(s1)
    800013c8:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    800013cc:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    800013d0:	00100593          	li	a1,1
    800013d4:	00005797          	auipc	a5,0x5
    800013d8:	7047b783          	ld	a5,1796(a5) # 80006ad8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800013dc:	0007b503          	ld	a0,0(a5)
    800013e0:	00000097          	auipc	ra,0x0
    800013e4:	7e4080e7          	jalr	2020(ra) # 80001bc4 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    800013e8:	00001097          	auipc	ra,0x1
    800013ec:	950080e7          	jalr	-1712(ra) # 80001d38 <_ZN7_thread8dispatchEv>
    }
}
    800013f0:	01813083          	ld	ra,24(sp)
    800013f4:	01013403          	ld	s0,16(sp)
    800013f8:	00813483          	ld	s1,8(sp)
    800013fc:	02010113          	addi	sp,sp,32
    80001400:	00008067          	ret
            id->blockHead = pNewBlock;
    80001404:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80001408:	00a4b423          	sd	a0,8(s1)
    8000140c:	fc5ff06f          	j	800013d0 <_ZN4_sem4waitEPS_+0x64>

0000000080001410 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    80001410:	01052783          	lw	a5,16(a0)
    80001414:	0017879b          	addiw	a5,a5,1
    80001418:	0007871b          	sext.w	a4,a5
    8000141c:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    80001420:	00e05463          	blez	a4,80001428 <_ZN4_sem6signalEPS_+0x18>
    80001424:	00008067          	ret
void _sem::signal(sem_t id){
    80001428:	fe010113          	addi	sp,sp,-32
    8000142c:	00113c23          	sd	ra,24(sp)
    80001430:	00813823          	sd	s0,16(sp)
    80001434:	00913423          	sd	s1,8(sp)
    80001438:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    8000143c:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001440:	0084b783          	ld	a5,8(s1)
    80001444:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == nullptr){
    80001448:	04078063          	beqz	a5,80001488 <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = nullptr;
        }
        pUnblock->pThread->setBlocked(false);
    8000144c:	00000593          	li	a1,0
    80001450:	0004b503          	ld	a0,0(s1)
    80001454:	00000097          	auipc	ra,0x0
    80001458:	770080e7          	jalr	1904(ra) # 80001bc4 <_ZN7_thread10setBlockedEb>
        Scheduler::put(pUnblock->pThread);
    8000145c:	0004b503          	ld	a0,0(s1)
    80001460:	00002097          	auipc	ra,0x2
    80001464:	070080e7          	jalr	112(ra) # 800034d0 <_ZN9Scheduler3putEP7_thread>
        mem_free(pUnblock);
    80001468:	00048513          	mv	a0,s1
    8000146c:	00000097          	auipc	ra,0x0
    80001470:	cc4080e7          	jalr	-828(ra) # 80001130 <_Z8mem_freePv>
    }
    80001474:	01813083          	ld	ra,24(sp)
    80001478:	01013403          	ld	s0,16(sp)
    8000147c:	00813483          	ld	s1,8(sp)
    80001480:	02010113          	addi	sp,sp,32
    80001484:	00008067          	ret
            id->blockTail = nullptr;
    80001488:	00053423          	sd	zero,8(a0)
    8000148c:	fc1ff06f          	j	8000144c <_ZN4_sem6signalEPS_+0x3c>

0000000080001490 <main>:
 */

#include "kernel.h"

/// @brief first function to be called
void main(){
    80001490:	fc010113          	addi	sp,sp,-64
    80001494:	02113c23          	sd	ra,56(sp)
    80001498:	02813823          	sd	s0,48(sp)
    8000149c:	02913423          	sd	s1,40(sp)
    800014a0:	04010413          	addi	s0,sp,64
#include "sched.h"

class Kernel{
    public:
        /// @brief constructor
        Kernel(){}; /// empty constructor
    800014a4:	fc040513          	addi	a0,s0,-64
    800014a8:	00001097          	auipc	ra,0x1
    800014ac:	9a0080e7          	jalr	-1632(ra) # 80001e48 <_ZN11HeapManagerC1Ev>
    800014b0:	fd040513          	addi	a0,s0,-48
    800014b4:	00002097          	auipc	ra,0x2
    800014b8:	f94080e7          	jalr	-108(ra) # 80003448 <_ZN9SchedulerC1Ev>
    800014bc:	0200006f          	j	800014dc <main+0x4c>
    800014c0:	00050493          	mv	s1,a0
    800014c4:	fc040513          	addi	a0,s0,-64
    800014c8:	00001097          	auipc	ra,0x1
    800014cc:	9d8080e7          	jalr	-1576(ra) # 80001ea0 <_ZN11HeapManagerD1Ev>
    800014d0:	00048513          	mv	a0,s1
    800014d4:	00006097          	auipc	ra,0x6
    800014d8:	744080e7          	jalr	1860(ra) # 80007c18 <_Unwind_Resume>
    Kernel kernel = Kernel();
    kernel.initialise();
    800014dc:	fc040513          	addi	a0,s0,-64
    800014e0:	00000097          	auipc	ra,0x0
    800014e4:	348080e7          	jalr	840(ra) # 80001828 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    800014e8:	fc040513          	addi	a0,s0,-64
    800014ec:	00000097          	auipc	ra,0x0
    800014f0:	394080e7          	jalr	916(ra) # 80001880 <_ZN6Kernel3runEv>
    if(exitCode == Kernel::EXIT_FAILURE){
    800014f4:	00100793          	li	a5,1
    800014f8:	00f51463          	bne	a0,a5,80001500 <main+0x70>
        while(1){} /// infinite loop
    800014fc:	0000006f          	j	800014fc <main+0x6c>
        /// @brief destructor
        ~Kernel(){};
    80001500:	fc040513          	addi	a0,s0,-64
    80001504:	00001097          	auipc	ra,0x1
    80001508:	99c080e7          	jalr	-1636(ra) # 80001ea0 <_ZN11HeapManagerD1Ev>
    }
    8000150c:	03813083          	ld	ra,56(sp)
    80001510:	03013403          	ld	s0,48(sp)
    80001514:	02813483          	ld	s1,40(sp)
    80001518:	04010113          	addi	sp,sp,64
    8000151c:	00008067          	ret
    80001520:	00050493          	mv	s1,a0
    80001524:	fc040513          	addi	a0,s0,-64
    80001528:	00001097          	auipc	ra,0x1
    8000152c:	978080e7          	jalr	-1672(ra) # 80001ea0 <_ZN11HeapManagerD1Ev>
    80001530:	00048513          	mv	a0,s1
    80001534:	00006097          	auipc	ra,0x6
    80001538:	6e4080e7          	jalr	1764(ra) # 80007c18 <_Unwind_Resume>

000000008000153c <_Z13assert_failedPKci>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char* file, int line ){
    8000153c:	fc010113          	addi	sp,sp,-64
    80001540:	02113c23          	sd	ra,56(sp)
    80001544:	02813823          	sd	s0,48(sp)
    80001548:	02913423          	sd	s1,40(sp)
    8000154c:	03213023          	sd	s2,32(sp)
    80001550:	04010413          	addi	s0,sp,64
    80001554:	00050493          	mv	s1,a0
    80001558:	00058913          	mv	s2,a1
    putc('\n');
    8000155c:	00a00513          	li	a0,10
    80001560:	00000097          	auipc	ra,0x0
    80001564:	d58080e7          	jalr	-680(ra) # 800012b8 <_Z4putcc>
    putc('A');
    80001568:	04100513          	li	a0,65
    8000156c:	00000097          	auipc	ra,0x0
    80001570:	d4c080e7          	jalr	-692(ra) # 800012b8 <_Z4putcc>
    putc('s');
    80001574:	07300513          	li	a0,115
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	d40080e7          	jalr	-704(ra) # 800012b8 <_Z4putcc>
    putc('s');
    80001580:	07300513          	li	a0,115
    80001584:	00000097          	auipc	ra,0x0
    80001588:	d34080e7          	jalr	-716(ra) # 800012b8 <_Z4putcc>
    putc('e');
    8000158c:	06500513          	li	a0,101
    80001590:	00000097          	auipc	ra,0x0
    80001594:	d28080e7          	jalr	-728(ra) # 800012b8 <_Z4putcc>
    putc('r');
    80001598:	07200513          	li	a0,114
    8000159c:	00000097          	auipc	ra,0x0
    800015a0:	d1c080e7          	jalr	-740(ra) # 800012b8 <_Z4putcc>
    putc('t');
    800015a4:	07400513          	li	a0,116
    800015a8:	00000097          	auipc	ra,0x0
    800015ac:	d10080e7          	jalr	-752(ra) # 800012b8 <_Z4putcc>
    putc('i');
    800015b0:	06900513          	li	a0,105
    800015b4:	00000097          	auipc	ra,0x0
    800015b8:	d04080e7          	jalr	-764(ra) # 800012b8 <_Z4putcc>
    putc('o');
    800015bc:	06f00513          	li	a0,111
    800015c0:	00000097          	auipc	ra,0x0
    800015c4:	cf8080e7          	jalr	-776(ra) # 800012b8 <_Z4putcc>
    putc('n');
    800015c8:	06e00513          	li	a0,110
    800015cc:	00000097          	auipc	ra,0x0
    800015d0:	cec080e7          	jalr	-788(ra) # 800012b8 <_Z4putcc>
    putc(' ');
    800015d4:	02000513          	li	a0,32
    800015d8:	00000097          	auipc	ra,0x0
    800015dc:	ce0080e7          	jalr	-800(ra) # 800012b8 <_Z4putcc>
    putc('f');
    800015e0:	06600513          	li	a0,102
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	cd4080e7          	jalr	-812(ra) # 800012b8 <_Z4putcc>
    putc('a');
    800015ec:	06100513          	li	a0,97
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	cc8080e7          	jalr	-824(ra) # 800012b8 <_Z4putcc>
    putc('i');
    800015f8:	06900513          	li	a0,105
    800015fc:	00000097          	auipc	ra,0x0
    80001600:	cbc080e7          	jalr	-836(ra) # 800012b8 <_Z4putcc>
    putc('l');
    80001604:	06c00513          	li	a0,108
    80001608:	00000097          	auipc	ra,0x0
    8000160c:	cb0080e7          	jalr	-848(ra) # 800012b8 <_Z4putcc>
    putc('e');
    80001610:	06500513          	li	a0,101
    80001614:	00000097          	auipc	ra,0x0
    80001618:	ca4080e7          	jalr	-860(ra) # 800012b8 <_Z4putcc>
    putc('d');
    8000161c:	06400513          	li	a0,100
    80001620:	00000097          	auipc	ra,0x0
    80001624:	c98080e7          	jalr	-872(ra) # 800012b8 <_Z4putcc>
    putc(' ');
    80001628:	02000513          	li	a0,32
    8000162c:	00000097          	auipc	ra,0x0
    80001630:	c8c080e7          	jalr	-884(ra) # 800012b8 <_Z4putcc>
    putc('i');
    80001634:	06900513          	li	a0,105
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	c80080e7          	jalr	-896(ra) # 800012b8 <_Z4putcc>
    putc('n');
    80001640:	06e00513          	li	a0,110
    80001644:	00000097          	auipc	ra,0x0
    80001648:	c74080e7          	jalr	-908(ra) # 800012b8 <_Z4putcc>
    putc(' ');
    8000164c:	02000513          	li	a0,32
    80001650:	00000097          	auipc	ra,0x0
    80001654:	c68080e7          	jalr	-920(ra) # 800012b8 <_Z4putcc>
    putc('f');
    80001658:	06600513          	li	a0,102
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	c5c080e7          	jalr	-932(ra) # 800012b8 <_Z4putcc>
    putc('i');
    80001664:	06900513          	li	a0,105
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	c50080e7          	jalr	-944(ra) # 800012b8 <_Z4putcc>
    putc('l');
    80001670:	06c00513          	li	a0,108
    80001674:	00000097          	auipc	ra,0x0
    80001678:	c44080e7          	jalr	-956(ra) # 800012b8 <_Z4putcc>
    putc('e');
    8000167c:	06500513          	li	a0,101
    80001680:	00000097          	auipc	ra,0x0
    80001684:	c38080e7          	jalr	-968(ra) # 800012b8 <_Z4putcc>
    putc(':');
    80001688:	03a00513          	li	a0,58
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	c2c080e7          	jalr	-980(ra) # 800012b8 <_Z4putcc>
    putc(' ');
    80001694:	02000513          	li	a0,32
    80001698:	00000097          	auipc	ra,0x0
    8000169c:	c20080e7          	jalr	-992(ra) # 800012b8 <_Z4putcc>
    while(*file != 0){
    800016a0:	0004c503          	lbu	a0,0(s1)
    800016a4:	00050a63          	beqz	a0,800016b8 <_Z13assert_failedPKci+0x17c>
        putc(*file);
    800016a8:	00000097          	auipc	ra,0x0
    800016ac:	c10080e7          	jalr	-1008(ra) # 800012b8 <_Z4putcc>
        file++;
    800016b0:	00148493          	addi	s1,s1,1
    while(*file != 0){
    800016b4:	fedff06f          	j	800016a0 <_Z13assert_failedPKci+0x164>
    }
    putc('\n');
    800016b8:	00a00513          	li	a0,10
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	bfc080e7          	jalr	-1028(ra) # 800012b8 <_Z4putcc>
    putc('l');
    800016c4:	06c00513          	li	a0,108
    800016c8:	00000097          	auipc	ra,0x0
    800016cc:	bf0080e7          	jalr	-1040(ra) # 800012b8 <_Z4putcc>
    putc('i');
    800016d0:	06900513          	li	a0,105
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	be4080e7          	jalr	-1052(ra) # 800012b8 <_Z4putcc>
    putc('n');
    800016dc:	06e00513          	li	a0,110
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	bd8080e7          	jalr	-1064(ra) # 800012b8 <_Z4putcc>
    putc('e');
    800016e8:	06500513          	li	a0,101
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	bcc080e7          	jalr	-1076(ra) # 800012b8 <_Z4putcc>
    putc(':');
    800016f4:	03a00513          	li	a0,58
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	bc0080e7          	jalr	-1088(ra) # 800012b8 <_Z4putcc>
    putc(' ');
    80001700:	02000513          	li	a0,32
    80001704:	00000097          	auipc	ra,0x0
    80001708:	bb4080e7          	jalr	-1100(ra) # 800012b8 <_Z4putcc>
    char buffer[20];
    int i = 0;
    8000170c:	00000493          	li	s1,0
    while(line != 0){
    80001710:	02090463          	beqz	s2,80001738 <_Z13assert_failedPKci+0x1fc>
        buffer[i] = line % 10 + '0';
    80001714:	00a00713          	li	a4,10
    80001718:	02e967bb          	remw	a5,s2,a4
    8000171c:	0307879b          	addiw	a5,a5,48
    80001720:	fe040693          	addi	a3,s0,-32
    80001724:	009686b3          	add	a3,a3,s1
    80001728:	fef68423          	sb	a5,-24(a3)
        line /= 10;
    8000172c:	02e9493b          	divw	s2,s2,a4
        i++;
    80001730:	0014849b          	addiw	s1,s1,1
    while(line != 0){
    80001734:	fddff06f          	j	80001710 <_Z13assert_failedPKci+0x1d4>
    }
    while(i != 0){
    80001738:	02048063          	beqz	s1,80001758 <_Z13assert_failedPKci+0x21c>
        i--;
    8000173c:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001740:	fe040793          	addi	a5,s0,-32
    80001744:	009787b3          	add	a5,a5,s1
    80001748:	fe87c503          	lbu	a0,-24(a5)
    8000174c:	00000097          	auipc	ra,0x0
    80001750:	b6c080e7          	jalr	-1172(ra) # 800012b8 <_Z4putcc>
    80001754:	fe5ff06f          	j	80001738 <_Z13assert_failedPKci+0x1fc>
    }
    putc('\n');
    80001758:	00a00513          	li	a0,10
    8000175c:	00000097          	auipc	ra,0x0
    80001760:	b5c080e7          	jalr	-1188(ra) # 800012b8 <_Z4putcc>
    while(1);
    80001764:	0000006f          	j	80001764 <_Z13assert_failedPKci+0x228>

0000000080001768 <_Z8testFuncPv>:
    return;
}

sem_t sem = nullptr;

void testFunc(void* arg){
    80001768:	ff010113          	addi	sp,sp,-16
    8000176c:	00113423          	sd	ra,8(sp)
    80001770:	00813023          	sd	s0,0(sp)
    80001774:	01010413          	addi	s0,sp,16
    putc('t');
    80001778:	07400513          	li	a0,116
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	b3c080e7          	jalr	-1220(ra) # 800012b8 <_Z4putcc>
    putc('e');
    80001784:	06500513          	li	a0,101
    80001788:	00000097          	auipc	ra,0x0
    8000178c:	b30080e7          	jalr	-1232(ra) # 800012b8 <_Z4putcc>
    putc('s');
    80001790:	07300513          	li	a0,115
    80001794:	00000097          	auipc	ra,0x0
    80001798:	b24080e7          	jalr	-1244(ra) # 800012b8 <_Z4putcc>
    putc('t');
    8000179c:	07400513          	li	a0,116
    800017a0:	00000097          	auipc	ra,0x0
    800017a4:	b18080e7          	jalr	-1256(ra) # 800012b8 <_Z4putcc>

    sem_wait(sem);
    800017a8:	00005517          	auipc	a0,0x5
    800017ac:	37853503          	ld	a0,888(a0) # 80006b20 <sem>
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	a88080e7          	jalr	-1400(ra) # 80001238 <_Z8sem_waitP4_sem>

    putc(' ');
    800017b8:	02000513          	li	a0,32
    800017bc:	00000097          	auipc	ra,0x0
    800017c0:	afc080e7          	jalr	-1284(ra) # 800012b8 <_Z4putcc>
    putc('t');
    800017c4:	07400513          	li	a0,116
    800017c8:	00000097          	auipc	ra,0x0
    800017cc:	af0080e7          	jalr	-1296(ra) # 800012b8 <_Z4putcc>
    putc('h');
    800017d0:	06800513          	li	a0,104
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	ae4080e7          	jalr	-1308(ra) # 800012b8 <_Z4putcc>
    putc('r');
    800017dc:	07200513          	li	a0,114
    800017e0:	00000097          	auipc	ra,0x0
    800017e4:	ad8080e7          	jalr	-1320(ra) # 800012b8 <_Z4putcc>
    putc('e');
    800017e8:	06500513          	li	a0,101
    800017ec:	00000097          	auipc	ra,0x0
    800017f0:	acc080e7          	jalr	-1332(ra) # 800012b8 <_Z4putcc>
    putc('a');
    800017f4:	06100513          	li	a0,97
    800017f8:	00000097          	auipc	ra,0x0
    800017fc:	ac0080e7          	jalr	-1344(ra) # 800012b8 <_Z4putcc>
    putc('d');
    80001800:	06400513          	li	a0,100
    80001804:	00000097          	auipc	ra,0x0
    80001808:	ab4080e7          	jalr	-1356(ra) # 800012b8 <_Z4putcc>
    putc('\n');
    8000180c:	00a00513          	li	a0,10
    80001810:	00000097          	auipc	ra,0x0
    80001814:	aa8080e7          	jalr	-1368(ra) # 800012b8 <_Z4putcc>
}
    80001818:	00813083          	ld	ra,8(sp)
    8000181c:	00013403          	ld	s0,0(sp)
    80001820:	01010113          	addi	sp,sp,16
    80001824:	00008067          	ret

0000000080001828 <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    80001828:	ff010113          	addi	sp,sp,-16
    8000182c:	00113423          	sd	ra,8(sp)
    80001830:	00813023          	sd	s0,0(sp)
    80001834:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001838:	00005797          	auipc	a5,0x5
    8000183c:	2907b783          	ld	a5,656(a5) # 80006ac8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001840:	10579073          	csrw	stvec,a5
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80001844:	100027f3          	csrr	a5,sstatus
    sstatus &= ~(1 << 8);
    80001848:	eff7f793          	andi	a5,a5,-257
    __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    8000184c:	10079073          	csrw	sstatus,a5
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001850:	00005797          	auipc	a5,0x5
    80001854:	2807b783          	ld	a5,640(a5) # 80006ad0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001858:	0007b603          	ld	a2,0(a5)
    8000185c:	00005797          	auipc	a5,0x5
    80001860:	2547b783          	ld	a5,596(a5) # 80006ab0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001864:	0007b583          	ld	a1,0(a5)
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	650080e7          	jalr	1616(ra) # 80001eb8 <_ZN11HeapManager4initEmm>
}
    80001870:	00813083          	ld	ra,8(sp)
    80001874:	00013403          	ld	s0,0(sp)
    80001878:	01010113          	addi	sp,sp,16
    8000187c:	00008067          	ret

0000000080001880 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001880:	fd010113          	addi	sp,sp,-48
    80001884:	02113423          	sd	ra,40(sp)
    80001888:	02813023          	sd	s0,32(sp)
    8000188c:	00913c23          	sd	s1,24(sp)
    80001890:	03010413          	addi	s0,sp,48
    
    thread_t t = (thread_t)mem_alloc(sizeof(_thread));
    80001894:	0b000513          	li	a0,176
    80001898:	00000097          	auipc	ra,0x0
    8000189c:	868080e7          	jalr	-1944(ra) # 80001100 <_Z9mem_allocm>
    800018a0:	fca43c23          	sd	a0,-40(s0)
    
    // _thread::create(&t, nullptr, nullptr, nullptr, false);
    // _thread::currentThread = t;

    thread_create(&t, nullptr, nullptr);
    800018a4:	00000613          	li	a2,0
    800018a8:	00000593          	li	a1,0
    800018ac:	fd840513          	addi	a0,s0,-40
    800018b0:	00000097          	auipc	ra,0x0
    800018b4:	8ac080e7          	jalr	-1876(ra) # 8000115c <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    800018b8:	00002097          	auipc	ra,0x2
    800018bc:	e08080e7          	jalr	-504(ra) # 800036c0 <_ZN9Scheduler3getEv>
    800018c0:	00005797          	auipc	a5,0x5
    800018c4:	2187b783          	ld	a5,536(a5) # 80006ad8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800018c8:	00a7b023          	sd	a0,0(a5)

    thread_t test = (thread_t)mem_alloc(sizeof(_thread));
    800018cc:	0b000513          	li	a0,176
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	830080e7          	jalr	-2000(ra) # 80001100 <_Z9mem_allocm>
    800018d8:	fca43823          	sd	a0,-48(s0)
    
    // _thread::create(&test, testFunc, nullptr, nullptr);
    thread_create(&test, testFunc, nullptr);
    800018dc:	00000613          	li	a2,0
    800018e0:	00000597          	auipc	a1,0x0
    800018e4:	e8858593          	addi	a1,a1,-376 # 80001768 <_Z8testFuncPv>
    800018e8:	fd040513          	addi	a0,s0,-48
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	870080e7          	jalr	-1936(ra) # 8000115c <_Z13thread_createPP7_threadPFvPvES2_>

    sem = (sem_t)mem_alloc(sizeof(_sem));
    800018f4:	01800513          	li	a0,24
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	808080e7          	jalr	-2040(ra) # 80001100 <_Z9mem_allocm>
    80001900:	00005497          	auipc	s1,0x5
    80001904:	22048493          	addi	s1,s1,544 # 80006b20 <sem>
    80001908:	00a4b023          	sd	a0,0(s1)
    sem_open(&sem, 0);
    8000190c:	00000593          	li	a1,0
    80001910:	00048513          	mv	a0,s1
    80001914:	00000097          	auipc	ra,0x0
    80001918:	8c0080e7          	jalr	-1856(ra) # 800011d4 <_Z8sem_openPP4_semj>


    thread_dispatch();
    8000191c:	00000097          	auipc	ra,0x0
    80001920:	898080e7          	jalr	-1896(ra) # 800011b4 <_Z15thread_dispatchv>
    sem_signal(sem);
    80001924:	0004b503          	ld	a0,0(s1)
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	93c080e7          	jalr	-1732(ra) # 80001264 <_Z10sem_signalP4_sem>
    // do{
    //     _thread::dispatch();
    // }while(1);

    putc('m');
    80001930:	06d00513          	li	a0,109
    80001934:	00000097          	auipc	ra,0x0
    80001938:	984080e7          	jalr	-1660(ra) # 800012b8 <_Z4putcc>
    putc('a');
    8000193c:	06100513          	li	a0,97
    80001940:	00000097          	auipc	ra,0x0
    80001944:	978080e7          	jalr	-1672(ra) # 800012b8 <_Z4putcc>
    putc('i');
    80001948:	06900513          	li	a0,105
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	96c080e7          	jalr	-1684(ra) # 800012b8 <_Z4putcc>
    putc('n');
    80001954:	06e00513          	li	a0,110
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	960080e7          	jalr	-1696(ra) # 800012b8 <_Z4putcc>
    putc('\n');
    80001960:	00a00513          	li	a0,10
    80001964:	00000097          	auipc	ra,0x0
    80001968:	954080e7          	jalr	-1708(ra) # 800012b8 <_Z4putcc>
    
    thread_dispatch();
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	848080e7          	jalr	-1976(ra) # 800011b4 <_Z15thread_dispatchv>

    return EXIT_SUCCESS;
    80001974:	00000513          	li	a0,0
    80001978:	02813083          	ld	ra,40(sp)
    8000197c:	02013403          	ld	s0,32(sp)
    80001980:	01813483          	ld	s1,24(sp)
    80001984:	03010113          	addi	sp,sp,48
    80001988:	00008067          	ret

000000008000198c <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"

thread_t _thread::currentThread = nullptr;
uint32 _thread::nextID = 0;

_thread::_thread(func function, void* arg){
    8000198c:	ff010113          	addi	sp,sp,-16
    80001990:	00813423          	sd	s0,8(sp)
    80001994:	01010413          	addi	s0,sp,16
    _thread(func function, void* arg);

    static void wrapper();


    struct contextWrapper{
    80001998:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    8000199c:	00005717          	auipc	a4,0x5
    800019a0:	18c70713          	addi	a4,a4,396 # 80006b28 <_ZN7_thread6nextIDE>
    800019a4:	00072783          	lw	a5,0(a4)
    800019a8:	0017869b          	addiw	a3,a5,1
    800019ac:	00d72023          	sw	a3,0(a4)
    800019b0:	00f52023          	sw	a5,0(a0)
    closed = 0;
    blocked = 0;
    sleeping = 0;
    finished = 0;
    reserved = 0;
    800019b4:	08052c23          	sw	zero,152(a0)
    joinHead = nullptr;
    800019b8:	08053023          	sd	zero,128(a0)
    timeLeft = 0;
    800019bc:	08053423          	sd	zero,136(a0)
    stackStart = 0;
    800019c0:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    800019c4:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    800019c8:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    800019cc:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    800019d0:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    800019d4:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    800019d8:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    800019dc:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    800019e0:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    800019e4:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    800019e8:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    800019ec:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    800019f0:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    800019f4:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    800019f8:	00000797          	auipc	a5,0x0
    800019fc:	3b878793          	addi	a5,a5,952 # 80001db0 <_ZN7_thread7wrapperEv>
    80001a00:	00f53423          	sd	a5,8(a0)
}
    80001a04:	00813403          	ld	s0,8(sp)
    80001a08:	01010113          	addi	sp,sp,16
    80001a0c:	00008067          	ret

0000000080001a10 <_Z10popSppSpiev>:

void popSppSpie(){
    80001a10:	ff010113          	addi	sp,sp,-16
    80001a14:	00813423          	sd	s0,8(sp)
    80001a18:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001a1c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001a20:	10200073          	sret
}
    80001a24:	00813403          	ld	s0,8(sp)
    80001a28:	01010113          	addi	sp,sp,16
    80001a2c:	00008067          	ret

0000000080001a30 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:
    currentThread->function(currentThread->arg);
    currentThread->finished = 1;
    dispatch();
}

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80001a30:	fc010113          	addi	sp,sp,-64
    80001a34:	02113c23          	sd	ra,56(sp)
    80001a38:	02813823          	sd	s0,48(sp)
    80001a3c:	02913423          	sd	s1,40(sp)
    80001a40:	03213023          	sd	s2,32(sp)
    80001a44:	01313c23          	sd	s3,24(sp)
    80001a48:	01413823          	sd	s4,16(sp)
    80001a4c:	01513423          	sd	s5,8(sp)
    80001a50:	04010413          	addi	s0,sp,64
    80001a54:	00050493          	mv	s1,a0
    80001a58:	00058a93          	mv	s5,a1
    80001a5c:	00060a13          	mv	s4,a2
    80001a60:	00068913          	mv	s2,a3
    80001a64:	00070993          	mv	s3,a4
    *thread = (thread_t)mem_alloc(sizeof(_thread));
    80001a68:	0b000513          	li	a0,176
    80001a6c:	fffff097          	auipc	ra,0xfffff
    80001a70:	694080e7          	jalr	1684(ra) # 80001100 <_Z9mem_allocm>
    80001a74:	00a4b023          	sd	a0,0(s1)
    
    (*thread)->function = function;
    80001a78:	0b553023          	sd	s5,160(a0)
    (*thread)->arg = arg;
    80001a7c:	0004b783          	ld	a5,0(s1)
    80001a80:	0b47b423          	sd	s4,168(a5)
    (*thread)->ID = nextID++;
    80001a84:	00005717          	auipc	a4,0x5
    80001a88:	0a470713          	addi	a4,a4,164 # 80006b28 <_ZN7_thread6nextIDE>
    80001a8c:	00072783          	lw	a5,0(a4)
    80001a90:	0017869b          	addiw	a3,a5,1
    80001a94:	00d72023          	sw	a3,0(a4)
    80001a98:	0004b703          	ld	a4,0(s1)
    80001a9c:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80001aa0:	0004b703          	ld	a4,0(s1)
    80001aa4:	09872783          	lw	a5,152(a4)
    80001aa8:	ffe7f793          	andi	a5,a5,-2
    80001aac:	08f72c23          	sw	a5,152(a4)
    (*thread)->blocked = false;
    80001ab0:	0004b703          	ld	a4,0(s1)
    80001ab4:	09872783          	lw	a5,152(a4)
    80001ab8:	ffd7f793          	andi	a5,a5,-3
    80001abc:	08f72c23          	sw	a5,152(a4)
    (*thread)->sleeping = false;
    80001ac0:	0004b703          	ld	a4,0(s1)
    80001ac4:	09872783          	lw	a5,152(a4)
    80001ac8:	ffb7f793          	andi	a5,a5,-5
    80001acc:	08f72c23          	sw	a5,152(a4)
    (*thread)->finished = false;
    80001ad0:	0004b703          	ld	a4,0(s1)
    80001ad4:	09872783          	lw	a5,152(a4)
    80001ad8:	ff77f793          	andi	a5,a5,-9
    80001adc:	08f72c23          	sw	a5,152(a4)
    (*thread)->reserved = 0;
    80001ae0:	0004b703          	ld	a4,0(s1)
    80001ae4:	09872783          	lw	a5,152(a4)
    80001ae8:	00f7f793          	andi	a5,a5,15
    80001aec:	08f72c23          	sw	a5,152(a4)
    (*thread)->joinHead = nullptr;
    80001af0:	0004b783          	ld	a5,0(s1)
    80001af4:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = 0;
    80001af8:	0004b783          	ld	a5,0(s1)
    80001afc:	0807b423          	sd	zero,136(a5)
    (*thread)->stackStart = 0;
    80001b00:	0004b783          	ld	a5,0(s1)
    80001b04:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80001b08:	0004b783          	ld	a5,0(s1)
    80001b0c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80001b10:	0004b783          	ld	a5,0(s1)
    80001b14:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80001b18:	0004b783          	ld	a5,0(s1)
    80001b1c:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80001b20:	0004b783          	ld	a5,0(s1)
    80001b24:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80001b28:	0004b783          	ld	a5,0(s1)
    80001b2c:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80001b30:	0004b783          	ld	a5,0(s1)
    80001b34:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    80001b38:	0004b783          	ld	a5,0(s1)
    80001b3c:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80001b40:	0004b783          	ld	a5,0(s1)
    80001b44:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80001b48:	0004b783          	ld	a5,0(s1)
    80001b4c:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80001b50:	0004b783          	ld	a5,0(s1)
    80001b54:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80001b58:	0004b783          	ld	a5,0(s1)
    80001b5c:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    80001b60:	0004b783          	ld	a5,0(s1)
    80001b64:	0607b823          	sd	zero,112(a5)

    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80001b68:	0004b783          	ld	a5,0(s1)
    80001b6c:	0127b823          	sd	s2,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80001b70:	0004b783          	ld	a5,0(s1)
    80001b74:	00000717          	auipc	a4,0x0
    80001b78:	23c70713          	addi	a4,a4,572 # 80001db0 <_ZN7_thread7wrapperEv>
    80001b7c:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    80001b80:	0004b783          	ld	a5,0(s1)
    80001b84:	0927b823          	sd	s2,144(a5)
    if(start){
    80001b88:	02099663          	bnez	s3,80001bb4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x184>
        Scheduler::put(*thread);
    }
    return 0;
}
    80001b8c:	00000513          	li	a0,0
    80001b90:	03813083          	ld	ra,56(sp)
    80001b94:	03013403          	ld	s0,48(sp)
    80001b98:	02813483          	ld	s1,40(sp)
    80001b9c:	02013903          	ld	s2,32(sp)
    80001ba0:	01813983          	ld	s3,24(sp)
    80001ba4:	01013a03          	ld	s4,16(sp)
    80001ba8:	00813a83          	ld	s5,8(sp)
    80001bac:	04010113          	addi	sp,sp,64
    80001bb0:	00008067          	ret
        Scheduler::put(*thread);
    80001bb4:	0004b503          	ld	a0,0(s1)
    80001bb8:	00002097          	auipc	ra,0x2
    80001bbc:	918080e7          	jalr	-1768(ra) # 800034d0 <_ZN9Scheduler3putEP7_thread>
    80001bc0:	fcdff06f          	j	80001b8c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x15c>

0000000080001bc4 <_ZN7_thread10setBlockedEb>:
    this->finished = 1;
    dispatch();    
    return 0;
}

void _thread::setBlocked(bool blocked){
    80001bc4:	ff010113          	addi	sp,sp,-16
    80001bc8:	00813423          	sd	s0,8(sp)
    80001bcc:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80001bd0:	0015f593          	andi	a1,a1,1
    80001bd4:	0015979b          	slliw	a5,a1,0x1
    80001bd8:	09852583          	lw	a1,152(a0)
    80001bdc:	ffd5f593          	andi	a1,a1,-3
    80001be0:	00f5e5b3          	or	a1,a1,a5
    80001be4:	08b52c23          	sw	a1,152(a0)
}
    80001be8:	00813403          	ld	s0,8(sp)
    80001bec:	01010113          	addi	sp,sp,16
    80001bf0:	00008067          	ret

0000000080001bf4 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80001bf4:	ff010113          	addi	sp,sp,-16
    80001bf8:	00813423          	sd	s0,8(sp)
    80001bfc:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80001c00:	0015f793          	andi	a5,a1,1
    80001c04:	09852583          	lw	a1,152(a0)
    80001c08:	ffe5f593          	andi	a1,a1,-2
    80001c0c:	00f5e5b3          	or	a1,a1,a5
    80001c10:	08b52c23          	sw	a1,152(a0)
}
    80001c14:	00813403          	ld	s0,8(sp)
    80001c18:	01010113          	addi	sp,sp,16
    80001c1c:	00008067          	ret

0000000080001c20 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    // }
    currentThread =  Scheduler::get();
    contextSwitch(oldThread == nullptr?nullptr:&oldThread->context, &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80001c20:	ff010113          	addi	sp,sp,-16
    80001c24:	00813423          	sd	s0,8(sp)
    80001c28:	01010413          	addi	s0,sp,16
    if(oldContext != nullptr){
    80001c2c:	08050063          	beqz	a0,80001cac <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x8c>

        __asm__ volatile ("mv %0, sp" : "=r"(oldContext->sp));
    80001c30:	00010793          	mv	a5,sp
    80001c34:	00f53423          	sd	a5,8(a0)
        __asm__ volatile ("mv %0, ra" : "=r"(oldContext->pc));
    80001c38:	00008793          	mv	a5,ra
    80001c3c:	00f53023          	sd	a5,0(a0)

        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->s0));
    80001c40:	00040793          	mv	a5,s0
    80001c44:	00f53823          	sd	a5,16(a0)
        __asm__ volatile ("mv %0, s1" : "=r"(oldContext->s1));
    80001c48:	00048793          	mv	a5,s1
    80001c4c:	00f53c23          	sd	a5,24(a0)
        __asm__ volatile ("mv %0, s2" : "=r"(oldContext->s2));
    80001c50:	00090793          	mv	a5,s2
    80001c54:	02f53023          	sd	a5,32(a0)
        __asm__ volatile ("mv %0, s3" : "=r"(oldContext->s3));
    80001c58:	00098793          	mv	a5,s3
    80001c5c:	02f53423          	sd	a5,40(a0)
        __asm__ volatile ("mv %0, s4" : "=r"(oldContext->s4));
    80001c60:	000a0793          	mv	a5,s4
    80001c64:	02f53823          	sd	a5,48(a0)
        __asm__ volatile ("mv %0, s5" : "=r"(oldContext->s5));
    80001c68:	000a8793          	mv	a5,s5
    80001c6c:	02f53c23          	sd	a5,56(a0)
        __asm__ volatile ("mv %0, s6" : "=r"(oldContext->s6));
    80001c70:	000b0793          	mv	a5,s6
    80001c74:	04f53023          	sd	a5,64(a0)
        __asm__ volatile ("mv %0, s7" : "=r"(oldContext->s7));
    80001c78:	000b8793          	mv	a5,s7
    80001c7c:	04f53423          	sd	a5,72(a0)
        __asm__ volatile ("mv %0, s8" : "=r"(oldContext->s8));
    80001c80:	000c0793          	mv	a5,s8
    80001c84:	04f53823          	sd	a5,80(a0)
        __asm__ volatile ("mv %0, s9" : "=r"(oldContext->s9));
    80001c88:	000c8793          	mv	a5,s9
    80001c8c:	04f53c23          	sd	a5,88(a0)
        __asm__ volatile ("mv %0, s10" : "=r"(oldContext->s10));
    80001c90:	000d0793          	mv	a5,s10
    80001c94:	06f53023          	sd	a5,96(a0)
        __asm__ volatile ("mv %0, s11" : "=r"(oldContext->s11));
    80001c98:	000d8793          	mv	a5,s11
    80001c9c:	06f53423          	sd	a5,104(a0)

        __asm__ volatile ("csrr s0, sstatus");
    80001ca0:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->sstatus));
    80001ca4:	00040793          	mv	a5,s0
    80001ca8:	06f53823          	sd	a5,112(a0)

    }
    if(newContext->sp != 0){
    80001cac:	0085b783          	ld	a5,8(a1)
    80001cb0:	00078463          	beqz	a5,80001cb8 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x98>
        __asm__ volatile ("mv sp, %0" :: "r"(newContext->sp));
    80001cb4:	00078113          	mv	sp,a5
    }

    
    __asm__ volatile ("mv s0, %0" :: "r"(newContext->sstatus));
    80001cb8:	0705b783          	ld	a5,112(a1)
    80001cbc:	00078413          	mv	s0,a5
    __asm__ volatile ("csrw sstatus, s0");
    80001cc0:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("mv s0, %0" :: "r"(newContext->s0));
    80001cc4:	0105b783          	ld	a5,16(a1)
    80001cc8:	00078413          	mv	s0,a5
    __asm__ volatile ("mv s1, %0" :: "r"(newContext->s1));
    80001ccc:	0185b783          	ld	a5,24(a1)
    80001cd0:	00078493          	mv	s1,a5
    __asm__ volatile ("mv s2, %0" :: "r"(newContext->s2));
    80001cd4:	0205b783          	ld	a5,32(a1)
    80001cd8:	00078913          	mv	s2,a5
    __asm__ volatile ("mv s3, %0" :: "r"(newContext->s3));
    80001cdc:	0285b783          	ld	a5,40(a1)
    80001ce0:	00078993          	mv	s3,a5
    __asm__ volatile ("mv s4, %0" :: "r"(newContext->s4));
    80001ce4:	0305b783          	ld	a5,48(a1)
    80001ce8:	00078a13          	mv	s4,a5
    __asm__ volatile ("mv s5, %0" :: "r"(newContext->s5));
    80001cec:	0385b783          	ld	a5,56(a1)
    80001cf0:	00078a93          	mv	s5,a5
    __asm__ volatile ("mv s6, %0" :: "r"(newContext->s6));
    80001cf4:	0405b783          	ld	a5,64(a1)
    80001cf8:	00078b13          	mv	s6,a5
    __asm__ volatile ("mv s7, %0" :: "r"(newContext->s7));
    80001cfc:	0485b783          	ld	a5,72(a1)
    80001d00:	00078b93          	mv	s7,a5
    __asm__ volatile ("mv s8, %0" :: "r"(newContext->s8));
    80001d04:	0505b783          	ld	a5,80(a1)
    80001d08:	00078c13          	mv	s8,a5
    __asm__ volatile ("mv s9, %0" :: "r"(newContext->s9));
    80001d0c:	0585b783          	ld	a5,88(a1)
    80001d10:	00078c93          	mv	s9,a5
    __asm__ volatile ("mv s10, %0" :: "r"(newContext->s10));
    80001d14:	0605b783          	ld	a5,96(a1)
    80001d18:	00078d13          	mv	s10,a5
    __asm__ volatile ("mv s11, %0" :: "r"(newContext->s11));
    80001d1c:	0685b783          	ld	a5,104(a1)
    80001d20:	00078d93          	mv	s11,a5

    __asm__ volatile ("mv ra, %0" :: "r"(newContext->pc));
    80001d24:	0005b783          	ld	a5,0(a1)
    80001d28:	00078093          	mv	ra,a5
    return;
}
    80001d2c:	00813403          	ld	s0,8(sp)
    80001d30:	01010113          	addi	sp,sp,16
    80001d34:	00008067          	ret

0000000080001d38 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80001d38:	fe010113          	addi	sp,sp,-32
    80001d3c:	00113c23          	sd	ra,24(sp)
    80001d40:	00813823          	sd	s0,16(sp)
    80001d44:	00913423          	sd	s1,8(sp)
    80001d48:	02010413          	addi	s0,sp,32
    _thread* oldThread = currentThread;
    80001d4c:	00005497          	auipc	s1,0x5
    80001d50:	de44b483          	ld	s1,-540(s1) # 80006b30 <_ZN7_thread13currentThreadE>
    if(oldThread != nullptr && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80001d54:	00048863          	beqz	s1,80001d64 <_ZN7_thread8dispatchEv+0x2c>
    80001d58:	0984b783          	ld	a5,152(s1)
    80001d5c:	00f7f793          	andi	a5,a5,15
    80001d60:	04078063          	beqz	a5,80001da0 <_ZN7_thread8dispatchEv+0x68>
    currentThread =  Scheduler::get();
    80001d64:	00002097          	auipc	ra,0x2
    80001d68:	95c080e7          	jalr	-1700(ra) # 800036c0 <_ZN9Scheduler3getEv>
    80001d6c:	00005797          	auipc	a5,0x5
    80001d70:	dca7b223          	sd	a0,-572(a5) # 80006b30 <_ZN7_thread13currentThreadE>
    contextSwitch(oldThread == nullptr?nullptr:&oldThread->context, &(currentThread->context));
    80001d74:	00048463          	beqz	s1,80001d7c <_ZN7_thread8dispatchEv+0x44>
    80001d78:	00848493          	addi	s1,s1,8
    80001d7c:	00850593          	addi	a1,a0,8
    80001d80:	00048513          	mv	a0,s1
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	e9c080e7          	jalr	-356(ra) # 80001c20 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80001d8c:	01813083          	ld	ra,24(sp)
    80001d90:	01013403          	ld	s0,16(sp)
    80001d94:	00813483          	ld	s1,8(sp)
    80001d98:	02010113          	addi	sp,sp,32
    80001d9c:	00008067          	ret
            Scheduler::put(oldThread);
    80001da0:	00048513          	mv	a0,s1
    80001da4:	00001097          	auipc	ra,0x1
    80001da8:	72c080e7          	jalr	1836(ra) # 800034d0 <_ZN9Scheduler3putEP7_thread>
    80001dac:	fb9ff06f          	j	80001d64 <_ZN7_thread8dispatchEv+0x2c>

0000000080001db0 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80001db0:	fe010113          	addi	sp,sp,-32
    80001db4:	00113c23          	sd	ra,24(sp)
    80001db8:	00813823          	sd	s0,16(sp)
    80001dbc:	00913423          	sd	s1,8(sp)
    80001dc0:	02010413          	addi	s0,sp,32
    popSppSpie();
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	c4c080e7          	jalr	-948(ra) # 80001a10 <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    80001dcc:	00005497          	auipc	s1,0x5
    80001dd0:	d5c48493          	addi	s1,s1,-676 # 80006b28 <_ZN7_thread6nextIDE>
    80001dd4:	0084b783          	ld	a5,8(s1)
    80001dd8:	0a07b703          	ld	a4,160(a5)
    80001ddc:	0a87b503          	ld	a0,168(a5)
    80001de0:	000700e7          	jalr	a4
    currentThread->finished = 1;
    80001de4:	0084b703          	ld	a4,8(s1)
    80001de8:	09872783          	lw	a5,152(a4)
    80001dec:	0087e793          	ori	a5,a5,8
    80001df0:	08f72c23          	sw	a5,152(a4)
    dispatch();
    80001df4:	00000097          	auipc	ra,0x0
    80001df8:	f44080e7          	jalr	-188(ra) # 80001d38 <_ZN7_thread8dispatchEv>
}
    80001dfc:	01813083          	ld	ra,24(sp)
    80001e00:	01013403          	ld	s0,16(sp)
    80001e04:	00813483          	ld	s1,8(sp)
    80001e08:	02010113          	addi	sp,sp,32
    80001e0c:	00008067          	ret

0000000080001e10 <_ZN7_thread4exitEv>:
int _thread::exit(){
    80001e10:	ff010113          	addi	sp,sp,-16
    80001e14:	00113423          	sd	ra,8(sp)
    80001e18:	00813023          	sd	s0,0(sp)
    80001e1c:	01010413          	addi	s0,sp,16
    this->finished = 1;
    80001e20:	09852783          	lw	a5,152(a0)
    80001e24:	0087e793          	ori	a5,a5,8
    80001e28:	08f52c23          	sw	a5,152(a0)
    dispatch();    
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	f0c080e7          	jalr	-244(ra) # 80001d38 <_ZN7_thread8dispatchEv>
}
    80001e34:	00000513          	li	a0,0
    80001e38:	00813083          	ld	ra,8(sp)
    80001e3c:	00013403          	ld	s0,0(sp)
    80001e40:	01010113          	addi	sp,sp,16
    80001e44:	00008067          	ret

0000000080001e48 <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "hw.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80001e48:	fe010113          	addi	sp,sp,-32
    80001e4c:	00113c23          	sd	ra,24(sp)
    80001e50:	00813823          	sd	s0,16(sp)
    80001e54:	00913423          	sd	s1,8(sp)
    80001e58:	02010413          	addi	s0,sp,32
    80001e5c:	00050493          	mv	s1,a0
    assert(instance == 0);
    80001e60:	00005797          	auipc	a5,0x5
    80001e64:	cd87b783          	ld	a5,-808(a5) # 80006b38 <_ZN11HeapManager8instanceE>
    80001e68:	02079063          	bnez	a5,80001e88 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80001e6c:	00005797          	auipc	a5,0x5
    80001e70:	cc97b623          	sd	s1,-820(a5) # 80006b38 <_ZN11HeapManager8instanceE>
}
    80001e74:	01813083          	ld	ra,24(sp)
    80001e78:	01013403          	ld	s0,16(sp)
    80001e7c:	00813483          	ld	s1,8(sp)
    80001e80:	02010113          	addi	sp,sp,32
    80001e84:	00008067          	ret
    assert(instance == 0);
    80001e88:	01200593          	li	a1,18
    80001e8c:	00004517          	auipc	a0,0x4
    80001e90:	19450513          	addi	a0,a0,404 # 80006020 <CONSOLE_STATUS+0x10>
    80001e94:	fffff097          	auipc	ra,0xfffff
    80001e98:	6a8080e7          	jalr	1704(ra) # 8000153c <_Z13assert_failedPKci>
    80001e9c:	fd1ff06f          	j	80001e6c <_ZN11HeapManagerC1Ev+0x24>

0000000080001ea0 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80001ea0:	ff010113          	addi	sp,sp,-16
    80001ea4:	00813423          	sd	s0,8(sp)
    80001ea8:	01010413          	addi	s0,sp,16
    
}
    80001eac:	00813403          	ld	s0,8(sp)
    80001eb0:	01010113          	addi	sp,sp,16
    80001eb4:	00008067          	ret

0000000080001eb8 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80001eb8:	fd010113          	addi	sp,sp,-48
    80001ebc:	02113423          	sd	ra,40(sp)
    80001ec0:	02813023          	sd	s0,32(sp)
    80001ec4:	00913c23          	sd	s1,24(sp)
    80001ec8:	01213823          	sd	s2,16(sp)
    80001ecc:	01313423          	sd	s3,8(sp)
    80001ed0:	03010413          	addi	s0,sp,48
    80001ed4:	00050913          	mv	s2,a0
    80001ed8:	00058993          	mv	s3,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80001edc:	40b604b3          	sub	s1,a2,a1
    80001ee0:	0414b793          	sltiu	a5,s1,65
    80001ee4:	0c079c63          	bnez	a5,80001fbc <_ZN11HeapManager4initEmm+0x104>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80001ee8:	01393023          	sd	s3,0(s2)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80001eec:	fde00793          	li	a5,-34
    80001ef0:	00f98c23          	sb	a5,24(s3)
    80001ef4:	fc000713          	li	a4,-64
    80001ef8:	00e98ca3          	sb	a4,25(s3)
    80001efc:	fad00713          	li	a4,-83
    80001f00:	00e98d23          	sb	a4,26(s3)
    80001f04:	00f98da3          	sb	a5,27(s3)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80001f08:	0064d613          	srli	a2,s1,0x6
    80001f0c:	00093783          	ld	a5,0(s2)
    80001f10:	fff60613          	addi	a2,a2,-1
    80001f14:	00c78823          	sb	a2,16(a5)
    80001f18:	00865713          	srli	a4,a2,0x8
    80001f1c:	00e788a3          	sb	a4,17(a5)
    80001f20:	01065713          	srli	a4,a2,0x10
    80001f24:	00e78923          	sb	a4,18(a5)
    80001f28:	0186571b          	srliw	a4,a2,0x18
    80001f2c:	00e789a3          	sb	a4,19(a5)
    80001f30:	02065713          	srli	a4,a2,0x20
    80001f34:	00e78a23          	sb	a4,20(a5)
    80001f38:	02865713          	srli	a4,a2,0x28
    80001f3c:	00e78aa3          	sb	a4,21(a5)
    80001f40:	03065713          	srli	a4,a2,0x30
    80001f44:	00e78b23          	sb	a4,22(a5)
    80001f48:	03865613          	srli	a2,a2,0x38
    80001f4c:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80001f50:	00093783          	ld	a5,0(s2)
    80001f54:	00078023          	sb	zero,0(a5)
    80001f58:	000780a3          	sb	zero,1(a5)
    80001f5c:	00078123          	sb	zero,2(a5)
    80001f60:	000781a3          	sb	zero,3(a5)
    80001f64:	00078223          	sb	zero,4(a5)
    80001f68:	000782a3          	sb	zero,5(a5)
    80001f6c:	00078323          	sb	zero,6(a5)
    80001f70:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80001f74:	00093783          	ld	a5,0(s2)
    80001f78:	00078423          	sb	zero,8(a5)
    80001f7c:	000784a3          	sb	zero,9(a5)
    80001f80:	00078523          	sb	zero,10(a5)
    80001f84:	000785a3          	sb	zero,11(a5)
    80001f88:	00078623          	sb	zero,12(a5)
    80001f8c:	000786a3          	sb	zero,13(a5)
    80001f90:	00078723          	sb	zero,14(a5)
    80001f94:	000787a3          	sb	zero,15(a5)
    m_pTail = m_pHead;
    80001f98:	00093783          	ld	a5,0(s2)
    80001f9c:	00f93423          	sd	a5,8(s2)
}
    80001fa0:	02813083          	ld	ra,40(sp)
    80001fa4:	02013403          	ld	s0,32(sp)
    80001fa8:	01813483          	ld	s1,24(sp)
    80001fac:	01013903          	ld	s2,16(sp)
    80001fb0:	00813983          	ld	s3,8(sp)
    80001fb4:	03010113          	addi	sp,sp,48
    80001fb8:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80001fbc:	01b00593          	li	a1,27
    80001fc0:	00004517          	auipc	a0,0x4
    80001fc4:	06050513          	addi	a0,a0,96 # 80006020 <CONSOLE_STATUS+0x10>
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	574080e7          	jalr	1396(ra) # 8000153c <_Z13assert_failedPKci>
    80001fd0:	f19ff06f          	j	80001ee8 <_ZN11HeapManager4initEmm+0x30>

0000000080001fd4 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80001fd4:	fe010113          	addi	sp,sp,-32
    80001fd8:	00113c23          	sd	ra,24(sp)
    80001fdc:	00813823          	sd	s0,16(sp)
    80001fe0:	00913423          	sd	s1,8(sp)
    80001fe4:	01213023          	sd	s2,0(sp)
    80001fe8:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80001fec:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80001ff0:	00000913          	li	s2,0
    80001ff4:	0b80006f          	j	800020ac <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80001ff8:	0104c783          	lbu	a5,16(s1)
    80001ffc:	0114c703          	lbu	a4,17(s1)
    80002000:	00871713          	slli	a4,a4,0x8
    80002004:	00f76733          	or	a4,a4,a5
    80002008:	0124c783          	lbu	a5,18(s1)
    8000200c:	01079793          	slli	a5,a5,0x10
    80002010:	00e7e733          	or	a4,a5,a4
    80002014:	0134c783          	lbu	a5,19(s1)
    80002018:	01879793          	slli	a5,a5,0x18
    8000201c:	00e7e7b3          	or	a5,a5,a4
    80002020:	0144c703          	lbu	a4,20(s1)
    80002024:	02071713          	slli	a4,a4,0x20
    80002028:	00f767b3          	or	a5,a4,a5
    8000202c:	0154c703          	lbu	a4,21(s1)
    80002030:	02871713          	slli	a4,a4,0x28
    80002034:	00f76733          	or	a4,a4,a5
    80002038:	0164c783          	lbu	a5,22(s1)
    8000203c:	03079793          	slli	a5,a5,0x30
    80002040:	00e7e733          	or	a4,a5,a4
    80002044:	0174c783          	lbu	a5,23(s1)
    80002048:	03879793          	slli	a5,a5,0x38
    8000204c:	00e7e7b3          	or	a5,a5,a4
    80002050:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80002054:	0004c703          	lbu	a4,0(s1)
    80002058:	0014c783          	lbu	a5,1(s1)
    8000205c:	00879793          	slli	a5,a5,0x8
    80002060:	00e7e733          	or	a4,a5,a4
    80002064:	0024c783          	lbu	a5,2(s1)
    80002068:	01079793          	slli	a5,a5,0x10
    8000206c:	00e7e7b3          	or	a5,a5,a4
    80002070:	0034c703          	lbu	a4,3(s1)
    80002074:	01871713          	slli	a4,a4,0x18
    80002078:	00f767b3          	or	a5,a4,a5
    8000207c:	0044c703          	lbu	a4,4(s1)
    80002080:	02071713          	slli	a4,a4,0x20
    80002084:	00f76733          	or	a4,a4,a5
    80002088:	0054c783          	lbu	a5,5(s1)
    8000208c:	02879793          	slli	a5,a5,0x28
    80002090:	00e7e733          	or	a4,a5,a4
    80002094:	0064c783          	lbu	a5,6(s1)
    80002098:	03079793          	slli	a5,a5,0x30
    8000209c:	00e7e7b3          	or	a5,a5,a4
    800020a0:	0074c483          	lbu	s1,7(s1)
    800020a4:	03849493          	slli	s1,s1,0x38
    800020a8:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800020ac:	04048a63          	beqz	s1,80002100 <_ZN11HeapManager17getHeapFreeMemoryEv+0x12c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800020b0:	0184c783          	lbu	a5,24(s1)
    800020b4:	0194c703          	lbu	a4,25(s1)
    800020b8:	00871713          	slli	a4,a4,0x8
    800020bc:	00f76733          	or	a4,a4,a5
    800020c0:	01a4c783          	lbu	a5,26(s1)
    800020c4:	01079793          	slli	a5,a5,0x10
    800020c8:	00e7e733          	or	a4,a5,a4
    800020cc:	01b4c783          	lbu	a5,27(s1)
    800020d0:	01879793          	slli	a5,a5,0x18
    800020d4:	00e7e7b3          	or	a5,a5,a4
    800020d8:	0007879b          	sext.w	a5,a5
    800020dc:	deadc737          	lui	a4,0xdeadc
    800020e0:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead432e>
    800020e4:	f0e78ae3          	beq	a5,a4,80001ff8 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    800020e8:	02900593          	li	a1,41
    800020ec:	00004517          	auipc	a0,0x4
    800020f0:	f3450513          	addi	a0,a0,-204 # 80006020 <CONSOLE_STATUS+0x10>
    800020f4:	fffff097          	auipc	ra,0xfffff
    800020f8:	448080e7          	jalr	1096(ra) # 8000153c <_Z13assert_failedPKci>
    800020fc:	efdff06f          	j	80001ff8 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002100:	00090513          	mv	a0,s2
    80002104:	01813083          	ld	ra,24(sp)
    80002108:	01013403          	ld	s0,16(sp)
    8000210c:	00813483          	ld	s1,8(sp)
    80002110:	00013903          	ld	s2,0(sp)
    80002114:	02010113          	addi	sp,sp,32
    80002118:	00008067          	ret

000000008000211c <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    8000211c:	fd010113          	addi	sp,sp,-48
    80002120:	02113423          	sd	ra,40(sp)
    80002124:	02813023          	sd	s0,32(sp)
    80002128:	00913c23          	sd	s1,24(sp)
    8000212c:	01213823          	sd	s2,16(sp)
    80002130:	01313423          	sd	s3,8(sp)
    80002134:	03010413          	addi	s0,sp,48
    80002138:	00050993          	mv	s3,a0
    8000213c:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002140:	00053483          	ld	s1,0(a0)
    80002144:	0b80006f          	j	800021fc <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002148:	0104c783          	lbu	a5,16(s1)
    8000214c:	0114c703          	lbu	a4,17(s1)
    80002150:	00871713          	slli	a4,a4,0x8
    80002154:	00f76733          	or	a4,a4,a5
    80002158:	0124c783          	lbu	a5,18(s1)
    8000215c:	01079793          	slli	a5,a5,0x10
    80002160:	00e7e733          	or	a4,a5,a4
    80002164:	0134c783          	lbu	a5,19(s1)
    80002168:	01879793          	slli	a5,a5,0x18
    8000216c:	00e7e7b3          	or	a5,a5,a4
    80002170:	0144c703          	lbu	a4,20(s1)
    80002174:	02071713          	slli	a4,a4,0x20
    80002178:	00f767b3          	or	a5,a4,a5
    8000217c:	0154c703          	lbu	a4,21(s1)
    80002180:	02871713          	slli	a4,a4,0x28
    80002184:	00f76733          	or	a4,a4,a5
    80002188:	0164c783          	lbu	a5,22(s1)
    8000218c:	03079793          	slli	a5,a5,0x30
    80002190:	00e7e733          	or	a4,a5,a4
    80002194:	0174c783          	lbu	a5,23(s1)
    80002198:	03879793          	slli	a5,a5,0x38
    8000219c:	00e7e7b3          	or	a5,a5,a4
    800021a0:	0b27f863          	bgeu	a5,s2,80002250 <_ZN11HeapManager12heapAllocateEm+0x134>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    800021a4:	0004c703          	lbu	a4,0(s1)
    800021a8:	0014c783          	lbu	a5,1(s1)
    800021ac:	00879793          	slli	a5,a5,0x8
    800021b0:	00e7e733          	or	a4,a5,a4
    800021b4:	0024c783          	lbu	a5,2(s1)
    800021b8:	01079793          	slli	a5,a5,0x10
    800021bc:	00e7e7b3          	or	a5,a5,a4
    800021c0:	0034c703          	lbu	a4,3(s1)
    800021c4:	01871713          	slli	a4,a4,0x18
    800021c8:	00f767b3          	or	a5,a4,a5
    800021cc:	0044c703          	lbu	a4,4(s1)
    800021d0:	02071713          	slli	a4,a4,0x20
    800021d4:	00f76733          	or	a4,a4,a5
    800021d8:	0054c783          	lbu	a5,5(s1)
    800021dc:	02879793          	slli	a5,a5,0x28
    800021e0:	00e7e733          	or	a4,a5,a4
    800021e4:	0064c783          	lbu	a5,6(s1)
    800021e8:	03079793          	slli	a5,a5,0x30
    800021ec:	00e7e7b3          	or	a5,a5,a4
    800021f0:	0074c483          	lbu	s1,7(s1)
    800021f4:	03849493          	slli	s1,s1,0x38
    800021f8:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800021fc:	4e048863          	beqz	s1,800026ec <_ZN11HeapManager12heapAllocateEm+0x5d0>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002200:	0184c783          	lbu	a5,24(s1)
    80002204:	0194c703          	lbu	a4,25(s1)
    80002208:	00871713          	slli	a4,a4,0x8
    8000220c:	00f76733          	or	a4,a4,a5
    80002210:	01a4c783          	lbu	a5,26(s1)
    80002214:	01079793          	slli	a5,a5,0x10
    80002218:	00e7e733          	or	a4,a5,a4
    8000221c:	01b4c783          	lbu	a5,27(s1)
    80002220:	01879793          	slli	a5,a5,0x18
    80002224:	00e7e7b3          	or	a5,a5,a4
    80002228:	0007879b          	sext.w	a5,a5
    8000222c:	deadc737          	lui	a4,0xdeadc
    80002230:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead432e>
    80002234:	f0e78ae3          	beq	a5,a4,80002148 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002238:	03300593          	li	a1,51
    8000223c:	00004517          	auipc	a0,0x4
    80002240:	de450513          	addi	a0,a0,-540 # 80006020 <CONSOLE_STATUS+0x10>
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	2f8080e7          	jalr	760(ra) # 8000153c <_Z13assert_failedPKci>
    8000224c:	efdff06f          	j	80002148 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002250:	00190713          	addi	a4,s2,1
    80002254:	2af77263          	bgeu	a4,a5,800024f8 <_ZN11HeapManager12heapAllocateEm+0x3dc>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002258:	00671793          	slli	a5,a4,0x6
    8000225c:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002260:	fde00713          	li	a4,-34
    80002264:	00e78c23          	sb	a4,24(a5)
    80002268:	fc000693          	li	a3,-64
    8000226c:	00d78ca3          	sb	a3,25(a5)
    80002270:	fad00693          	li	a3,-83
    80002274:	00d78d23          	sb	a3,26(a5)
    80002278:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    8000227c:	0104c703          	lbu	a4,16(s1)
    80002280:	0114c683          	lbu	a3,17(s1)
    80002284:	00869693          	slli	a3,a3,0x8
    80002288:	00e6e6b3          	or	a3,a3,a4
    8000228c:	0124c703          	lbu	a4,18(s1)
    80002290:	01071713          	slli	a4,a4,0x10
    80002294:	00d766b3          	or	a3,a4,a3
    80002298:	0134c703          	lbu	a4,19(s1)
    8000229c:	01871713          	slli	a4,a4,0x18
    800022a0:	00d76733          	or	a4,a4,a3
    800022a4:	0144c683          	lbu	a3,20(s1)
    800022a8:	02069693          	slli	a3,a3,0x20
    800022ac:	00e6e733          	or	a4,a3,a4
    800022b0:	0154c683          	lbu	a3,21(s1)
    800022b4:	02869693          	slli	a3,a3,0x28
    800022b8:	00e6e6b3          	or	a3,a3,a4
    800022bc:	0164c703          	lbu	a4,22(s1)
    800022c0:	03071713          	slli	a4,a4,0x30
    800022c4:	00d766b3          	or	a3,a4,a3
    800022c8:	0174c703          	lbu	a4,23(s1)
    800022cc:	03871713          	slli	a4,a4,0x38
    800022d0:	00d76733          	or	a4,a4,a3
    800022d4:	41270733          	sub	a4,a4,s2
    800022d8:	fff70713          	addi	a4,a4,-1
    800022dc:	00e78823          	sb	a4,16(a5)
    800022e0:	00875693          	srli	a3,a4,0x8
    800022e4:	00d788a3          	sb	a3,17(a5)
    800022e8:	01075693          	srli	a3,a4,0x10
    800022ec:	00d78923          	sb	a3,18(a5)
    800022f0:	0187569b          	srliw	a3,a4,0x18
    800022f4:	00d789a3          	sb	a3,19(a5)
    800022f8:	02075693          	srli	a3,a4,0x20
    800022fc:	00d78a23          	sb	a3,20(a5)
    80002300:	02875693          	srli	a3,a4,0x28
    80002304:	00d78aa3          	sb	a3,21(a5)
    80002308:	03075693          	srli	a3,a4,0x30
    8000230c:	00d78b23          	sb	a3,22(a5)
    80002310:	03875713          	srli	a4,a4,0x38
    80002314:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80002318:	0004c703          	lbu	a4,0(s1)
    8000231c:	0014c683          	lbu	a3,1(s1)
    80002320:	00869693          	slli	a3,a3,0x8
    80002324:	00e6e733          	or	a4,a3,a4
    80002328:	0024c683          	lbu	a3,2(s1)
    8000232c:	01069693          	slli	a3,a3,0x10
    80002330:	00e6e6b3          	or	a3,a3,a4
    80002334:	0034c703          	lbu	a4,3(s1)
    80002338:	01871713          	slli	a4,a4,0x18
    8000233c:	00d766b3          	or	a3,a4,a3
    80002340:	0044c703          	lbu	a4,4(s1)
    80002344:	02071713          	slli	a4,a4,0x20
    80002348:	00d76733          	or	a4,a4,a3
    8000234c:	0054c683          	lbu	a3,5(s1)
    80002350:	02869693          	slli	a3,a3,0x28
    80002354:	00e6e733          	or	a4,a3,a4
    80002358:	0064c683          	lbu	a3,6(s1)
    8000235c:	03069693          	slli	a3,a3,0x30
    80002360:	00e6e6b3          	or	a3,a3,a4
    80002364:	0074c703          	lbu	a4,7(s1)
    80002368:	03871713          	slli	a4,a4,0x38
    8000236c:	00d76733          	or	a4,a4,a3
    80002370:	00d78023          	sb	a3,0(a5)
    80002374:	00875693          	srli	a3,a4,0x8
    80002378:	00d780a3          	sb	a3,1(a5)
    8000237c:	01075693          	srli	a3,a4,0x10
    80002380:	00d78123          	sb	a3,2(a5)
    80002384:	0187569b          	srliw	a3,a4,0x18
    80002388:	00d781a3          	sb	a3,3(a5)
    8000238c:	02075693          	srli	a3,a4,0x20
    80002390:	00d78223          	sb	a3,4(a5)
    80002394:	02875693          	srli	a3,a4,0x28
    80002398:	00d782a3          	sb	a3,5(a5)
    8000239c:	03075693          	srli	a3,a4,0x30
    800023a0:	00d78323          	sb	a3,6(a5)
    800023a4:	03875713          	srli	a4,a4,0x38
    800023a8:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    800023ac:	00978423          	sb	s1,8(a5)
    800023b0:	0084d713          	srli	a4,s1,0x8
    800023b4:	00e784a3          	sb	a4,9(a5)
    800023b8:	0104d713          	srli	a4,s1,0x10
    800023bc:	00e78523          	sb	a4,10(a5)
    800023c0:	0184d71b          	srliw	a4,s1,0x18
    800023c4:	00e785a3          	sb	a4,11(a5)
    800023c8:	0204d713          	srli	a4,s1,0x20
    800023cc:	00e78623          	sb	a4,12(a5)
    800023d0:	0284d713          	srli	a4,s1,0x28
    800023d4:	00e786a3          	sb	a4,13(a5)
    800023d8:	0304d713          	srli	a4,s1,0x30
    800023dc:	00e78723          	sb	a4,14(a5)
    800023e0:	0384d713          	srli	a4,s1,0x38
    800023e4:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    800023e8:	0004c703          	lbu	a4,0(s1)
    800023ec:	0014c683          	lbu	a3,1(s1)
    800023f0:	00869693          	slli	a3,a3,0x8
    800023f4:	00e6e6b3          	or	a3,a3,a4
    800023f8:	0024c703          	lbu	a4,2(s1)
    800023fc:	01071713          	slli	a4,a4,0x10
    80002400:	00d766b3          	or	a3,a4,a3
    80002404:	0034c703          	lbu	a4,3(s1)
    80002408:	01871713          	slli	a4,a4,0x18
    8000240c:	00d76733          	or	a4,a4,a3
    80002410:	0044c683          	lbu	a3,4(s1)
    80002414:	02069693          	slli	a3,a3,0x20
    80002418:	00e6e733          	or	a4,a3,a4
    8000241c:	0054c683          	lbu	a3,5(s1)
    80002420:	02869693          	slli	a3,a3,0x28
    80002424:	00e6e6b3          	or	a3,a3,a4
    80002428:	0064c703          	lbu	a4,6(s1)
    8000242c:	03071713          	slli	a4,a4,0x30
    80002430:	00d766b3          	or	a3,a4,a3
    80002434:	0074c703          	lbu	a4,7(s1)
    80002438:	03871713          	slli	a4,a4,0x38
    8000243c:	00d76733          	or	a4,a4,a3
    80002440:	04070063          	beqz	a4,80002480 <_ZN11HeapManager12heapAllocateEm+0x364>
                    pCurrent->pNext->pPrev = pNew;
    80002444:	00f70423          	sb	a5,8(a4)
    80002448:	0087d693          	srli	a3,a5,0x8
    8000244c:	00d704a3          	sb	a3,9(a4)
    80002450:	0107d693          	srli	a3,a5,0x10
    80002454:	00d70523          	sb	a3,10(a4)
    80002458:	0187d69b          	srliw	a3,a5,0x18
    8000245c:	00d705a3          	sb	a3,11(a4)
    80002460:	0207d693          	srli	a3,a5,0x20
    80002464:	00d70623          	sb	a3,12(a4)
    80002468:	0287d693          	srli	a3,a5,0x28
    8000246c:	00d706a3          	sb	a3,13(a4)
    80002470:	0307d693          	srli	a3,a5,0x30
    80002474:	00d70723          	sb	a3,14(a4)
    80002478:	0387d693          	srli	a3,a5,0x38
    8000247c:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80002480:	00f48023          	sb	a5,0(s1)
    80002484:	0087d713          	srli	a4,a5,0x8
    80002488:	00e480a3          	sb	a4,1(s1)
    8000248c:	0107d713          	srli	a4,a5,0x10
    80002490:	00e48123          	sb	a4,2(s1)
    80002494:	0187d71b          	srliw	a4,a5,0x18
    80002498:	00e481a3          	sb	a4,3(s1)
    8000249c:	0207d713          	srli	a4,a5,0x20
    800024a0:	00e48223          	sb	a4,4(s1)
    800024a4:	0287d713          	srli	a4,a5,0x28
    800024a8:	00e482a3          	sb	a4,5(s1)
    800024ac:	0307d713          	srli	a4,a5,0x30
    800024b0:	00e48323          	sb	a4,6(s1)
    800024b4:	0387d793          	srli	a5,a5,0x38
    800024b8:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    800024bc:	01248823          	sb	s2,16(s1)
    800024c0:	00895793          	srli	a5,s2,0x8
    800024c4:	00f488a3          	sb	a5,17(s1)
    800024c8:	01095793          	srli	a5,s2,0x10
    800024cc:	00f48923          	sb	a5,18(s1)
    800024d0:	0189579b          	srliw	a5,s2,0x18
    800024d4:	00f489a3          	sb	a5,19(s1)
    800024d8:	02095793          	srli	a5,s2,0x20
    800024dc:	00f48a23          	sb	a5,20(s1)
    800024e0:	02895793          	srli	a5,s2,0x28
    800024e4:	00f48aa3          	sb	a5,21(s1)
    800024e8:	03095793          	srli	a5,s2,0x30
    800024ec:	00f48b23          	sb	a5,22(s1)
    800024f0:	03895913          	srli	s2,s2,0x38
    800024f4:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    800024f8:	0009b783          	ld	a5,0(s3)
    800024fc:	20978863          	beq	a5,s1,8000270c <_ZN11HeapManager12heapAllocateEm+0x5f0>
            if(pCurrent == m_pTail){
    80002500:	0089b783          	ld	a5,8(s3)
    80002504:	26978463          	beq	a5,s1,8000276c <_ZN11HeapManager12heapAllocateEm+0x650>
            if(pCurrent->pPrev != 0){
    80002508:	0084c783          	lbu	a5,8(s1)
    8000250c:	0094c703          	lbu	a4,9(s1)
    80002510:	00871713          	slli	a4,a4,0x8
    80002514:	00f76733          	or	a4,a4,a5
    80002518:	00a4c783          	lbu	a5,10(s1)
    8000251c:	01079793          	slli	a5,a5,0x10
    80002520:	00e7e733          	or	a4,a5,a4
    80002524:	00b4c783          	lbu	a5,11(s1)
    80002528:	01879793          	slli	a5,a5,0x18
    8000252c:	00e7e7b3          	or	a5,a5,a4
    80002530:	00c4c703          	lbu	a4,12(s1)
    80002534:	02071713          	slli	a4,a4,0x20
    80002538:	00f767b3          	or	a5,a4,a5
    8000253c:	00d4c703          	lbu	a4,13(s1)
    80002540:	02871713          	slli	a4,a4,0x28
    80002544:	00f76733          	or	a4,a4,a5
    80002548:	00e4c783          	lbu	a5,14(s1)
    8000254c:	03079793          	slli	a5,a5,0x30
    80002550:	00e7e733          	or	a4,a5,a4
    80002554:	00f4c783          	lbu	a5,15(s1)
    80002558:	03879793          	slli	a5,a5,0x38
    8000255c:	00e7e7b3          	or	a5,a5,a4
    80002560:	08078c63          	beqz	a5,800025f8 <_ZN11HeapManager12heapAllocateEm+0x4dc>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80002564:	0004c703          	lbu	a4,0(s1)
    80002568:	0014c683          	lbu	a3,1(s1)
    8000256c:	00869693          	slli	a3,a3,0x8
    80002570:	00e6e733          	or	a4,a3,a4
    80002574:	0024c683          	lbu	a3,2(s1)
    80002578:	01069693          	slli	a3,a3,0x10
    8000257c:	00e6e6b3          	or	a3,a3,a4
    80002580:	0034c703          	lbu	a4,3(s1)
    80002584:	01871713          	slli	a4,a4,0x18
    80002588:	00d766b3          	or	a3,a4,a3
    8000258c:	0044c703          	lbu	a4,4(s1)
    80002590:	02071713          	slli	a4,a4,0x20
    80002594:	00d76733          	or	a4,a4,a3
    80002598:	0054c683          	lbu	a3,5(s1)
    8000259c:	02869693          	slli	a3,a3,0x28
    800025a0:	00e6e733          	or	a4,a3,a4
    800025a4:	0064c683          	lbu	a3,6(s1)
    800025a8:	03069693          	slli	a3,a3,0x30
    800025ac:	00e6e6b3          	or	a3,a3,a4
    800025b0:	0074c703          	lbu	a4,7(s1)
    800025b4:	03871713          	slli	a4,a4,0x38
    800025b8:	00d76733          	or	a4,a4,a3
    800025bc:	00d78023          	sb	a3,0(a5)
    800025c0:	00875693          	srli	a3,a4,0x8
    800025c4:	00d780a3          	sb	a3,1(a5)
    800025c8:	01075693          	srli	a3,a4,0x10
    800025cc:	00d78123          	sb	a3,2(a5)
    800025d0:	0187569b          	srliw	a3,a4,0x18
    800025d4:	00d781a3          	sb	a3,3(a5)
    800025d8:	02075693          	srli	a3,a4,0x20
    800025dc:	00d78223          	sb	a3,4(a5)
    800025e0:	02875693          	srli	a3,a4,0x28
    800025e4:	00d782a3          	sb	a3,5(a5)
    800025e8:	03075693          	srli	a3,a4,0x30
    800025ec:	00d78323          	sb	a3,6(a5)
    800025f0:	03875713          	srli	a4,a4,0x38
    800025f4:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    800025f8:	0004c783          	lbu	a5,0(s1)
    800025fc:	0014c703          	lbu	a4,1(s1)
    80002600:	00871713          	slli	a4,a4,0x8
    80002604:	00f76733          	or	a4,a4,a5
    80002608:	0024c783          	lbu	a5,2(s1)
    8000260c:	01079793          	slli	a5,a5,0x10
    80002610:	00e7e733          	or	a4,a5,a4
    80002614:	0034c783          	lbu	a5,3(s1)
    80002618:	01879793          	slli	a5,a5,0x18
    8000261c:	00e7e7b3          	or	a5,a5,a4
    80002620:	0044c703          	lbu	a4,4(s1)
    80002624:	02071713          	slli	a4,a4,0x20
    80002628:	00f767b3          	or	a5,a4,a5
    8000262c:	0054c703          	lbu	a4,5(s1)
    80002630:	02871713          	slli	a4,a4,0x28
    80002634:	00f76733          	or	a4,a4,a5
    80002638:	0064c783          	lbu	a5,6(s1)
    8000263c:	03079793          	slli	a5,a5,0x30
    80002640:	00e7e733          	or	a4,a5,a4
    80002644:	0074c783          	lbu	a5,7(s1)
    80002648:	03879793          	slli	a5,a5,0x38
    8000264c:	00e7e7b3          	or	a5,a5,a4
    80002650:	08078c63          	beqz	a5,800026e8 <_ZN11HeapManager12heapAllocateEm+0x5cc>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80002654:	0084c703          	lbu	a4,8(s1)
    80002658:	0094c683          	lbu	a3,9(s1)
    8000265c:	00869693          	slli	a3,a3,0x8
    80002660:	00e6e733          	or	a4,a3,a4
    80002664:	00a4c683          	lbu	a3,10(s1)
    80002668:	01069693          	slli	a3,a3,0x10
    8000266c:	00e6e6b3          	or	a3,a3,a4
    80002670:	00b4c703          	lbu	a4,11(s1)
    80002674:	01871713          	slli	a4,a4,0x18
    80002678:	00d766b3          	or	a3,a4,a3
    8000267c:	00c4c703          	lbu	a4,12(s1)
    80002680:	02071713          	slli	a4,a4,0x20
    80002684:	00d76733          	or	a4,a4,a3
    80002688:	00d4c683          	lbu	a3,13(s1)
    8000268c:	02869693          	slli	a3,a3,0x28
    80002690:	00e6e733          	or	a4,a3,a4
    80002694:	00e4c683          	lbu	a3,14(s1)
    80002698:	03069693          	slli	a3,a3,0x30
    8000269c:	00e6e6b3          	or	a3,a3,a4
    800026a0:	00f4c703          	lbu	a4,15(s1)
    800026a4:	03871713          	slli	a4,a4,0x38
    800026a8:	00d76733          	or	a4,a4,a3
    800026ac:	00d78423          	sb	a3,8(a5)
    800026b0:	00875693          	srli	a3,a4,0x8
    800026b4:	00d784a3          	sb	a3,9(a5)
    800026b8:	01075693          	srli	a3,a4,0x10
    800026bc:	00d78523          	sb	a3,10(a5)
    800026c0:	0187569b          	srliw	a3,a4,0x18
    800026c4:	00d785a3          	sb	a3,11(a5)
    800026c8:	02075693          	srli	a3,a4,0x20
    800026cc:	00d78623          	sb	a3,12(a5)
    800026d0:	02875693          	srli	a3,a4,0x28
    800026d4:	00d786a3          	sb	a3,13(a5)
    800026d8:	03075693          	srli	a3,a4,0x30
    800026dc:	00d78723          	sb	a3,14(a5)
    800026e0:	03875713          	srli	a4,a4,0x38
    800026e4:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    800026e8:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    800026ec:	00048513          	mv	a0,s1
    800026f0:	02813083          	ld	ra,40(sp)
    800026f4:	02013403          	ld	s0,32(sp)
    800026f8:	01813483          	ld	s1,24(sp)
    800026fc:	01013903          	ld	s2,16(sp)
    80002700:	00813983          	ld	s3,8(sp)
    80002704:	03010113          	addi	sp,sp,48
    80002708:	00008067          	ret
                m_pHead = pCurrent->pNext;
    8000270c:	0004c703          	lbu	a4,0(s1)
    80002710:	0014c783          	lbu	a5,1(s1)
    80002714:	00879793          	slli	a5,a5,0x8
    80002718:	00e7e7b3          	or	a5,a5,a4
    8000271c:	0024c703          	lbu	a4,2(s1)
    80002720:	01071713          	slli	a4,a4,0x10
    80002724:	00f76733          	or	a4,a4,a5
    80002728:	0034c783          	lbu	a5,3(s1)
    8000272c:	01879793          	slli	a5,a5,0x18
    80002730:	00e7e733          	or	a4,a5,a4
    80002734:	0044c783          	lbu	a5,4(s1)
    80002738:	02079793          	slli	a5,a5,0x20
    8000273c:	00e7e7b3          	or	a5,a5,a4
    80002740:	0054c703          	lbu	a4,5(s1)
    80002744:	02871713          	slli	a4,a4,0x28
    80002748:	00f76733          	or	a4,a4,a5
    8000274c:	0064c783          	lbu	a5,6(s1)
    80002750:	03079793          	slli	a5,a5,0x30
    80002754:	00e7e733          	or	a4,a5,a4
    80002758:	0074c783          	lbu	a5,7(s1)
    8000275c:	03879793          	slli	a5,a5,0x38
    80002760:	00e7e7b3          	or	a5,a5,a4
    80002764:	00f9b023          	sd	a5,0(s3)
    80002768:	d99ff06f          	j	80002500 <_ZN11HeapManager12heapAllocateEm+0x3e4>
                m_pTail = pCurrent->pPrev;
    8000276c:	0084c703          	lbu	a4,8(s1)
    80002770:	0094c783          	lbu	a5,9(s1)
    80002774:	00879793          	slli	a5,a5,0x8
    80002778:	00e7e7b3          	or	a5,a5,a4
    8000277c:	00a4c703          	lbu	a4,10(s1)
    80002780:	01071713          	slli	a4,a4,0x10
    80002784:	00f76733          	or	a4,a4,a5
    80002788:	00b4c783          	lbu	a5,11(s1)
    8000278c:	01879793          	slli	a5,a5,0x18
    80002790:	00e7e733          	or	a4,a5,a4
    80002794:	00c4c783          	lbu	a5,12(s1)
    80002798:	02079793          	slli	a5,a5,0x20
    8000279c:	00e7e7b3          	or	a5,a5,a4
    800027a0:	00d4c703          	lbu	a4,13(s1)
    800027a4:	02871713          	slli	a4,a4,0x28
    800027a8:	00f76733          	or	a4,a4,a5
    800027ac:	00e4c783          	lbu	a5,14(s1)
    800027b0:	03079793          	slli	a5,a5,0x30
    800027b4:	00e7e733          	or	a4,a5,a4
    800027b8:	00f4c783          	lbu	a5,15(s1)
    800027bc:	03879793          	slli	a5,a5,0x38
    800027c0:	00e7e7b3          	or	a5,a5,a4
    800027c4:	00f9b423          	sd	a5,8(s3)
    800027c8:	d41ff06f          	j	80002508 <_ZN11HeapManager12heapAllocateEm+0x3ec>

00000000800027cc <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    800027cc:	fc010113          	addi	sp,sp,-64
    800027d0:	02113c23          	sd	ra,56(sp)
    800027d4:	02813823          	sd	s0,48(sp)
    800027d8:	02913423          	sd	s1,40(sp)
    800027dc:	03213023          	sd	s2,32(sp)
    800027e0:	01313c23          	sd	s3,24(sp)
    800027e4:	01413823          	sd	s4,16(sp)
    800027e8:	01513423          	sd	s5,8(sp)
    800027ec:	04010413          	addi	s0,sp,64
    800027f0:	00050a93          	mv	s5,a0
    800027f4:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    800027f8:	fc058913          	addi	s2,a1,-64
    800027fc:	00090993          	mv	s3,s2
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80002800:	01894783          	lbu	a5,24(s2)
    80002804:	01994703          	lbu	a4,25(s2)
    80002808:	00871713          	slli	a4,a4,0x8
    8000280c:	00f76733          	or	a4,a4,a5
    80002810:	01a94783          	lbu	a5,26(s2)
    80002814:	01079793          	slli	a5,a5,0x10
    80002818:	00e7e733          	or	a4,a5,a4
    8000281c:	01b94783          	lbu	a5,27(s2)
    80002820:	01879793          	slli	a5,a5,0x18
    80002824:	00e7e7b3          	or	a5,a5,a4
    80002828:	0007879b          	sext.w	a5,a5
    8000282c:	deadc737          	lui	a4,0xdeadc
    80002830:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead432e>
    80002834:	00e79663          	bne	a5,a4,80002840 <_ZN11HeapManager8heapFreeEPv+0x74>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80002838:	000ab483          	ld	s1,0(s5)
    8000283c:	0740006f          	j	800028b0 <_ZN11HeapManager8heapFreeEPv+0xe4>
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80002840:	05700593          	li	a1,87
    80002844:	00003517          	auipc	a0,0x3
    80002848:	7dc50513          	addi	a0,a0,2012 # 80006020 <CONSOLE_STATUS+0x10>
    8000284c:	fffff097          	auipc	ra,0xfffff
    80002850:	cf0080e7          	jalr	-784(ra) # 8000153c <_Z13assert_failedPKci>
    80002854:	fe5ff06f          	j	80002838 <_ZN11HeapManager8heapFreeEPv+0x6c>
    while(pInsert != 0 && pInsert < pFree){
        assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
        pInsert = pInsert->pNext;
    80002858:	0004c703          	lbu	a4,0(s1)
    8000285c:	0014c783          	lbu	a5,1(s1)
    80002860:	00879793          	slli	a5,a5,0x8
    80002864:	00e7e733          	or	a4,a5,a4
    80002868:	0024c783          	lbu	a5,2(s1)
    8000286c:	01079793          	slli	a5,a5,0x10
    80002870:	00e7e7b3          	or	a5,a5,a4
    80002874:	0034c703          	lbu	a4,3(s1)
    80002878:	01871713          	slli	a4,a4,0x18
    8000287c:	00f767b3          	or	a5,a4,a5
    80002880:	0044c703          	lbu	a4,4(s1)
    80002884:	02071713          	slli	a4,a4,0x20
    80002888:	00f76733          	or	a4,a4,a5
    8000288c:	0054c783          	lbu	a5,5(s1)
    80002890:	02879793          	slli	a5,a5,0x28
    80002894:	00e7e733          	or	a4,a5,a4
    80002898:	0064c783          	lbu	a5,6(s1)
    8000289c:	03079793          	slli	a5,a5,0x30
    800028a0:	00e7e7b3          	or	a5,a5,a4
    800028a4:	0074c483          	lbu	s1,7(s1)
    800028a8:	03849493          	slli	s1,s1,0x38
    800028ac:	00f4e4b3          	or	s1,s1,a5
    while(pInsert != 0 && pInsert < pFree){
    800028b0:	04048c63          	beqz	s1,80002908 <_ZN11HeapManager8heapFreeEPv+0x13c>
    800028b4:	0534fa63          	bgeu	s1,s3,80002908 <_ZN11HeapManager8heapFreeEPv+0x13c>
        assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    800028b8:	0184c783          	lbu	a5,24(s1)
    800028bc:	0194c703          	lbu	a4,25(s1)
    800028c0:	00871713          	slli	a4,a4,0x8
    800028c4:	00f76733          	or	a4,a4,a5
    800028c8:	01a4c783          	lbu	a5,26(s1)
    800028cc:	01079793          	slli	a5,a5,0x10
    800028d0:	00e7e733          	or	a4,a5,a4
    800028d4:	01b4c783          	lbu	a5,27(s1)
    800028d8:	01879793          	slli	a5,a5,0x18
    800028dc:	00e7e7b3          	or	a5,a5,a4
    800028e0:	0007879b          	sext.w	a5,a5
    800028e4:	deadc737          	lui	a4,0xdeadc
    800028e8:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead432e>
    800028ec:	f6e786e3          	beq	a5,a4,80002858 <_ZN11HeapManager8heapFreeEPv+0x8c>
    800028f0:	05a00593          	li	a1,90
    800028f4:	00003517          	auipc	a0,0x3
    800028f8:	72c50513          	addi	a0,a0,1836 # 80006020 <CONSOLE_STATUS+0x10>
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	c40080e7          	jalr	-960(ra) # 8000153c <_Z13assert_failedPKci>
    80002904:	f55ff06f          	j	80002858 <_ZN11HeapManager8heapFreeEPv+0x8c>
    }
    if(pInsert == 0){
    80002908:	40048863          	beqz	s1,80002d18 <_ZN11HeapManager8heapFreeEPv+0x54c>
        pFree->pPrev = m_pTail;
        pFree->pNext = 0;
        m_pTail->pNext = pFree;
        m_pTail = pFree;
    }else{
        pFree->pPrev = pInsert->pPrev;
    8000290c:	0084c783          	lbu	a5,8(s1)
    80002910:	0094c703          	lbu	a4,9(s1)
    80002914:	00871713          	slli	a4,a4,0x8
    80002918:	00f767b3          	or	a5,a4,a5
    8000291c:	00a4c703          	lbu	a4,10(s1)
    80002920:	01071713          	slli	a4,a4,0x10
    80002924:	00f76733          	or	a4,a4,a5
    80002928:	00b4c783          	lbu	a5,11(s1)
    8000292c:	01879793          	slli	a5,a5,0x18
    80002930:	00e7e733          	or	a4,a5,a4
    80002934:	00c4c783          	lbu	a5,12(s1)
    80002938:	02079793          	slli	a5,a5,0x20
    8000293c:	00e7e7b3          	or	a5,a5,a4
    80002940:	00d4c703          	lbu	a4,13(s1)
    80002944:	02871713          	slli	a4,a4,0x28
    80002948:	00f767b3          	or	a5,a4,a5
    8000294c:	00e4c703          	lbu	a4,14(s1)
    80002950:	03071713          	slli	a4,a4,0x30
    80002954:	00f76733          	or	a4,a4,a5
    80002958:	00f4c783          	lbu	a5,15(s1)
    8000295c:	03879793          	slli	a5,a5,0x38
    80002960:	00e7e7b3          	or	a5,a5,a4
    80002964:	00e90423          	sb	a4,8(s2)
    80002968:	0087d713          	srli	a4,a5,0x8
    8000296c:	00e904a3          	sb	a4,9(s2)
    80002970:	0107d713          	srli	a4,a5,0x10
    80002974:	00e90523          	sb	a4,10(s2)
    80002978:	0187d71b          	srliw	a4,a5,0x18
    8000297c:	00e905a3          	sb	a4,11(s2)
    80002980:	0207d713          	srli	a4,a5,0x20
    80002984:	00e90623          	sb	a4,12(s2)
    80002988:	0287d713          	srli	a4,a5,0x28
    8000298c:	00e906a3          	sb	a4,13(s2)
    80002990:	0307d713          	srli	a4,a5,0x30
    80002994:	00e90723          	sb	a4,14(s2)
    80002998:	0387d793          	srli	a5,a5,0x38
    8000299c:	00f907a3          	sb	a5,15(s2)
        pFree->pNext = pInsert;
    800029a0:	fc9a0023          	sb	s1,-64(s4)
    800029a4:	0084d793          	srli	a5,s1,0x8
    800029a8:	00f900a3          	sb	a5,1(s2)
    800029ac:	0104d793          	srli	a5,s1,0x10
    800029b0:	00f90123          	sb	a5,2(s2)
    800029b4:	0184d79b          	srliw	a5,s1,0x18
    800029b8:	00f901a3          	sb	a5,3(s2)
    800029bc:	0204d793          	srli	a5,s1,0x20
    800029c0:	00f90223          	sb	a5,4(s2)
    800029c4:	0284d793          	srli	a5,s1,0x28
    800029c8:	00f902a3          	sb	a5,5(s2)
    800029cc:	0304d793          	srli	a5,s1,0x30
    800029d0:	00f90323          	sb	a5,6(s2)
    800029d4:	0384d793          	srli	a5,s1,0x38
    800029d8:	00f903a3          	sb	a5,7(s2)
        if(pInsert->pPrev != 0){
    800029dc:	0084c783          	lbu	a5,8(s1)
    800029e0:	0094c703          	lbu	a4,9(s1)
    800029e4:	00871713          	slli	a4,a4,0x8
    800029e8:	00f76733          	or	a4,a4,a5
    800029ec:	00a4c783          	lbu	a5,10(s1)
    800029f0:	01079793          	slli	a5,a5,0x10
    800029f4:	00e7e733          	or	a4,a5,a4
    800029f8:	00b4c783          	lbu	a5,11(s1)
    800029fc:	01879793          	slli	a5,a5,0x18
    80002a00:	00e7e7b3          	or	a5,a5,a4
    80002a04:	00c4c703          	lbu	a4,12(s1)
    80002a08:	02071713          	slli	a4,a4,0x20
    80002a0c:	00f767b3          	or	a5,a4,a5
    80002a10:	00d4c703          	lbu	a4,13(s1)
    80002a14:	02871713          	slli	a4,a4,0x28
    80002a18:	00f76733          	or	a4,a4,a5
    80002a1c:	00e4c783          	lbu	a5,14(s1)
    80002a20:	03079793          	slli	a5,a5,0x30
    80002a24:	00e7e733          	or	a4,a5,a4
    80002a28:	00f4c783          	lbu	a5,15(s1)
    80002a2c:	03879793          	slli	a5,a5,0x38
    80002a30:	00e7e7b3          	or	a5,a5,a4
    80002a34:	04078063          	beqz	a5,80002a74 <_ZN11HeapManager8heapFreeEPv+0x2a8>
            pInsert->pPrev->pNext = pFree;
    80002a38:	01278023          	sb	s2,0(a5)
    80002a3c:	00895713          	srli	a4,s2,0x8
    80002a40:	00e780a3          	sb	a4,1(a5)
    80002a44:	01095713          	srli	a4,s2,0x10
    80002a48:	00e78123          	sb	a4,2(a5)
    80002a4c:	0189571b          	srliw	a4,s2,0x18
    80002a50:	00e781a3          	sb	a4,3(a5)
    80002a54:	02095713          	srli	a4,s2,0x20
    80002a58:	00e78223          	sb	a4,4(a5)
    80002a5c:	02895713          	srli	a4,s2,0x28
    80002a60:	00e782a3          	sb	a4,5(a5)
    80002a64:	03095713          	srli	a4,s2,0x30
    80002a68:	00e78323          	sb	a4,6(a5)
    80002a6c:	03895713          	srli	a4,s2,0x38
    80002a70:	00e783a3          	sb	a4,7(a5)
        }
        pInsert->pPrev = pFree;
    80002a74:	01248423          	sb	s2,8(s1)
    80002a78:	00895793          	srli	a5,s2,0x8
    80002a7c:	00f484a3          	sb	a5,9(s1)
    80002a80:	01095793          	srli	a5,s2,0x10
    80002a84:	00f48523          	sb	a5,10(s1)
    80002a88:	0189579b          	srliw	a5,s2,0x18
    80002a8c:	00f485a3          	sb	a5,11(s1)
    80002a90:	02095793          	srli	a5,s2,0x20
    80002a94:	00f48623          	sb	a5,12(s1)
    80002a98:	02895793          	srli	a5,s2,0x28
    80002a9c:	00f486a3          	sb	a5,13(s1)
    80002aa0:	03095793          	srli	a5,s2,0x30
    80002aa4:	00f48723          	sb	a5,14(s1)
    80002aa8:	03895793          	srli	a5,s2,0x38
    80002aac:	00f487a3          	sb	a5,15(s1)
    }
    if(!pFree->pPrev){
    80002ab0:	00894783          	lbu	a5,8(s2)
    80002ab4:	00994703          	lbu	a4,9(s2)
    80002ab8:	00871713          	slli	a4,a4,0x8
    80002abc:	00f76733          	or	a4,a4,a5
    80002ac0:	00a94783          	lbu	a5,10(s2)
    80002ac4:	01079793          	slli	a5,a5,0x10
    80002ac8:	00e7e733          	or	a4,a5,a4
    80002acc:	00b94783          	lbu	a5,11(s2)
    80002ad0:	01879793          	slli	a5,a5,0x18
    80002ad4:	00e7e7b3          	or	a5,a5,a4
    80002ad8:	00c94703          	lbu	a4,12(s2)
    80002adc:	02071713          	slli	a4,a4,0x20
    80002ae0:	00f767b3          	or	a5,a4,a5
    80002ae4:	00d94703          	lbu	a4,13(s2)
    80002ae8:	02871713          	slli	a4,a4,0x28
    80002aec:	00f76733          	or	a4,a4,a5
    80002af0:	00e94783          	lbu	a5,14(s2)
    80002af4:	03079793          	slli	a5,a5,0x30
    80002af8:	00e7e733          	or	a4,a5,a4
    80002afc:	00f94783          	lbu	a5,15(s2)
    80002b00:	03879793          	slli	a5,a5,0x38
    80002b04:	00e7e7b3          	or	a5,a5,a4
    80002b08:	2a078c63          	beqz	a5,80002dc0 <_ZN11HeapManager8heapFreeEPv+0x5f4>
        m_pHead = pFree;
    }
    if(!pFree->pNext){
    80002b0c:	fc0a4783          	lbu	a5,-64(s4)
    80002b10:	00194703          	lbu	a4,1(s2)
    80002b14:	00871713          	slli	a4,a4,0x8
    80002b18:	00f76733          	or	a4,a4,a5
    80002b1c:	00294783          	lbu	a5,2(s2)
    80002b20:	01079793          	slli	a5,a5,0x10
    80002b24:	00e7e733          	or	a4,a5,a4
    80002b28:	00394783          	lbu	a5,3(s2)
    80002b2c:	01879793          	slli	a5,a5,0x18
    80002b30:	00e7e7b3          	or	a5,a5,a4
    80002b34:	00494703          	lbu	a4,4(s2)
    80002b38:	02071713          	slli	a4,a4,0x20
    80002b3c:	00f767b3          	or	a5,a4,a5
    80002b40:	00594703          	lbu	a4,5(s2)
    80002b44:	02871713          	slli	a4,a4,0x28
    80002b48:	00f76733          	or	a4,a4,a5
    80002b4c:	00694783          	lbu	a5,6(s2)
    80002b50:	03079793          	slli	a5,a5,0x30
    80002b54:	00e7e733          	or	a4,a5,a4
    80002b58:	00794783          	lbu	a5,7(s2)
    80002b5c:	03879793          	slli	a5,a5,0x38
    80002b60:	00e7e7b3          	or	a5,a5,a4
    80002b64:	26078263          	beqz	a5,80002dc8 <_ZN11HeapManager8heapFreeEPv+0x5fc>
        m_pTail = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uintptr_t>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree)){
    80002b68:	00894783          	lbu	a5,8(s2)
    80002b6c:	00994703          	lbu	a4,9(s2)
    80002b70:	00871713          	slli	a4,a4,0x8
    80002b74:	00f76733          	or	a4,a4,a5
    80002b78:	00a94783          	lbu	a5,10(s2)
    80002b7c:	01079793          	slli	a5,a5,0x10
    80002b80:	00e7e733          	or	a4,a5,a4
    80002b84:	00b94783          	lbu	a5,11(s2)
    80002b88:	01879793          	slli	a5,a5,0x18
    80002b8c:	00e7e7b3          	or	a5,a5,a4
    80002b90:	00c94703          	lbu	a4,12(s2)
    80002b94:	02071713          	slli	a4,a4,0x20
    80002b98:	00f767b3          	or	a5,a4,a5
    80002b9c:	00d94703          	lbu	a4,13(s2)
    80002ba0:	02871713          	slli	a4,a4,0x28
    80002ba4:	00f76733          	or	a4,a4,a5
    80002ba8:	00e94783          	lbu	a5,14(s2)
    80002bac:	03079793          	slli	a5,a5,0x30
    80002bb0:	00e7e733          	or	a4,a5,a4
    80002bb4:	00f94783          	lbu	a5,15(s2)
    80002bb8:	03879793          	slli	a5,a5,0x38
    80002bbc:	00e7e7b3          	or	a5,a5,a4
    80002bc0:	06078663          	beqz	a5,80002c2c <_ZN11HeapManager8heapFreeEPv+0x460>
    80002bc4:	0107c703          	lbu	a4,16(a5)
    80002bc8:	0117c683          	lbu	a3,17(a5)
    80002bcc:	00869693          	slli	a3,a3,0x8
    80002bd0:	00e6e6b3          	or	a3,a3,a4
    80002bd4:	0127c703          	lbu	a4,18(a5)
    80002bd8:	01071713          	slli	a4,a4,0x10
    80002bdc:	00d766b3          	or	a3,a4,a3
    80002be0:	0137c703          	lbu	a4,19(a5)
    80002be4:	01871713          	slli	a4,a4,0x18
    80002be8:	00d76733          	or	a4,a4,a3
    80002bec:	0147c683          	lbu	a3,20(a5)
    80002bf0:	02069693          	slli	a3,a3,0x20
    80002bf4:	00e6e733          	or	a4,a3,a4
    80002bf8:	0157c683          	lbu	a3,21(a5)
    80002bfc:	02869693          	slli	a3,a3,0x28
    80002c00:	00e6e6b3          	or	a3,a3,a4
    80002c04:	0167c703          	lbu	a4,22(a5)
    80002c08:	03071713          	slli	a4,a4,0x30
    80002c0c:	00d766b3          	or	a3,a4,a3
    80002c10:	0177c703          	lbu	a4,23(a5)
    80002c14:	03871713          	slli	a4,a4,0x38
    80002c18:	00d76733          	or	a4,a4,a3
    80002c1c:	00170693          	addi	a3,a4,1
    80002c20:	00669693          	slli	a3,a3,0x6
    80002c24:	00d786b3          	add	a3,a5,a3
    80002c28:	1ad90463          	beq	s2,a3,80002dd0 <_ZN11HeapManager8heapFreeEPv+0x604>
            m_pTail = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uintptr_t>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree->pNext)){
    80002c2c:	0009c783          	lbu	a5,0(s3)
    80002c30:	0019c703          	lbu	a4,1(s3)
    80002c34:	00871713          	slli	a4,a4,0x8
    80002c38:	00f76733          	or	a4,a4,a5
    80002c3c:	0029c783          	lbu	a5,2(s3)
    80002c40:	01079793          	slli	a5,a5,0x10
    80002c44:	00e7e733          	or	a4,a5,a4
    80002c48:	0039c783          	lbu	a5,3(s3)
    80002c4c:	01879793          	slli	a5,a5,0x18
    80002c50:	00e7e7b3          	or	a5,a5,a4
    80002c54:	0049c703          	lbu	a4,4(s3)
    80002c58:	02071713          	slli	a4,a4,0x20
    80002c5c:	00f767b3          	or	a5,a4,a5
    80002c60:	0059c703          	lbu	a4,5(s3)
    80002c64:	02871713          	slli	a4,a4,0x28
    80002c68:	00f76733          	or	a4,a4,a5
    80002c6c:	0069c783          	lbu	a5,6(s3)
    80002c70:	03079793          	slli	a5,a5,0x30
    80002c74:	00e7e733          	or	a4,a5,a4
    80002c78:	0079c783          	lbu	a5,7(s3)
    80002c7c:	03879793          	slli	a5,a5,0x38
    80002c80:	00e7e7b3          	or	a5,a5,a4
    80002c84:	06078663          	beqz	a5,80002cf0 <_ZN11HeapManager8heapFreeEPv+0x524>
    80002c88:	0109c703          	lbu	a4,16(s3)
    80002c8c:	0119c683          	lbu	a3,17(s3)
    80002c90:	00869693          	slli	a3,a3,0x8
    80002c94:	00e6e6b3          	or	a3,a3,a4
    80002c98:	0129c703          	lbu	a4,18(s3)
    80002c9c:	01071713          	slli	a4,a4,0x10
    80002ca0:	00d766b3          	or	a3,a4,a3
    80002ca4:	0139c703          	lbu	a4,19(s3)
    80002ca8:	01871713          	slli	a4,a4,0x18
    80002cac:	00d76733          	or	a4,a4,a3
    80002cb0:	0149c683          	lbu	a3,20(s3)
    80002cb4:	02069693          	slli	a3,a3,0x20
    80002cb8:	00e6e733          	or	a4,a3,a4
    80002cbc:	0159c683          	lbu	a3,21(s3)
    80002cc0:	02869693          	slli	a3,a3,0x28
    80002cc4:	00e6e6b3          	or	a3,a3,a4
    80002cc8:	0169c703          	lbu	a4,22(s3)
    80002ccc:	03071713          	slli	a4,a4,0x30
    80002cd0:	00d766b3          	or	a3,a4,a3
    80002cd4:	0179c703          	lbu	a4,23(s3)
    80002cd8:	03871713          	slli	a4,a4,0x38
    80002cdc:	00d76733          	or	a4,a4,a3
    80002ce0:	00170693          	addi	a3,a4,1
    80002ce4:	00669693          	slli	a3,a3,0x6
    80002ce8:	00d986b3          	add	a3,s3,a3
    80002cec:	40f68c63          	beq	a3,a5,80003104 <_ZN11HeapManager8heapFreeEPv+0x938>
        }else{
            m_pTail = pFree;
        }
    }
    return 0;
}
    80002cf0:	00000513          	li	a0,0
    80002cf4:	03813083          	ld	ra,56(sp)
    80002cf8:	03013403          	ld	s0,48(sp)
    80002cfc:	02813483          	ld	s1,40(sp)
    80002d00:	02013903          	ld	s2,32(sp)
    80002d04:	01813983          	ld	s3,24(sp)
    80002d08:	01013a03          	ld	s4,16(sp)
    80002d0c:	00813a83          	ld	s5,8(sp)
    80002d10:	04010113          	addi	sp,sp,64
    80002d14:	00008067          	ret
        pFree->pPrev = m_pTail;
    80002d18:	008ab783          	ld	a5,8(s5)
    80002d1c:	00f90423          	sb	a5,8(s2)
    80002d20:	0087d713          	srli	a4,a5,0x8
    80002d24:	00e904a3          	sb	a4,9(s2)
    80002d28:	0107d713          	srli	a4,a5,0x10
    80002d2c:	00e90523          	sb	a4,10(s2)
    80002d30:	0187d71b          	srliw	a4,a5,0x18
    80002d34:	00e905a3          	sb	a4,11(s2)
    80002d38:	0207d713          	srli	a4,a5,0x20
    80002d3c:	00e90623          	sb	a4,12(s2)
    80002d40:	0287d713          	srli	a4,a5,0x28
    80002d44:	00e906a3          	sb	a4,13(s2)
    80002d48:	0307d713          	srli	a4,a5,0x30
    80002d4c:	00e90723          	sb	a4,14(s2)
    80002d50:	0387d793          	srli	a5,a5,0x38
    80002d54:	00f907a3          	sb	a5,15(s2)
        pFree->pNext = 0;
    80002d58:	fc0a0023          	sb	zero,-64(s4)
    80002d5c:	000900a3          	sb	zero,1(s2)
    80002d60:	00090123          	sb	zero,2(s2)
    80002d64:	000901a3          	sb	zero,3(s2)
    80002d68:	00090223          	sb	zero,4(s2)
    80002d6c:	000902a3          	sb	zero,5(s2)
    80002d70:	00090323          	sb	zero,6(s2)
    80002d74:	000903a3          	sb	zero,7(s2)
        m_pTail->pNext = pFree;
    80002d78:	008ab783          	ld	a5,8(s5)
    80002d7c:	01278023          	sb	s2,0(a5)
    80002d80:	00895713          	srli	a4,s2,0x8
    80002d84:	00e780a3          	sb	a4,1(a5)
    80002d88:	01095713          	srli	a4,s2,0x10
    80002d8c:	00e78123          	sb	a4,2(a5)
    80002d90:	0189571b          	srliw	a4,s2,0x18
    80002d94:	00e781a3          	sb	a4,3(a5)
    80002d98:	02095713          	srli	a4,s2,0x20
    80002d9c:	00e78223          	sb	a4,4(a5)
    80002da0:	02895713          	srli	a4,s2,0x28
    80002da4:	00e782a3          	sb	a4,5(a5)
    80002da8:	03095713          	srli	a4,s2,0x30
    80002dac:	00e78323          	sb	a4,6(a5)
    80002db0:	03895713          	srli	a4,s2,0x38
    80002db4:	00e783a3          	sb	a4,7(a5)
        m_pTail = pFree;
    80002db8:	012ab423          	sd	s2,8(s5)
    80002dbc:	cf5ff06f          	j	80002ab0 <_ZN11HeapManager8heapFreeEPv+0x2e4>
        m_pHead = pFree;
    80002dc0:	012ab023          	sd	s2,0(s5)
    80002dc4:	d49ff06f          	j	80002b0c <_ZN11HeapManager8heapFreeEPv+0x340>
        m_pTail = pFree;
    80002dc8:	012ab423          	sd	s2,8(s5)
    80002dcc:	d9dff06f          	j	80002b68 <_ZN11HeapManager8heapFreeEPv+0x39c>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80002dd0:	01094683          	lbu	a3,16(s2)
    80002dd4:	01194603          	lbu	a2,17(s2)
    80002dd8:	00861613          	slli	a2,a2,0x8
    80002ddc:	00d66633          	or	a2,a2,a3
    80002de0:	01294683          	lbu	a3,18(s2)
    80002de4:	01069693          	slli	a3,a3,0x10
    80002de8:	00c6e633          	or	a2,a3,a2
    80002dec:	01394683          	lbu	a3,19(s2)
    80002df0:	01869693          	slli	a3,a3,0x18
    80002df4:	00c6e6b3          	or	a3,a3,a2
    80002df8:	01494603          	lbu	a2,20(s2)
    80002dfc:	02061613          	slli	a2,a2,0x20
    80002e00:	00d666b3          	or	a3,a2,a3
    80002e04:	01594603          	lbu	a2,21(s2)
    80002e08:	02861613          	slli	a2,a2,0x28
    80002e0c:	00d66633          	or	a2,a2,a3
    80002e10:	01694683          	lbu	a3,22(s2)
    80002e14:	03069693          	slli	a3,a3,0x30
    80002e18:	00c6e633          	or	a2,a3,a2
    80002e1c:	01794683          	lbu	a3,23(s2)
    80002e20:	03869693          	slli	a3,a3,0x38
    80002e24:	00c6e6b3          	or	a3,a3,a2
    80002e28:	00d70733          	add	a4,a4,a3
    80002e2c:	00170713          	addi	a4,a4,1
    80002e30:	00e78823          	sb	a4,16(a5)
    80002e34:	00875693          	srli	a3,a4,0x8
    80002e38:	00d788a3          	sb	a3,17(a5)
    80002e3c:	01075693          	srli	a3,a4,0x10
    80002e40:	00d78923          	sb	a3,18(a5)
    80002e44:	0187569b          	srliw	a3,a4,0x18
    80002e48:	00d789a3          	sb	a3,19(a5)
    80002e4c:	02075693          	srli	a3,a4,0x20
    80002e50:	00d78a23          	sb	a3,20(a5)
    80002e54:	02875693          	srli	a3,a4,0x28
    80002e58:	00d78aa3          	sb	a3,21(a5)
    80002e5c:	03075693          	srli	a3,a4,0x30
    80002e60:	00d78b23          	sb	a3,22(a5)
    80002e64:	03875713          	srli	a4,a4,0x38
    80002e68:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    80002e6c:	00894703          	lbu	a4,8(s2)
    80002e70:	00994783          	lbu	a5,9(s2)
    80002e74:	00879793          	slli	a5,a5,0x8
    80002e78:	00e7e7b3          	or	a5,a5,a4
    80002e7c:	00a94703          	lbu	a4,10(s2)
    80002e80:	01071713          	slli	a4,a4,0x10
    80002e84:	00f767b3          	or	a5,a4,a5
    80002e88:	00b94703          	lbu	a4,11(s2)
    80002e8c:	01871713          	slli	a4,a4,0x18
    80002e90:	00f76733          	or	a4,a4,a5
    80002e94:	00c94783          	lbu	a5,12(s2)
    80002e98:	02079793          	slli	a5,a5,0x20
    80002e9c:	00e7e733          	or	a4,a5,a4
    80002ea0:	00d94783          	lbu	a5,13(s2)
    80002ea4:	02879793          	slli	a5,a5,0x28
    80002ea8:	00e7e7b3          	or	a5,a5,a4
    80002eac:	00e94703          	lbu	a4,14(s2)
    80002eb0:	03071713          	slli	a4,a4,0x30
    80002eb4:	00f767b3          	or	a5,a4,a5
    80002eb8:	00f94703          	lbu	a4,15(s2)
    80002ebc:	03871713          	slli	a4,a4,0x38
    80002ec0:	00f76733          	or	a4,a4,a5
    80002ec4:	fc0a4783          	lbu	a5,-64(s4)
    80002ec8:	00194683          	lbu	a3,1(s2)
    80002ecc:	00869693          	slli	a3,a3,0x8
    80002ed0:	00f6e7b3          	or	a5,a3,a5
    80002ed4:	00294683          	lbu	a3,2(s2)
    80002ed8:	01069693          	slli	a3,a3,0x10
    80002edc:	00f6e6b3          	or	a3,a3,a5
    80002ee0:	00394783          	lbu	a5,3(s2)
    80002ee4:	01879793          	slli	a5,a5,0x18
    80002ee8:	00d7e6b3          	or	a3,a5,a3
    80002eec:	00494783          	lbu	a5,4(s2)
    80002ef0:	02079793          	slli	a5,a5,0x20
    80002ef4:	00d7e7b3          	or	a5,a5,a3
    80002ef8:	00594683          	lbu	a3,5(s2)
    80002efc:	02869693          	slli	a3,a3,0x28
    80002f00:	00f6e7b3          	or	a5,a3,a5
    80002f04:	00694683          	lbu	a3,6(s2)
    80002f08:	03069693          	slli	a3,a3,0x30
    80002f0c:	00f6e6b3          	or	a3,a3,a5
    80002f10:	00794783          	lbu	a5,7(s2)
    80002f14:	03879793          	slli	a5,a5,0x38
    80002f18:	00d7e7b3          	or	a5,a5,a3
    80002f1c:	00d70023          	sb	a3,0(a4)
    80002f20:	0087d693          	srli	a3,a5,0x8
    80002f24:	00d700a3          	sb	a3,1(a4)
    80002f28:	0107d693          	srli	a3,a5,0x10
    80002f2c:	00d70123          	sb	a3,2(a4)
    80002f30:	0187d69b          	srliw	a3,a5,0x18
    80002f34:	00d701a3          	sb	a3,3(a4)
    80002f38:	0207d693          	srli	a3,a5,0x20
    80002f3c:	00d70223          	sb	a3,4(a4)
    80002f40:	0287d693          	srli	a3,a5,0x28
    80002f44:	00d702a3          	sb	a3,5(a4)
    80002f48:	0307d693          	srli	a3,a5,0x30
    80002f4c:	00d70323          	sb	a3,6(a4)
    80002f50:	0387d793          	srli	a5,a5,0x38
    80002f54:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    80002f58:	fc0a4783          	lbu	a5,-64(s4)
    80002f5c:	00194703          	lbu	a4,1(s2)
    80002f60:	00871713          	slli	a4,a4,0x8
    80002f64:	00f76733          	or	a4,a4,a5
    80002f68:	00294783          	lbu	a5,2(s2)
    80002f6c:	01079793          	slli	a5,a5,0x10
    80002f70:	00e7e733          	or	a4,a5,a4
    80002f74:	00394783          	lbu	a5,3(s2)
    80002f78:	01879793          	slli	a5,a5,0x18
    80002f7c:	00e7e7b3          	or	a5,a5,a4
    80002f80:	00494703          	lbu	a4,4(s2)
    80002f84:	02071713          	slli	a4,a4,0x20
    80002f88:	00f767b3          	or	a5,a4,a5
    80002f8c:	00594703          	lbu	a4,5(s2)
    80002f90:	02871713          	slli	a4,a4,0x28
    80002f94:	00f76733          	or	a4,a4,a5
    80002f98:	00694783          	lbu	a5,6(s2)
    80002f9c:	03079793          	slli	a5,a5,0x30
    80002fa0:	00e7e733          	or	a4,a5,a4
    80002fa4:	00794783          	lbu	a5,7(s2)
    80002fa8:	03879793          	slli	a5,a5,0x38
    80002fac:	00e7e7b3          	or	a5,a5,a4
    80002fb0:	0e078a63          	beqz	a5,800030a4 <_ZN11HeapManager8heapFreeEPv+0x8d8>
            pFree->pNext->pPrev = pFree->pPrev;
    80002fb4:	00894703          	lbu	a4,8(s2)
    80002fb8:	00994683          	lbu	a3,9(s2)
    80002fbc:	00869693          	slli	a3,a3,0x8
    80002fc0:	00e6e733          	or	a4,a3,a4
    80002fc4:	00a94683          	lbu	a3,10(s2)
    80002fc8:	01069693          	slli	a3,a3,0x10
    80002fcc:	00e6e6b3          	or	a3,a3,a4
    80002fd0:	00b94703          	lbu	a4,11(s2)
    80002fd4:	01871713          	slli	a4,a4,0x18
    80002fd8:	00d766b3          	or	a3,a4,a3
    80002fdc:	00c94703          	lbu	a4,12(s2)
    80002fe0:	02071713          	slli	a4,a4,0x20
    80002fe4:	00d76733          	or	a4,a4,a3
    80002fe8:	00d94683          	lbu	a3,13(s2)
    80002fec:	02869693          	slli	a3,a3,0x28
    80002ff0:	00e6e733          	or	a4,a3,a4
    80002ff4:	00e94683          	lbu	a3,14(s2)
    80002ff8:	03069693          	slli	a3,a3,0x30
    80002ffc:	00e6e6b3          	or	a3,a3,a4
    80003000:	00f94703          	lbu	a4,15(s2)
    80003004:	03871713          	slli	a4,a4,0x38
    80003008:	00d76733          	or	a4,a4,a3
    8000300c:	00d78423          	sb	a3,8(a5)
    80003010:	00875693          	srli	a3,a4,0x8
    80003014:	00d784a3          	sb	a3,9(a5)
    80003018:	01075693          	srli	a3,a4,0x10
    8000301c:	00d78523          	sb	a3,10(a5)
    80003020:	0187569b          	srliw	a3,a4,0x18
    80003024:	00d785a3          	sb	a3,11(a5)
    80003028:	02075693          	srli	a3,a4,0x20
    8000302c:	00d78623          	sb	a3,12(a5)
    80003030:	02875693          	srli	a3,a4,0x28
    80003034:	00d786a3          	sb	a3,13(a5)
    80003038:	03075693          	srli	a3,a4,0x30
    8000303c:	00d78723          	sb	a3,14(a5)
    80003040:	03875713          	srli	a4,a4,0x38
    80003044:	00e787a3          	sb	a4,15(a5)
        pFree = pFree->pPrev;
    80003048:	00894983          	lbu	s3,8(s2)
    8000304c:	00994783          	lbu	a5,9(s2)
    80003050:	00879793          	slli	a5,a5,0x8
    80003054:	0137e7b3          	or	a5,a5,s3
    80003058:	00a94983          	lbu	s3,10(s2)
    8000305c:	01099993          	slli	s3,s3,0x10
    80003060:	00f9e7b3          	or	a5,s3,a5
    80003064:	00b94983          	lbu	s3,11(s2)
    80003068:	01899993          	slli	s3,s3,0x18
    8000306c:	00f9e9b3          	or	s3,s3,a5
    80003070:	00c94783          	lbu	a5,12(s2)
    80003074:	02079793          	slli	a5,a5,0x20
    80003078:	0137e9b3          	or	s3,a5,s3
    8000307c:	00d94783          	lbu	a5,13(s2)
    80003080:	02879793          	slli	a5,a5,0x28
    80003084:	0137e7b3          	or	a5,a5,s3
    80003088:	00e94983          	lbu	s3,14(s2)
    8000308c:	03099993          	slli	s3,s3,0x30
    80003090:	00f9e7b3          	or	a5,s3,a5
    80003094:	00f94983          	lbu	s3,15(s2)
    80003098:	03899993          	slli	s3,s3,0x38
    8000309c:	00f9e9b3          	or	s3,s3,a5
    800030a0:	b8dff06f          	j	80002c2c <_ZN11HeapManager8heapFreeEPv+0x460>
            m_pTail = pFree->pPrev;
    800030a4:	00894703          	lbu	a4,8(s2)
    800030a8:	00994783          	lbu	a5,9(s2)
    800030ac:	00879793          	slli	a5,a5,0x8
    800030b0:	00e7e7b3          	or	a5,a5,a4
    800030b4:	00a94703          	lbu	a4,10(s2)
    800030b8:	01071713          	slli	a4,a4,0x10
    800030bc:	00f76733          	or	a4,a4,a5
    800030c0:	00b94783          	lbu	a5,11(s2)
    800030c4:	01879793          	slli	a5,a5,0x18
    800030c8:	00e7e733          	or	a4,a5,a4
    800030cc:	00c94783          	lbu	a5,12(s2)
    800030d0:	02079793          	slli	a5,a5,0x20
    800030d4:	00e7e7b3          	or	a5,a5,a4
    800030d8:	00d94703          	lbu	a4,13(s2)
    800030dc:	02871713          	slli	a4,a4,0x28
    800030e0:	00f76733          	or	a4,a4,a5
    800030e4:	00e94783          	lbu	a5,14(s2)
    800030e8:	03079793          	slli	a5,a5,0x30
    800030ec:	00e7e733          	or	a4,a5,a4
    800030f0:	00f94783          	lbu	a5,15(s2)
    800030f4:	03879793          	slli	a5,a5,0x38
    800030f8:	00e7e7b3          	or	a5,a5,a4
    800030fc:	00fab423          	sd	a5,8(s5)
    80003100:	f49ff06f          	j	80003048 <_ZN11HeapManager8heapFreeEPv+0x87c>
        pFree->nSize += pFree->pNext->nSize + 1;
    80003104:	0107c683          	lbu	a3,16(a5)
    80003108:	0117c603          	lbu	a2,17(a5)
    8000310c:	00861613          	slli	a2,a2,0x8
    80003110:	00d66633          	or	a2,a2,a3
    80003114:	0127c683          	lbu	a3,18(a5)
    80003118:	01069693          	slli	a3,a3,0x10
    8000311c:	00c6e633          	or	a2,a3,a2
    80003120:	0137c683          	lbu	a3,19(a5)
    80003124:	01869693          	slli	a3,a3,0x18
    80003128:	00c6e6b3          	or	a3,a3,a2
    8000312c:	0147c603          	lbu	a2,20(a5)
    80003130:	02061613          	slli	a2,a2,0x20
    80003134:	00d666b3          	or	a3,a2,a3
    80003138:	0157c603          	lbu	a2,21(a5)
    8000313c:	02861613          	slli	a2,a2,0x28
    80003140:	00d66633          	or	a2,a2,a3
    80003144:	0167c683          	lbu	a3,22(a5)
    80003148:	03069693          	slli	a3,a3,0x30
    8000314c:	00c6e633          	or	a2,a3,a2
    80003150:	0177c683          	lbu	a3,23(a5)
    80003154:	03869693          	slli	a3,a3,0x38
    80003158:	00c6e6b3          	or	a3,a3,a2
    8000315c:	00d70733          	add	a4,a4,a3
    80003160:	00170713          	addi	a4,a4,1
    80003164:	00e98823          	sb	a4,16(s3)
    80003168:	00875693          	srli	a3,a4,0x8
    8000316c:	00d988a3          	sb	a3,17(s3)
    80003170:	01075693          	srli	a3,a4,0x10
    80003174:	00d98923          	sb	a3,18(s3)
    80003178:	0187569b          	srliw	a3,a4,0x18
    8000317c:	00d989a3          	sb	a3,19(s3)
    80003180:	02075693          	srli	a3,a4,0x20
    80003184:	00d98a23          	sb	a3,20(s3)
    80003188:	02875693          	srli	a3,a4,0x28
    8000318c:	00d98aa3          	sb	a3,21(s3)
    80003190:	03075693          	srli	a3,a4,0x30
    80003194:	00d98b23          	sb	a3,22(s3)
    80003198:	03875713          	srli	a4,a4,0x38
    8000319c:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    800031a0:	0007c683          	lbu	a3,0(a5)
    800031a4:	0017c703          	lbu	a4,1(a5)
    800031a8:	00871713          	slli	a4,a4,0x8
    800031ac:	00d766b3          	or	a3,a4,a3
    800031b0:	0027c703          	lbu	a4,2(a5)
    800031b4:	01071713          	slli	a4,a4,0x10
    800031b8:	00d76733          	or	a4,a4,a3
    800031bc:	0037c683          	lbu	a3,3(a5)
    800031c0:	01869693          	slli	a3,a3,0x18
    800031c4:	00e6e733          	or	a4,a3,a4
    800031c8:	0047c683          	lbu	a3,4(a5)
    800031cc:	02069693          	slli	a3,a3,0x20
    800031d0:	00e6e6b3          	or	a3,a3,a4
    800031d4:	0057c703          	lbu	a4,5(a5)
    800031d8:	02871713          	slli	a4,a4,0x28
    800031dc:	00d766b3          	or	a3,a4,a3
    800031e0:	0067c703          	lbu	a4,6(a5)
    800031e4:	03071713          	slli	a4,a4,0x30
    800031e8:	00d76733          	or	a4,a4,a3
    800031ec:	0077c783          	lbu	a5,7(a5)
    800031f0:	03879793          	slli	a5,a5,0x38
    800031f4:	00e7e7b3          	or	a5,a5,a4
    800031f8:	00e98023          	sb	a4,0(s3)
    800031fc:	0087d713          	srli	a4,a5,0x8
    80003200:	00e980a3          	sb	a4,1(s3)
    80003204:	0107d713          	srli	a4,a5,0x10
    80003208:	00e98123          	sb	a4,2(s3)
    8000320c:	0187d71b          	srliw	a4,a5,0x18
    80003210:	00e981a3          	sb	a4,3(s3)
    80003214:	0207d713          	srli	a4,a5,0x20
    80003218:	00e98223          	sb	a4,4(s3)
    8000321c:	0287d713          	srli	a4,a5,0x28
    80003220:	00e982a3          	sb	a4,5(s3)
    80003224:	0307d713          	srli	a4,a5,0x30
    80003228:	00e98323          	sb	a4,6(s3)
    8000322c:	0387d713          	srli	a4,a5,0x38
    80003230:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    80003234:	04078263          	beqz	a5,80003278 <_ZN11HeapManager8heapFreeEPv+0xaac>
            pFree->pNext->pPrev = pFree;
    80003238:	01378423          	sb	s3,8(a5)
    8000323c:	0089d713          	srli	a4,s3,0x8
    80003240:	00e784a3          	sb	a4,9(a5)
    80003244:	0109d713          	srli	a4,s3,0x10
    80003248:	00e78523          	sb	a4,10(a5)
    8000324c:	0189d71b          	srliw	a4,s3,0x18
    80003250:	00e785a3          	sb	a4,11(a5)
    80003254:	0209d713          	srli	a4,s3,0x20
    80003258:	00e78623          	sb	a4,12(a5)
    8000325c:	0289d713          	srli	a4,s3,0x28
    80003260:	00e786a3          	sb	a4,13(a5)
    80003264:	0309d713          	srli	a4,s3,0x30
    80003268:	00e78723          	sb	a4,14(a5)
    8000326c:	0389d993          	srli	s3,s3,0x38
    80003270:	013787a3          	sb	s3,15(a5)
    80003274:	a7dff06f          	j	80002cf0 <_ZN11HeapManager8heapFreeEPv+0x524>
            m_pTail = pFree;
    80003278:	013ab423          	sd	s3,8(s5)
    8000327c:	a75ff06f          	j	80002cf0 <_ZN11HeapManager8heapFreeEPv+0x524>

0000000080003280 <exceptionHandler>:
#include "console.h"
#include "thread.h"
#include "sem.h"


extern "C" void exceptionHandler(){
    80003280:	fc010113          	addi	sp,sp,-64
    80003284:	02113c23          	sd	ra,56(sp)
    80003288:	02813823          	sd	s0,48(sp)
    8000328c:	02913423          	sd	s1,40(sp)
    80003290:	03213023          	sd	s2,32(sp)
    80003294:	01313c23          	sd	s3,24(sp)
    80003298:	01413823          	sd	s4,16(sp)
    8000329c:	01513423          	sd	s5,8(sp)
    800032a0:	04010413          	addi	s0,sp,64

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800032a4:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    800032a8:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800032ac:	141024f3          	csrr	s1,sepc

    uint64 a0 = 0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800032b0:	00050793          	mv	a5,a0
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800032b4:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800032b8:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800032bc:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800032c0:	00070693          	mv	a3,a4
    uint64 returnVal = 0;
    /// check if the exception was a syscall
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){
    800032c4:	ff870713          	addi	a4,a4,-8
    800032c8:	00100693          	li	a3,1
    800032cc:	02e6f463          	bgeu	a3,a4,800032f4 <exceptionHandler+0x74>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, 0x2");
    }
    800032d0:	03813083          	ld	ra,56(sp)
    800032d4:	03013403          	ld	s0,48(sp)
    800032d8:	02813483          	ld	s1,40(sp)
    800032dc:	02013903          	ld	s2,32(sp)
    800032e0:	01813983          	ld	s3,24(sp)
    800032e4:	01013a03          	ld	s4,16(sp)
    800032e8:	00813a83          	ld	s5,8(sp)
    800032ec:	04010113          	addi	sp,sp,64
    800032f0:	00008067          	ret
        switch(a0){
    800032f4:	04200713          	li	a4,66
    800032f8:	14f76463          	bltu	a4,a5,80003440 <exceptionHandler+0x1c0>
    800032fc:	00279793          	slli	a5,a5,0x2
    80003300:	00003717          	auipc	a4,0x3
    80003304:	d3470713          	addi	a4,a4,-716 # 80006034 <CONSOLE_STATUS+0x24>
    80003308:	00e787b3          	add	a5,a5,a4
    8000330c:	0007a783          	lw	a5,0(a5)
    80003310:	00e787b3          	add	a5,a5,a4
    80003314:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80003318:	00098593          	mv	a1,s3
    8000331c:	00003797          	auipc	a5,0x3
    80003320:	79c7b783          	ld	a5,1948(a5) # 80006ab8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003324:	0007b503          	ld	a0,0(a5)
    80003328:	fffff097          	auipc	ra,0xfffff
    8000332c:	df4080e7          	jalr	-524(ra) # 8000211c <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003330:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003334:	00448493          	addi	s1,s1,4
    80003338:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    8000333c:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, 0x2");
    80003340:	14417073          	csrci	sip,2
    80003344:	f8dff06f          	j	800032d0 <exceptionHandler+0x50>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80003348:	00098593          	mv	a1,s3
    8000334c:	00003797          	auipc	a5,0x3
    80003350:	76c7b783          	ld	a5,1900(a5) # 80006ab8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003354:	0007b503          	ld	a0,0(a5)
    80003358:	fffff097          	auipc	ra,0xfffff
    8000335c:	474080e7          	jalr	1140(ra) # 800027cc <_ZN11HeapManager8heapFreeEPv>
                break;
    80003360:	fd1ff06f          	j	80003330 <exceptionHandler+0xb0>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)((uint64)HeapManager::getInstance().heapAllocate(DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE) + DEFAULT_STACK_SIZE - 1));
    80003364:	04000593          	li	a1,64
    80003368:	00003797          	auipc	a5,0x3
    8000336c:	7507b783          	ld	a5,1872(a5) # 80006ab8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003370:	0007b503          	ld	a0,0(a5)
    80003374:	fffff097          	auipc	ra,0xfffff
    80003378:	da8080e7          	jalr	-600(ra) # 8000211c <_ZN11HeapManager12heapAllocateEm>
    8000337c:	00100713          	li	a4,1
    80003380:	000017b7          	lui	a5,0x1
    80003384:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003388:	00f506b3          	add	a3,a0,a5
    8000338c:	000a8613          	mv	a2,s5
    80003390:	000a0593          	mv	a1,s4
    80003394:	00098513          	mv	a0,s3
    80003398:	ffffe097          	auipc	ra,0xffffe
    8000339c:	698080e7          	jalr	1688(ra) # 80001a30 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    800033a0:	f91ff06f          	j	80003330 <exceptionHandler+0xb0>
                returnVal = _thread::currentThread->exit();
    800033a4:	00003797          	auipc	a5,0x3
    800033a8:	7347b783          	ld	a5,1844(a5) # 80006ad8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800033ac:	0007b503          	ld	a0,0(a5)
    800033b0:	fffff097          	auipc	ra,0xfffff
    800033b4:	a60080e7          	jalr	-1440(ra) # 80001e10 <_ZN7_thread4exitEv>
                break;
    800033b8:	f79ff06f          	j	80003330 <exceptionHandler+0xb0>
                _thread::dispatch();
    800033bc:	fffff097          	auipc	ra,0xfffff
    800033c0:	97c080e7          	jalr	-1668(ra) # 80001d38 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    800033c4:	00000513          	li	a0,0
                break;
    800033c8:	f69ff06f          	j	80003330 <exceptionHandler+0xb0>
                _sem::open((sem_t*)a1, unsigned(a2));
    800033cc:	000a059b          	sext.w	a1,s4
    800033d0:	00098513          	mv	a0,s3
    800033d4:	ffffe097          	auipc	ra,0xffffe
    800033d8:	f08080e7          	jalr	-248(ra) # 800012dc <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800033dc:	00000513          	li	a0,0
                break;
    800033e0:	f51ff06f          	j	80003330 <exceptionHandler+0xb0>
                _sem::close((sem_t)a1);
    800033e4:	00098513          	mv	a0,s3
    800033e8:	ffffe097          	auipc	ra,0xffffe
    800033ec:	f24080e7          	jalr	-220(ra) # 8000130c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800033f0:	00000513          	li	a0,0
                break;
    800033f4:	f3dff06f          	j	80003330 <exceptionHandler+0xb0>
                _sem::wait((sem_t)a1);
    800033f8:	00098513          	mv	a0,s3
    800033fc:	ffffe097          	auipc	ra,0xffffe
    80003400:	f70080e7          	jalr	-144(ra) # 8000136c <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80003404:	00000513          	li	a0,0
                break;
    80003408:	f29ff06f          	j	80003330 <exceptionHandler+0xb0>
                _sem::signal((sem_t)a1);
    8000340c:	00098513          	mv	a0,s3
    80003410:	ffffe097          	auipc	ra,0xffffe
    80003414:	000080e7          	jalr	ra # 80001410 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80003418:	00000513          	li	a0,0
                break;
    8000341c:	f15ff06f          	j	80003330 <exceptionHandler+0xb0>
                returnVal = __getc();
    80003420:	00002097          	auipc	ra,0x2
    80003424:	498080e7          	jalr	1176(ra) # 800058b8 <__getc>
                break;
    80003428:	f09ff06f          	j	80003330 <exceptionHandler+0xb0>
                __putc(a1);
    8000342c:	0ff9f513          	andi	a0,s3,255
    80003430:	00002097          	auipc	ra,0x2
    80003434:	44c080e7          	jalr	1100(ra) # 8000587c <__putc>
    uint64 returnVal = 0;
    80003438:	00000513          	li	a0,0
                break;
    8000343c:	ef5ff06f          	j	80003330 <exceptionHandler+0xb0>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){
    80003440:	00000513          	li	a0,0
    80003444:	eedff06f          	j	80003330 <exceptionHandler+0xb0>

0000000080003448 <_ZN9SchedulerC1Ev>:
#include "assert.h"
#include "syscalls_c.h"

Scheduler* Scheduler::singleton = nullptr;

Scheduler::Scheduler(){
    80003448:	fe010113          	addi	sp,sp,-32
    8000344c:	00113c23          	sd	ra,24(sp)
    80003450:	00813823          	sd	s0,16(sp)
    80003454:	00913423          	sd	s1,8(sp)
    80003458:	02010413          	addi	s0,sp,32
    8000345c:	00050493          	mv	s1,a0
    assert(singleton == nullptr);
    80003460:	00003797          	auipc	a5,0x3
    80003464:	6e07b783          	ld	a5,1760(a5) # 80006b40 <_ZN9Scheduler9singletonE>
    80003468:	02079463          	bnez	a5,80003490 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    8000346c:	00003797          	auipc	a5,0x3
    80003470:	6c97ba23          	sd	s1,1748(a5) # 80006b40 <_ZN9Scheduler9singletonE>
    head = nullptr;
    80003474:	0004b023          	sd	zero,0(s1)
    tail = nullptr;
    80003478:	0004b423          	sd	zero,8(s1)
}
    8000347c:	01813083          	ld	ra,24(sp)
    80003480:	01013403          	ld	s0,16(sp)
    80003484:	00813483          	ld	s1,8(sp)
    80003488:	02010113          	addi	sp,sp,32
    8000348c:	00008067          	ret
    assert(singleton == nullptr);
    80003490:	01300593          	li	a1,19
    80003494:	00003517          	auipc	a0,0x3
    80003498:	cac50513          	addi	a0,a0,-852 # 80006140 <CONSOLE_STATUS+0x130>
    8000349c:	ffffe097          	auipc	ra,0xffffe
    800034a0:	0a0080e7          	jalr	160(ra) # 8000153c <_Z13assert_failedPKci>
    800034a4:	fc9ff06f          	j	8000346c <_ZN9SchedulerC1Ev+0x24>

00000000800034a8 <_ZN9Scheduler7isEmptyEv>:

// Scheduler* Scheduler::getInstance(){
//     return singleton;
// }

bool Scheduler::isEmpty(){
    800034a8:	ff010113          	addi	sp,sp,-16
    800034ac:	00813423          	sd	s0,8(sp)
    800034b0:	01010413          	addi	s0,sp,16
    return singleton->head == nullptr;
    800034b4:	00003797          	auipc	a5,0x3
    800034b8:	68c7b783          	ld	a5,1676(a5) # 80006b40 <_ZN9Scheduler9singletonE>
    800034bc:	0007b503          	ld	a0,0(a5)
}
    800034c0:	00153513          	seqz	a0,a0
    800034c4:	00813403          	ld	s0,8(sp)
    800034c8:	01010113          	addi	sp,sp,16
    800034cc:	00008067          	ret

00000000800034d0 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    800034d0:	fe010113          	addi	sp,sp,-32
    800034d4:	00113c23          	sd	ra,24(sp)
    800034d8:	00813823          	sd	s0,16(sp)
    800034dc:	00913423          	sd	s1,8(sp)
    800034e0:	01213023          	sd	s2,0(sp)
    800034e4:	02010413          	addi	s0,sp,32
    800034e8:	00050493          	mv	s1,a0
    if(singleton->head == nullptr){
    800034ec:	00003917          	auipc	s2,0x3
    800034f0:	65493903          	ld	s2,1620(s2) # 80006b40 <_ZN9Scheduler9singletonE>
    800034f4:	00093783          	ld	a5,0(s2)
    800034f8:	12078c63          	beqz	a5,80003630 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = nullptr;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800034fc:	00893903          	ld	s2,8(s2)
    80003500:	01000513          	li	a0,16
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	bfc080e7          	jalr	-1028(ra) # 80001100 <_Z9mem_allocm>
    8000350c:	00a90423          	sb	a0,8(s2)
    80003510:	00855793          	srli	a5,a0,0x8
    80003514:	00f904a3          	sb	a5,9(s2)
    80003518:	01055793          	srli	a5,a0,0x10
    8000351c:	00f90523          	sb	a5,10(s2)
    80003520:	0185579b          	srliw	a5,a0,0x18
    80003524:	00f905a3          	sb	a5,11(s2)
    80003528:	02055793          	srli	a5,a0,0x20
    8000352c:	00f90623          	sb	a5,12(s2)
    80003530:	02855793          	srli	a5,a0,0x28
    80003534:	00f906a3          	sb	a5,13(s2)
    80003538:	03055793          	srli	a5,a0,0x30
    8000353c:	00f90723          	sb	a5,14(s2)
    80003540:	03855513          	srli	a0,a0,0x38
    80003544:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003548:	00003617          	auipc	a2,0x3
    8000354c:	5f860613          	addi	a2,a2,1528 # 80006b40 <_ZN9Scheduler9singletonE>
    80003550:	00063583          	ld	a1,0(a2)
    80003554:	0085b703          	ld	a4,8(a1)
    80003558:	00874783          	lbu	a5,8(a4)
    8000355c:	00974683          	lbu	a3,9(a4)
    80003560:	00869693          	slli	a3,a3,0x8
    80003564:	00f6e6b3          	or	a3,a3,a5
    80003568:	00a74783          	lbu	a5,10(a4)
    8000356c:	01079793          	slli	a5,a5,0x10
    80003570:	00d7e6b3          	or	a3,a5,a3
    80003574:	00b74783          	lbu	a5,11(a4)
    80003578:	01879793          	slli	a5,a5,0x18
    8000357c:	00d7e7b3          	or	a5,a5,a3
    80003580:	00c74683          	lbu	a3,12(a4)
    80003584:	02069693          	slli	a3,a3,0x20
    80003588:	00f6e7b3          	or	a5,a3,a5
    8000358c:	00d74683          	lbu	a3,13(a4)
    80003590:	02869693          	slli	a3,a3,0x28
    80003594:	00f6e6b3          	or	a3,a3,a5
    80003598:	00e74783          	lbu	a5,14(a4)
    8000359c:	03079793          	slli	a5,a5,0x30
    800035a0:	00d7e6b3          	or	a3,a5,a3
    800035a4:	00f74783          	lbu	a5,15(a4)
    800035a8:	03879793          	slli	a5,a5,0x38
    800035ac:	00d7e7b3          	or	a5,a5,a3
    800035b0:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    800035b4:	00978023          	sb	s1,0(a5)
    800035b8:	0084d713          	srli	a4,s1,0x8
    800035bc:	00e780a3          	sb	a4,1(a5)
    800035c0:	0104d713          	srli	a4,s1,0x10
    800035c4:	00e78123          	sb	a4,2(a5)
    800035c8:	0184d71b          	srliw	a4,s1,0x18
    800035cc:	00e781a3          	sb	a4,3(a5)
    800035d0:	0204d713          	srli	a4,s1,0x20
    800035d4:	00e78223          	sb	a4,4(a5)
    800035d8:	0284d713          	srli	a4,s1,0x28
    800035dc:	00e782a3          	sb	a4,5(a5)
    800035e0:	0304d713          	srli	a4,s1,0x30
    800035e4:	00e78323          	sb	a4,6(a5)
    800035e8:	0384d493          	srli	s1,s1,0x38
    800035ec:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = nullptr;
    800035f0:	00063783          	ld	a5,0(a2)
    800035f4:	0087b783          	ld	a5,8(a5)
    800035f8:	00078423          	sb	zero,8(a5)
    800035fc:	000784a3          	sb	zero,9(a5)
    80003600:	00078523          	sb	zero,10(a5)
    80003604:	000785a3          	sb	zero,11(a5)
    80003608:	00078623          	sb	zero,12(a5)
    8000360c:	000786a3          	sb	zero,13(a5)
    80003610:	00078723          	sb	zero,14(a5)
    80003614:	000787a3          	sb	zero,15(a5)
    }
}
    80003618:	01813083          	ld	ra,24(sp)
    8000361c:	01013403          	ld	s0,16(sp)
    80003620:	00813483          	ld	s1,8(sp)
    80003624:	00013903          	ld	s2,0(sp)
    80003628:	02010113          	addi	sp,sp,32
    8000362c:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003630:	01000513          	li	a0,16
    80003634:	ffffe097          	auipc	ra,0xffffe
    80003638:	acc080e7          	jalr	-1332(ra) # 80001100 <_Z9mem_allocm>
    8000363c:	00a93423          	sd	a0,8(s2)
    80003640:	00003717          	auipc	a4,0x3
    80003644:	50070713          	addi	a4,a4,1280 # 80006b40 <_ZN9Scheduler9singletonE>
    80003648:	00073783          	ld	a5,0(a4)
    8000364c:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003650:	00073783          	ld	a5,0(a4)
    80003654:	0007b783          	ld	a5,0(a5)
    80003658:	00978023          	sb	s1,0(a5)
    8000365c:	0084d693          	srli	a3,s1,0x8
    80003660:	00d780a3          	sb	a3,1(a5)
    80003664:	0104d693          	srli	a3,s1,0x10
    80003668:	00d78123          	sb	a3,2(a5)
    8000366c:	0184d69b          	srliw	a3,s1,0x18
    80003670:	00d781a3          	sb	a3,3(a5)
    80003674:	0204d693          	srli	a3,s1,0x20
    80003678:	00d78223          	sb	a3,4(a5)
    8000367c:	0284d693          	srli	a3,s1,0x28
    80003680:	00d782a3          	sb	a3,5(a5)
    80003684:	0304d693          	srli	a3,s1,0x30
    80003688:	00d78323          	sb	a3,6(a5)
    8000368c:	0384d493          	srli	s1,s1,0x38
    80003690:	009783a3          	sb	s1,7(a5)
        singleton->head->next = nullptr;
    80003694:	00073783          	ld	a5,0(a4)
    80003698:	0007b783          	ld	a5,0(a5)
    8000369c:	00078423          	sb	zero,8(a5)
    800036a0:	000784a3          	sb	zero,9(a5)
    800036a4:	00078523          	sb	zero,10(a5)
    800036a8:	000785a3          	sb	zero,11(a5)
    800036ac:	00078623          	sb	zero,12(a5)
    800036b0:	000786a3          	sb	zero,13(a5)
    800036b4:	00078723          	sb	zero,14(a5)
    800036b8:	000787a3          	sb	zero,15(a5)
    800036bc:	f5dff06f          	j	80003618 <_ZN9Scheduler3putEP7_thread+0x148>

00000000800036c0 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    800036c0:	fe010113          	addi	sp,sp,-32
    800036c4:	00113c23          	sd	ra,24(sp)
    800036c8:	00813823          	sd	s0,16(sp)
    800036cc:	00913423          	sd	s1,8(sp)
    800036d0:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    800036d4:	00003697          	auipc	a3,0x3
    800036d8:	46c6b683          	ld	a3,1132(a3) # 80006b40 <_ZN9Scheduler9singletonE>
    800036dc:	0006b503          	ld	a0,0(a3)
    if(tmp == nullptr){
    800036e0:	0c050c63          	beqz	a0,800037b8 <_ZN9Scheduler3getEv+0xf8>
        return nullptr;
    }
    thread_t thread = tmp->thread;
    800036e4:	00054483          	lbu	s1,0(a0)
    800036e8:	00154783          	lbu	a5,1(a0)
    800036ec:	00879793          	slli	a5,a5,0x8
    800036f0:	0097e7b3          	or	a5,a5,s1
    800036f4:	00254483          	lbu	s1,2(a0)
    800036f8:	01049493          	slli	s1,s1,0x10
    800036fc:	00f4e7b3          	or	a5,s1,a5
    80003700:	00354483          	lbu	s1,3(a0)
    80003704:	01849493          	slli	s1,s1,0x18
    80003708:	00f4e4b3          	or	s1,s1,a5
    8000370c:	00454783          	lbu	a5,4(a0)
    80003710:	02079793          	slli	a5,a5,0x20
    80003714:	0097e4b3          	or	s1,a5,s1
    80003718:	00554783          	lbu	a5,5(a0)
    8000371c:	02879793          	slli	a5,a5,0x28
    80003720:	0097e7b3          	or	a5,a5,s1
    80003724:	00654483          	lbu	s1,6(a0)
    80003728:	03049493          	slli	s1,s1,0x30
    8000372c:	00f4e7b3          	or	a5,s1,a5
    80003730:	00754483          	lbu	s1,7(a0)
    80003734:	03849493          	slli	s1,s1,0x38
    80003738:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    8000373c:	00854783          	lbu	a5,8(a0)
    80003740:	00954703          	lbu	a4,9(a0)
    80003744:	00871713          	slli	a4,a4,0x8
    80003748:	00f76733          	or	a4,a4,a5
    8000374c:	00a54783          	lbu	a5,10(a0)
    80003750:	01079793          	slli	a5,a5,0x10
    80003754:	00e7e733          	or	a4,a5,a4
    80003758:	00b54783          	lbu	a5,11(a0)
    8000375c:	01879793          	slli	a5,a5,0x18
    80003760:	00e7e7b3          	or	a5,a5,a4
    80003764:	00c54703          	lbu	a4,12(a0)
    80003768:	02071713          	slli	a4,a4,0x20
    8000376c:	00f767b3          	or	a5,a4,a5
    80003770:	00d54703          	lbu	a4,13(a0)
    80003774:	02871713          	slli	a4,a4,0x28
    80003778:	00f76733          	or	a4,a4,a5
    8000377c:	00e54783          	lbu	a5,14(a0)
    80003780:	03079793          	slli	a5,a5,0x30
    80003784:	00e7e733          	or	a4,a5,a4
    80003788:	00f54783          	lbu	a5,15(a0)
    8000378c:	03879793          	slli	a5,a5,0x38
    80003790:	00e7e7b3          	or	a5,a5,a4
    80003794:	00f6b023          	sd	a5,0(a3)
    mem_free(tmp);
    80003798:	ffffe097          	auipc	ra,0xffffe
    8000379c:	998080e7          	jalr	-1640(ra) # 80001130 <_Z8mem_freePv>
    return thread;
    800037a0:	00048513          	mv	a0,s1
    800037a4:	01813083          	ld	ra,24(sp)
    800037a8:	01013403          	ld	s0,16(sp)
    800037ac:	00813483          	ld	s1,8(sp)
    800037b0:	02010113          	addi	sp,sp,32
    800037b4:	00008067          	ret
        return nullptr;
    800037b8:	00050493          	mv	s1,a0
    800037bc:	fe5ff06f          	j	800037a0 <_ZN9Scheduler3getEv+0xe0>

00000000800037c0 <start>:
    800037c0:	ff010113          	addi	sp,sp,-16
    800037c4:	00813423          	sd	s0,8(sp)
    800037c8:	01010413          	addi	s0,sp,16
    800037cc:	300027f3          	csrr	a5,mstatus
    800037d0:	ffffe737          	lui	a4,0xffffe
    800037d4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff6a4f>
    800037d8:	00e7f7b3          	and	a5,a5,a4
    800037dc:	00001737          	lui	a4,0x1
    800037e0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800037e4:	00e7e7b3          	or	a5,a5,a4
    800037e8:	30079073          	csrw	mstatus,a5
    800037ec:	00000797          	auipc	a5,0x0
    800037f0:	16078793          	addi	a5,a5,352 # 8000394c <system_main>
    800037f4:	34179073          	csrw	mepc,a5
    800037f8:	00000793          	li	a5,0
    800037fc:	18079073          	csrw	satp,a5
    80003800:	000107b7          	lui	a5,0x10
    80003804:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003808:	30279073          	csrw	medeleg,a5
    8000380c:	30379073          	csrw	mideleg,a5
    80003810:	104027f3          	csrr	a5,sie
    80003814:	2227e793          	ori	a5,a5,546
    80003818:	10479073          	csrw	sie,a5
    8000381c:	fff00793          	li	a5,-1
    80003820:	00a7d793          	srli	a5,a5,0xa
    80003824:	3b079073          	csrw	pmpaddr0,a5
    80003828:	00f00793          	li	a5,15
    8000382c:	3a079073          	csrw	pmpcfg0,a5
    80003830:	f14027f3          	csrr	a5,mhartid
    80003834:	0200c737          	lui	a4,0x200c
    80003838:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000383c:	0007869b          	sext.w	a3,a5
    80003840:	00269713          	slli	a4,a3,0x2
    80003844:	000f4637          	lui	a2,0xf4
    80003848:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000384c:	00d70733          	add	a4,a4,a3
    80003850:	0037979b          	slliw	a5,a5,0x3
    80003854:	020046b7          	lui	a3,0x2004
    80003858:	00d787b3          	add	a5,a5,a3
    8000385c:	00c585b3          	add	a1,a1,a2
    80003860:	00371693          	slli	a3,a4,0x3
    80003864:	00003717          	auipc	a4,0x3
    80003868:	2ec70713          	addi	a4,a4,748 # 80006b50 <timer_scratch>
    8000386c:	00b7b023          	sd	a1,0(a5)
    80003870:	00d70733          	add	a4,a4,a3
    80003874:	00f73c23          	sd	a5,24(a4)
    80003878:	02c73023          	sd	a2,32(a4)
    8000387c:	34071073          	csrw	mscratch,a4
    80003880:	00000797          	auipc	a5,0x0
    80003884:	6e078793          	addi	a5,a5,1760 # 80003f60 <timervec>
    80003888:	30579073          	csrw	mtvec,a5
    8000388c:	300027f3          	csrr	a5,mstatus
    80003890:	0087e793          	ori	a5,a5,8
    80003894:	30079073          	csrw	mstatus,a5
    80003898:	304027f3          	csrr	a5,mie
    8000389c:	0807e793          	ori	a5,a5,128
    800038a0:	30479073          	csrw	mie,a5
    800038a4:	f14027f3          	csrr	a5,mhartid
    800038a8:	0007879b          	sext.w	a5,a5
    800038ac:	00078213          	mv	tp,a5
    800038b0:	30200073          	mret
    800038b4:	00813403          	ld	s0,8(sp)
    800038b8:	01010113          	addi	sp,sp,16
    800038bc:	00008067          	ret

00000000800038c0 <timerinit>:
    800038c0:	ff010113          	addi	sp,sp,-16
    800038c4:	00813423          	sd	s0,8(sp)
    800038c8:	01010413          	addi	s0,sp,16
    800038cc:	f14027f3          	csrr	a5,mhartid
    800038d0:	0200c737          	lui	a4,0x200c
    800038d4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800038d8:	0007869b          	sext.w	a3,a5
    800038dc:	00269713          	slli	a4,a3,0x2
    800038e0:	000f4637          	lui	a2,0xf4
    800038e4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800038e8:	00d70733          	add	a4,a4,a3
    800038ec:	0037979b          	slliw	a5,a5,0x3
    800038f0:	020046b7          	lui	a3,0x2004
    800038f4:	00d787b3          	add	a5,a5,a3
    800038f8:	00c585b3          	add	a1,a1,a2
    800038fc:	00371693          	slli	a3,a4,0x3
    80003900:	00003717          	auipc	a4,0x3
    80003904:	25070713          	addi	a4,a4,592 # 80006b50 <timer_scratch>
    80003908:	00b7b023          	sd	a1,0(a5)
    8000390c:	00d70733          	add	a4,a4,a3
    80003910:	00f73c23          	sd	a5,24(a4)
    80003914:	02c73023          	sd	a2,32(a4)
    80003918:	34071073          	csrw	mscratch,a4
    8000391c:	00000797          	auipc	a5,0x0
    80003920:	64478793          	addi	a5,a5,1604 # 80003f60 <timervec>
    80003924:	30579073          	csrw	mtvec,a5
    80003928:	300027f3          	csrr	a5,mstatus
    8000392c:	0087e793          	ori	a5,a5,8
    80003930:	30079073          	csrw	mstatus,a5
    80003934:	304027f3          	csrr	a5,mie
    80003938:	0807e793          	ori	a5,a5,128
    8000393c:	30479073          	csrw	mie,a5
    80003940:	00813403          	ld	s0,8(sp)
    80003944:	01010113          	addi	sp,sp,16
    80003948:	00008067          	ret

000000008000394c <system_main>:
    8000394c:	fe010113          	addi	sp,sp,-32
    80003950:	00813823          	sd	s0,16(sp)
    80003954:	00913423          	sd	s1,8(sp)
    80003958:	00113c23          	sd	ra,24(sp)
    8000395c:	02010413          	addi	s0,sp,32
    80003960:	00000097          	auipc	ra,0x0
    80003964:	0c4080e7          	jalr	196(ra) # 80003a24 <cpuid>
    80003968:	00003497          	auipc	s1,0x3
    8000396c:	18848493          	addi	s1,s1,392 # 80006af0 <started>
    80003970:	02050263          	beqz	a0,80003994 <system_main+0x48>
    80003974:	0004a783          	lw	a5,0(s1)
    80003978:	0007879b          	sext.w	a5,a5
    8000397c:	fe078ce3          	beqz	a5,80003974 <system_main+0x28>
    80003980:	0ff0000f          	fence
    80003984:	00002517          	auipc	a0,0x2
    80003988:	7fc50513          	addi	a0,a0,2044 # 80006180 <CONSOLE_STATUS+0x170>
    8000398c:	00001097          	auipc	ra,0x1
    80003990:	a70080e7          	jalr	-1424(ra) # 800043fc <panic>
    80003994:	00001097          	auipc	ra,0x1
    80003998:	9c4080e7          	jalr	-1596(ra) # 80004358 <consoleinit>
    8000399c:	00001097          	auipc	ra,0x1
    800039a0:	150080e7          	jalr	336(ra) # 80004aec <printfinit>
    800039a4:	00003517          	auipc	a0,0x3
    800039a8:	8bc50513          	addi	a0,a0,-1860 # 80006260 <CONSOLE_STATUS+0x250>
    800039ac:	00001097          	auipc	ra,0x1
    800039b0:	aac080e7          	jalr	-1364(ra) # 80004458 <__printf>
    800039b4:	00002517          	auipc	a0,0x2
    800039b8:	79c50513          	addi	a0,a0,1948 # 80006150 <CONSOLE_STATUS+0x140>
    800039bc:	00001097          	auipc	ra,0x1
    800039c0:	a9c080e7          	jalr	-1380(ra) # 80004458 <__printf>
    800039c4:	00003517          	auipc	a0,0x3
    800039c8:	89c50513          	addi	a0,a0,-1892 # 80006260 <CONSOLE_STATUS+0x250>
    800039cc:	00001097          	auipc	ra,0x1
    800039d0:	a8c080e7          	jalr	-1396(ra) # 80004458 <__printf>
    800039d4:	00001097          	auipc	ra,0x1
    800039d8:	4a4080e7          	jalr	1188(ra) # 80004e78 <kinit>
    800039dc:	00000097          	auipc	ra,0x0
    800039e0:	148080e7          	jalr	328(ra) # 80003b24 <trapinit>
    800039e4:	00000097          	auipc	ra,0x0
    800039e8:	16c080e7          	jalr	364(ra) # 80003b50 <trapinithart>
    800039ec:	00000097          	auipc	ra,0x0
    800039f0:	5b4080e7          	jalr	1460(ra) # 80003fa0 <plicinit>
    800039f4:	00000097          	auipc	ra,0x0
    800039f8:	5d4080e7          	jalr	1492(ra) # 80003fc8 <plicinithart>
    800039fc:	00000097          	auipc	ra,0x0
    80003a00:	078080e7          	jalr	120(ra) # 80003a74 <userinit>
    80003a04:	0ff0000f          	fence
    80003a08:	00100793          	li	a5,1
    80003a0c:	00002517          	auipc	a0,0x2
    80003a10:	75c50513          	addi	a0,a0,1884 # 80006168 <CONSOLE_STATUS+0x158>
    80003a14:	00f4a023          	sw	a5,0(s1)
    80003a18:	00001097          	auipc	ra,0x1
    80003a1c:	a40080e7          	jalr	-1472(ra) # 80004458 <__printf>
    80003a20:	0000006f          	j	80003a20 <system_main+0xd4>

0000000080003a24 <cpuid>:
    80003a24:	ff010113          	addi	sp,sp,-16
    80003a28:	00813423          	sd	s0,8(sp)
    80003a2c:	01010413          	addi	s0,sp,16
    80003a30:	00020513          	mv	a0,tp
    80003a34:	00813403          	ld	s0,8(sp)
    80003a38:	0005051b          	sext.w	a0,a0
    80003a3c:	01010113          	addi	sp,sp,16
    80003a40:	00008067          	ret

0000000080003a44 <mycpu>:
    80003a44:	ff010113          	addi	sp,sp,-16
    80003a48:	00813423          	sd	s0,8(sp)
    80003a4c:	01010413          	addi	s0,sp,16
    80003a50:	00020793          	mv	a5,tp
    80003a54:	00813403          	ld	s0,8(sp)
    80003a58:	0007879b          	sext.w	a5,a5
    80003a5c:	00779793          	slli	a5,a5,0x7
    80003a60:	00004517          	auipc	a0,0x4
    80003a64:	12050513          	addi	a0,a0,288 # 80007b80 <cpus>
    80003a68:	00f50533          	add	a0,a0,a5
    80003a6c:	01010113          	addi	sp,sp,16
    80003a70:	00008067          	ret

0000000080003a74 <userinit>:
    80003a74:	ff010113          	addi	sp,sp,-16
    80003a78:	00813423          	sd	s0,8(sp)
    80003a7c:	01010413          	addi	s0,sp,16
    80003a80:	00813403          	ld	s0,8(sp)
    80003a84:	01010113          	addi	sp,sp,16
    80003a88:	ffffe317          	auipc	t1,0xffffe
    80003a8c:	a0830067          	jr	-1528(t1) # 80001490 <main>

0000000080003a90 <either_copyout>:
    80003a90:	ff010113          	addi	sp,sp,-16
    80003a94:	00813023          	sd	s0,0(sp)
    80003a98:	00113423          	sd	ra,8(sp)
    80003a9c:	01010413          	addi	s0,sp,16
    80003aa0:	02051663          	bnez	a0,80003acc <either_copyout+0x3c>
    80003aa4:	00058513          	mv	a0,a1
    80003aa8:	00060593          	mv	a1,a2
    80003aac:	0006861b          	sext.w	a2,a3
    80003ab0:	00002097          	auipc	ra,0x2
    80003ab4:	c54080e7          	jalr	-940(ra) # 80005704 <__memmove>
    80003ab8:	00813083          	ld	ra,8(sp)
    80003abc:	00013403          	ld	s0,0(sp)
    80003ac0:	00000513          	li	a0,0
    80003ac4:	01010113          	addi	sp,sp,16
    80003ac8:	00008067          	ret
    80003acc:	00002517          	auipc	a0,0x2
    80003ad0:	6dc50513          	addi	a0,a0,1756 # 800061a8 <CONSOLE_STATUS+0x198>
    80003ad4:	00001097          	auipc	ra,0x1
    80003ad8:	928080e7          	jalr	-1752(ra) # 800043fc <panic>

0000000080003adc <either_copyin>:
    80003adc:	ff010113          	addi	sp,sp,-16
    80003ae0:	00813023          	sd	s0,0(sp)
    80003ae4:	00113423          	sd	ra,8(sp)
    80003ae8:	01010413          	addi	s0,sp,16
    80003aec:	02059463          	bnez	a1,80003b14 <either_copyin+0x38>
    80003af0:	00060593          	mv	a1,a2
    80003af4:	0006861b          	sext.w	a2,a3
    80003af8:	00002097          	auipc	ra,0x2
    80003afc:	c0c080e7          	jalr	-1012(ra) # 80005704 <__memmove>
    80003b00:	00813083          	ld	ra,8(sp)
    80003b04:	00013403          	ld	s0,0(sp)
    80003b08:	00000513          	li	a0,0
    80003b0c:	01010113          	addi	sp,sp,16
    80003b10:	00008067          	ret
    80003b14:	00002517          	auipc	a0,0x2
    80003b18:	6bc50513          	addi	a0,a0,1724 # 800061d0 <CONSOLE_STATUS+0x1c0>
    80003b1c:	00001097          	auipc	ra,0x1
    80003b20:	8e0080e7          	jalr	-1824(ra) # 800043fc <panic>

0000000080003b24 <trapinit>:
    80003b24:	ff010113          	addi	sp,sp,-16
    80003b28:	00813423          	sd	s0,8(sp)
    80003b2c:	01010413          	addi	s0,sp,16
    80003b30:	00813403          	ld	s0,8(sp)
    80003b34:	00002597          	auipc	a1,0x2
    80003b38:	6c458593          	addi	a1,a1,1732 # 800061f8 <CONSOLE_STATUS+0x1e8>
    80003b3c:	00004517          	auipc	a0,0x4
    80003b40:	0c450513          	addi	a0,a0,196 # 80007c00 <tickslock>
    80003b44:	01010113          	addi	sp,sp,16
    80003b48:	00001317          	auipc	t1,0x1
    80003b4c:	5c030067          	jr	1472(t1) # 80005108 <initlock>

0000000080003b50 <trapinithart>:
    80003b50:	ff010113          	addi	sp,sp,-16
    80003b54:	00813423          	sd	s0,8(sp)
    80003b58:	01010413          	addi	s0,sp,16
    80003b5c:	00000797          	auipc	a5,0x0
    80003b60:	2f478793          	addi	a5,a5,756 # 80003e50 <kernelvec>
    80003b64:	10579073          	csrw	stvec,a5
    80003b68:	00813403          	ld	s0,8(sp)
    80003b6c:	01010113          	addi	sp,sp,16
    80003b70:	00008067          	ret

0000000080003b74 <usertrap>:
    80003b74:	ff010113          	addi	sp,sp,-16
    80003b78:	00813423          	sd	s0,8(sp)
    80003b7c:	01010413          	addi	s0,sp,16
    80003b80:	00813403          	ld	s0,8(sp)
    80003b84:	01010113          	addi	sp,sp,16
    80003b88:	00008067          	ret

0000000080003b8c <usertrapret>:
    80003b8c:	ff010113          	addi	sp,sp,-16
    80003b90:	00813423          	sd	s0,8(sp)
    80003b94:	01010413          	addi	s0,sp,16
    80003b98:	00813403          	ld	s0,8(sp)
    80003b9c:	01010113          	addi	sp,sp,16
    80003ba0:	00008067          	ret

0000000080003ba4 <kerneltrap>:
    80003ba4:	fe010113          	addi	sp,sp,-32
    80003ba8:	00813823          	sd	s0,16(sp)
    80003bac:	00113c23          	sd	ra,24(sp)
    80003bb0:	00913423          	sd	s1,8(sp)
    80003bb4:	02010413          	addi	s0,sp,32
    80003bb8:	142025f3          	csrr	a1,scause
    80003bbc:	100027f3          	csrr	a5,sstatus
    80003bc0:	0027f793          	andi	a5,a5,2
    80003bc4:	10079c63          	bnez	a5,80003cdc <kerneltrap+0x138>
    80003bc8:	142027f3          	csrr	a5,scause
    80003bcc:	0207ce63          	bltz	a5,80003c08 <kerneltrap+0x64>
    80003bd0:	00002517          	auipc	a0,0x2
    80003bd4:	67050513          	addi	a0,a0,1648 # 80006240 <CONSOLE_STATUS+0x230>
    80003bd8:	00001097          	auipc	ra,0x1
    80003bdc:	880080e7          	jalr	-1920(ra) # 80004458 <__printf>
    80003be0:	141025f3          	csrr	a1,sepc
    80003be4:	14302673          	csrr	a2,stval
    80003be8:	00002517          	auipc	a0,0x2
    80003bec:	66850513          	addi	a0,a0,1640 # 80006250 <CONSOLE_STATUS+0x240>
    80003bf0:	00001097          	auipc	ra,0x1
    80003bf4:	868080e7          	jalr	-1944(ra) # 80004458 <__printf>
    80003bf8:	00002517          	auipc	a0,0x2
    80003bfc:	67050513          	addi	a0,a0,1648 # 80006268 <CONSOLE_STATUS+0x258>
    80003c00:	00000097          	auipc	ra,0x0
    80003c04:	7fc080e7          	jalr	2044(ra) # 800043fc <panic>
    80003c08:	0ff7f713          	andi	a4,a5,255
    80003c0c:	00900693          	li	a3,9
    80003c10:	04d70063          	beq	a4,a3,80003c50 <kerneltrap+0xac>
    80003c14:	fff00713          	li	a4,-1
    80003c18:	03f71713          	slli	a4,a4,0x3f
    80003c1c:	00170713          	addi	a4,a4,1
    80003c20:	fae798e3          	bne	a5,a4,80003bd0 <kerneltrap+0x2c>
    80003c24:	00000097          	auipc	ra,0x0
    80003c28:	e00080e7          	jalr	-512(ra) # 80003a24 <cpuid>
    80003c2c:	06050663          	beqz	a0,80003c98 <kerneltrap+0xf4>
    80003c30:	144027f3          	csrr	a5,sip
    80003c34:	ffd7f793          	andi	a5,a5,-3
    80003c38:	14479073          	csrw	sip,a5
    80003c3c:	01813083          	ld	ra,24(sp)
    80003c40:	01013403          	ld	s0,16(sp)
    80003c44:	00813483          	ld	s1,8(sp)
    80003c48:	02010113          	addi	sp,sp,32
    80003c4c:	00008067          	ret
    80003c50:	00000097          	auipc	ra,0x0
    80003c54:	3c4080e7          	jalr	964(ra) # 80004014 <plic_claim>
    80003c58:	00a00793          	li	a5,10
    80003c5c:	00050493          	mv	s1,a0
    80003c60:	06f50863          	beq	a0,a5,80003cd0 <kerneltrap+0x12c>
    80003c64:	fc050ce3          	beqz	a0,80003c3c <kerneltrap+0x98>
    80003c68:	00050593          	mv	a1,a0
    80003c6c:	00002517          	auipc	a0,0x2
    80003c70:	5b450513          	addi	a0,a0,1460 # 80006220 <CONSOLE_STATUS+0x210>
    80003c74:	00000097          	auipc	ra,0x0
    80003c78:	7e4080e7          	jalr	2020(ra) # 80004458 <__printf>
    80003c7c:	01013403          	ld	s0,16(sp)
    80003c80:	01813083          	ld	ra,24(sp)
    80003c84:	00048513          	mv	a0,s1
    80003c88:	00813483          	ld	s1,8(sp)
    80003c8c:	02010113          	addi	sp,sp,32
    80003c90:	00000317          	auipc	t1,0x0
    80003c94:	3bc30067          	jr	956(t1) # 8000404c <plic_complete>
    80003c98:	00004517          	auipc	a0,0x4
    80003c9c:	f6850513          	addi	a0,a0,-152 # 80007c00 <tickslock>
    80003ca0:	00001097          	auipc	ra,0x1
    80003ca4:	48c080e7          	jalr	1164(ra) # 8000512c <acquire>
    80003ca8:	00003717          	auipc	a4,0x3
    80003cac:	e4c70713          	addi	a4,a4,-436 # 80006af4 <ticks>
    80003cb0:	00072783          	lw	a5,0(a4)
    80003cb4:	00004517          	auipc	a0,0x4
    80003cb8:	f4c50513          	addi	a0,a0,-180 # 80007c00 <tickslock>
    80003cbc:	0017879b          	addiw	a5,a5,1
    80003cc0:	00f72023          	sw	a5,0(a4)
    80003cc4:	00001097          	auipc	ra,0x1
    80003cc8:	534080e7          	jalr	1332(ra) # 800051f8 <release>
    80003ccc:	f65ff06f          	j	80003c30 <kerneltrap+0x8c>
    80003cd0:	00001097          	auipc	ra,0x1
    80003cd4:	090080e7          	jalr	144(ra) # 80004d60 <uartintr>
    80003cd8:	fa5ff06f          	j	80003c7c <kerneltrap+0xd8>
    80003cdc:	00002517          	auipc	a0,0x2
    80003ce0:	52450513          	addi	a0,a0,1316 # 80006200 <CONSOLE_STATUS+0x1f0>
    80003ce4:	00000097          	auipc	ra,0x0
    80003ce8:	718080e7          	jalr	1816(ra) # 800043fc <panic>

0000000080003cec <clockintr>:
    80003cec:	fe010113          	addi	sp,sp,-32
    80003cf0:	00813823          	sd	s0,16(sp)
    80003cf4:	00913423          	sd	s1,8(sp)
    80003cf8:	00113c23          	sd	ra,24(sp)
    80003cfc:	02010413          	addi	s0,sp,32
    80003d00:	00004497          	auipc	s1,0x4
    80003d04:	f0048493          	addi	s1,s1,-256 # 80007c00 <tickslock>
    80003d08:	00048513          	mv	a0,s1
    80003d0c:	00001097          	auipc	ra,0x1
    80003d10:	420080e7          	jalr	1056(ra) # 8000512c <acquire>
    80003d14:	00003717          	auipc	a4,0x3
    80003d18:	de070713          	addi	a4,a4,-544 # 80006af4 <ticks>
    80003d1c:	00072783          	lw	a5,0(a4)
    80003d20:	01013403          	ld	s0,16(sp)
    80003d24:	01813083          	ld	ra,24(sp)
    80003d28:	00048513          	mv	a0,s1
    80003d2c:	0017879b          	addiw	a5,a5,1
    80003d30:	00813483          	ld	s1,8(sp)
    80003d34:	00f72023          	sw	a5,0(a4)
    80003d38:	02010113          	addi	sp,sp,32
    80003d3c:	00001317          	auipc	t1,0x1
    80003d40:	4bc30067          	jr	1212(t1) # 800051f8 <release>

0000000080003d44 <devintr>:
    80003d44:	142027f3          	csrr	a5,scause
    80003d48:	00000513          	li	a0,0
    80003d4c:	0007c463          	bltz	a5,80003d54 <devintr+0x10>
    80003d50:	00008067          	ret
    80003d54:	fe010113          	addi	sp,sp,-32
    80003d58:	00813823          	sd	s0,16(sp)
    80003d5c:	00113c23          	sd	ra,24(sp)
    80003d60:	00913423          	sd	s1,8(sp)
    80003d64:	02010413          	addi	s0,sp,32
    80003d68:	0ff7f713          	andi	a4,a5,255
    80003d6c:	00900693          	li	a3,9
    80003d70:	04d70c63          	beq	a4,a3,80003dc8 <devintr+0x84>
    80003d74:	fff00713          	li	a4,-1
    80003d78:	03f71713          	slli	a4,a4,0x3f
    80003d7c:	00170713          	addi	a4,a4,1
    80003d80:	00e78c63          	beq	a5,a4,80003d98 <devintr+0x54>
    80003d84:	01813083          	ld	ra,24(sp)
    80003d88:	01013403          	ld	s0,16(sp)
    80003d8c:	00813483          	ld	s1,8(sp)
    80003d90:	02010113          	addi	sp,sp,32
    80003d94:	00008067          	ret
    80003d98:	00000097          	auipc	ra,0x0
    80003d9c:	c8c080e7          	jalr	-884(ra) # 80003a24 <cpuid>
    80003da0:	06050663          	beqz	a0,80003e0c <devintr+0xc8>
    80003da4:	144027f3          	csrr	a5,sip
    80003da8:	ffd7f793          	andi	a5,a5,-3
    80003dac:	14479073          	csrw	sip,a5
    80003db0:	01813083          	ld	ra,24(sp)
    80003db4:	01013403          	ld	s0,16(sp)
    80003db8:	00813483          	ld	s1,8(sp)
    80003dbc:	00200513          	li	a0,2
    80003dc0:	02010113          	addi	sp,sp,32
    80003dc4:	00008067          	ret
    80003dc8:	00000097          	auipc	ra,0x0
    80003dcc:	24c080e7          	jalr	588(ra) # 80004014 <plic_claim>
    80003dd0:	00a00793          	li	a5,10
    80003dd4:	00050493          	mv	s1,a0
    80003dd8:	06f50663          	beq	a0,a5,80003e44 <devintr+0x100>
    80003ddc:	00100513          	li	a0,1
    80003de0:	fa0482e3          	beqz	s1,80003d84 <devintr+0x40>
    80003de4:	00048593          	mv	a1,s1
    80003de8:	00002517          	auipc	a0,0x2
    80003dec:	43850513          	addi	a0,a0,1080 # 80006220 <CONSOLE_STATUS+0x210>
    80003df0:	00000097          	auipc	ra,0x0
    80003df4:	668080e7          	jalr	1640(ra) # 80004458 <__printf>
    80003df8:	00048513          	mv	a0,s1
    80003dfc:	00000097          	auipc	ra,0x0
    80003e00:	250080e7          	jalr	592(ra) # 8000404c <plic_complete>
    80003e04:	00100513          	li	a0,1
    80003e08:	f7dff06f          	j	80003d84 <devintr+0x40>
    80003e0c:	00004517          	auipc	a0,0x4
    80003e10:	df450513          	addi	a0,a0,-524 # 80007c00 <tickslock>
    80003e14:	00001097          	auipc	ra,0x1
    80003e18:	318080e7          	jalr	792(ra) # 8000512c <acquire>
    80003e1c:	00003717          	auipc	a4,0x3
    80003e20:	cd870713          	addi	a4,a4,-808 # 80006af4 <ticks>
    80003e24:	00072783          	lw	a5,0(a4)
    80003e28:	00004517          	auipc	a0,0x4
    80003e2c:	dd850513          	addi	a0,a0,-552 # 80007c00 <tickslock>
    80003e30:	0017879b          	addiw	a5,a5,1
    80003e34:	00f72023          	sw	a5,0(a4)
    80003e38:	00001097          	auipc	ra,0x1
    80003e3c:	3c0080e7          	jalr	960(ra) # 800051f8 <release>
    80003e40:	f65ff06f          	j	80003da4 <devintr+0x60>
    80003e44:	00001097          	auipc	ra,0x1
    80003e48:	f1c080e7          	jalr	-228(ra) # 80004d60 <uartintr>
    80003e4c:	fadff06f          	j	80003df8 <devintr+0xb4>

0000000080003e50 <kernelvec>:
    80003e50:	f0010113          	addi	sp,sp,-256
    80003e54:	00113023          	sd	ra,0(sp)
    80003e58:	00213423          	sd	sp,8(sp)
    80003e5c:	00313823          	sd	gp,16(sp)
    80003e60:	00413c23          	sd	tp,24(sp)
    80003e64:	02513023          	sd	t0,32(sp)
    80003e68:	02613423          	sd	t1,40(sp)
    80003e6c:	02713823          	sd	t2,48(sp)
    80003e70:	02813c23          	sd	s0,56(sp)
    80003e74:	04913023          	sd	s1,64(sp)
    80003e78:	04a13423          	sd	a0,72(sp)
    80003e7c:	04b13823          	sd	a1,80(sp)
    80003e80:	04c13c23          	sd	a2,88(sp)
    80003e84:	06d13023          	sd	a3,96(sp)
    80003e88:	06e13423          	sd	a4,104(sp)
    80003e8c:	06f13823          	sd	a5,112(sp)
    80003e90:	07013c23          	sd	a6,120(sp)
    80003e94:	09113023          	sd	a7,128(sp)
    80003e98:	09213423          	sd	s2,136(sp)
    80003e9c:	09313823          	sd	s3,144(sp)
    80003ea0:	09413c23          	sd	s4,152(sp)
    80003ea4:	0b513023          	sd	s5,160(sp)
    80003ea8:	0b613423          	sd	s6,168(sp)
    80003eac:	0b713823          	sd	s7,176(sp)
    80003eb0:	0b813c23          	sd	s8,184(sp)
    80003eb4:	0d913023          	sd	s9,192(sp)
    80003eb8:	0da13423          	sd	s10,200(sp)
    80003ebc:	0db13823          	sd	s11,208(sp)
    80003ec0:	0dc13c23          	sd	t3,216(sp)
    80003ec4:	0fd13023          	sd	t4,224(sp)
    80003ec8:	0fe13423          	sd	t5,232(sp)
    80003ecc:	0ff13823          	sd	t6,240(sp)
    80003ed0:	cd5ff0ef          	jal	ra,80003ba4 <kerneltrap>
    80003ed4:	00013083          	ld	ra,0(sp)
    80003ed8:	00813103          	ld	sp,8(sp)
    80003edc:	01013183          	ld	gp,16(sp)
    80003ee0:	02013283          	ld	t0,32(sp)
    80003ee4:	02813303          	ld	t1,40(sp)
    80003ee8:	03013383          	ld	t2,48(sp)
    80003eec:	03813403          	ld	s0,56(sp)
    80003ef0:	04013483          	ld	s1,64(sp)
    80003ef4:	04813503          	ld	a0,72(sp)
    80003ef8:	05013583          	ld	a1,80(sp)
    80003efc:	05813603          	ld	a2,88(sp)
    80003f00:	06013683          	ld	a3,96(sp)
    80003f04:	06813703          	ld	a4,104(sp)
    80003f08:	07013783          	ld	a5,112(sp)
    80003f0c:	07813803          	ld	a6,120(sp)
    80003f10:	08013883          	ld	a7,128(sp)
    80003f14:	08813903          	ld	s2,136(sp)
    80003f18:	09013983          	ld	s3,144(sp)
    80003f1c:	09813a03          	ld	s4,152(sp)
    80003f20:	0a013a83          	ld	s5,160(sp)
    80003f24:	0a813b03          	ld	s6,168(sp)
    80003f28:	0b013b83          	ld	s7,176(sp)
    80003f2c:	0b813c03          	ld	s8,184(sp)
    80003f30:	0c013c83          	ld	s9,192(sp)
    80003f34:	0c813d03          	ld	s10,200(sp)
    80003f38:	0d013d83          	ld	s11,208(sp)
    80003f3c:	0d813e03          	ld	t3,216(sp)
    80003f40:	0e013e83          	ld	t4,224(sp)
    80003f44:	0e813f03          	ld	t5,232(sp)
    80003f48:	0f013f83          	ld	t6,240(sp)
    80003f4c:	10010113          	addi	sp,sp,256
    80003f50:	10200073          	sret
    80003f54:	00000013          	nop
    80003f58:	00000013          	nop
    80003f5c:	00000013          	nop

0000000080003f60 <timervec>:
    80003f60:	34051573          	csrrw	a0,mscratch,a0
    80003f64:	00b53023          	sd	a1,0(a0)
    80003f68:	00c53423          	sd	a2,8(a0)
    80003f6c:	00d53823          	sd	a3,16(a0)
    80003f70:	01853583          	ld	a1,24(a0)
    80003f74:	02053603          	ld	a2,32(a0)
    80003f78:	0005b683          	ld	a3,0(a1)
    80003f7c:	00c686b3          	add	a3,a3,a2
    80003f80:	00d5b023          	sd	a3,0(a1)
    80003f84:	00200593          	li	a1,2
    80003f88:	14459073          	csrw	sip,a1
    80003f8c:	01053683          	ld	a3,16(a0)
    80003f90:	00853603          	ld	a2,8(a0)
    80003f94:	00053583          	ld	a1,0(a0)
    80003f98:	34051573          	csrrw	a0,mscratch,a0
    80003f9c:	30200073          	mret

0000000080003fa0 <plicinit>:
    80003fa0:	ff010113          	addi	sp,sp,-16
    80003fa4:	00813423          	sd	s0,8(sp)
    80003fa8:	01010413          	addi	s0,sp,16
    80003fac:	00813403          	ld	s0,8(sp)
    80003fb0:	0c0007b7          	lui	a5,0xc000
    80003fb4:	00100713          	li	a4,1
    80003fb8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80003fbc:	00e7a223          	sw	a4,4(a5)
    80003fc0:	01010113          	addi	sp,sp,16
    80003fc4:	00008067          	ret

0000000080003fc8 <plicinithart>:
    80003fc8:	ff010113          	addi	sp,sp,-16
    80003fcc:	00813023          	sd	s0,0(sp)
    80003fd0:	00113423          	sd	ra,8(sp)
    80003fd4:	01010413          	addi	s0,sp,16
    80003fd8:	00000097          	auipc	ra,0x0
    80003fdc:	a4c080e7          	jalr	-1460(ra) # 80003a24 <cpuid>
    80003fe0:	0085171b          	slliw	a4,a0,0x8
    80003fe4:	0c0027b7          	lui	a5,0xc002
    80003fe8:	00e787b3          	add	a5,a5,a4
    80003fec:	40200713          	li	a4,1026
    80003ff0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003ff4:	00813083          	ld	ra,8(sp)
    80003ff8:	00013403          	ld	s0,0(sp)
    80003ffc:	00d5151b          	slliw	a0,a0,0xd
    80004000:	0c2017b7          	lui	a5,0xc201
    80004004:	00a78533          	add	a0,a5,a0
    80004008:	00052023          	sw	zero,0(a0)
    8000400c:	01010113          	addi	sp,sp,16
    80004010:	00008067          	ret

0000000080004014 <plic_claim>:
    80004014:	ff010113          	addi	sp,sp,-16
    80004018:	00813023          	sd	s0,0(sp)
    8000401c:	00113423          	sd	ra,8(sp)
    80004020:	01010413          	addi	s0,sp,16
    80004024:	00000097          	auipc	ra,0x0
    80004028:	a00080e7          	jalr	-1536(ra) # 80003a24 <cpuid>
    8000402c:	00813083          	ld	ra,8(sp)
    80004030:	00013403          	ld	s0,0(sp)
    80004034:	00d5151b          	slliw	a0,a0,0xd
    80004038:	0c2017b7          	lui	a5,0xc201
    8000403c:	00a78533          	add	a0,a5,a0
    80004040:	00452503          	lw	a0,4(a0)
    80004044:	01010113          	addi	sp,sp,16
    80004048:	00008067          	ret

000000008000404c <plic_complete>:
    8000404c:	fe010113          	addi	sp,sp,-32
    80004050:	00813823          	sd	s0,16(sp)
    80004054:	00913423          	sd	s1,8(sp)
    80004058:	00113c23          	sd	ra,24(sp)
    8000405c:	02010413          	addi	s0,sp,32
    80004060:	00050493          	mv	s1,a0
    80004064:	00000097          	auipc	ra,0x0
    80004068:	9c0080e7          	jalr	-1600(ra) # 80003a24 <cpuid>
    8000406c:	01813083          	ld	ra,24(sp)
    80004070:	01013403          	ld	s0,16(sp)
    80004074:	00d5179b          	slliw	a5,a0,0xd
    80004078:	0c201737          	lui	a4,0xc201
    8000407c:	00f707b3          	add	a5,a4,a5
    80004080:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004084:	00813483          	ld	s1,8(sp)
    80004088:	02010113          	addi	sp,sp,32
    8000408c:	00008067          	ret

0000000080004090 <consolewrite>:
    80004090:	fb010113          	addi	sp,sp,-80
    80004094:	04813023          	sd	s0,64(sp)
    80004098:	04113423          	sd	ra,72(sp)
    8000409c:	02913c23          	sd	s1,56(sp)
    800040a0:	03213823          	sd	s2,48(sp)
    800040a4:	03313423          	sd	s3,40(sp)
    800040a8:	03413023          	sd	s4,32(sp)
    800040ac:	01513c23          	sd	s5,24(sp)
    800040b0:	05010413          	addi	s0,sp,80
    800040b4:	06c05c63          	blez	a2,8000412c <consolewrite+0x9c>
    800040b8:	00060993          	mv	s3,a2
    800040bc:	00050a13          	mv	s4,a0
    800040c0:	00058493          	mv	s1,a1
    800040c4:	00000913          	li	s2,0
    800040c8:	fff00a93          	li	s5,-1
    800040cc:	01c0006f          	j	800040e8 <consolewrite+0x58>
    800040d0:	fbf44503          	lbu	a0,-65(s0)
    800040d4:	0019091b          	addiw	s2,s2,1
    800040d8:	00148493          	addi	s1,s1,1
    800040dc:	00001097          	auipc	ra,0x1
    800040e0:	a9c080e7          	jalr	-1380(ra) # 80004b78 <uartputc>
    800040e4:	03298063          	beq	s3,s2,80004104 <consolewrite+0x74>
    800040e8:	00048613          	mv	a2,s1
    800040ec:	00100693          	li	a3,1
    800040f0:	000a0593          	mv	a1,s4
    800040f4:	fbf40513          	addi	a0,s0,-65
    800040f8:	00000097          	auipc	ra,0x0
    800040fc:	9e4080e7          	jalr	-1564(ra) # 80003adc <either_copyin>
    80004100:	fd5518e3          	bne	a0,s5,800040d0 <consolewrite+0x40>
    80004104:	04813083          	ld	ra,72(sp)
    80004108:	04013403          	ld	s0,64(sp)
    8000410c:	03813483          	ld	s1,56(sp)
    80004110:	02813983          	ld	s3,40(sp)
    80004114:	02013a03          	ld	s4,32(sp)
    80004118:	01813a83          	ld	s5,24(sp)
    8000411c:	00090513          	mv	a0,s2
    80004120:	03013903          	ld	s2,48(sp)
    80004124:	05010113          	addi	sp,sp,80
    80004128:	00008067          	ret
    8000412c:	00000913          	li	s2,0
    80004130:	fd5ff06f          	j	80004104 <consolewrite+0x74>

0000000080004134 <consoleread>:
    80004134:	f9010113          	addi	sp,sp,-112
    80004138:	06813023          	sd	s0,96(sp)
    8000413c:	04913c23          	sd	s1,88(sp)
    80004140:	05213823          	sd	s2,80(sp)
    80004144:	05313423          	sd	s3,72(sp)
    80004148:	05413023          	sd	s4,64(sp)
    8000414c:	03513c23          	sd	s5,56(sp)
    80004150:	03613823          	sd	s6,48(sp)
    80004154:	03713423          	sd	s7,40(sp)
    80004158:	03813023          	sd	s8,32(sp)
    8000415c:	06113423          	sd	ra,104(sp)
    80004160:	01913c23          	sd	s9,24(sp)
    80004164:	07010413          	addi	s0,sp,112
    80004168:	00060b93          	mv	s7,a2
    8000416c:	00050913          	mv	s2,a0
    80004170:	00058c13          	mv	s8,a1
    80004174:	00060b1b          	sext.w	s6,a2
    80004178:	00004497          	auipc	s1,0x4
    8000417c:	ab048493          	addi	s1,s1,-1360 # 80007c28 <cons>
    80004180:	00400993          	li	s3,4
    80004184:	fff00a13          	li	s4,-1
    80004188:	00a00a93          	li	s5,10
    8000418c:	05705e63          	blez	s7,800041e8 <consoleread+0xb4>
    80004190:	09c4a703          	lw	a4,156(s1)
    80004194:	0984a783          	lw	a5,152(s1)
    80004198:	0007071b          	sext.w	a4,a4
    8000419c:	08e78463          	beq	a5,a4,80004224 <consoleread+0xf0>
    800041a0:	07f7f713          	andi	a4,a5,127
    800041a4:	00e48733          	add	a4,s1,a4
    800041a8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800041ac:	0017869b          	addiw	a3,a5,1
    800041b0:	08d4ac23          	sw	a3,152(s1)
    800041b4:	00070c9b          	sext.w	s9,a4
    800041b8:	0b370663          	beq	a4,s3,80004264 <consoleread+0x130>
    800041bc:	00100693          	li	a3,1
    800041c0:	f9f40613          	addi	a2,s0,-97
    800041c4:	000c0593          	mv	a1,s8
    800041c8:	00090513          	mv	a0,s2
    800041cc:	f8e40fa3          	sb	a4,-97(s0)
    800041d0:	00000097          	auipc	ra,0x0
    800041d4:	8c0080e7          	jalr	-1856(ra) # 80003a90 <either_copyout>
    800041d8:	01450863          	beq	a0,s4,800041e8 <consoleread+0xb4>
    800041dc:	001c0c13          	addi	s8,s8,1
    800041e0:	fffb8b9b          	addiw	s7,s7,-1
    800041e4:	fb5c94e3          	bne	s9,s5,8000418c <consoleread+0x58>
    800041e8:	000b851b          	sext.w	a0,s7
    800041ec:	06813083          	ld	ra,104(sp)
    800041f0:	06013403          	ld	s0,96(sp)
    800041f4:	05813483          	ld	s1,88(sp)
    800041f8:	05013903          	ld	s2,80(sp)
    800041fc:	04813983          	ld	s3,72(sp)
    80004200:	04013a03          	ld	s4,64(sp)
    80004204:	03813a83          	ld	s5,56(sp)
    80004208:	02813b83          	ld	s7,40(sp)
    8000420c:	02013c03          	ld	s8,32(sp)
    80004210:	01813c83          	ld	s9,24(sp)
    80004214:	40ab053b          	subw	a0,s6,a0
    80004218:	03013b03          	ld	s6,48(sp)
    8000421c:	07010113          	addi	sp,sp,112
    80004220:	00008067          	ret
    80004224:	00001097          	auipc	ra,0x1
    80004228:	1d8080e7          	jalr	472(ra) # 800053fc <push_on>
    8000422c:	0984a703          	lw	a4,152(s1)
    80004230:	09c4a783          	lw	a5,156(s1)
    80004234:	0007879b          	sext.w	a5,a5
    80004238:	fef70ce3          	beq	a4,a5,80004230 <consoleread+0xfc>
    8000423c:	00001097          	auipc	ra,0x1
    80004240:	234080e7          	jalr	564(ra) # 80005470 <pop_on>
    80004244:	0984a783          	lw	a5,152(s1)
    80004248:	07f7f713          	andi	a4,a5,127
    8000424c:	00e48733          	add	a4,s1,a4
    80004250:	01874703          	lbu	a4,24(a4)
    80004254:	0017869b          	addiw	a3,a5,1
    80004258:	08d4ac23          	sw	a3,152(s1)
    8000425c:	00070c9b          	sext.w	s9,a4
    80004260:	f5371ee3          	bne	a4,s3,800041bc <consoleread+0x88>
    80004264:	000b851b          	sext.w	a0,s7
    80004268:	f96bf2e3          	bgeu	s7,s6,800041ec <consoleread+0xb8>
    8000426c:	08f4ac23          	sw	a5,152(s1)
    80004270:	f7dff06f          	j	800041ec <consoleread+0xb8>

0000000080004274 <consputc>:
    80004274:	10000793          	li	a5,256
    80004278:	00f50663          	beq	a0,a5,80004284 <consputc+0x10>
    8000427c:	00001317          	auipc	t1,0x1
    80004280:	9f430067          	jr	-1548(t1) # 80004c70 <uartputc_sync>
    80004284:	ff010113          	addi	sp,sp,-16
    80004288:	00113423          	sd	ra,8(sp)
    8000428c:	00813023          	sd	s0,0(sp)
    80004290:	01010413          	addi	s0,sp,16
    80004294:	00800513          	li	a0,8
    80004298:	00001097          	auipc	ra,0x1
    8000429c:	9d8080e7          	jalr	-1576(ra) # 80004c70 <uartputc_sync>
    800042a0:	02000513          	li	a0,32
    800042a4:	00001097          	auipc	ra,0x1
    800042a8:	9cc080e7          	jalr	-1588(ra) # 80004c70 <uartputc_sync>
    800042ac:	00013403          	ld	s0,0(sp)
    800042b0:	00813083          	ld	ra,8(sp)
    800042b4:	00800513          	li	a0,8
    800042b8:	01010113          	addi	sp,sp,16
    800042bc:	00001317          	auipc	t1,0x1
    800042c0:	9b430067          	jr	-1612(t1) # 80004c70 <uartputc_sync>

00000000800042c4 <consoleintr>:
    800042c4:	fe010113          	addi	sp,sp,-32
    800042c8:	00813823          	sd	s0,16(sp)
    800042cc:	00913423          	sd	s1,8(sp)
    800042d0:	01213023          	sd	s2,0(sp)
    800042d4:	00113c23          	sd	ra,24(sp)
    800042d8:	02010413          	addi	s0,sp,32
    800042dc:	00004917          	auipc	s2,0x4
    800042e0:	94c90913          	addi	s2,s2,-1716 # 80007c28 <cons>
    800042e4:	00050493          	mv	s1,a0
    800042e8:	00090513          	mv	a0,s2
    800042ec:	00001097          	auipc	ra,0x1
    800042f0:	e40080e7          	jalr	-448(ra) # 8000512c <acquire>
    800042f4:	02048c63          	beqz	s1,8000432c <consoleintr+0x68>
    800042f8:	0a092783          	lw	a5,160(s2)
    800042fc:	09892703          	lw	a4,152(s2)
    80004300:	07f00693          	li	a3,127
    80004304:	40e7873b          	subw	a4,a5,a4
    80004308:	02e6e263          	bltu	a3,a4,8000432c <consoleintr+0x68>
    8000430c:	00d00713          	li	a4,13
    80004310:	04e48063          	beq	s1,a4,80004350 <consoleintr+0x8c>
    80004314:	07f7f713          	andi	a4,a5,127
    80004318:	00e90733          	add	a4,s2,a4
    8000431c:	0017879b          	addiw	a5,a5,1
    80004320:	0af92023          	sw	a5,160(s2)
    80004324:	00970c23          	sb	s1,24(a4)
    80004328:	08f92e23          	sw	a5,156(s2)
    8000432c:	01013403          	ld	s0,16(sp)
    80004330:	01813083          	ld	ra,24(sp)
    80004334:	00813483          	ld	s1,8(sp)
    80004338:	00013903          	ld	s2,0(sp)
    8000433c:	00004517          	auipc	a0,0x4
    80004340:	8ec50513          	addi	a0,a0,-1812 # 80007c28 <cons>
    80004344:	02010113          	addi	sp,sp,32
    80004348:	00001317          	auipc	t1,0x1
    8000434c:	eb030067          	jr	-336(t1) # 800051f8 <release>
    80004350:	00a00493          	li	s1,10
    80004354:	fc1ff06f          	j	80004314 <consoleintr+0x50>

0000000080004358 <consoleinit>:
    80004358:	fe010113          	addi	sp,sp,-32
    8000435c:	00113c23          	sd	ra,24(sp)
    80004360:	00813823          	sd	s0,16(sp)
    80004364:	00913423          	sd	s1,8(sp)
    80004368:	02010413          	addi	s0,sp,32
    8000436c:	00004497          	auipc	s1,0x4
    80004370:	8bc48493          	addi	s1,s1,-1860 # 80007c28 <cons>
    80004374:	00048513          	mv	a0,s1
    80004378:	00002597          	auipc	a1,0x2
    8000437c:	f0058593          	addi	a1,a1,-256 # 80006278 <CONSOLE_STATUS+0x268>
    80004380:	00001097          	auipc	ra,0x1
    80004384:	d88080e7          	jalr	-632(ra) # 80005108 <initlock>
    80004388:	00000097          	auipc	ra,0x0
    8000438c:	7ac080e7          	jalr	1964(ra) # 80004b34 <uartinit>
    80004390:	01813083          	ld	ra,24(sp)
    80004394:	01013403          	ld	s0,16(sp)
    80004398:	00000797          	auipc	a5,0x0
    8000439c:	d9c78793          	addi	a5,a5,-612 # 80004134 <consoleread>
    800043a0:	0af4bc23          	sd	a5,184(s1)
    800043a4:	00000797          	auipc	a5,0x0
    800043a8:	cec78793          	addi	a5,a5,-788 # 80004090 <consolewrite>
    800043ac:	0cf4b023          	sd	a5,192(s1)
    800043b0:	00813483          	ld	s1,8(sp)
    800043b4:	02010113          	addi	sp,sp,32
    800043b8:	00008067          	ret

00000000800043bc <console_read>:
    800043bc:	ff010113          	addi	sp,sp,-16
    800043c0:	00813423          	sd	s0,8(sp)
    800043c4:	01010413          	addi	s0,sp,16
    800043c8:	00813403          	ld	s0,8(sp)
    800043cc:	00004317          	auipc	t1,0x4
    800043d0:	91433303          	ld	t1,-1772(t1) # 80007ce0 <devsw+0x10>
    800043d4:	01010113          	addi	sp,sp,16
    800043d8:	00030067          	jr	t1

00000000800043dc <console_write>:
    800043dc:	ff010113          	addi	sp,sp,-16
    800043e0:	00813423          	sd	s0,8(sp)
    800043e4:	01010413          	addi	s0,sp,16
    800043e8:	00813403          	ld	s0,8(sp)
    800043ec:	00004317          	auipc	t1,0x4
    800043f0:	8fc33303          	ld	t1,-1796(t1) # 80007ce8 <devsw+0x18>
    800043f4:	01010113          	addi	sp,sp,16
    800043f8:	00030067          	jr	t1

00000000800043fc <panic>:
    800043fc:	fe010113          	addi	sp,sp,-32
    80004400:	00113c23          	sd	ra,24(sp)
    80004404:	00813823          	sd	s0,16(sp)
    80004408:	00913423          	sd	s1,8(sp)
    8000440c:	02010413          	addi	s0,sp,32
    80004410:	00050493          	mv	s1,a0
    80004414:	00002517          	auipc	a0,0x2
    80004418:	e6c50513          	addi	a0,a0,-404 # 80006280 <CONSOLE_STATUS+0x270>
    8000441c:	00004797          	auipc	a5,0x4
    80004420:	9607a623          	sw	zero,-1684(a5) # 80007d88 <pr+0x18>
    80004424:	00000097          	auipc	ra,0x0
    80004428:	034080e7          	jalr	52(ra) # 80004458 <__printf>
    8000442c:	00048513          	mv	a0,s1
    80004430:	00000097          	auipc	ra,0x0
    80004434:	028080e7          	jalr	40(ra) # 80004458 <__printf>
    80004438:	00002517          	auipc	a0,0x2
    8000443c:	e2850513          	addi	a0,a0,-472 # 80006260 <CONSOLE_STATUS+0x250>
    80004440:	00000097          	auipc	ra,0x0
    80004444:	018080e7          	jalr	24(ra) # 80004458 <__printf>
    80004448:	00100793          	li	a5,1
    8000444c:	00002717          	auipc	a4,0x2
    80004450:	6af72623          	sw	a5,1708(a4) # 80006af8 <panicked>
    80004454:	0000006f          	j	80004454 <panic+0x58>

0000000080004458 <__printf>:
    80004458:	f3010113          	addi	sp,sp,-208
    8000445c:	08813023          	sd	s0,128(sp)
    80004460:	07313423          	sd	s3,104(sp)
    80004464:	09010413          	addi	s0,sp,144
    80004468:	05813023          	sd	s8,64(sp)
    8000446c:	08113423          	sd	ra,136(sp)
    80004470:	06913c23          	sd	s1,120(sp)
    80004474:	07213823          	sd	s2,112(sp)
    80004478:	07413023          	sd	s4,96(sp)
    8000447c:	05513c23          	sd	s5,88(sp)
    80004480:	05613823          	sd	s6,80(sp)
    80004484:	05713423          	sd	s7,72(sp)
    80004488:	03913c23          	sd	s9,56(sp)
    8000448c:	03a13823          	sd	s10,48(sp)
    80004490:	03b13423          	sd	s11,40(sp)
    80004494:	00004317          	auipc	t1,0x4
    80004498:	8dc30313          	addi	t1,t1,-1828 # 80007d70 <pr>
    8000449c:	01832c03          	lw	s8,24(t1)
    800044a0:	00b43423          	sd	a1,8(s0)
    800044a4:	00c43823          	sd	a2,16(s0)
    800044a8:	00d43c23          	sd	a3,24(s0)
    800044ac:	02e43023          	sd	a4,32(s0)
    800044b0:	02f43423          	sd	a5,40(s0)
    800044b4:	03043823          	sd	a6,48(s0)
    800044b8:	03143c23          	sd	a7,56(s0)
    800044bc:	00050993          	mv	s3,a0
    800044c0:	4a0c1663          	bnez	s8,8000496c <__printf+0x514>
    800044c4:	60098c63          	beqz	s3,80004adc <__printf+0x684>
    800044c8:	0009c503          	lbu	a0,0(s3)
    800044cc:	00840793          	addi	a5,s0,8
    800044d0:	f6f43c23          	sd	a5,-136(s0)
    800044d4:	00000493          	li	s1,0
    800044d8:	22050063          	beqz	a0,800046f8 <__printf+0x2a0>
    800044dc:	00002a37          	lui	s4,0x2
    800044e0:	00018ab7          	lui	s5,0x18
    800044e4:	000f4b37          	lui	s6,0xf4
    800044e8:	00989bb7          	lui	s7,0x989
    800044ec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800044f0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800044f4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800044f8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800044fc:	00148c9b          	addiw	s9,s1,1
    80004500:	02500793          	li	a5,37
    80004504:	01998933          	add	s2,s3,s9
    80004508:	38f51263          	bne	a0,a5,8000488c <__printf+0x434>
    8000450c:	00094783          	lbu	a5,0(s2)
    80004510:	00078c9b          	sext.w	s9,a5
    80004514:	1e078263          	beqz	a5,800046f8 <__printf+0x2a0>
    80004518:	0024849b          	addiw	s1,s1,2
    8000451c:	07000713          	li	a4,112
    80004520:	00998933          	add	s2,s3,s1
    80004524:	38e78a63          	beq	a5,a4,800048b8 <__printf+0x460>
    80004528:	20f76863          	bltu	a4,a5,80004738 <__printf+0x2e0>
    8000452c:	42a78863          	beq	a5,a0,8000495c <__printf+0x504>
    80004530:	06400713          	li	a4,100
    80004534:	40e79663          	bne	a5,a4,80004940 <__printf+0x4e8>
    80004538:	f7843783          	ld	a5,-136(s0)
    8000453c:	0007a603          	lw	a2,0(a5)
    80004540:	00878793          	addi	a5,a5,8
    80004544:	f6f43c23          	sd	a5,-136(s0)
    80004548:	42064a63          	bltz	a2,8000497c <__printf+0x524>
    8000454c:	00a00713          	li	a4,10
    80004550:	02e677bb          	remuw	a5,a2,a4
    80004554:	00002d97          	auipc	s11,0x2
    80004558:	d54d8d93          	addi	s11,s11,-684 # 800062a8 <digits>
    8000455c:	00900593          	li	a1,9
    80004560:	0006051b          	sext.w	a0,a2
    80004564:	00000c93          	li	s9,0
    80004568:	02079793          	slli	a5,a5,0x20
    8000456c:	0207d793          	srli	a5,a5,0x20
    80004570:	00fd87b3          	add	a5,s11,a5
    80004574:	0007c783          	lbu	a5,0(a5)
    80004578:	02e656bb          	divuw	a3,a2,a4
    8000457c:	f8f40023          	sb	a5,-128(s0)
    80004580:	14c5d863          	bge	a1,a2,800046d0 <__printf+0x278>
    80004584:	06300593          	li	a1,99
    80004588:	00100c93          	li	s9,1
    8000458c:	02e6f7bb          	remuw	a5,a3,a4
    80004590:	02079793          	slli	a5,a5,0x20
    80004594:	0207d793          	srli	a5,a5,0x20
    80004598:	00fd87b3          	add	a5,s11,a5
    8000459c:	0007c783          	lbu	a5,0(a5)
    800045a0:	02e6d73b          	divuw	a4,a3,a4
    800045a4:	f8f400a3          	sb	a5,-127(s0)
    800045a8:	12a5f463          	bgeu	a1,a0,800046d0 <__printf+0x278>
    800045ac:	00a00693          	li	a3,10
    800045b0:	00900593          	li	a1,9
    800045b4:	02d777bb          	remuw	a5,a4,a3
    800045b8:	02079793          	slli	a5,a5,0x20
    800045bc:	0207d793          	srli	a5,a5,0x20
    800045c0:	00fd87b3          	add	a5,s11,a5
    800045c4:	0007c503          	lbu	a0,0(a5)
    800045c8:	02d757bb          	divuw	a5,a4,a3
    800045cc:	f8a40123          	sb	a0,-126(s0)
    800045d0:	48e5f263          	bgeu	a1,a4,80004a54 <__printf+0x5fc>
    800045d4:	06300513          	li	a0,99
    800045d8:	02d7f5bb          	remuw	a1,a5,a3
    800045dc:	02059593          	slli	a1,a1,0x20
    800045e0:	0205d593          	srli	a1,a1,0x20
    800045e4:	00bd85b3          	add	a1,s11,a1
    800045e8:	0005c583          	lbu	a1,0(a1)
    800045ec:	02d7d7bb          	divuw	a5,a5,a3
    800045f0:	f8b401a3          	sb	a1,-125(s0)
    800045f4:	48e57263          	bgeu	a0,a4,80004a78 <__printf+0x620>
    800045f8:	3e700513          	li	a0,999
    800045fc:	02d7f5bb          	remuw	a1,a5,a3
    80004600:	02059593          	slli	a1,a1,0x20
    80004604:	0205d593          	srli	a1,a1,0x20
    80004608:	00bd85b3          	add	a1,s11,a1
    8000460c:	0005c583          	lbu	a1,0(a1)
    80004610:	02d7d7bb          	divuw	a5,a5,a3
    80004614:	f8b40223          	sb	a1,-124(s0)
    80004618:	46e57663          	bgeu	a0,a4,80004a84 <__printf+0x62c>
    8000461c:	02d7f5bb          	remuw	a1,a5,a3
    80004620:	02059593          	slli	a1,a1,0x20
    80004624:	0205d593          	srli	a1,a1,0x20
    80004628:	00bd85b3          	add	a1,s11,a1
    8000462c:	0005c583          	lbu	a1,0(a1)
    80004630:	02d7d7bb          	divuw	a5,a5,a3
    80004634:	f8b402a3          	sb	a1,-123(s0)
    80004638:	46ea7863          	bgeu	s4,a4,80004aa8 <__printf+0x650>
    8000463c:	02d7f5bb          	remuw	a1,a5,a3
    80004640:	02059593          	slli	a1,a1,0x20
    80004644:	0205d593          	srli	a1,a1,0x20
    80004648:	00bd85b3          	add	a1,s11,a1
    8000464c:	0005c583          	lbu	a1,0(a1)
    80004650:	02d7d7bb          	divuw	a5,a5,a3
    80004654:	f8b40323          	sb	a1,-122(s0)
    80004658:	3eeaf863          	bgeu	s5,a4,80004a48 <__printf+0x5f0>
    8000465c:	02d7f5bb          	remuw	a1,a5,a3
    80004660:	02059593          	slli	a1,a1,0x20
    80004664:	0205d593          	srli	a1,a1,0x20
    80004668:	00bd85b3          	add	a1,s11,a1
    8000466c:	0005c583          	lbu	a1,0(a1)
    80004670:	02d7d7bb          	divuw	a5,a5,a3
    80004674:	f8b403a3          	sb	a1,-121(s0)
    80004678:	42eb7e63          	bgeu	s6,a4,80004ab4 <__printf+0x65c>
    8000467c:	02d7f5bb          	remuw	a1,a5,a3
    80004680:	02059593          	slli	a1,a1,0x20
    80004684:	0205d593          	srli	a1,a1,0x20
    80004688:	00bd85b3          	add	a1,s11,a1
    8000468c:	0005c583          	lbu	a1,0(a1)
    80004690:	02d7d7bb          	divuw	a5,a5,a3
    80004694:	f8b40423          	sb	a1,-120(s0)
    80004698:	42ebfc63          	bgeu	s7,a4,80004ad0 <__printf+0x678>
    8000469c:	02079793          	slli	a5,a5,0x20
    800046a0:	0207d793          	srli	a5,a5,0x20
    800046a4:	00fd8db3          	add	s11,s11,a5
    800046a8:	000dc703          	lbu	a4,0(s11)
    800046ac:	00a00793          	li	a5,10
    800046b0:	00900c93          	li	s9,9
    800046b4:	f8e404a3          	sb	a4,-119(s0)
    800046b8:	00065c63          	bgez	a2,800046d0 <__printf+0x278>
    800046bc:	f9040713          	addi	a4,s0,-112
    800046c0:	00f70733          	add	a4,a4,a5
    800046c4:	02d00693          	li	a3,45
    800046c8:	fed70823          	sb	a3,-16(a4)
    800046cc:	00078c93          	mv	s9,a5
    800046d0:	f8040793          	addi	a5,s0,-128
    800046d4:	01978cb3          	add	s9,a5,s9
    800046d8:	f7f40d13          	addi	s10,s0,-129
    800046dc:	000cc503          	lbu	a0,0(s9)
    800046e0:	fffc8c93          	addi	s9,s9,-1
    800046e4:	00000097          	auipc	ra,0x0
    800046e8:	b90080e7          	jalr	-1136(ra) # 80004274 <consputc>
    800046ec:	ffac98e3          	bne	s9,s10,800046dc <__printf+0x284>
    800046f0:	00094503          	lbu	a0,0(s2)
    800046f4:	e00514e3          	bnez	a0,800044fc <__printf+0xa4>
    800046f8:	1a0c1663          	bnez	s8,800048a4 <__printf+0x44c>
    800046fc:	08813083          	ld	ra,136(sp)
    80004700:	08013403          	ld	s0,128(sp)
    80004704:	07813483          	ld	s1,120(sp)
    80004708:	07013903          	ld	s2,112(sp)
    8000470c:	06813983          	ld	s3,104(sp)
    80004710:	06013a03          	ld	s4,96(sp)
    80004714:	05813a83          	ld	s5,88(sp)
    80004718:	05013b03          	ld	s6,80(sp)
    8000471c:	04813b83          	ld	s7,72(sp)
    80004720:	04013c03          	ld	s8,64(sp)
    80004724:	03813c83          	ld	s9,56(sp)
    80004728:	03013d03          	ld	s10,48(sp)
    8000472c:	02813d83          	ld	s11,40(sp)
    80004730:	0d010113          	addi	sp,sp,208
    80004734:	00008067          	ret
    80004738:	07300713          	li	a4,115
    8000473c:	1ce78a63          	beq	a5,a4,80004910 <__printf+0x4b8>
    80004740:	07800713          	li	a4,120
    80004744:	1ee79e63          	bne	a5,a4,80004940 <__printf+0x4e8>
    80004748:	f7843783          	ld	a5,-136(s0)
    8000474c:	0007a703          	lw	a4,0(a5)
    80004750:	00878793          	addi	a5,a5,8
    80004754:	f6f43c23          	sd	a5,-136(s0)
    80004758:	28074263          	bltz	a4,800049dc <__printf+0x584>
    8000475c:	00002d97          	auipc	s11,0x2
    80004760:	b4cd8d93          	addi	s11,s11,-1204 # 800062a8 <digits>
    80004764:	00f77793          	andi	a5,a4,15
    80004768:	00fd87b3          	add	a5,s11,a5
    8000476c:	0007c683          	lbu	a3,0(a5)
    80004770:	00f00613          	li	a2,15
    80004774:	0007079b          	sext.w	a5,a4
    80004778:	f8d40023          	sb	a3,-128(s0)
    8000477c:	0047559b          	srliw	a1,a4,0x4
    80004780:	0047569b          	srliw	a3,a4,0x4
    80004784:	00000c93          	li	s9,0
    80004788:	0ee65063          	bge	a2,a4,80004868 <__printf+0x410>
    8000478c:	00f6f693          	andi	a3,a3,15
    80004790:	00dd86b3          	add	a3,s11,a3
    80004794:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004798:	0087d79b          	srliw	a5,a5,0x8
    8000479c:	00100c93          	li	s9,1
    800047a0:	f8d400a3          	sb	a3,-127(s0)
    800047a4:	0cb67263          	bgeu	a2,a1,80004868 <__printf+0x410>
    800047a8:	00f7f693          	andi	a3,a5,15
    800047ac:	00dd86b3          	add	a3,s11,a3
    800047b0:	0006c583          	lbu	a1,0(a3)
    800047b4:	00f00613          	li	a2,15
    800047b8:	0047d69b          	srliw	a3,a5,0x4
    800047bc:	f8b40123          	sb	a1,-126(s0)
    800047c0:	0047d593          	srli	a1,a5,0x4
    800047c4:	28f67e63          	bgeu	a2,a5,80004a60 <__printf+0x608>
    800047c8:	00f6f693          	andi	a3,a3,15
    800047cc:	00dd86b3          	add	a3,s11,a3
    800047d0:	0006c503          	lbu	a0,0(a3)
    800047d4:	0087d813          	srli	a6,a5,0x8
    800047d8:	0087d69b          	srliw	a3,a5,0x8
    800047dc:	f8a401a3          	sb	a0,-125(s0)
    800047e0:	28b67663          	bgeu	a2,a1,80004a6c <__printf+0x614>
    800047e4:	00f6f693          	andi	a3,a3,15
    800047e8:	00dd86b3          	add	a3,s11,a3
    800047ec:	0006c583          	lbu	a1,0(a3)
    800047f0:	00c7d513          	srli	a0,a5,0xc
    800047f4:	00c7d69b          	srliw	a3,a5,0xc
    800047f8:	f8b40223          	sb	a1,-124(s0)
    800047fc:	29067a63          	bgeu	a2,a6,80004a90 <__printf+0x638>
    80004800:	00f6f693          	andi	a3,a3,15
    80004804:	00dd86b3          	add	a3,s11,a3
    80004808:	0006c583          	lbu	a1,0(a3)
    8000480c:	0107d813          	srli	a6,a5,0x10
    80004810:	0107d69b          	srliw	a3,a5,0x10
    80004814:	f8b402a3          	sb	a1,-123(s0)
    80004818:	28a67263          	bgeu	a2,a0,80004a9c <__printf+0x644>
    8000481c:	00f6f693          	andi	a3,a3,15
    80004820:	00dd86b3          	add	a3,s11,a3
    80004824:	0006c683          	lbu	a3,0(a3)
    80004828:	0147d79b          	srliw	a5,a5,0x14
    8000482c:	f8d40323          	sb	a3,-122(s0)
    80004830:	21067663          	bgeu	a2,a6,80004a3c <__printf+0x5e4>
    80004834:	02079793          	slli	a5,a5,0x20
    80004838:	0207d793          	srli	a5,a5,0x20
    8000483c:	00fd8db3          	add	s11,s11,a5
    80004840:	000dc683          	lbu	a3,0(s11)
    80004844:	00800793          	li	a5,8
    80004848:	00700c93          	li	s9,7
    8000484c:	f8d403a3          	sb	a3,-121(s0)
    80004850:	00075c63          	bgez	a4,80004868 <__printf+0x410>
    80004854:	f9040713          	addi	a4,s0,-112
    80004858:	00f70733          	add	a4,a4,a5
    8000485c:	02d00693          	li	a3,45
    80004860:	fed70823          	sb	a3,-16(a4)
    80004864:	00078c93          	mv	s9,a5
    80004868:	f8040793          	addi	a5,s0,-128
    8000486c:	01978cb3          	add	s9,a5,s9
    80004870:	f7f40d13          	addi	s10,s0,-129
    80004874:	000cc503          	lbu	a0,0(s9)
    80004878:	fffc8c93          	addi	s9,s9,-1
    8000487c:	00000097          	auipc	ra,0x0
    80004880:	9f8080e7          	jalr	-1544(ra) # 80004274 <consputc>
    80004884:	ff9d18e3          	bne	s10,s9,80004874 <__printf+0x41c>
    80004888:	0100006f          	j	80004898 <__printf+0x440>
    8000488c:	00000097          	auipc	ra,0x0
    80004890:	9e8080e7          	jalr	-1560(ra) # 80004274 <consputc>
    80004894:	000c8493          	mv	s1,s9
    80004898:	00094503          	lbu	a0,0(s2)
    8000489c:	c60510e3          	bnez	a0,800044fc <__printf+0xa4>
    800048a0:	e40c0ee3          	beqz	s8,800046fc <__printf+0x2a4>
    800048a4:	00003517          	auipc	a0,0x3
    800048a8:	4cc50513          	addi	a0,a0,1228 # 80007d70 <pr>
    800048ac:	00001097          	auipc	ra,0x1
    800048b0:	94c080e7          	jalr	-1716(ra) # 800051f8 <release>
    800048b4:	e49ff06f          	j	800046fc <__printf+0x2a4>
    800048b8:	f7843783          	ld	a5,-136(s0)
    800048bc:	03000513          	li	a0,48
    800048c0:	01000d13          	li	s10,16
    800048c4:	00878713          	addi	a4,a5,8
    800048c8:	0007bc83          	ld	s9,0(a5)
    800048cc:	f6e43c23          	sd	a4,-136(s0)
    800048d0:	00000097          	auipc	ra,0x0
    800048d4:	9a4080e7          	jalr	-1628(ra) # 80004274 <consputc>
    800048d8:	07800513          	li	a0,120
    800048dc:	00000097          	auipc	ra,0x0
    800048e0:	998080e7          	jalr	-1640(ra) # 80004274 <consputc>
    800048e4:	00002d97          	auipc	s11,0x2
    800048e8:	9c4d8d93          	addi	s11,s11,-1596 # 800062a8 <digits>
    800048ec:	03ccd793          	srli	a5,s9,0x3c
    800048f0:	00fd87b3          	add	a5,s11,a5
    800048f4:	0007c503          	lbu	a0,0(a5)
    800048f8:	fffd0d1b          	addiw	s10,s10,-1
    800048fc:	004c9c93          	slli	s9,s9,0x4
    80004900:	00000097          	auipc	ra,0x0
    80004904:	974080e7          	jalr	-1676(ra) # 80004274 <consputc>
    80004908:	fe0d12e3          	bnez	s10,800048ec <__printf+0x494>
    8000490c:	f8dff06f          	j	80004898 <__printf+0x440>
    80004910:	f7843783          	ld	a5,-136(s0)
    80004914:	0007bc83          	ld	s9,0(a5)
    80004918:	00878793          	addi	a5,a5,8
    8000491c:	f6f43c23          	sd	a5,-136(s0)
    80004920:	000c9a63          	bnez	s9,80004934 <__printf+0x4dc>
    80004924:	1080006f          	j	80004a2c <__printf+0x5d4>
    80004928:	001c8c93          	addi	s9,s9,1
    8000492c:	00000097          	auipc	ra,0x0
    80004930:	948080e7          	jalr	-1720(ra) # 80004274 <consputc>
    80004934:	000cc503          	lbu	a0,0(s9)
    80004938:	fe0518e3          	bnez	a0,80004928 <__printf+0x4d0>
    8000493c:	f5dff06f          	j	80004898 <__printf+0x440>
    80004940:	02500513          	li	a0,37
    80004944:	00000097          	auipc	ra,0x0
    80004948:	930080e7          	jalr	-1744(ra) # 80004274 <consputc>
    8000494c:	000c8513          	mv	a0,s9
    80004950:	00000097          	auipc	ra,0x0
    80004954:	924080e7          	jalr	-1756(ra) # 80004274 <consputc>
    80004958:	f41ff06f          	j	80004898 <__printf+0x440>
    8000495c:	02500513          	li	a0,37
    80004960:	00000097          	auipc	ra,0x0
    80004964:	914080e7          	jalr	-1772(ra) # 80004274 <consputc>
    80004968:	f31ff06f          	j	80004898 <__printf+0x440>
    8000496c:	00030513          	mv	a0,t1
    80004970:	00000097          	auipc	ra,0x0
    80004974:	7bc080e7          	jalr	1980(ra) # 8000512c <acquire>
    80004978:	b4dff06f          	j	800044c4 <__printf+0x6c>
    8000497c:	40c0053b          	negw	a0,a2
    80004980:	00a00713          	li	a4,10
    80004984:	02e576bb          	remuw	a3,a0,a4
    80004988:	00002d97          	auipc	s11,0x2
    8000498c:	920d8d93          	addi	s11,s11,-1760 # 800062a8 <digits>
    80004990:	ff700593          	li	a1,-9
    80004994:	02069693          	slli	a3,a3,0x20
    80004998:	0206d693          	srli	a3,a3,0x20
    8000499c:	00dd86b3          	add	a3,s11,a3
    800049a0:	0006c683          	lbu	a3,0(a3)
    800049a4:	02e557bb          	divuw	a5,a0,a4
    800049a8:	f8d40023          	sb	a3,-128(s0)
    800049ac:	10b65e63          	bge	a2,a1,80004ac8 <__printf+0x670>
    800049b0:	06300593          	li	a1,99
    800049b4:	02e7f6bb          	remuw	a3,a5,a4
    800049b8:	02069693          	slli	a3,a3,0x20
    800049bc:	0206d693          	srli	a3,a3,0x20
    800049c0:	00dd86b3          	add	a3,s11,a3
    800049c4:	0006c683          	lbu	a3,0(a3)
    800049c8:	02e7d73b          	divuw	a4,a5,a4
    800049cc:	00200793          	li	a5,2
    800049d0:	f8d400a3          	sb	a3,-127(s0)
    800049d4:	bca5ece3          	bltu	a1,a0,800045ac <__printf+0x154>
    800049d8:	ce5ff06f          	j	800046bc <__printf+0x264>
    800049dc:	40e007bb          	negw	a5,a4
    800049e0:	00002d97          	auipc	s11,0x2
    800049e4:	8c8d8d93          	addi	s11,s11,-1848 # 800062a8 <digits>
    800049e8:	00f7f693          	andi	a3,a5,15
    800049ec:	00dd86b3          	add	a3,s11,a3
    800049f0:	0006c583          	lbu	a1,0(a3)
    800049f4:	ff100613          	li	a2,-15
    800049f8:	0047d69b          	srliw	a3,a5,0x4
    800049fc:	f8b40023          	sb	a1,-128(s0)
    80004a00:	0047d59b          	srliw	a1,a5,0x4
    80004a04:	0ac75e63          	bge	a4,a2,80004ac0 <__printf+0x668>
    80004a08:	00f6f693          	andi	a3,a3,15
    80004a0c:	00dd86b3          	add	a3,s11,a3
    80004a10:	0006c603          	lbu	a2,0(a3)
    80004a14:	00f00693          	li	a3,15
    80004a18:	0087d79b          	srliw	a5,a5,0x8
    80004a1c:	f8c400a3          	sb	a2,-127(s0)
    80004a20:	d8b6e4e3          	bltu	a3,a1,800047a8 <__printf+0x350>
    80004a24:	00200793          	li	a5,2
    80004a28:	e2dff06f          	j	80004854 <__printf+0x3fc>
    80004a2c:	00002c97          	auipc	s9,0x2
    80004a30:	85cc8c93          	addi	s9,s9,-1956 # 80006288 <CONSOLE_STATUS+0x278>
    80004a34:	02800513          	li	a0,40
    80004a38:	ef1ff06f          	j	80004928 <__printf+0x4d0>
    80004a3c:	00700793          	li	a5,7
    80004a40:	00600c93          	li	s9,6
    80004a44:	e0dff06f          	j	80004850 <__printf+0x3f8>
    80004a48:	00700793          	li	a5,7
    80004a4c:	00600c93          	li	s9,6
    80004a50:	c69ff06f          	j	800046b8 <__printf+0x260>
    80004a54:	00300793          	li	a5,3
    80004a58:	00200c93          	li	s9,2
    80004a5c:	c5dff06f          	j	800046b8 <__printf+0x260>
    80004a60:	00300793          	li	a5,3
    80004a64:	00200c93          	li	s9,2
    80004a68:	de9ff06f          	j	80004850 <__printf+0x3f8>
    80004a6c:	00400793          	li	a5,4
    80004a70:	00300c93          	li	s9,3
    80004a74:	dddff06f          	j	80004850 <__printf+0x3f8>
    80004a78:	00400793          	li	a5,4
    80004a7c:	00300c93          	li	s9,3
    80004a80:	c39ff06f          	j	800046b8 <__printf+0x260>
    80004a84:	00500793          	li	a5,5
    80004a88:	00400c93          	li	s9,4
    80004a8c:	c2dff06f          	j	800046b8 <__printf+0x260>
    80004a90:	00500793          	li	a5,5
    80004a94:	00400c93          	li	s9,4
    80004a98:	db9ff06f          	j	80004850 <__printf+0x3f8>
    80004a9c:	00600793          	li	a5,6
    80004aa0:	00500c93          	li	s9,5
    80004aa4:	dadff06f          	j	80004850 <__printf+0x3f8>
    80004aa8:	00600793          	li	a5,6
    80004aac:	00500c93          	li	s9,5
    80004ab0:	c09ff06f          	j	800046b8 <__printf+0x260>
    80004ab4:	00800793          	li	a5,8
    80004ab8:	00700c93          	li	s9,7
    80004abc:	bfdff06f          	j	800046b8 <__printf+0x260>
    80004ac0:	00100793          	li	a5,1
    80004ac4:	d91ff06f          	j	80004854 <__printf+0x3fc>
    80004ac8:	00100793          	li	a5,1
    80004acc:	bf1ff06f          	j	800046bc <__printf+0x264>
    80004ad0:	00900793          	li	a5,9
    80004ad4:	00800c93          	li	s9,8
    80004ad8:	be1ff06f          	j	800046b8 <__printf+0x260>
    80004adc:	00001517          	auipc	a0,0x1
    80004ae0:	7b450513          	addi	a0,a0,1972 # 80006290 <CONSOLE_STATUS+0x280>
    80004ae4:	00000097          	auipc	ra,0x0
    80004ae8:	918080e7          	jalr	-1768(ra) # 800043fc <panic>

0000000080004aec <printfinit>:
    80004aec:	fe010113          	addi	sp,sp,-32
    80004af0:	00813823          	sd	s0,16(sp)
    80004af4:	00913423          	sd	s1,8(sp)
    80004af8:	00113c23          	sd	ra,24(sp)
    80004afc:	02010413          	addi	s0,sp,32
    80004b00:	00003497          	auipc	s1,0x3
    80004b04:	27048493          	addi	s1,s1,624 # 80007d70 <pr>
    80004b08:	00048513          	mv	a0,s1
    80004b0c:	00001597          	auipc	a1,0x1
    80004b10:	79458593          	addi	a1,a1,1940 # 800062a0 <CONSOLE_STATUS+0x290>
    80004b14:	00000097          	auipc	ra,0x0
    80004b18:	5f4080e7          	jalr	1524(ra) # 80005108 <initlock>
    80004b1c:	01813083          	ld	ra,24(sp)
    80004b20:	01013403          	ld	s0,16(sp)
    80004b24:	0004ac23          	sw	zero,24(s1)
    80004b28:	00813483          	ld	s1,8(sp)
    80004b2c:	02010113          	addi	sp,sp,32
    80004b30:	00008067          	ret

0000000080004b34 <uartinit>:
    80004b34:	ff010113          	addi	sp,sp,-16
    80004b38:	00813423          	sd	s0,8(sp)
    80004b3c:	01010413          	addi	s0,sp,16
    80004b40:	100007b7          	lui	a5,0x10000
    80004b44:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004b48:	f8000713          	li	a4,-128
    80004b4c:	00e781a3          	sb	a4,3(a5)
    80004b50:	00300713          	li	a4,3
    80004b54:	00e78023          	sb	a4,0(a5)
    80004b58:	000780a3          	sb	zero,1(a5)
    80004b5c:	00e781a3          	sb	a4,3(a5)
    80004b60:	00700693          	li	a3,7
    80004b64:	00d78123          	sb	a3,2(a5)
    80004b68:	00e780a3          	sb	a4,1(a5)
    80004b6c:	00813403          	ld	s0,8(sp)
    80004b70:	01010113          	addi	sp,sp,16
    80004b74:	00008067          	ret

0000000080004b78 <uartputc>:
    80004b78:	00002797          	auipc	a5,0x2
    80004b7c:	f807a783          	lw	a5,-128(a5) # 80006af8 <panicked>
    80004b80:	00078463          	beqz	a5,80004b88 <uartputc+0x10>
    80004b84:	0000006f          	j	80004b84 <uartputc+0xc>
    80004b88:	fd010113          	addi	sp,sp,-48
    80004b8c:	02813023          	sd	s0,32(sp)
    80004b90:	00913c23          	sd	s1,24(sp)
    80004b94:	01213823          	sd	s2,16(sp)
    80004b98:	01313423          	sd	s3,8(sp)
    80004b9c:	02113423          	sd	ra,40(sp)
    80004ba0:	03010413          	addi	s0,sp,48
    80004ba4:	00002917          	auipc	s2,0x2
    80004ba8:	f5c90913          	addi	s2,s2,-164 # 80006b00 <uart_tx_r>
    80004bac:	00093783          	ld	a5,0(s2)
    80004bb0:	00002497          	auipc	s1,0x2
    80004bb4:	f5848493          	addi	s1,s1,-168 # 80006b08 <uart_tx_w>
    80004bb8:	0004b703          	ld	a4,0(s1)
    80004bbc:	02078693          	addi	a3,a5,32
    80004bc0:	00050993          	mv	s3,a0
    80004bc4:	02e69c63          	bne	a3,a4,80004bfc <uartputc+0x84>
    80004bc8:	00001097          	auipc	ra,0x1
    80004bcc:	834080e7          	jalr	-1996(ra) # 800053fc <push_on>
    80004bd0:	00093783          	ld	a5,0(s2)
    80004bd4:	0004b703          	ld	a4,0(s1)
    80004bd8:	02078793          	addi	a5,a5,32
    80004bdc:	00e79463          	bne	a5,a4,80004be4 <uartputc+0x6c>
    80004be0:	0000006f          	j	80004be0 <uartputc+0x68>
    80004be4:	00001097          	auipc	ra,0x1
    80004be8:	88c080e7          	jalr	-1908(ra) # 80005470 <pop_on>
    80004bec:	00093783          	ld	a5,0(s2)
    80004bf0:	0004b703          	ld	a4,0(s1)
    80004bf4:	02078693          	addi	a3,a5,32
    80004bf8:	fce688e3          	beq	a3,a4,80004bc8 <uartputc+0x50>
    80004bfc:	01f77693          	andi	a3,a4,31
    80004c00:	00003597          	auipc	a1,0x3
    80004c04:	19058593          	addi	a1,a1,400 # 80007d90 <uart_tx_buf>
    80004c08:	00d586b3          	add	a3,a1,a3
    80004c0c:	00170713          	addi	a4,a4,1
    80004c10:	01368023          	sb	s3,0(a3)
    80004c14:	00e4b023          	sd	a4,0(s1)
    80004c18:	10000637          	lui	a2,0x10000
    80004c1c:	02f71063          	bne	a4,a5,80004c3c <uartputc+0xc4>
    80004c20:	0340006f          	j	80004c54 <uartputc+0xdc>
    80004c24:	00074703          	lbu	a4,0(a4)
    80004c28:	00f93023          	sd	a5,0(s2)
    80004c2c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004c30:	00093783          	ld	a5,0(s2)
    80004c34:	0004b703          	ld	a4,0(s1)
    80004c38:	00f70e63          	beq	a4,a5,80004c54 <uartputc+0xdc>
    80004c3c:	00564683          	lbu	a3,5(a2)
    80004c40:	01f7f713          	andi	a4,a5,31
    80004c44:	00e58733          	add	a4,a1,a4
    80004c48:	0206f693          	andi	a3,a3,32
    80004c4c:	00178793          	addi	a5,a5,1
    80004c50:	fc069ae3          	bnez	a3,80004c24 <uartputc+0xac>
    80004c54:	02813083          	ld	ra,40(sp)
    80004c58:	02013403          	ld	s0,32(sp)
    80004c5c:	01813483          	ld	s1,24(sp)
    80004c60:	01013903          	ld	s2,16(sp)
    80004c64:	00813983          	ld	s3,8(sp)
    80004c68:	03010113          	addi	sp,sp,48
    80004c6c:	00008067          	ret

0000000080004c70 <uartputc_sync>:
    80004c70:	ff010113          	addi	sp,sp,-16
    80004c74:	00813423          	sd	s0,8(sp)
    80004c78:	01010413          	addi	s0,sp,16
    80004c7c:	00002717          	auipc	a4,0x2
    80004c80:	e7c72703          	lw	a4,-388(a4) # 80006af8 <panicked>
    80004c84:	02071663          	bnez	a4,80004cb0 <uartputc_sync+0x40>
    80004c88:	00050793          	mv	a5,a0
    80004c8c:	100006b7          	lui	a3,0x10000
    80004c90:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004c94:	02077713          	andi	a4,a4,32
    80004c98:	fe070ce3          	beqz	a4,80004c90 <uartputc_sync+0x20>
    80004c9c:	0ff7f793          	andi	a5,a5,255
    80004ca0:	00f68023          	sb	a5,0(a3)
    80004ca4:	00813403          	ld	s0,8(sp)
    80004ca8:	01010113          	addi	sp,sp,16
    80004cac:	00008067          	ret
    80004cb0:	0000006f          	j	80004cb0 <uartputc_sync+0x40>

0000000080004cb4 <uartstart>:
    80004cb4:	ff010113          	addi	sp,sp,-16
    80004cb8:	00813423          	sd	s0,8(sp)
    80004cbc:	01010413          	addi	s0,sp,16
    80004cc0:	00002617          	auipc	a2,0x2
    80004cc4:	e4060613          	addi	a2,a2,-448 # 80006b00 <uart_tx_r>
    80004cc8:	00002517          	auipc	a0,0x2
    80004ccc:	e4050513          	addi	a0,a0,-448 # 80006b08 <uart_tx_w>
    80004cd0:	00063783          	ld	a5,0(a2)
    80004cd4:	00053703          	ld	a4,0(a0)
    80004cd8:	04f70263          	beq	a4,a5,80004d1c <uartstart+0x68>
    80004cdc:	100005b7          	lui	a1,0x10000
    80004ce0:	00003817          	auipc	a6,0x3
    80004ce4:	0b080813          	addi	a6,a6,176 # 80007d90 <uart_tx_buf>
    80004ce8:	01c0006f          	j	80004d04 <uartstart+0x50>
    80004cec:	0006c703          	lbu	a4,0(a3)
    80004cf0:	00f63023          	sd	a5,0(a2)
    80004cf4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004cf8:	00063783          	ld	a5,0(a2)
    80004cfc:	00053703          	ld	a4,0(a0)
    80004d00:	00f70e63          	beq	a4,a5,80004d1c <uartstart+0x68>
    80004d04:	01f7f713          	andi	a4,a5,31
    80004d08:	00e806b3          	add	a3,a6,a4
    80004d0c:	0055c703          	lbu	a4,5(a1)
    80004d10:	00178793          	addi	a5,a5,1
    80004d14:	02077713          	andi	a4,a4,32
    80004d18:	fc071ae3          	bnez	a4,80004cec <uartstart+0x38>
    80004d1c:	00813403          	ld	s0,8(sp)
    80004d20:	01010113          	addi	sp,sp,16
    80004d24:	00008067          	ret

0000000080004d28 <uartgetc>:
    80004d28:	ff010113          	addi	sp,sp,-16
    80004d2c:	00813423          	sd	s0,8(sp)
    80004d30:	01010413          	addi	s0,sp,16
    80004d34:	10000737          	lui	a4,0x10000
    80004d38:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004d3c:	0017f793          	andi	a5,a5,1
    80004d40:	00078c63          	beqz	a5,80004d58 <uartgetc+0x30>
    80004d44:	00074503          	lbu	a0,0(a4)
    80004d48:	0ff57513          	andi	a0,a0,255
    80004d4c:	00813403          	ld	s0,8(sp)
    80004d50:	01010113          	addi	sp,sp,16
    80004d54:	00008067          	ret
    80004d58:	fff00513          	li	a0,-1
    80004d5c:	ff1ff06f          	j	80004d4c <uartgetc+0x24>

0000000080004d60 <uartintr>:
    80004d60:	100007b7          	lui	a5,0x10000
    80004d64:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004d68:	0017f793          	andi	a5,a5,1
    80004d6c:	0a078463          	beqz	a5,80004e14 <uartintr+0xb4>
    80004d70:	fe010113          	addi	sp,sp,-32
    80004d74:	00813823          	sd	s0,16(sp)
    80004d78:	00913423          	sd	s1,8(sp)
    80004d7c:	00113c23          	sd	ra,24(sp)
    80004d80:	02010413          	addi	s0,sp,32
    80004d84:	100004b7          	lui	s1,0x10000
    80004d88:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004d8c:	0ff57513          	andi	a0,a0,255
    80004d90:	fffff097          	auipc	ra,0xfffff
    80004d94:	534080e7          	jalr	1332(ra) # 800042c4 <consoleintr>
    80004d98:	0054c783          	lbu	a5,5(s1)
    80004d9c:	0017f793          	andi	a5,a5,1
    80004da0:	fe0794e3          	bnez	a5,80004d88 <uartintr+0x28>
    80004da4:	00002617          	auipc	a2,0x2
    80004da8:	d5c60613          	addi	a2,a2,-676 # 80006b00 <uart_tx_r>
    80004dac:	00002517          	auipc	a0,0x2
    80004db0:	d5c50513          	addi	a0,a0,-676 # 80006b08 <uart_tx_w>
    80004db4:	00063783          	ld	a5,0(a2)
    80004db8:	00053703          	ld	a4,0(a0)
    80004dbc:	04f70263          	beq	a4,a5,80004e00 <uartintr+0xa0>
    80004dc0:	100005b7          	lui	a1,0x10000
    80004dc4:	00003817          	auipc	a6,0x3
    80004dc8:	fcc80813          	addi	a6,a6,-52 # 80007d90 <uart_tx_buf>
    80004dcc:	01c0006f          	j	80004de8 <uartintr+0x88>
    80004dd0:	0006c703          	lbu	a4,0(a3)
    80004dd4:	00f63023          	sd	a5,0(a2)
    80004dd8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004ddc:	00063783          	ld	a5,0(a2)
    80004de0:	00053703          	ld	a4,0(a0)
    80004de4:	00f70e63          	beq	a4,a5,80004e00 <uartintr+0xa0>
    80004de8:	01f7f713          	andi	a4,a5,31
    80004dec:	00e806b3          	add	a3,a6,a4
    80004df0:	0055c703          	lbu	a4,5(a1)
    80004df4:	00178793          	addi	a5,a5,1
    80004df8:	02077713          	andi	a4,a4,32
    80004dfc:	fc071ae3          	bnez	a4,80004dd0 <uartintr+0x70>
    80004e00:	01813083          	ld	ra,24(sp)
    80004e04:	01013403          	ld	s0,16(sp)
    80004e08:	00813483          	ld	s1,8(sp)
    80004e0c:	02010113          	addi	sp,sp,32
    80004e10:	00008067          	ret
    80004e14:	00002617          	auipc	a2,0x2
    80004e18:	cec60613          	addi	a2,a2,-788 # 80006b00 <uart_tx_r>
    80004e1c:	00002517          	auipc	a0,0x2
    80004e20:	cec50513          	addi	a0,a0,-788 # 80006b08 <uart_tx_w>
    80004e24:	00063783          	ld	a5,0(a2)
    80004e28:	00053703          	ld	a4,0(a0)
    80004e2c:	04f70263          	beq	a4,a5,80004e70 <uartintr+0x110>
    80004e30:	100005b7          	lui	a1,0x10000
    80004e34:	00003817          	auipc	a6,0x3
    80004e38:	f5c80813          	addi	a6,a6,-164 # 80007d90 <uart_tx_buf>
    80004e3c:	01c0006f          	j	80004e58 <uartintr+0xf8>
    80004e40:	0006c703          	lbu	a4,0(a3)
    80004e44:	00f63023          	sd	a5,0(a2)
    80004e48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004e4c:	00063783          	ld	a5,0(a2)
    80004e50:	00053703          	ld	a4,0(a0)
    80004e54:	02f70063          	beq	a4,a5,80004e74 <uartintr+0x114>
    80004e58:	01f7f713          	andi	a4,a5,31
    80004e5c:	00e806b3          	add	a3,a6,a4
    80004e60:	0055c703          	lbu	a4,5(a1)
    80004e64:	00178793          	addi	a5,a5,1
    80004e68:	02077713          	andi	a4,a4,32
    80004e6c:	fc071ae3          	bnez	a4,80004e40 <uartintr+0xe0>
    80004e70:	00008067          	ret
    80004e74:	00008067          	ret

0000000080004e78 <kinit>:
    80004e78:	fc010113          	addi	sp,sp,-64
    80004e7c:	02913423          	sd	s1,40(sp)
    80004e80:	fffff7b7          	lui	a5,0xfffff
    80004e84:	00004497          	auipc	s1,0x4
    80004e88:	f2b48493          	addi	s1,s1,-213 # 80008daf <end+0xfff>
    80004e8c:	02813823          	sd	s0,48(sp)
    80004e90:	01313c23          	sd	s3,24(sp)
    80004e94:	00f4f4b3          	and	s1,s1,a5
    80004e98:	02113c23          	sd	ra,56(sp)
    80004e9c:	03213023          	sd	s2,32(sp)
    80004ea0:	01413823          	sd	s4,16(sp)
    80004ea4:	01513423          	sd	s5,8(sp)
    80004ea8:	04010413          	addi	s0,sp,64
    80004eac:	000017b7          	lui	a5,0x1
    80004eb0:	01100993          	li	s3,17
    80004eb4:	00f487b3          	add	a5,s1,a5
    80004eb8:	01b99993          	slli	s3,s3,0x1b
    80004ebc:	06f9e063          	bltu	s3,a5,80004f1c <kinit+0xa4>
    80004ec0:	00003a97          	auipc	s5,0x3
    80004ec4:	ef0a8a93          	addi	s5,s5,-272 # 80007db0 <end>
    80004ec8:	0754ec63          	bltu	s1,s5,80004f40 <kinit+0xc8>
    80004ecc:	0734fa63          	bgeu	s1,s3,80004f40 <kinit+0xc8>
    80004ed0:	00088a37          	lui	s4,0x88
    80004ed4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004ed8:	00002917          	auipc	s2,0x2
    80004edc:	c3890913          	addi	s2,s2,-968 # 80006b10 <kmem>
    80004ee0:	00ca1a13          	slli	s4,s4,0xc
    80004ee4:	0140006f          	j	80004ef8 <kinit+0x80>
    80004ee8:	000017b7          	lui	a5,0x1
    80004eec:	00f484b3          	add	s1,s1,a5
    80004ef0:	0554e863          	bltu	s1,s5,80004f40 <kinit+0xc8>
    80004ef4:	0534f663          	bgeu	s1,s3,80004f40 <kinit+0xc8>
    80004ef8:	00001637          	lui	a2,0x1
    80004efc:	00100593          	li	a1,1
    80004f00:	00048513          	mv	a0,s1
    80004f04:	00000097          	auipc	ra,0x0
    80004f08:	5e4080e7          	jalr	1508(ra) # 800054e8 <__memset>
    80004f0c:	00093783          	ld	a5,0(s2)
    80004f10:	00f4b023          	sd	a5,0(s1)
    80004f14:	00993023          	sd	s1,0(s2)
    80004f18:	fd4498e3          	bne	s1,s4,80004ee8 <kinit+0x70>
    80004f1c:	03813083          	ld	ra,56(sp)
    80004f20:	03013403          	ld	s0,48(sp)
    80004f24:	02813483          	ld	s1,40(sp)
    80004f28:	02013903          	ld	s2,32(sp)
    80004f2c:	01813983          	ld	s3,24(sp)
    80004f30:	01013a03          	ld	s4,16(sp)
    80004f34:	00813a83          	ld	s5,8(sp)
    80004f38:	04010113          	addi	sp,sp,64
    80004f3c:	00008067          	ret
    80004f40:	00001517          	auipc	a0,0x1
    80004f44:	38050513          	addi	a0,a0,896 # 800062c0 <digits+0x18>
    80004f48:	fffff097          	auipc	ra,0xfffff
    80004f4c:	4b4080e7          	jalr	1204(ra) # 800043fc <panic>

0000000080004f50 <freerange>:
    80004f50:	fc010113          	addi	sp,sp,-64
    80004f54:	000017b7          	lui	a5,0x1
    80004f58:	02913423          	sd	s1,40(sp)
    80004f5c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004f60:	009504b3          	add	s1,a0,s1
    80004f64:	fffff537          	lui	a0,0xfffff
    80004f68:	02813823          	sd	s0,48(sp)
    80004f6c:	02113c23          	sd	ra,56(sp)
    80004f70:	03213023          	sd	s2,32(sp)
    80004f74:	01313c23          	sd	s3,24(sp)
    80004f78:	01413823          	sd	s4,16(sp)
    80004f7c:	01513423          	sd	s5,8(sp)
    80004f80:	01613023          	sd	s6,0(sp)
    80004f84:	04010413          	addi	s0,sp,64
    80004f88:	00a4f4b3          	and	s1,s1,a0
    80004f8c:	00f487b3          	add	a5,s1,a5
    80004f90:	06f5e463          	bltu	a1,a5,80004ff8 <freerange+0xa8>
    80004f94:	00003a97          	auipc	s5,0x3
    80004f98:	e1ca8a93          	addi	s5,s5,-484 # 80007db0 <end>
    80004f9c:	0954e263          	bltu	s1,s5,80005020 <freerange+0xd0>
    80004fa0:	01100993          	li	s3,17
    80004fa4:	01b99993          	slli	s3,s3,0x1b
    80004fa8:	0734fc63          	bgeu	s1,s3,80005020 <freerange+0xd0>
    80004fac:	00058a13          	mv	s4,a1
    80004fb0:	00002917          	auipc	s2,0x2
    80004fb4:	b6090913          	addi	s2,s2,-1184 # 80006b10 <kmem>
    80004fb8:	00002b37          	lui	s6,0x2
    80004fbc:	0140006f          	j	80004fd0 <freerange+0x80>
    80004fc0:	000017b7          	lui	a5,0x1
    80004fc4:	00f484b3          	add	s1,s1,a5
    80004fc8:	0554ec63          	bltu	s1,s5,80005020 <freerange+0xd0>
    80004fcc:	0534fa63          	bgeu	s1,s3,80005020 <freerange+0xd0>
    80004fd0:	00001637          	lui	a2,0x1
    80004fd4:	00100593          	li	a1,1
    80004fd8:	00048513          	mv	a0,s1
    80004fdc:	00000097          	auipc	ra,0x0
    80004fe0:	50c080e7          	jalr	1292(ra) # 800054e8 <__memset>
    80004fe4:	00093703          	ld	a4,0(s2)
    80004fe8:	016487b3          	add	a5,s1,s6
    80004fec:	00e4b023          	sd	a4,0(s1)
    80004ff0:	00993023          	sd	s1,0(s2)
    80004ff4:	fcfa76e3          	bgeu	s4,a5,80004fc0 <freerange+0x70>
    80004ff8:	03813083          	ld	ra,56(sp)
    80004ffc:	03013403          	ld	s0,48(sp)
    80005000:	02813483          	ld	s1,40(sp)
    80005004:	02013903          	ld	s2,32(sp)
    80005008:	01813983          	ld	s3,24(sp)
    8000500c:	01013a03          	ld	s4,16(sp)
    80005010:	00813a83          	ld	s5,8(sp)
    80005014:	00013b03          	ld	s6,0(sp)
    80005018:	04010113          	addi	sp,sp,64
    8000501c:	00008067          	ret
    80005020:	00001517          	auipc	a0,0x1
    80005024:	2a050513          	addi	a0,a0,672 # 800062c0 <digits+0x18>
    80005028:	fffff097          	auipc	ra,0xfffff
    8000502c:	3d4080e7          	jalr	980(ra) # 800043fc <panic>

0000000080005030 <kfree>:
    80005030:	fe010113          	addi	sp,sp,-32
    80005034:	00813823          	sd	s0,16(sp)
    80005038:	00113c23          	sd	ra,24(sp)
    8000503c:	00913423          	sd	s1,8(sp)
    80005040:	02010413          	addi	s0,sp,32
    80005044:	03451793          	slli	a5,a0,0x34
    80005048:	04079c63          	bnez	a5,800050a0 <kfree+0x70>
    8000504c:	00003797          	auipc	a5,0x3
    80005050:	d6478793          	addi	a5,a5,-668 # 80007db0 <end>
    80005054:	00050493          	mv	s1,a0
    80005058:	04f56463          	bltu	a0,a5,800050a0 <kfree+0x70>
    8000505c:	01100793          	li	a5,17
    80005060:	01b79793          	slli	a5,a5,0x1b
    80005064:	02f57e63          	bgeu	a0,a5,800050a0 <kfree+0x70>
    80005068:	00001637          	lui	a2,0x1
    8000506c:	00100593          	li	a1,1
    80005070:	00000097          	auipc	ra,0x0
    80005074:	478080e7          	jalr	1144(ra) # 800054e8 <__memset>
    80005078:	00002797          	auipc	a5,0x2
    8000507c:	a9878793          	addi	a5,a5,-1384 # 80006b10 <kmem>
    80005080:	0007b703          	ld	a4,0(a5)
    80005084:	01813083          	ld	ra,24(sp)
    80005088:	01013403          	ld	s0,16(sp)
    8000508c:	00e4b023          	sd	a4,0(s1)
    80005090:	0097b023          	sd	s1,0(a5)
    80005094:	00813483          	ld	s1,8(sp)
    80005098:	02010113          	addi	sp,sp,32
    8000509c:	00008067          	ret
    800050a0:	00001517          	auipc	a0,0x1
    800050a4:	22050513          	addi	a0,a0,544 # 800062c0 <digits+0x18>
    800050a8:	fffff097          	auipc	ra,0xfffff
    800050ac:	354080e7          	jalr	852(ra) # 800043fc <panic>

00000000800050b0 <kalloc>:
    800050b0:	fe010113          	addi	sp,sp,-32
    800050b4:	00813823          	sd	s0,16(sp)
    800050b8:	00913423          	sd	s1,8(sp)
    800050bc:	00113c23          	sd	ra,24(sp)
    800050c0:	02010413          	addi	s0,sp,32
    800050c4:	00002797          	auipc	a5,0x2
    800050c8:	a4c78793          	addi	a5,a5,-1460 # 80006b10 <kmem>
    800050cc:	0007b483          	ld	s1,0(a5)
    800050d0:	02048063          	beqz	s1,800050f0 <kalloc+0x40>
    800050d4:	0004b703          	ld	a4,0(s1)
    800050d8:	00001637          	lui	a2,0x1
    800050dc:	00500593          	li	a1,5
    800050e0:	00048513          	mv	a0,s1
    800050e4:	00e7b023          	sd	a4,0(a5)
    800050e8:	00000097          	auipc	ra,0x0
    800050ec:	400080e7          	jalr	1024(ra) # 800054e8 <__memset>
    800050f0:	01813083          	ld	ra,24(sp)
    800050f4:	01013403          	ld	s0,16(sp)
    800050f8:	00048513          	mv	a0,s1
    800050fc:	00813483          	ld	s1,8(sp)
    80005100:	02010113          	addi	sp,sp,32
    80005104:	00008067          	ret

0000000080005108 <initlock>:
    80005108:	ff010113          	addi	sp,sp,-16
    8000510c:	00813423          	sd	s0,8(sp)
    80005110:	01010413          	addi	s0,sp,16
    80005114:	00813403          	ld	s0,8(sp)
    80005118:	00b53423          	sd	a1,8(a0)
    8000511c:	00052023          	sw	zero,0(a0)
    80005120:	00053823          	sd	zero,16(a0)
    80005124:	01010113          	addi	sp,sp,16
    80005128:	00008067          	ret

000000008000512c <acquire>:
    8000512c:	fe010113          	addi	sp,sp,-32
    80005130:	00813823          	sd	s0,16(sp)
    80005134:	00913423          	sd	s1,8(sp)
    80005138:	00113c23          	sd	ra,24(sp)
    8000513c:	01213023          	sd	s2,0(sp)
    80005140:	02010413          	addi	s0,sp,32
    80005144:	00050493          	mv	s1,a0
    80005148:	10002973          	csrr	s2,sstatus
    8000514c:	100027f3          	csrr	a5,sstatus
    80005150:	ffd7f793          	andi	a5,a5,-3
    80005154:	10079073          	csrw	sstatus,a5
    80005158:	fffff097          	auipc	ra,0xfffff
    8000515c:	8ec080e7          	jalr	-1812(ra) # 80003a44 <mycpu>
    80005160:	07852783          	lw	a5,120(a0)
    80005164:	06078e63          	beqz	a5,800051e0 <acquire+0xb4>
    80005168:	fffff097          	auipc	ra,0xfffff
    8000516c:	8dc080e7          	jalr	-1828(ra) # 80003a44 <mycpu>
    80005170:	07852783          	lw	a5,120(a0)
    80005174:	0004a703          	lw	a4,0(s1)
    80005178:	0017879b          	addiw	a5,a5,1
    8000517c:	06f52c23          	sw	a5,120(a0)
    80005180:	04071063          	bnez	a4,800051c0 <acquire+0x94>
    80005184:	00100713          	li	a4,1
    80005188:	00070793          	mv	a5,a4
    8000518c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005190:	0007879b          	sext.w	a5,a5
    80005194:	fe079ae3          	bnez	a5,80005188 <acquire+0x5c>
    80005198:	0ff0000f          	fence
    8000519c:	fffff097          	auipc	ra,0xfffff
    800051a0:	8a8080e7          	jalr	-1880(ra) # 80003a44 <mycpu>
    800051a4:	01813083          	ld	ra,24(sp)
    800051a8:	01013403          	ld	s0,16(sp)
    800051ac:	00a4b823          	sd	a0,16(s1)
    800051b0:	00013903          	ld	s2,0(sp)
    800051b4:	00813483          	ld	s1,8(sp)
    800051b8:	02010113          	addi	sp,sp,32
    800051bc:	00008067          	ret
    800051c0:	0104b903          	ld	s2,16(s1)
    800051c4:	fffff097          	auipc	ra,0xfffff
    800051c8:	880080e7          	jalr	-1920(ra) # 80003a44 <mycpu>
    800051cc:	faa91ce3          	bne	s2,a0,80005184 <acquire+0x58>
    800051d0:	00001517          	auipc	a0,0x1
    800051d4:	0f850513          	addi	a0,a0,248 # 800062c8 <digits+0x20>
    800051d8:	fffff097          	auipc	ra,0xfffff
    800051dc:	224080e7          	jalr	548(ra) # 800043fc <panic>
    800051e0:	00195913          	srli	s2,s2,0x1
    800051e4:	fffff097          	auipc	ra,0xfffff
    800051e8:	860080e7          	jalr	-1952(ra) # 80003a44 <mycpu>
    800051ec:	00197913          	andi	s2,s2,1
    800051f0:	07252e23          	sw	s2,124(a0)
    800051f4:	f75ff06f          	j	80005168 <acquire+0x3c>

00000000800051f8 <release>:
    800051f8:	fe010113          	addi	sp,sp,-32
    800051fc:	00813823          	sd	s0,16(sp)
    80005200:	00113c23          	sd	ra,24(sp)
    80005204:	00913423          	sd	s1,8(sp)
    80005208:	01213023          	sd	s2,0(sp)
    8000520c:	02010413          	addi	s0,sp,32
    80005210:	00052783          	lw	a5,0(a0)
    80005214:	00079a63          	bnez	a5,80005228 <release+0x30>
    80005218:	00001517          	auipc	a0,0x1
    8000521c:	0b850513          	addi	a0,a0,184 # 800062d0 <digits+0x28>
    80005220:	fffff097          	auipc	ra,0xfffff
    80005224:	1dc080e7          	jalr	476(ra) # 800043fc <panic>
    80005228:	01053903          	ld	s2,16(a0)
    8000522c:	00050493          	mv	s1,a0
    80005230:	fffff097          	auipc	ra,0xfffff
    80005234:	814080e7          	jalr	-2028(ra) # 80003a44 <mycpu>
    80005238:	fea910e3          	bne	s2,a0,80005218 <release+0x20>
    8000523c:	0004b823          	sd	zero,16(s1)
    80005240:	0ff0000f          	fence
    80005244:	0f50000f          	fence	iorw,ow
    80005248:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000524c:	ffffe097          	auipc	ra,0xffffe
    80005250:	7f8080e7          	jalr	2040(ra) # 80003a44 <mycpu>
    80005254:	100027f3          	csrr	a5,sstatus
    80005258:	0027f793          	andi	a5,a5,2
    8000525c:	04079a63          	bnez	a5,800052b0 <release+0xb8>
    80005260:	07852783          	lw	a5,120(a0)
    80005264:	02f05e63          	blez	a5,800052a0 <release+0xa8>
    80005268:	fff7871b          	addiw	a4,a5,-1
    8000526c:	06e52c23          	sw	a4,120(a0)
    80005270:	00071c63          	bnez	a4,80005288 <release+0x90>
    80005274:	07c52783          	lw	a5,124(a0)
    80005278:	00078863          	beqz	a5,80005288 <release+0x90>
    8000527c:	100027f3          	csrr	a5,sstatus
    80005280:	0027e793          	ori	a5,a5,2
    80005284:	10079073          	csrw	sstatus,a5
    80005288:	01813083          	ld	ra,24(sp)
    8000528c:	01013403          	ld	s0,16(sp)
    80005290:	00813483          	ld	s1,8(sp)
    80005294:	00013903          	ld	s2,0(sp)
    80005298:	02010113          	addi	sp,sp,32
    8000529c:	00008067          	ret
    800052a0:	00001517          	auipc	a0,0x1
    800052a4:	05050513          	addi	a0,a0,80 # 800062f0 <digits+0x48>
    800052a8:	fffff097          	auipc	ra,0xfffff
    800052ac:	154080e7          	jalr	340(ra) # 800043fc <panic>
    800052b0:	00001517          	auipc	a0,0x1
    800052b4:	02850513          	addi	a0,a0,40 # 800062d8 <digits+0x30>
    800052b8:	fffff097          	auipc	ra,0xfffff
    800052bc:	144080e7          	jalr	324(ra) # 800043fc <panic>

00000000800052c0 <holding>:
    800052c0:	00052783          	lw	a5,0(a0)
    800052c4:	00079663          	bnez	a5,800052d0 <holding+0x10>
    800052c8:	00000513          	li	a0,0
    800052cc:	00008067          	ret
    800052d0:	fe010113          	addi	sp,sp,-32
    800052d4:	00813823          	sd	s0,16(sp)
    800052d8:	00913423          	sd	s1,8(sp)
    800052dc:	00113c23          	sd	ra,24(sp)
    800052e0:	02010413          	addi	s0,sp,32
    800052e4:	01053483          	ld	s1,16(a0)
    800052e8:	ffffe097          	auipc	ra,0xffffe
    800052ec:	75c080e7          	jalr	1884(ra) # 80003a44 <mycpu>
    800052f0:	01813083          	ld	ra,24(sp)
    800052f4:	01013403          	ld	s0,16(sp)
    800052f8:	40a48533          	sub	a0,s1,a0
    800052fc:	00153513          	seqz	a0,a0
    80005300:	00813483          	ld	s1,8(sp)
    80005304:	02010113          	addi	sp,sp,32
    80005308:	00008067          	ret

000000008000530c <push_off>:
    8000530c:	fe010113          	addi	sp,sp,-32
    80005310:	00813823          	sd	s0,16(sp)
    80005314:	00113c23          	sd	ra,24(sp)
    80005318:	00913423          	sd	s1,8(sp)
    8000531c:	02010413          	addi	s0,sp,32
    80005320:	100024f3          	csrr	s1,sstatus
    80005324:	100027f3          	csrr	a5,sstatus
    80005328:	ffd7f793          	andi	a5,a5,-3
    8000532c:	10079073          	csrw	sstatus,a5
    80005330:	ffffe097          	auipc	ra,0xffffe
    80005334:	714080e7          	jalr	1812(ra) # 80003a44 <mycpu>
    80005338:	07852783          	lw	a5,120(a0)
    8000533c:	02078663          	beqz	a5,80005368 <push_off+0x5c>
    80005340:	ffffe097          	auipc	ra,0xffffe
    80005344:	704080e7          	jalr	1796(ra) # 80003a44 <mycpu>
    80005348:	07852783          	lw	a5,120(a0)
    8000534c:	01813083          	ld	ra,24(sp)
    80005350:	01013403          	ld	s0,16(sp)
    80005354:	0017879b          	addiw	a5,a5,1
    80005358:	06f52c23          	sw	a5,120(a0)
    8000535c:	00813483          	ld	s1,8(sp)
    80005360:	02010113          	addi	sp,sp,32
    80005364:	00008067          	ret
    80005368:	0014d493          	srli	s1,s1,0x1
    8000536c:	ffffe097          	auipc	ra,0xffffe
    80005370:	6d8080e7          	jalr	1752(ra) # 80003a44 <mycpu>
    80005374:	0014f493          	andi	s1,s1,1
    80005378:	06952e23          	sw	s1,124(a0)
    8000537c:	fc5ff06f          	j	80005340 <push_off+0x34>

0000000080005380 <pop_off>:
    80005380:	ff010113          	addi	sp,sp,-16
    80005384:	00813023          	sd	s0,0(sp)
    80005388:	00113423          	sd	ra,8(sp)
    8000538c:	01010413          	addi	s0,sp,16
    80005390:	ffffe097          	auipc	ra,0xffffe
    80005394:	6b4080e7          	jalr	1716(ra) # 80003a44 <mycpu>
    80005398:	100027f3          	csrr	a5,sstatus
    8000539c:	0027f793          	andi	a5,a5,2
    800053a0:	04079663          	bnez	a5,800053ec <pop_off+0x6c>
    800053a4:	07852783          	lw	a5,120(a0)
    800053a8:	02f05a63          	blez	a5,800053dc <pop_off+0x5c>
    800053ac:	fff7871b          	addiw	a4,a5,-1
    800053b0:	06e52c23          	sw	a4,120(a0)
    800053b4:	00071c63          	bnez	a4,800053cc <pop_off+0x4c>
    800053b8:	07c52783          	lw	a5,124(a0)
    800053bc:	00078863          	beqz	a5,800053cc <pop_off+0x4c>
    800053c0:	100027f3          	csrr	a5,sstatus
    800053c4:	0027e793          	ori	a5,a5,2
    800053c8:	10079073          	csrw	sstatus,a5
    800053cc:	00813083          	ld	ra,8(sp)
    800053d0:	00013403          	ld	s0,0(sp)
    800053d4:	01010113          	addi	sp,sp,16
    800053d8:	00008067          	ret
    800053dc:	00001517          	auipc	a0,0x1
    800053e0:	f1450513          	addi	a0,a0,-236 # 800062f0 <digits+0x48>
    800053e4:	fffff097          	auipc	ra,0xfffff
    800053e8:	018080e7          	jalr	24(ra) # 800043fc <panic>
    800053ec:	00001517          	auipc	a0,0x1
    800053f0:	eec50513          	addi	a0,a0,-276 # 800062d8 <digits+0x30>
    800053f4:	fffff097          	auipc	ra,0xfffff
    800053f8:	008080e7          	jalr	8(ra) # 800043fc <panic>

00000000800053fc <push_on>:
    800053fc:	fe010113          	addi	sp,sp,-32
    80005400:	00813823          	sd	s0,16(sp)
    80005404:	00113c23          	sd	ra,24(sp)
    80005408:	00913423          	sd	s1,8(sp)
    8000540c:	02010413          	addi	s0,sp,32
    80005410:	100024f3          	csrr	s1,sstatus
    80005414:	100027f3          	csrr	a5,sstatus
    80005418:	0027e793          	ori	a5,a5,2
    8000541c:	10079073          	csrw	sstatus,a5
    80005420:	ffffe097          	auipc	ra,0xffffe
    80005424:	624080e7          	jalr	1572(ra) # 80003a44 <mycpu>
    80005428:	07852783          	lw	a5,120(a0)
    8000542c:	02078663          	beqz	a5,80005458 <push_on+0x5c>
    80005430:	ffffe097          	auipc	ra,0xffffe
    80005434:	614080e7          	jalr	1556(ra) # 80003a44 <mycpu>
    80005438:	07852783          	lw	a5,120(a0)
    8000543c:	01813083          	ld	ra,24(sp)
    80005440:	01013403          	ld	s0,16(sp)
    80005444:	0017879b          	addiw	a5,a5,1
    80005448:	06f52c23          	sw	a5,120(a0)
    8000544c:	00813483          	ld	s1,8(sp)
    80005450:	02010113          	addi	sp,sp,32
    80005454:	00008067          	ret
    80005458:	0014d493          	srli	s1,s1,0x1
    8000545c:	ffffe097          	auipc	ra,0xffffe
    80005460:	5e8080e7          	jalr	1512(ra) # 80003a44 <mycpu>
    80005464:	0014f493          	andi	s1,s1,1
    80005468:	06952e23          	sw	s1,124(a0)
    8000546c:	fc5ff06f          	j	80005430 <push_on+0x34>

0000000080005470 <pop_on>:
    80005470:	ff010113          	addi	sp,sp,-16
    80005474:	00813023          	sd	s0,0(sp)
    80005478:	00113423          	sd	ra,8(sp)
    8000547c:	01010413          	addi	s0,sp,16
    80005480:	ffffe097          	auipc	ra,0xffffe
    80005484:	5c4080e7          	jalr	1476(ra) # 80003a44 <mycpu>
    80005488:	100027f3          	csrr	a5,sstatus
    8000548c:	0027f793          	andi	a5,a5,2
    80005490:	04078463          	beqz	a5,800054d8 <pop_on+0x68>
    80005494:	07852783          	lw	a5,120(a0)
    80005498:	02f05863          	blez	a5,800054c8 <pop_on+0x58>
    8000549c:	fff7879b          	addiw	a5,a5,-1
    800054a0:	06f52c23          	sw	a5,120(a0)
    800054a4:	07853783          	ld	a5,120(a0)
    800054a8:	00079863          	bnez	a5,800054b8 <pop_on+0x48>
    800054ac:	100027f3          	csrr	a5,sstatus
    800054b0:	ffd7f793          	andi	a5,a5,-3
    800054b4:	10079073          	csrw	sstatus,a5
    800054b8:	00813083          	ld	ra,8(sp)
    800054bc:	00013403          	ld	s0,0(sp)
    800054c0:	01010113          	addi	sp,sp,16
    800054c4:	00008067          	ret
    800054c8:	00001517          	auipc	a0,0x1
    800054cc:	e5050513          	addi	a0,a0,-432 # 80006318 <digits+0x70>
    800054d0:	fffff097          	auipc	ra,0xfffff
    800054d4:	f2c080e7          	jalr	-212(ra) # 800043fc <panic>
    800054d8:	00001517          	auipc	a0,0x1
    800054dc:	e2050513          	addi	a0,a0,-480 # 800062f8 <digits+0x50>
    800054e0:	fffff097          	auipc	ra,0xfffff
    800054e4:	f1c080e7          	jalr	-228(ra) # 800043fc <panic>

00000000800054e8 <__memset>:
    800054e8:	ff010113          	addi	sp,sp,-16
    800054ec:	00813423          	sd	s0,8(sp)
    800054f0:	01010413          	addi	s0,sp,16
    800054f4:	1a060e63          	beqz	a2,800056b0 <__memset+0x1c8>
    800054f8:	40a007b3          	neg	a5,a0
    800054fc:	0077f793          	andi	a5,a5,7
    80005500:	00778693          	addi	a3,a5,7
    80005504:	00b00813          	li	a6,11
    80005508:	0ff5f593          	andi	a1,a1,255
    8000550c:	fff6071b          	addiw	a4,a2,-1
    80005510:	1b06e663          	bltu	a3,a6,800056bc <__memset+0x1d4>
    80005514:	1cd76463          	bltu	a4,a3,800056dc <__memset+0x1f4>
    80005518:	1a078e63          	beqz	a5,800056d4 <__memset+0x1ec>
    8000551c:	00b50023          	sb	a1,0(a0)
    80005520:	00100713          	li	a4,1
    80005524:	1ae78463          	beq	a5,a4,800056cc <__memset+0x1e4>
    80005528:	00b500a3          	sb	a1,1(a0)
    8000552c:	00200713          	li	a4,2
    80005530:	1ae78a63          	beq	a5,a4,800056e4 <__memset+0x1fc>
    80005534:	00b50123          	sb	a1,2(a0)
    80005538:	00300713          	li	a4,3
    8000553c:	18e78463          	beq	a5,a4,800056c4 <__memset+0x1dc>
    80005540:	00b501a3          	sb	a1,3(a0)
    80005544:	00400713          	li	a4,4
    80005548:	1ae78263          	beq	a5,a4,800056ec <__memset+0x204>
    8000554c:	00b50223          	sb	a1,4(a0)
    80005550:	00500713          	li	a4,5
    80005554:	1ae78063          	beq	a5,a4,800056f4 <__memset+0x20c>
    80005558:	00b502a3          	sb	a1,5(a0)
    8000555c:	00700713          	li	a4,7
    80005560:	18e79e63          	bne	a5,a4,800056fc <__memset+0x214>
    80005564:	00b50323          	sb	a1,6(a0)
    80005568:	00700e93          	li	t4,7
    8000556c:	00859713          	slli	a4,a1,0x8
    80005570:	00e5e733          	or	a4,a1,a4
    80005574:	01059e13          	slli	t3,a1,0x10
    80005578:	01c76e33          	or	t3,a4,t3
    8000557c:	01859313          	slli	t1,a1,0x18
    80005580:	006e6333          	or	t1,t3,t1
    80005584:	02059893          	slli	a7,a1,0x20
    80005588:	40f60e3b          	subw	t3,a2,a5
    8000558c:	011368b3          	or	a7,t1,a7
    80005590:	02859813          	slli	a6,a1,0x28
    80005594:	0108e833          	or	a6,a7,a6
    80005598:	03059693          	slli	a3,a1,0x30
    8000559c:	003e589b          	srliw	a7,t3,0x3
    800055a0:	00d866b3          	or	a3,a6,a3
    800055a4:	03859713          	slli	a4,a1,0x38
    800055a8:	00389813          	slli	a6,a7,0x3
    800055ac:	00f507b3          	add	a5,a0,a5
    800055b0:	00e6e733          	or	a4,a3,a4
    800055b4:	000e089b          	sext.w	a7,t3
    800055b8:	00f806b3          	add	a3,a6,a5
    800055bc:	00e7b023          	sd	a4,0(a5)
    800055c0:	00878793          	addi	a5,a5,8
    800055c4:	fed79ce3          	bne	a5,a3,800055bc <__memset+0xd4>
    800055c8:	ff8e7793          	andi	a5,t3,-8
    800055cc:	0007871b          	sext.w	a4,a5
    800055d0:	01d787bb          	addw	a5,a5,t4
    800055d4:	0ce88e63          	beq	a7,a4,800056b0 <__memset+0x1c8>
    800055d8:	00f50733          	add	a4,a0,a5
    800055dc:	00b70023          	sb	a1,0(a4)
    800055e0:	0017871b          	addiw	a4,a5,1
    800055e4:	0cc77663          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    800055e8:	00e50733          	add	a4,a0,a4
    800055ec:	00b70023          	sb	a1,0(a4)
    800055f0:	0027871b          	addiw	a4,a5,2
    800055f4:	0ac77e63          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    800055f8:	00e50733          	add	a4,a0,a4
    800055fc:	00b70023          	sb	a1,0(a4)
    80005600:	0037871b          	addiw	a4,a5,3
    80005604:	0ac77663          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005608:	00e50733          	add	a4,a0,a4
    8000560c:	00b70023          	sb	a1,0(a4)
    80005610:	0047871b          	addiw	a4,a5,4
    80005614:	08c77e63          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005618:	00e50733          	add	a4,a0,a4
    8000561c:	00b70023          	sb	a1,0(a4)
    80005620:	0057871b          	addiw	a4,a5,5
    80005624:	08c77663          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005628:	00e50733          	add	a4,a0,a4
    8000562c:	00b70023          	sb	a1,0(a4)
    80005630:	0067871b          	addiw	a4,a5,6
    80005634:	06c77e63          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005638:	00e50733          	add	a4,a0,a4
    8000563c:	00b70023          	sb	a1,0(a4)
    80005640:	0077871b          	addiw	a4,a5,7
    80005644:	06c77663          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005648:	00e50733          	add	a4,a0,a4
    8000564c:	00b70023          	sb	a1,0(a4)
    80005650:	0087871b          	addiw	a4,a5,8
    80005654:	04c77e63          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005658:	00e50733          	add	a4,a0,a4
    8000565c:	00b70023          	sb	a1,0(a4)
    80005660:	0097871b          	addiw	a4,a5,9
    80005664:	04c77663          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005668:	00e50733          	add	a4,a0,a4
    8000566c:	00b70023          	sb	a1,0(a4)
    80005670:	00a7871b          	addiw	a4,a5,10
    80005674:	02c77e63          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005678:	00e50733          	add	a4,a0,a4
    8000567c:	00b70023          	sb	a1,0(a4)
    80005680:	00b7871b          	addiw	a4,a5,11
    80005684:	02c77663          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005688:	00e50733          	add	a4,a0,a4
    8000568c:	00b70023          	sb	a1,0(a4)
    80005690:	00c7871b          	addiw	a4,a5,12
    80005694:	00c77e63          	bgeu	a4,a2,800056b0 <__memset+0x1c8>
    80005698:	00e50733          	add	a4,a0,a4
    8000569c:	00b70023          	sb	a1,0(a4)
    800056a0:	00d7879b          	addiw	a5,a5,13
    800056a4:	00c7f663          	bgeu	a5,a2,800056b0 <__memset+0x1c8>
    800056a8:	00f507b3          	add	a5,a0,a5
    800056ac:	00b78023          	sb	a1,0(a5)
    800056b0:	00813403          	ld	s0,8(sp)
    800056b4:	01010113          	addi	sp,sp,16
    800056b8:	00008067          	ret
    800056bc:	00b00693          	li	a3,11
    800056c0:	e55ff06f          	j	80005514 <__memset+0x2c>
    800056c4:	00300e93          	li	t4,3
    800056c8:	ea5ff06f          	j	8000556c <__memset+0x84>
    800056cc:	00100e93          	li	t4,1
    800056d0:	e9dff06f          	j	8000556c <__memset+0x84>
    800056d4:	00000e93          	li	t4,0
    800056d8:	e95ff06f          	j	8000556c <__memset+0x84>
    800056dc:	00000793          	li	a5,0
    800056e0:	ef9ff06f          	j	800055d8 <__memset+0xf0>
    800056e4:	00200e93          	li	t4,2
    800056e8:	e85ff06f          	j	8000556c <__memset+0x84>
    800056ec:	00400e93          	li	t4,4
    800056f0:	e7dff06f          	j	8000556c <__memset+0x84>
    800056f4:	00500e93          	li	t4,5
    800056f8:	e75ff06f          	j	8000556c <__memset+0x84>
    800056fc:	00600e93          	li	t4,6
    80005700:	e6dff06f          	j	8000556c <__memset+0x84>

0000000080005704 <__memmove>:
    80005704:	ff010113          	addi	sp,sp,-16
    80005708:	00813423          	sd	s0,8(sp)
    8000570c:	01010413          	addi	s0,sp,16
    80005710:	0e060863          	beqz	a2,80005800 <__memmove+0xfc>
    80005714:	fff6069b          	addiw	a3,a2,-1
    80005718:	0006881b          	sext.w	a6,a3
    8000571c:	0ea5e863          	bltu	a1,a0,8000580c <__memmove+0x108>
    80005720:	00758713          	addi	a4,a1,7
    80005724:	00a5e7b3          	or	a5,a1,a0
    80005728:	40a70733          	sub	a4,a4,a0
    8000572c:	0077f793          	andi	a5,a5,7
    80005730:	00f73713          	sltiu	a4,a4,15
    80005734:	00174713          	xori	a4,a4,1
    80005738:	0017b793          	seqz	a5,a5
    8000573c:	00e7f7b3          	and	a5,a5,a4
    80005740:	10078863          	beqz	a5,80005850 <__memmove+0x14c>
    80005744:	00900793          	li	a5,9
    80005748:	1107f463          	bgeu	a5,a6,80005850 <__memmove+0x14c>
    8000574c:	0036581b          	srliw	a6,a2,0x3
    80005750:	fff8081b          	addiw	a6,a6,-1
    80005754:	02081813          	slli	a6,a6,0x20
    80005758:	01d85893          	srli	a7,a6,0x1d
    8000575c:	00858813          	addi	a6,a1,8
    80005760:	00058793          	mv	a5,a1
    80005764:	00050713          	mv	a4,a0
    80005768:	01088833          	add	a6,a7,a6
    8000576c:	0007b883          	ld	a7,0(a5)
    80005770:	00878793          	addi	a5,a5,8
    80005774:	00870713          	addi	a4,a4,8
    80005778:	ff173c23          	sd	a7,-8(a4)
    8000577c:	ff0798e3          	bne	a5,a6,8000576c <__memmove+0x68>
    80005780:	ff867713          	andi	a4,a2,-8
    80005784:	02071793          	slli	a5,a4,0x20
    80005788:	0207d793          	srli	a5,a5,0x20
    8000578c:	00f585b3          	add	a1,a1,a5
    80005790:	40e686bb          	subw	a3,a3,a4
    80005794:	00f507b3          	add	a5,a0,a5
    80005798:	06e60463          	beq	a2,a4,80005800 <__memmove+0xfc>
    8000579c:	0005c703          	lbu	a4,0(a1)
    800057a0:	00e78023          	sb	a4,0(a5)
    800057a4:	04068e63          	beqz	a3,80005800 <__memmove+0xfc>
    800057a8:	0015c603          	lbu	a2,1(a1)
    800057ac:	00100713          	li	a4,1
    800057b0:	00c780a3          	sb	a2,1(a5)
    800057b4:	04e68663          	beq	a3,a4,80005800 <__memmove+0xfc>
    800057b8:	0025c603          	lbu	a2,2(a1)
    800057bc:	00200713          	li	a4,2
    800057c0:	00c78123          	sb	a2,2(a5)
    800057c4:	02e68e63          	beq	a3,a4,80005800 <__memmove+0xfc>
    800057c8:	0035c603          	lbu	a2,3(a1)
    800057cc:	00300713          	li	a4,3
    800057d0:	00c781a3          	sb	a2,3(a5)
    800057d4:	02e68663          	beq	a3,a4,80005800 <__memmove+0xfc>
    800057d8:	0045c603          	lbu	a2,4(a1)
    800057dc:	00400713          	li	a4,4
    800057e0:	00c78223          	sb	a2,4(a5)
    800057e4:	00e68e63          	beq	a3,a4,80005800 <__memmove+0xfc>
    800057e8:	0055c603          	lbu	a2,5(a1)
    800057ec:	00500713          	li	a4,5
    800057f0:	00c782a3          	sb	a2,5(a5)
    800057f4:	00e68663          	beq	a3,a4,80005800 <__memmove+0xfc>
    800057f8:	0065c703          	lbu	a4,6(a1)
    800057fc:	00e78323          	sb	a4,6(a5)
    80005800:	00813403          	ld	s0,8(sp)
    80005804:	01010113          	addi	sp,sp,16
    80005808:	00008067          	ret
    8000580c:	02061713          	slli	a4,a2,0x20
    80005810:	02075713          	srli	a4,a4,0x20
    80005814:	00e587b3          	add	a5,a1,a4
    80005818:	f0f574e3          	bgeu	a0,a5,80005720 <__memmove+0x1c>
    8000581c:	02069613          	slli	a2,a3,0x20
    80005820:	02065613          	srli	a2,a2,0x20
    80005824:	fff64613          	not	a2,a2
    80005828:	00e50733          	add	a4,a0,a4
    8000582c:	00c78633          	add	a2,a5,a2
    80005830:	fff7c683          	lbu	a3,-1(a5)
    80005834:	fff78793          	addi	a5,a5,-1
    80005838:	fff70713          	addi	a4,a4,-1
    8000583c:	00d70023          	sb	a3,0(a4)
    80005840:	fec798e3          	bne	a5,a2,80005830 <__memmove+0x12c>
    80005844:	00813403          	ld	s0,8(sp)
    80005848:	01010113          	addi	sp,sp,16
    8000584c:	00008067          	ret
    80005850:	02069713          	slli	a4,a3,0x20
    80005854:	02075713          	srli	a4,a4,0x20
    80005858:	00170713          	addi	a4,a4,1
    8000585c:	00e50733          	add	a4,a0,a4
    80005860:	00050793          	mv	a5,a0
    80005864:	0005c683          	lbu	a3,0(a1)
    80005868:	00178793          	addi	a5,a5,1
    8000586c:	00158593          	addi	a1,a1,1
    80005870:	fed78fa3          	sb	a3,-1(a5)
    80005874:	fee798e3          	bne	a5,a4,80005864 <__memmove+0x160>
    80005878:	f89ff06f          	j	80005800 <__memmove+0xfc>

000000008000587c <__putc>:
    8000587c:	fe010113          	addi	sp,sp,-32
    80005880:	00813823          	sd	s0,16(sp)
    80005884:	00113c23          	sd	ra,24(sp)
    80005888:	02010413          	addi	s0,sp,32
    8000588c:	00050793          	mv	a5,a0
    80005890:	fef40593          	addi	a1,s0,-17
    80005894:	00100613          	li	a2,1
    80005898:	00000513          	li	a0,0
    8000589c:	fef407a3          	sb	a5,-17(s0)
    800058a0:	fffff097          	auipc	ra,0xfffff
    800058a4:	b3c080e7          	jalr	-1220(ra) # 800043dc <console_write>
    800058a8:	01813083          	ld	ra,24(sp)
    800058ac:	01013403          	ld	s0,16(sp)
    800058b0:	02010113          	addi	sp,sp,32
    800058b4:	00008067          	ret

00000000800058b8 <__getc>:
    800058b8:	fe010113          	addi	sp,sp,-32
    800058bc:	00813823          	sd	s0,16(sp)
    800058c0:	00113c23          	sd	ra,24(sp)
    800058c4:	02010413          	addi	s0,sp,32
    800058c8:	fe840593          	addi	a1,s0,-24
    800058cc:	00100613          	li	a2,1
    800058d0:	00000513          	li	a0,0
    800058d4:	fffff097          	auipc	ra,0xfffff
    800058d8:	ae8080e7          	jalr	-1304(ra) # 800043bc <console_read>
    800058dc:	fe844503          	lbu	a0,-24(s0)
    800058e0:	01813083          	ld	ra,24(sp)
    800058e4:	01013403          	ld	s0,16(sp)
    800058e8:	02010113          	addi	sp,sp,32
    800058ec:	00008067          	ret

00000000800058f0 <console_handler>:
    800058f0:	fe010113          	addi	sp,sp,-32
    800058f4:	00813823          	sd	s0,16(sp)
    800058f8:	00113c23          	sd	ra,24(sp)
    800058fc:	00913423          	sd	s1,8(sp)
    80005900:	02010413          	addi	s0,sp,32
    80005904:	14202773          	csrr	a4,scause
    80005908:	100027f3          	csrr	a5,sstatus
    8000590c:	0027f793          	andi	a5,a5,2
    80005910:	06079e63          	bnez	a5,8000598c <console_handler+0x9c>
    80005914:	00074c63          	bltz	a4,8000592c <console_handler+0x3c>
    80005918:	01813083          	ld	ra,24(sp)
    8000591c:	01013403          	ld	s0,16(sp)
    80005920:	00813483          	ld	s1,8(sp)
    80005924:	02010113          	addi	sp,sp,32
    80005928:	00008067          	ret
    8000592c:	0ff77713          	andi	a4,a4,255
    80005930:	00900793          	li	a5,9
    80005934:	fef712e3          	bne	a4,a5,80005918 <console_handler+0x28>
    80005938:	ffffe097          	auipc	ra,0xffffe
    8000593c:	6dc080e7          	jalr	1756(ra) # 80004014 <plic_claim>
    80005940:	00a00793          	li	a5,10
    80005944:	00050493          	mv	s1,a0
    80005948:	02f50c63          	beq	a0,a5,80005980 <console_handler+0x90>
    8000594c:	fc0506e3          	beqz	a0,80005918 <console_handler+0x28>
    80005950:	00050593          	mv	a1,a0
    80005954:	00001517          	auipc	a0,0x1
    80005958:	8cc50513          	addi	a0,a0,-1844 # 80006220 <CONSOLE_STATUS+0x210>
    8000595c:	fffff097          	auipc	ra,0xfffff
    80005960:	afc080e7          	jalr	-1284(ra) # 80004458 <__printf>
    80005964:	01013403          	ld	s0,16(sp)
    80005968:	01813083          	ld	ra,24(sp)
    8000596c:	00048513          	mv	a0,s1
    80005970:	00813483          	ld	s1,8(sp)
    80005974:	02010113          	addi	sp,sp,32
    80005978:	ffffe317          	auipc	t1,0xffffe
    8000597c:	6d430067          	jr	1748(t1) # 8000404c <plic_complete>
    80005980:	fffff097          	auipc	ra,0xfffff
    80005984:	3e0080e7          	jalr	992(ra) # 80004d60 <uartintr>
    80005988:	fddff06f          	j	80005964 <console_handler+0x74>
    8000598c:	00001517          	auipc	a0,0x1
    80005990:	99450513          	addi	a0,a0,-1644 # 80006320 <digits+0x78>
    80005994:	fffff097          	auipc	ra,0xfffff
    80005998:	a68080e7          	jalr	-1432(ra) # 800043fc <panic>
	...
