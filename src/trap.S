.global trap
.align 4

trap:

    addi sp, sp, -256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    csrr t0, scause
    li t1, 0x8000000000000000
    and t0, t0, t1
    bnez t0, interrupt
    call exceptionHandler
    j end
interrupt:
    sd a0, 10*8(sp)
    call exceptionHandler
    ld a0, 10*8(sp)

end:
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret