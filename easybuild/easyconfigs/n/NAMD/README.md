# NAMD

-   [NAMD Website](http://www.ks.uiuc.edu/Research/namd/)

## General information

NAMD is a parallel molecular dynamics code designed for high-performance 
simulation of large biomolecular systems. Based on Charm++ parallel objects, 
NAMD scales to hundreds of cores for typical simulations and beyond 500,000 
cores for the largest simulations. NAMD uses the popular molecular graphics 
program VMD for simulation setup and trajectory analysis, but is also 
file-compatible with AMBER, CHARMM, and X-PLOR.


## EasyBuild

-   [NAMD in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/n/NAMD)

-   [NAMD in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/n/NAMD)


### Version 2.14 for CPE GNU 21.08

-   The EasyConfig is derived from the CSCS one


### Version 3.0b6 GPU resident for CPE AMD 23.09

-   Works with a single node runs only - uses multicore Charm++ runtime (no MPI)

-   Beta release of the code

-   Uses ROCm 5.6.1 not fully supported with CPE 23.09 


### Version 3.0 for CPU in 24.03

-   2 versions are offered:

    -   One using MPI for distributed memory parallelism.
    
    -   Another one directly talking to the libfabric library.


### Version 3.0.2 for CPU in 25.03

-   The configurations are a straightforward port of those for 3.0 in 24.03.


### Version 3.0.2 with GPU support for 24.03 and 25.03

-   Two different configurations:
    
    -   `-rocm-gpu-offload`: Uses HIP for the GPU, and MPI and Charm++ SMP for parallelism.
    
    -   `-rocm-gpu-resident`:  Uses HIP with the GPU in resident mode, so only supports 
        single node runs.
    