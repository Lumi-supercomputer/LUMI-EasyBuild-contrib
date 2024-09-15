# Trilinos instructions

-   [Home page](https://trilinos.org/)

-   [Trilinos main GitHub repository](https://github.com/trilinos/Trilinos)

    -   [GitHub releases](https://github.com/trilinos/Trilinos/releases)

- Legacy recipes for building libraries with Cray's PE [pe-scripts](https://github.com/Cray/pe-scripts/tree/master/sh)


## EasyBuild

-   [Trilinos support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/t/Trilinos)

-   There is no support for Trilinos in the CSCS repository

-   [Trilinos in Spack](https://spack.readthedocs.io/en/latest/package_list.html#trilinos)


### Version 12.18.1 for cpeGNU (archived)

-   This easyconfig is based on old Cray's recipes with custom patches. The library version is last commit for v12 branch [55a7599](https://github.com/trilinos/Trilinos/commit/55a75997332636a28afc9db1aee4ae46fe8d93e7)

#### Known issues

-  Fails to build with recent versions of make and CMake, avoid using `buildtools` module, works with system's `make/4.2.1` and `cmake/3.20.4`; see [this issue](https://github.com/GEOS-DEV/thirdPartyLibs/issues/136).
-  Fails to build with recent versions of Boost (which requires C++14) overwriting compile options for C++11, works with `Boost/1.72.0`.
-  Includes Kokkos but no GPU support enabled in this version, target is LUMI-C.

#### Dependencies

-  Boost, SuperLU, SuperLU_DIST, ParMETIS, SCOTCH, MUMPS, MATIO.  
-  Python3, HDF5 (parallel), NetCDF (parallel) from the Cray PE.

### Version 13.4.1 for cpeGNU (archived)

-   The EasyConfig file is developed in LUST, with currently some fewer options as the
    one in the EasyBuilders repository, and without GPU support.

### Version 12.18.1 for cpeGNU 22.12 (archived)
    
-   A downgrade as a user required the version 12 API.

-   Based more on the Cray scripts for installing the former TPSL and some other libraries.

### Version 13.4.1 for cpeGNU 23.04

- Update based on the easyconfig from version 13.4.1 