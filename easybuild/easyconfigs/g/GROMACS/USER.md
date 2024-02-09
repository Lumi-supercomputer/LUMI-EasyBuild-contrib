# GROMACS user instructions

## A note about the GPU versions.

There exist two different versions of GROMACS for AMD GPUs.

-   The authors of GROMACS use SYCL for an implementation for AMD GPUs. These versions
    are or will be part of the official GROMACS distribution channels.
-   AMD has made a hip port of the CUDA version. It is not clear though to what extent
    that branch will see further development as GROMACS evolves. GROMACS developers
    don't provide support on using this version.

According to tests in June 2023, the HIP port offered 15-25% more performance compared
to SYCL port, but the GROMACS release has been more tested and is supported by the
development team.

Check the technical documentation of the EasyConfigs to find out on which branch of GROMACS
the recipes are based. That documentation is more towards the bottom of the page.

Alternatively, you can load one of the [CSC compiled versions](https://docs.csc.fi/apps/gromacs/#lumi)
which are available as modules. Batch script templates for different use cases are also provided.
Expect the performance from one GCD to exceed that of a 128 core CPU node.
Please, consult the
[instructions on how to enable CSC installed module on LUMI](https://docs.lumi-supercomputer.eu/software/local/csc/).
The CSC-compiled versions are supported by CSC rather than by the LUMI User Support 
Team.


## A note about the CPU versions with PLUMED after the March/April 2023 system maintenance/update

After the March/April 2023 system update building PLUMED broke so those easyconfigs
were replaced with two versions, one without Python support and one with a different way
of enabling support for the `cray-python` modules. Therefore the corresponding 
EasyConfigs of GROMACS have also been replaced.

It is done this way because it is also unclear if the Python support is needed when
used with GROMACS. 

See also the [page on PLUMED](../../p/PLUMED/).


## Training materials

-   [Workshop: How to run GROMACS efficiently on LUMI (January 24-25, 2024, BioExcel/CSC Finland/KTH Sweden)](https://zenodo.org/records/10610643)

