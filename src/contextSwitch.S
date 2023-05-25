.global _ZN6thread14contextSwitchtEPNS_14ContextWrapperES1_
.type _ZN6thread14contextSwitchtEPNS_14ContextWrapperES1_, @function
_ZN3TCB14contextSwitcht_ZN6thread14contextSwitchtEPNS_14ContextWrapperES1_EPNS_14ContextWrapperES1_:
    sd ra, 0 * 8(a0)
    sd sp, 1 * 8(a0)

    ld ra, 0 * 8(a1)
    ld sp, 1 * 8(a1)

    ret