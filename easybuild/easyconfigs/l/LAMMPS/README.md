# LAMMPS instructions

  * [LAMMPS web site](https://www.lammps.org/)

  * [LAMMPS GitHub](https://github.com/lammps/lammps)
  
  * JSC had public notes on LAMMPS optimization (link was 
    [fzj-jsc.github.io/tuning_lammps/](https://fzj-jsc.github.io/tuning_lammps/))
    but these are no longer available.
  
    Basically the advice from JSC is to use Kokkos as it covers multicore and GPU, 
    but it does need to be enabled also by users running LAMMPS. 


## EasyBuild support

  * [LAMMPS support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/LAMMPS).
    This is based on a custom EasyBlock with support for most but not yet all optional packages.
    Likely due to this and the continyous rapid changes in the package the support for recent
    versions is lagging.

  * [LAMMPS support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/l/LAMMPS).
    CSCS uses the plain CMakeMake generic easyblock but does not support most of the additional
    packages. There are recipes for newer versions though, but often for Piz Daint. They should
    port over easily though.

  * [LAMMPS support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/lammps)


### 29Oct20-*-minimal for cpeGNU 21.08

  * This is an EasyConfig file directly derived from the CSCS one.

  * Added support for jpeg and png based on the Spack recipe.

  * It does not yet work with cpeCray because FFmpeg does not compile.


### 23Jun22_update2-*-minimal for cpeGNU 22.08

  * Fairly trivial update of the one for the 29Oct20 version.

### 2Aug2023_update3 for cpeGNU 24.03

  * Based on previous easyconfigs but adapted to make it closer to the 
    EasyBuilders one. We enable packages which requires no extra dependency
    or with dependency already present in the central software stack.