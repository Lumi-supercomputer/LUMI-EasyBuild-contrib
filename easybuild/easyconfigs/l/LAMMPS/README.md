# LAMMPS instructions

  * [LAMMPS web site](https://www.lammps.org/)

  * [LAMMPS GitHub](https://github.com/lammps/lammps)


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


### 29Oct20*-minimal

  * This is an EasyConfig file directly derived from the CSCS one.

  * Added support for jpeg and png based on the Spack recipe.

  * It does not yet work with cpeCray because FFmpeg does not compile.