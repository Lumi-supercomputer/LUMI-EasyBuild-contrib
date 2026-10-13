# MUMPS instructions

-   [MUMPS web site](https://mumps-solver.org/index.php)


## EasyBuild

-   [Support for MUMPS in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/m/MUMPS)

-   There is no support for MUMPS in the CSCS repository.


### Version 5.5.1. for cpeGNU 22.08 and 22.12

-   The EasyConfig is derived from the EasyBuilders one with an additional patch
    for the Cray PE.


### Version 5.6.1 for cpeGNU 24.03 and 25.03 and cpeCray 25.03

-   The EasyConfig is derived from the EasyBuilders one
    
    
### Version 5.8.1 for cpeGNU 25.03

-   The EasyConfig is derived from the EasyBuilders one and we haven't figured
    out yet how to adapt patches from earlier versions to also build a shared
    library version.


### 5.9.1 for cpeGNU 26.03

-   The EasyConfig is a direct port of the 5.8.1 one for cpeGNU 25.03, but we 
    switched to EB6-compatible parameters.

-   We now also always build static and shared libraries (and it turns out that 
    this was possible with 5.8.1 also). The trick was found in an EasyBuilders
    EasyConfig (use the right make targets in `buildopts`).

-   The new `-idx32-fp64` version of METIS is the one that corresponds to the
    old one without versionsuffix.
