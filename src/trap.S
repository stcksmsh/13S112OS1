.global trap
.align 4

trap:

    addi sp, sp, -256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

<<<<<<< HEAD
    call _ZN5Riscv20handleSupervisorTrapEv
=======
    call _ZN3ABI11trapHandlerEv
>>>>>>> 0c010e2 (Added initial thread ABI files, testing follows...)


    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret