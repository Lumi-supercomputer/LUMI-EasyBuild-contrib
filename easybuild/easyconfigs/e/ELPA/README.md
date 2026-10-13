# ELPA installation instructions

-   [ELPA home page](https://elpa.mpcdf.mpg.de/)

-   [ELPA GitLab](https://gitlab.mpcdf.mpg.de/elpa/elpa) hosted by MPG

    -   [Installation instructions on the GitLab](https://gitlab.mpcdf.mpg.de/elpa/elpa/blob/master/INSTALL.md)

    -   [Gitlab releases](https://gitlab.mpcdf.mpg.de/elpa/elpa/-/releases)


## General information

-   ELPA stands for Eigenvalue soLvers for Petascale Applications

-   ELPA libraries can be compiled with or without OpenMP support. Both sets
    of libraries can be installed together as they have different names.

-   ELPA can also be build without MPI support, and those libraries get
    "onenode" in their name. Hence MPI and non-MPI OpenMP and non-OpenMP
    versions can coexist in a single library directory.

-   ELPA also contains optional GPU support through CUDA.

-   ELPA contains kernels for various CPUs: there is a generic kernel,
    specialized kernels for SSE, AVX, AVX2, AVX512, and some support
    for SPARC64, BlueGene P and BlueGene Q.

-   ELPA includes the script ``manual_cpp`` that is used during the build process
    and as of version 2020.05.001 still requires Python 2. Moreover, it calls
    the Python interpreter using a shebang that calls the ``python``
    executable.


## TODOs

It is not clear from the documentation which linear algebra libraries
should be used for the OpenMP versions of the code: Should we use the
multithread version or the singlethread version?


## EasyBuild

-   [ELPA in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/e/ELPA)

-   [ELPA in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/e/ELPA)

-   [Spack package elpa](https://packages.spack.io/package.html?name=elpa)


### 2021.05.002 for CPE 21.08 - Was in the central software stack

-   The EasyConfig is derived from the CSCS one with some elements of the
    University of Antwerpen one inserted (mostly in the documentation of the
    module)

-   The download location is taken from the EasyBuilders version. It turns out
    that downloading via the download page often fails in EasyBuild (though the link
    did seem to work in a browser).

-   TODO: ELPA does not yet compile with the Cray and AMD Fortran compilers,
    and both produce different errors.


### 2022.05.001 CPU for 22.08 (GNU and Cray)

-   the cpeCray version is without OpenMP support


### 2022.11.rc1 for cpeGNU 22.08

-   Trivial port of older EasyConfigs


### 2022.11 for cpeGNU 22.08

-   Trivial port of older EasyConfigs.


### 2023.05.001 GPU for 22.12

-   Supports GNU toolchain with ROCm (version agnostic)

-   No support for OpenMP (conficts with GPU stream implementation) 

  
### 2023.05.001 CPU for 23.09

-   Based on previous EasyConfigs for the CPU version but with some refinements in 
    the compiler options.
 
 
### 2024.05.001 CPU and GPU for 24.03 and later

-   The EasyConfigs are based on previous ones and the EasyBuilder ones.

-   Developed a cpeCray version with ROCm which needed a patch to compile.

-   Added license information for the 25.03 versions.


### 2025.06.001 for GPU and CPU

-   The EasyConfigs are based on those of previous versions.

-   Switched to EB6-compatible parameters for 26.03.


### 2026.02.002 for CPU

-   The EasyConfig is a straightforward version bump of 2025.06.001 for 26.03.


### 2026.02.002 for GPU

-   This version is for cpeCray as there was a request for a GPU-aware version
    of PETSc using the Cray compiler for a Fortran project.

    It is an almost straightforward port of the EasyConfig for 2025.06.001 for GPU though.

