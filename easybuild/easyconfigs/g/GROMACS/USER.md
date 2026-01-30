# GROMACS user instructions

!!! Bug "Severe issues with GROMACS after the January 2026 system update"
    Hugepages support on LUMI is broken after the January 2026 system update.
    EasyBuild recipes for 24.03 have been adapted to no longer load the 
    `cray-hugepages8M` module when compiling. Users should not load the
    `cray-hugepages` modules anymore when running GROMACS as one can expect
    random crashes. It looks like even memory corruption that creates
    wrong results could happen.


## A note about the GPU versions.

There exist two different versions of GROMACS for AMD GPUs.

-   The authors of GROMACS use SYCL for an implementation for AMD GPUs. These versions
    are currently part of the official GROMACS distribution channels. Since the initial
    release, performance did improve a lot.

-   AMD initially made a HIP port of the CUDA version. The GROMACS developers plan to
    offer an evolution of this port (still co-developed with AMD), likely starting
    from 2026.0, as an official version of GROMACS.

Whereas older testing from 2023 showed a performance benefit for the HIP port of
sometimes 15-25% compared to then current versions of the SYCL port, that performance gap 
has now been largely closed. Despite this, we will likely offer the HIP version as an alternative
again once it becomes an official part of the GROMACS distribution so that users can compare what
works best for their case. Currently, this also implies that it is important to try to switch
to the most recent versions of GROMACS for GPU, i.e., the 2025 EasyConfigs that we offer, rather 
than sticking to older versions.

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

It is done this way because it is also unclear if the Python support is needed when PLUMED is
used with GROMACS. 

As GROMACS 2025 should contain all necessary parts of PLUMED that are needed when running GROMACS,
we do not offer modules with the full PLUMED integrated anymore.

See also the [page on PLUMED](../../p/PLUMED/).


## Training materials

-   [Workshop: How to run GROMACS efficiently on LUMI (January 24-25, 2024, BioExcel/CSC Finland/KTH Sweden)](https://zenodo.org/records/10610643)

