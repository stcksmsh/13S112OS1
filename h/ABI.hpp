#ifndef ABIHEADERFILE
#define ABIHEADERFILE

#include "../lib/hw.h"

class ABI
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

    static void disableInterrupt();
    static void enableInterrupt();

private:
    // trap handler, used in trap.S
   static void trapHandler();
};
#endif