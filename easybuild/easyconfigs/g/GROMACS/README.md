# GROMACS

  * [GROMACS web site](http://www.gromacs.org/)

      * [Check versions via the manual](https://manual.gromacs.org/)


## GROMACS and PLUMED

[PLUMED](https://www.plumed.org/) is software that can be combined with GROMACS.
It works via a patch for the GROMACS installation that should be applied before
compiling GROMACS.

It is rather difficult to figure out which versions of PLUMED and GROMACS can be
combined. One option is to look at tags in the PLUMED GitHub and then check the
[contents of the patches subdirectory](https://github.com/plumed/plumed2/tree/master/patches).
Another way to find out which versions of GROMACS are supported is to load the
PLUMED module and then run ``plumed-patch -l`` to get a list of the included
engines.

| PLUMED  | 2019   | 2020   | 2021   | 2022   |
|:--------|:-------|:-------|:-------|:-------|
| 2.8.0   | 2019.6 | 2020.6 | 2021.4 |        |
| 2.7.4   | 2019.6 | 2020.6 | 2021.4 |        |
| 2.7.3   | 2019.6 | 2020.6 | 2021.4 |        |
| 2.7.2   | 2019.6 | 2020.6 | 2021   |        |
| 2.7.1   | 2019.6 | 2020.5 | 2021   |        |
| 2.7.0   | 2019.6 | 2020.4 |        |        |
| 2.6.4   | 2019.6 | 2020.4 |        |        |
| 2.6.3   | 2019.6 | 2020.4 |        |        |
| 2.6.2   | 2019.6 | 2020.4 |        |        |
| 2.6.1   | 2019.6 | 2020.2 |        |        |
| 2.6.0   | 2019.4 |        |        |        |

## GROMACS and GPU

  * [GROMACS 2023.2 support for AMD GPUs](https://manual.gromacs.org/2023.2/install-guide/index.html#sycl-gpu-acceleration-for-amd-gpus)
  * [CSC page with example job scripts for GPU](https://docs.csc.fi/apps/gromacs/#example-batch-script-for-lumi-full-gpu-node)

## EasyBuild

  * [GROMACS support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/g/GROMACS)

  * [GROMACS support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GROMACS)

  * [GROMACS support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/gromacs)


### Version 2020.6 for CPE 21.08

  * The EasyConfig is a straightforward port of the CSCS one with some information
    added borrowed from the UAntwerpen EasyConfig.

  * We added a bash function, ``gromacs-completion``, that can be used to turn the
    command completion for GROMACS on.

  * Note that the EasyConfig does not run the GROMACS tests, presumably because they
    require an mpirun script and/or should be run in the context of a suitable compute
    job.

  * The AMD-version does not support cray-hugepages. Activating this causes the Cray
    wrapper to add an option to the linker that it does not like.


### Version 2021.3 for CPE 21.08

  * We started from our own EasyConfig for 2020.6 but had to omit ``GMX_PREFER_STATIC_LIBS``
    and add ``BUILD_SHARED_LIBS=ON`` to the CMake options to avoid an error message about
    building GMXAPI.

  * Note that the EasyConfig does not run the GROMACS tests, presumably because they
    require an mpirun script and/or should be run in the context of a suitable compute
    job.

  * The AMD-version does not support cray-hugepages. Activating this causes the Cray
    wrapper to add an option to the linker that it does not like.


### Version 2020.4 with PLUMED 2.6.4 for CPE 21.08

  * The integration of the PLUMED patch is based on the CSCS EasyConfigs. We still
    compile single and double precision versions as the CSCS version does this.

    Old documents claim that one should only run GROMACS in double precision when
    using PLUMED, but then I found comments on PLUMED 2.x that claim that that one
    always runs in double precision, also when used with a single precision GROMACS,
    to avoid numerical problems that can occur in single precision in some of the
    PLUMED routines.
    
  * Note that it was not possible to get GROMACS 2020.X to work with the cpeGNU 21.12 
    environment which is based on GCC 11.2.0.


### Version 2021.5 for CPE 21.12

  * Compiled with cpeGNU, cpeCray and cpeAOCC but not yet benchmarked.
  
  * 2020 versions did not work with the GNU compiler in LUMI/21.12
  

### Version 2021.4 with PLUMED 2.7.4 and 2.8.0 for CPE 21.12 and later

  * As PLUMED 2.8.0 is a .0 version, we decided to also offer recipes for the latest
    2.7 version at the time of developement.
    
  * **After the March/April 2023 system update building PLUMED broke so those easyconfigs
    were replaced with two versions, one without Python support and one with a different way
    of enabling support for the `cray-python` modules. Therefore the corresponding 
    EasyConfigs of GROMACS have also been replaced.**

### GROMACS 2023.2 with AMD GPU support for CPE 22.12

  * There are multiple easyconfig files for running GROMACS with AMD GPU acceleration, that follows [installation guide](https://manual.gromacs.org/2023.2/install-guide/index.html#sycl-gpu-acceleration-for-amd-gpus).

    * [HeFFTe enabled](https://manual.gromacs.org/2023.2/install-guide/index.html#using-heffte) version for multi-node, multi-GPU execution with MPI and hipSYCL
    * Generic hipSYCL version with MPI and GPU support enabled
    * [VkFFT enabled](https://manual.gromacs.org/2023.2/install-guide/index.html#using-vkfft) version for single-node execution with thread-MPI and single GPU offloading
 
  * Both MPI versions have support for [GPU aware MPI](https://manual.gromacs.org/2023.2/install-guide/index.html#gpu-aware-mpi-support) enabled 
  * All GPU enabled version use hipSYCL as GPU backend, compiled with ROCm 5.2.3

### GROMACS-2023-dev-cpeGNU-22.08-MPI-GPU

  * This is an EasyConfig for AMD's own, _unofficial_ HIP-port of GROMACS which is a version
    that is not supported by the main GROMACS developers, who prefer to work with
    SYCL for support for AMD GPUs. It is derived from the container recipes of AMD.

