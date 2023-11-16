# CMOR instructions

This is currently an experimental build. It is not clear if the package is
complete. Use at your own risk.

  * [CMOR web site](https://cmor.llnl.gov/)
  
  * [CMOR on GitHub](https://github.com/pcmdi/cmor)
  
      * [CMOR GitHub releases](https://github.com/PCMDI/cmor/releases)
      
      * [CMOR GitHub tags - there are more than there are releases](https://github.com/PCMDI/cmor/tags)


## EasyBuild

  * There is no support for CMOR in the EasyBuilders repository

  * There is no support for CMOR in the CSCS repository

  * [CMOR support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/cmor)


### Version 3.6.1 for CPE 21.08, 21.12, 22.06, 22.08

  * Developed our own ConfigureMake-based EasyConfig file by analysing the
    Spack example and the configure script.

  * Fortran support does not work with the cpeCray toolchain.
  
  * Python and cdat support are currently not enabled.


### Version 3.7.2 for CPE 22.12, 23.03

  * Trivial port of the 3.6.1 EasyConfig.

  * Added a copy of the LICENSE file to the installation.

  * Just as for 3.6.1, python and cdat support are not enabled.

  * In the cpeCray version the Fortran interfaces are still disabled.


### Version 3.7.3 from CPE 23.09 on

  * Trivial port of the 3.7.3 EasyConfig, though according to the release notes
    several bugs have been fixed.


