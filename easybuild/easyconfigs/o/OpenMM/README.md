# OpenMM

  * [OpenMM Website](https://openmm.org/)

  * [OpenMM on GitHub](https://github.com/openmm/openmm)
  
      * [OpenMM GitHub releases](https://github.com/openmm/openmm/releases)


## General information

OpenMM is a high-performance toolkit for molecular simulation. You can use it as
an application, a library, or a flexible programming environment. It include 
extensive language bindings for Python, C, C++, and Fortran.


## EasyBuild

  * [OpenMM in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OpenMM)

  * There is no support for OpenMM in the CSCS repository
  
  * [Spack OpenMM package](https://github.com/spack/spack/blob/develop/var/spack/repos/builtin/packages/openmm/package.py)


### Version 7.5.1 for CPE GNU 21.08

  * The EasyConfig is derived from the EasyBuilders one
  
  * Include a patch to fix problem when building with Doxygen 1.9 used in 
    `buildtools`


### Version 7.5.1 for CPE Cray 21.08

One of the test fail (segfault), be aware of it if you are using this version.

  * The EasyConfig is derived from the EasyBuilders one
  
  * Include a patch to fix problem when building with Doxygen 1.9 used in 
    `buildtools`


### Version 7.7.0 for 21.12 and 22.06
    
  * The EasyConfig is a fairly straightforward evolution of the 7.5.1 one.

  * The test failure for #71 TestSerializeState (with SEGFAULT) is still present
    with the Cray compiler in 22.06. The crash is internal in the code and doesn't
    seem to be the result of a library that is linked in.

    