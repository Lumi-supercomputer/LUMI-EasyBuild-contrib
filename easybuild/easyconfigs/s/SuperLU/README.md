# SuperLU instructions

-   [SuperLU home page](https://portal.nersc.gov/project/sparse/superlu/)

-   [SuperLU on GitHub](https://github.com/xiaoyeli/superlu)

    -   [GitHub releases](https://github.com/xiaoyeli/superlu/releases)


## EasyBuild

-   [SuperLU package in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/SuperLU)

-   There is no support for SuperLU in the CSCS repository.


### Version 6.0.0 for CPE 23.09

-   The EasyConfig is a LUST development.


### Version 6.0.1 for cpeGNU 24.03 and 25.03

-   Update based on previous easyconfigs

-   The OpenMP versionsuffix is misleading as the code does not contain any 
    OpenMP directives and as a static library, will also not link to the
    multithreaded BLAS. This was copied from the EasyBuilders repository and
    it is not clear why they did that.


### Version 7.0.1 for cpeGNU 25.03

-   Mostly a straightforward adaptation of the 6.0.1 EasyConfig in 25.03.

-   The EasyConfig was also extended to generate both static and shared libraries.

-   As we now generate a shared library version also, we must take into account
    single- en multi-threaded BLAS libraries, which is why there is a version
    with and without `-OpenMP` versionsuffix.
    
    Note that SuperLU itself is single-threaded code.
