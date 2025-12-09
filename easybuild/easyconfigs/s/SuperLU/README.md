# SuperLU instructions

-   [SuperLU home page](https://portal.nersc.gov/project/sparse/superlu/)

-   [SuperLU on GitHub](https://github.com/xiaoyeli/superlu)

    -   [GitHub releases](https://github.com/xiaoyeli/superlu/releases)


## EasyBuild

-   [SuperLU package in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/SuperLU)

-   There is no support for SuperLU in the CSCS repository.


### Version 6.0.0 for CPE 23.09

-   The EasyConfig is a LUST development.


### Version 6.0.0 for cpeGNU 24.03

-   Update based on previous easyconfigs


### Version 7.0.1 for cpeGNU 25.03

-   Removed the OpenMP enabling, also from `toolchainopts`. 
    You may want to use it in `toolchainopts` to link the OpenMP version of LibSci,
    but in fact you need `SuperLU_MT` for threading support in SuperLU itself.

    There are no OpenMP pragma's in the code, and even though it needs a BLAS
    library, there is no reference to that in the pkgconfig file for the package,
    so basically adding the OpenMP compiler flags should not do anything.

