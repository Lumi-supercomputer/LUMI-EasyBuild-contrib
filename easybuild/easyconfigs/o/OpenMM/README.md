# OpenMM

  * [OpenMM Website](https://openmm.org/)

## General information

OpenMM is a high-performance toolkit for molecular simulation. You can use it as
an application, a library, or a flexible programming environment. It include 
extensive language bindings for Python, C, C++, and Fortran.

## EasyBuild

  * [OpenMM in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OpenMM)

### Version 7.5.1 for CPE GNU 21.08

  * The EasyConfig is derived from the EasyBuilders one
  * Include a patch to fix problem when building with Doxygen 1.9 used in 
    `buildtools`

### Version 7.5.1 for CPE Cray 21.08

One of the test fail (segfault), be aware of it if you are using this version.

  * The EasyConfig is derived from the EasyBuilders one
  * Include a patch to fix problem when building with Doxygen 1.9 used in 
    `buildtools`
