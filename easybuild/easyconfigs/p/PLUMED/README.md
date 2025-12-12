# PLUMED instructions

-   [PLUMED web site](https://www.plumed.org/)

    -   [PLUMED 2.7 installation manual](https://www.plumed.org/doc-v2.7/user-doc/manual.pdf)

-   [PLUMED on GitHub](https://github.com/plumed/plumed2)

Note that the choice of PLUMED version depends a lot on the software that it will be
used with. E.g., every GROMACS version requires a very specific version of PLUMED.

The easiest way to find out which versions of other applications are supported by a 
particular version of PLUMED, is to go into 
[the patches subdirectory](https://github.com/plumed/plumed2/tree/master/patches)
and then look for the patches for a given version tag.


## EasyBuild

-   [PLUMED support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PLUMED)

-   [PLEMED support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/p/PLUMED)

-   [PLUMED support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/plumed)


### Version 2.6.4 and 2.7.2 for CPE 21.08

-   We started from the CSCS recipe but added the Boost-support used in the EasyBuilders
    recipe.

    -   Enabled hugepages, though this may not be needed even when including in GROMACS.

    -   Added cray-fftw to the dependencies as the configure process does look for
        a FFTW library. It was already used in the CSCS recipes for 2.7 but is
        equally useful in 2.6.

    -   Added cray-python to the build dependencies as CSCS does for the 2.7 recipes,
        though it may make sense to make it an actual dependency. We did not do this
        for now as the Python support is really only meant for developers according
        to the manual.

    -   Removed ``--enable-rpath`` used in the CSCS recipe as the configure process produces
        a warning that the ``-R``-option does not work.

    -   The ``MPIEXEC=srun`` has also been removed as the configure process can still not
        find a way to start MPI processes; it assumes ``mpirun`` is the way to do it.

        The correct way to do this is actually through ``PLUMED_MPIRUN`` but as we may not
        be compiling in a job context or a job context suitable for the tests that PLUMED
        wants to do it is OK to not set this.

    -   Added ``--enable-asmjit``, an option used in the EasyBuilders recipe (and off
        by default).

-   **IMPORATANT**: Cray Blas currently does not work properly with PLUMED so it has
    been disabled.

    -   cpeGNU: Crashes. The crash happens in ``src/crayblas_util.c`` line 353 for
        the 2.7.2 version in ``_freeBlasMemPool``, called by ``_crayblas_shutdown``.

    -   cpeCray: Blas isn't active according to ``config has blas`` even when compiling
        with ``--enable-external-blas``. So obviously something goes wrong in the configure
        step that does not go wrong with cpeGNU.

    -   Did not yet try with cpeAMD.

-   We currently have XDR file support disabled (as is the default in an EasyBuild
    installation). XDR file support is a tricky thing as it seems to be something that
    comes with GROMACS but is not available separate from GROMACS.

-   As for GROMACS, hugepages support does not work with the AMD compilers.
  
  
### 2.7.4 and 2.8.0 for CPE 21.12

-   Trivial adaptations of the EasyConfigs for 21.08.
  
-   Did not go exclusively for 2.8.0 as this version is very new and hence may still 
    have problems.
    

### 2.7.4 and 2.8.0 for CPE 22.06

-   Had a look at the BLAS problem. It turns out that whatever version of GSL one uses,
    when one does an `ldd` of the `plumed` executable, it is linked against two versions
    of libsci, the sequential and the OpenMP one. 
    
    TODO: Further investigation of the log files to check what is going on.
    
    It looks like:
    
    -   GSL uses the sequential or OpenMP libsci as suggested by the module versionsuffix.
      
    -   libplumedKernel.so itself seems to link directly to the OpenMP version, so 
        likely OpenMP is activated during the compile.
        
    -   However, it looks like the `plumed` executable then adds the link against the
        sequential version of the libsci library.
        
    Though not all observations are in line with this, the problem might be in the 
    PLUMED kernel library itself.

In 22.06, Cray libsci produces a warning if the application is linked against multiple 
versions of the libsci library. This turns out to be the case irrespective of the 
version of GSL that is linked into PLUMED. It looks like a problem in the PLUMED build
process itself causes it to link to multiple libsci libraries if `--enable-external-blas`
and `--enable-external-lapack` are used.


### 2.7.4 and 2.8.0 for CPE 22.08 (after update of April 2023)

-   There was a problem with the EasyConfig of PLUMED as there was an interaction between
    the PYTHONPATH set by EasyBuild and adjusted by cray-python, causing the build process
    to fail in the installation process
    
    Two solutions have been implemented:
    
    -   `-cray-python-3.9.12.1`-versions: Load Python in a different way so that we 
        can first unset the PYTHONPATH.
        
        These EasyConfigs need further investigation and are a temporary workaround as we
        suspect they may still be picking up unintended Python binaries or packages.
        
    -   `-noPython`: Simply disables Python; build PLUMED without Python support.


### 2.8.3 for CPE 23.09

-   Trivial version bump of 2.8.0.

-   But at least initially no support for cpeCray/23.09 as Boost fails to build.


### 2.9.0 for CPE 23.09

-   Fails to build on the login nodes if you build for `partition/C`.

-   Version bump from 2.8.3 but switched to the downloads that EasyBuild also uses
    so that we can copy checksums from there.
    
-   Initially no support for cpeCray as we cannot build Boost for cpeCray.


### 2.9.2 for CPE 24.03

-   Some improvements inspired by the current EasyBuilders versions.
    
-   Re-enabled external BLAS/LAPACK. Doesn't seems to be a problem anymore.

-   Small workaround applied to make sure linking against libsci is correct.
    
-   Some improvements to the way environment variables are set.

-   cpeGNU version also with the Python plugin and extra sanity checks to
    test the Python integration.

-   Include information in the comments on how to run the regression tests.

    According to the manual, it is normal that some tests fail due to numerical
    differences when using different compilers with more aggressive optimisations,
    so interpret with care.
    

### 2.9.3 for cpe 24.03

-   Trivial port, and mostly done because there were reports that 2.9.2 is rather
    buggy.
    
 
### 2.9.4 for cpe 25.03

-   Another bugfix release and hence a rather trivial port, but the sources were not made
    available in the usual way.

