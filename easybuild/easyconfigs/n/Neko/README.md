# Neko

-   [Neko Website](https://neko.cfd)

-   [Neko on GitHub](https://github.com/ExtremeFLOW/neko)

    -   [GitHub releases](https://github.com/ExtremeFLOW/neko/releases)


## General information

Neko is a portable framework for high-order spectral element flow simulations. 
Written in modern Fortran, Neko adopts an object-oriented approach, allowing 
multi-tier abstractions of the solver stack and facilitating various hardware 
backends ranging from general-purpose processors, CUDA and HIP enabled accelerators.


## EasyBuild

-   There is no support for Neko in the EasyBuilders repository

-   [neko Spack package](https://packages.spack.io/package.html?name=neko)


### Version 0.8.1 for CPE GNU and CPE Cray 24.03 

-   Recipe for the GNU toolchain is only tested for single node runs; there is an issue 
    with device buffers on multiple nodes for this version

-   Recipes are tested against ROCm release 6.0.3


### Version 0.9.1 for cpeGNU and cpeCray 25.03

-   Straightforward ports of the EasyConfigs for 0.8.1 in 24.03.

    The configuration is still very basic with no optional dependencies.

-   Not tested as the upgrade was not done on user demand with test examples 
    available, but reading the release notes, some issues are to be expected.
    
-   Installation of 1.0.0 failed with both the GNU and the Cray compilers.
    The [release notes of 1.0.0](https://github.com/ExtremeFLOW/neko/releases/tag/v1.0.0)
    also mention issues with both compilers on Cray systems.
