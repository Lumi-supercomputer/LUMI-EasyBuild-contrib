# PETSc instructions

-   [PETSc web site](https://petsc.org/)

-   [GitLab release tags](https://gitlab.com/petsc/petsc/-/tags)


## General instructions

PETSc is a toolbox with lots of optional dependencies and we cannot include them all.

Finding out which versions were used by the developers for a certain release, can be done
via the [config/BuildSystem/config/packages](https://gitlab.com/petsc/petsc/-/tree/main/config/BuildSystem/config/packages)
subdirectory where you can also select the appropriate tag, e.g.,
[this version for PETSc 3.25.4](https://gitlab.com/petsc/petsc/-/tree/v3.25.4/config/BuildSystem/config/packages?ref_type=tags).


## EasyBuild

-   [PETSc in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PETSc)

-   Simple `ConfigureMake` easyconfig while default PETSc easyblock is not compatible with LUMI toolchains

-   [HPE-Cray PETSc sample build script (TPSL)](https://github.com/Cray/pe-scripts/blob/master/sh/petsc.sh)

    PETSc was part of the Cray Third-Party Scientific Libraries (TPSL) but is no longer
    delivered in a ready-to-use form


### Version 3.17 from CPE 21.08 on

-   OpenMP enabled; Hypre, METIS, ParMETIS, SCOTCH, MUMPS, SuperLU_Dist, STRUMPACK; dependencies: python (Cray), HDF5 (Cray), Boost
-   `-minimal`: no OpenMP, dependencies: python (Cray), HDF5 (Cray), Boost, METIS, SCOTCH


### Version 3.19 for CPE 23.09 

-   GPU enabled versions with Kokkos enabled and build against ROCm 5.6.1
-   cpeGNU recipe follows old TPSL config with most external linear algebra libraries enabled
-   cpeCray recipe excludes most of external linear algebra libraries because of linking problems


### Version 3.21.5 for CPU in CPE 24.03

-   The EasyConfig has been restructured a bit but is otherwise a direct port of the one for
    3.19 for 23.09.


### Version 3.21.5 for GPU in CPE 23.09

-   Currently using an external Kokkos library as that is easier if PETSc is used in combination 
    with other libraries or code that also uses Kokkos.

-   Builds upon the CPU version, just adding even more configuration options to use [Kokkos](../../k/Kokkos/index.md)
    and [Kokkos-kernels](../../k/Kokkos-kernels/index.md).


### Version 3.23.5-cpeGNU-25.03-OpenMP-CPU-forYambo

-   Similar to the version 3.21.1 for CPU in 24.03, but configuration checked for use with Yambo 5.3.

    
### Version 3.24.2 for CPU in CPE 25.03

-   Straightforward port of the EasyConfig for the CPU version of 3.21.5 in 24.03, 
    only updating the dependencies to sometimes new major versions.


### Version 3.24.4 for GPU with cpeGNU and cpeCray 25.03

-   The Cray version was made for a porting project.

    There is an issue with it. Only the Fortran parts are fully OpenMP enabled as 
    otherwise there were linking issues with the `cc` compiler wrapper.


### Version 3.25.4 for CPU in 26.03

-   An evolution of the 3.24.2 EasyConfig for CPU in 25.03.

-   Checked some dependencies in [this directory](https://gitlab.com/petsc/petsc/-/tree/v3.25.4/config/BuildSystem/config/packages?ref_type=tags).

-   We've paid particular attention to the precision of METIS/ParMETIS but in
    the future we may search for forks where ParMETIS does not also include
    the METIS library in its build (but we would still have to be consistent
    in the precision for indices and reals).


### Version 3.23.7-cpeGNU-26.03-OpenMP-CPU-forYambo

-   Similar to the version 3.23.5 for Yambo in 25.03, but decided to go for a bug fix
    release.

-   Switched to EB6-compatible parameters in the EasyConfigs.
