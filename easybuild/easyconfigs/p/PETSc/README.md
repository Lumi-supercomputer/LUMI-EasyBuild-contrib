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
