.global _ZN7_thread13contextSwitchEPNS_14contextWrappertES1_
.type _ZN7_thread13contextSwitchEPNS_14contextWrappertES1_, @function
_ZN7_thread13contextSwitchEPNS_14contextWrappertES1_:
    sd ra, 0 * 8(a0)
    sd sp, 1 * 8(a0)

    ld ra, 0 * 8(a1)
    ld sp, 1 * 8(a1)

    ret