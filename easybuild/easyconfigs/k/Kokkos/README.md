# Kokkos technical information

-   [Kokkos website](https://kokkos.org/)

-   [Kokkos core GitHub repository](https://github.com/kokkos/kokkos)

    -   [Kokkos GitHub releases](https://github.com/kokkos/kokkos/releases)


## EasyBuild

-   No EasyBuild support Kokkos at the time of writing in either the EasyBuilders or the CSCS repository.

-   [kokkos package in Spack](https://packages.spack.io/package.html?name=kokkos)


### Version 4.5.01 for cpeGNU and cpeAMD with ROCm 6.0.3

-   The EasyConfig is a LUST development.

-   The cpeGNU recipe offers the serial host backend only to avoid OpenMP runtime library mismatch 
    between the GNU one and ROCm one.

    
### 4.6.2 for cpeGNU and cpeAMD with ROCm 6.3.4

-   Straightforward port of the EasyConfigs for 4.5.1 in 24.03.
