# CMOR instructions

This is currently an experimental build. It is not clear if the package is
complete. Use at your own risk.

  * [CMOR web site](https://cmor.llnl.gov/)


## EasyBuild

  * There is no support for CMOR in the EasyBuilders repository

  * There is no support for CMOR in the CSCS repository

  * [CMOR support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/cmor)


### Version 3.6.1 for CPE 21.08

  * Developed our own ConfigureMake-based EasyConfig file by analysing the
    Spack example and the configure script.

  * Fortran support does not work with the cpeCray toolchain.
