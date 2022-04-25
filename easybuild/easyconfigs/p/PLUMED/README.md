# PLUMED instructions

  * [PLUMED web site](https://www.plumed.org/)

      * [PLUMED 2.7 installation manual](https://www.plumed.org/doc-v2.7/user-doc/manual.pdf)

  * [PLUMED on GitHub](https://github.com/plumed/plumed2)


Note that the choice of PLUMED version depends a lot on the software that it will be
used with. E.g., every GROMACS version requires a very specific version of PLUMED.



## EasyBuild

  * [PLUMED support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PLUMED)

  * [PLEMED support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/p/PLUMED)

  * [PLUMED support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/plumed)


### Version 2.6.4 and 2.7.2 for CPE 21.08

  * We started from the CSCS recipe but added the Boost-support used in the EasyBuilders
    recipe.

      * Enabled hugepages, though this may not be needed even when including in GROMACS.

      * Added cray-fftw to the dependencies as the configure process does look for
        a FFTW library. It was already used in the CSCS recipes for 2.7 but is
        equally useful in 2.6.

      * Added cray-python to the build dependencies as CSCS does for the 2.7 recipes,
        though it may make sense to make it an actual dependency. We did not do this
        for now as the Python support is really only meant for developers according
        to the manual.

      * Removed ``--enable-rpath`` used in the CSCS recipe as the configure process produces
        a warning that the ``-R``-option does not work.

      * The ``MPIEXEC=srun`` has also been removed as the configure process can still not
        find a way to start MPI processes; it assumes ``mpirun`` is the way to do it.

        The correct way to do this is actually through ``PLUMED_MPIRUN`` but as we may not
        be compiling in a job context or a job context suitable for the tests that PLUMED
        wants to do it is OK to not set this.

      * Added ``--enable-asmjit``, an option used in the EasyBuilders recipe (and off
        by default).

  * **IMPORATANT**: Cray Blas currently does not work properly with PLUMED so it has
    been disabled.

      * cpeGNU: Crashes. The crash happens in ``src/crayblas_util.c`` line 353 for
        the 2.7.2 version in ``_freeBlasMemPool``, called by ``_crayblas_shutdown``.

      * cpeCray: Blas isn't active according to ``config has blas`` even when compiling
        with ``--enable-external-blas``. So obviously something goes wrong in the configure
        step that does not go wrong with cpeGNU.

      * Did not yet try with cpeAMD.

  * We currently have XDR file support disabled (as is the default in an EasyBuild
    installation). XDR file support is a tricky thing as it seems to be something that
    comes with GROMACS but is not available separate from GROMACS.

  * As for GROMACS, hugepages support does not work with the AMD compilers.
  
  
### 2.7.4 and 2.8.0 for CPE 21.12

  * Trivial adaptations of the EasyConfigs for 21.08.
  
  * Did not go exclusively for 2.8.0 as this version is very new and hence may still 
    have problems.

