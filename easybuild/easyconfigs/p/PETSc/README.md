# PETSc instructions

  * [PETSc web site](https://petsc.org/)


## EasyBuild

  * Simple `ConfigureMake` easyconfig while default PETSc easyblock is not compatibile with LUMI toolchains

  * [HPE-Cray PETSc sample build script (TPSL)](https://github.com/Cray/pe-scripts/blob/master/sh/petsc.sh)

    PETSc was part of the Cray Third-Party Scientific Libraries (TPSL) but is no longer
    delivered in a ready-to-use form


### Version 3.17 from CPE 21.08 on

  * OpenMP enabled; Hypre, METIS, ParMETIS, SCOTCH, MUMPS, SuperLU_Dist, STRUMPACK; dependencies: python (Cray), HDF5 (Cray), Boost
  * `-minimal`: no OpenMP, dependencies: python (Cray), HDF5 (Cray), Boost, METIS, SCOTCH


### Version 3.19 for CPE 23.09 

  * GPU enabled versions with Kokkos enabled and build against ROCm 5.6.1
  * cpeGNU recipe follows old TPSL config with most external linear algebra libraries enabled
  * cpeCray recipe excludes most of external linear algebra libraries because of linking problems


### Version 3.21.5 for CPU in CPE 24.03

  * The EasyConfig has been restructured a bit but is otherwise a direct port of the one for
    3.19 for 23.09.


### Version 3.21.5 for GPU in CPE 23.09

  * Currently using an external Kokkos library as that is easier if PETSc is used in combination 
    with other libraries or code that also uses Kokkos.

  * Builds upon the CPU version, just adding even more configuration options to use [Kokkos](../../k/Kokkos/index.md)
    and [Kokkos-kernels](../../k/Kokkos-kernels/index.md).
