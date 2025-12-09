# SuperLU_DIST instructions

-   [SuperLU home page](https://portal.nersc.gov/project/sparse/superlu/)

-   [SuperLU_DIST on GitHub](https://github.com/xiaoyeli/superlu_dist)

    -   [GitHub releases](https://github.com/xiaoyeli/superlu_dist/releases)


## EasyBuild

-   [SuperLU_DIST package in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/SuperLU_DIST)

-   There is no support for SuperLU in the CSCS repository.


### Version 7.2.0 for cpeGNU 22.08

-   The EasyConfig is an extended version of the EasyBuilders one.


### Version 8.1.2

-   The EasyConfig is adapted from the 7.2.0 one.

-   But **note that OpenMP is disabled in this version**.


### Version 9.0.0 for cpeGNU 24.03

-   Update based on previous easyconfigs


### Version 9.2.0 for cpeGNU 25.03

-   The EasyConfig is a straightforward port of the 9.0.0 one in 24.03.

-   Changed the versionsuffix as GPU builds are also possible.

-   Changed the options to generate both static and shared libraries.

-   Double-checked if OpenMP is supported, and the package can support a multithreaded
    BLAS library. 
    
-   Checking the Spack recipe is actually more useful than checking the EasyBuilders
    recipes. It also shows that special versions of METIS or ParMETIS are needed when
    using 64-bit indexing.
