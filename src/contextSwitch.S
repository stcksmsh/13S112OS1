.global _ZN6thread13contextSwitchEPNS_14ContextWrapperES1_
.type _ZN6thread13contextSwitchEPNS_14ContextWrapperES1_, @function
_ZN6thread13contextSwitchEPNS_14ContextWrapperES1_:
    sd ra, 0 * 8(a0)
    sd sp, 1 * 8(a0)

    ld ra, 0 * 8(a1)
    ld sp, 1 * 8(a1)

    ret