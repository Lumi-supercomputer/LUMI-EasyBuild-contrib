# MATIO instruction

MATIO is used by Trilinos.

-   [MATIO - MAT File I/O Libary on SourceForge](https://matio.sourceforge.io/)

-   [MATIO on GitHub](https://github.com/tbeu/matio)


## EasyBuild

-   [MATIO support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/m/MATIO)

-   There is no support for MATIO in the CSCS repository


### Version 1.5.23 for cpeGNU 22.08 and 22.12 (archived)

-   The EasyConfig is adapted from the EasyBuilder ones.


### Version 1.5.27 for cpeGNU 24.03

-   The EasyConfig is adapted from the previous one but with a
    switch to use CMake as the build system. Enabled shared library and
    HDF5. HDF5 parallel is used as MATIO is a Trilinos dependency and we
    use the parallel version to build Trilinos.
    

### Version 1.5.29 for cpeGNU 25.03

-   The EasyConfig is a straightforward port of the one for 1.5.27 in 24.03.
