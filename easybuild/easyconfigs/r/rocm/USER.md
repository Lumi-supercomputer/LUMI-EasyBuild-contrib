# ROCm user-installable modules user instructions

There are some additional ROCm(tm) modules that are not pre-installed on the
system because they are meant for very specialised use or are not fully compatible
with the system software.

At the time of writing (February 2026), the following user-installable modules
are compatible with the GPU driver on LUMI:

-   `rocm./6.1.3` is meant to be used with the 23.09 compilers. It is the last
    version of ROCm(tm) based on LLVM 17, the LLVM version used in the Cray
    compilers in 23.09, and the only such version compatible with the GPU driver
    that became available after the January 2026 system update.

-   `rocm/7.0.3` is offered as-is. RCCL does not work and there is also no matching
    MPI library. ROCm(tm) 7 support will only come with the 26.03 version of the 
    HPE Cray Programming Environment, but it remains to be seen how the RCCL issues
    can get solved.
