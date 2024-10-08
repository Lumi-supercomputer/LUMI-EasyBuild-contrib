# GPAW technical instructions

-   [GPAW documentation](https://gpaw.readthedocs.io/)

-   [GPAW on GitLab](https://gitlab.com/gpaw/gpaw)


## EasyBuild

-   [GPAW support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/GPAW)

-   [(Outdated) GPAW support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GPAW)

-   [GPAW support in Spack](https://packages.spack.io/package.html?name=py-gpaw)


### 24.6.0 for CPU

-   The build procedure is based on
    [the GPAW documentation](https://gpaw.readthedocs.io/platforms/Cray/lumi.html).

-   ASE is installed within the GPAW module (without an independent easyconfig for it).

-   The gpaw-setups are downloaded within GPAW module (comes as a separate easyconfig in the easybuilders repo).


### 24.6.0 for GPU

-   Note! This GPU version does not pass all the tests.
    Consider testing developer installation described in
    [the GPAW documentation](https://gpaw.readthedocs.io/platforms/Cray/lumi.html).

-   The GPU version is under continuous development
    and [has some limitations](https://gpaw.readthedocs.io/documentation/gpu.html).

-   OpenMP is now turned off while ELPA does not support it with AMD GPUs
    (linking GPAW w/OMP against ELPA w/o OMP causes LibSci version mismatch).

-   GPU device selection is patched compared to the upstream code version.

