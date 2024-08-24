# OpenBLAS instructions

  * [OpenBLAS web site](http://www.openblas.net/)
  
  * [OpenBLAS documentation wiki](https://github.com/xianyi/OpenBLAS/wiki)
  
  * [OpenBLAS on GitHub](https://github.com/xianyi/OpenBLAS)
  
      * [GitHub releases](https://github.com/xianyi/OpenBLAS/releases)
      

## General information

OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version.

Note that OpenBLAS will conflict with the Cray LibSci library, so when using
this module you have to unload the cray-libsci module as otherwise the
Cray compiler wrappers will add LibSci to the libraries used by the
compiler.

Cray LibSci already contains BLAS, LAPACK and ScaLAPACK functionality and
should be your first choice. But this module may be useful if you run into
problems with the Cray LibSci library. Note however that software in the
LUMI stack is by default build with the Cray LibSci library, so your code
that relies on BLIS may not link correctly to any of the other modules
in the LUMI software stacks.


## EasyBuild

  * [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OpenBLAS)
  
  * [Support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/o/OpenBLAS)
    which is really for the EasyBuild common toolchains and not for the Cray PE.


### Version 0.3.20 for cpeGNU/22.06, cpeGNU/22.08 (archived)

  * The EasyConfig is an adaptation of the standard EasyBuilders one.
  
    Note that it is best to unload cray-libsci to make sure that there is
    no interaction at all with that library. Otherwise, e.g., one might
    end up testing the Cray library rather than OpenBLAS.

### Version 0.3.23 for cpeGNU 22.12 (archived)

  * Version provided with 64-bit integer support on user demand.

### Issues with 0.3.23 and GCC 12.2.0 (archived)

  * Take caution on updating for GCC 12.2.0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107254

### Version 0.3.24 for cpeGNU 23.12 and 24.03

  * The easyconfig is an adaptation of the standard EasyBuilders one.
