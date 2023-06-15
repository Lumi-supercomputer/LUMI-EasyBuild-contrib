# ELPA installation instructions

  * [ELPA home page](https://elpa.mpcdf.mpg.de/)

  * [ELPA GitLab](https://gitlab.mpcdf.mpg.de/elpa/elpa) hosted by MPG

      + [Installation instructions on the GitLab](https://gitlab.mpcdf.mpg.de/elpa/elpa/blob/master/INSTALL.md)


## General information

  * ELPA stands for Eigenvalue soLvers for Petascale Applications
  * ELPA libraries can be compiled with or without OpenMP support. Both sets
    of libraries can be installed together as they have different names.
  * ELPA can also be build without MPI support, and those libraries get
    "onenode" in their name. Hence MPI and non-MPI OpenMP and non-OpenMP
    versions can coexist in a single library directory.
  * ELPA also contains optional GPU support through CUDA.
  * ELPA contains kernels for various CPUs: there is a generic kernel,
    specialized kernels for SSE, AVX, AVX2, AVX512, and some support
    for SPARC64, BlueGene P and BlueGene Q.
  * ELPA includes the script ``manual_cpp`` that is used during the build process
    and as of version 2020.05.001 still requires Python 2. Moreover, it calls
    the Python interpreter using a shebang that calls the ``python``
    executable.

## TODOs

It is not clear from the documentation which linear algebra libraries
should be used for the OpenMP versions of the code: Should we use the
multithread version or the singlethread version?

## EasyBuild

  * [ELPA in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/e/ELPA)

  * [ELPA in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/e/ELPA)

### 2021.05.002 for CPE 21.08 - Was in the central software stack

  * The EasyConfig is derived from the CSCS one with some elements of the
    University of Antwerpen one inserted (mostly in the documentation of the
    module)

  * The download location is taken from the EasyBuilders version. It turns out
    that downloading via the download page often fails in EasyBuild (though the link
    did seem to work in a browser).

  * TODO: ELPA does not yet compile with the Cray and AMD Fortran compilers,
    and both produce different errors.


### 2022.05.001 CPU for 22.08 (GNU and Cray)

  * the cpeCray version is without OpenMP support

### 2022.11.rc1 for cpeGNU 22.08

  * Trivial port of older EasyConfigs

### 2022.11 for cpeGNU 22.08

  * Trivial port of older EasyConfigs.
