# YAXT instructions

YAXT is a dependency for CDO but doesn't seem to be used by any other
EasyBuild-supported package as of September 2021.

  * [YAXT web page](https://www.dkrz.de/redmine/projects/yaxt)


## EasyBuild

  * [YAXT support in the EasyBuilders repository]()

  * [YAXT support in the CSCS repository]()


### Version 0.9.1 for CPE 21.08

  * The EasyConfig is a mix of the EasyBuilders and CSCS one,
    the former supporting more recent versions at the time of
    development.

  * Some tests in the configure script have to be skipped as they require an
    MPI starter. It may be possible to configure it to use ``srun`` rather
    then the ``mpirun`` or ``mpiexec`` that it searches for. The checks
    are turned off with the ``--without-regard-for-quality`` switch.

  * On the cpeCray programming environment, ``libtool`` fails to properly link
    C and Fortran code so the Fortran interfaces are not provided in that
    module.

  * YAXT does not compile with cpeAMD at the moment, the configure
    process generates a compiler option that clang does not like
    (-soname).
