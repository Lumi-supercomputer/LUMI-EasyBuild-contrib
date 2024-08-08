# GPAW technical instructions

-   [GPAW Wiki](https://wiki.fysik.dtu.dk/gpaw/#)

-   [GPAW on GitLab](https://gitlab.com/gpaw/gpaw)


## EasyBuild

-   [GPAW support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/GPAW)
   
-   [(Outdated) GPAW support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GPAW)

-   [GPAW support in Spack](https://packages.spack.io/package.html?name=py-gpaw)


### 24.1.0 for GPU and for CPU

-   The build procedure for the GPU version is based on the
    [(outdated) instructions on the GPAW Wiki](https://wiki.fysik.dtu.dk/gpaw/platforms/Cray/lumi.html).

-   OpenMP is now turned off while ELPA does not support it with AMD GPUs 
    (linking GPAW w/OMP against ELPA w/o OMP casuses LibSci version mismatch)

-   GPU device selection is patched compared to the upstream code version

-   It installs ASE as a Python module without an independent easyconfig for it

-   It also downloads gpaw-setups which comes as a separate easyconfig in the easybuilders repo


### 24.6.0 for GPU and for CPU

-   Setup is similar to that of 24.1.0
