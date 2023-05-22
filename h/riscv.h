#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_RISCV_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_RISCV_HPP

#include "../lib/hw.h"

extern "C" void supervisorTrap();
class Riscv
{
public:
    static void popSppSpie();
    
    /// @brief clears bit of sip
    /// @param  uint64 the bit to clear (0..63)
    static void sipBitClear(uint64);

    /// @brief clears bit of sstatus
    /// @param  uint64 the bit to clear (0..63)
    static void sstatusBitClear(uint64);

    /// @brief reads the supervisor status register
    /// @return sstatus
    static uint64 sstatusRead();

    /// @brief writes the supervisor status register
    /// @param  uint64 new sstatus
    static void sstatusWrite(uint64);

private:

    // trap handler, used in trap.S
   static void trapHandler();


};
<<<<<<< HEAD:h/riscv.h

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}


inline void Riscv::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));

}
#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_RISCV_HPP
=======
#endif
>>>>>>> 0c010e2 (Added initial thread ABI files, testing follows...):h/ABI.h
