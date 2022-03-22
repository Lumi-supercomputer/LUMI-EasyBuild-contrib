# GROMACS

  * [GROMACS web site](http://www.gromacs.org/)

      * [Check versions via the manual](https://manual.gromacs.org/)


## GROMACS and PLUMED

[PLUMED](https://www.plumed.org/) is software that can be combined with GROMACS.
It works via a patch for the GROMACS installation that should be applied before
compiling GROMACS.

It is rather difficult to figure out which versions of PLUMED and GROMACS can be
combined. One option is to look at tags in the PLUMED GitHub and then check the
[contents of the patches subdirectory](https://github.com/plumed/plumed2/tree/master/patches).
Another way to find out which versions of GROMACS are supported is to load the
PLUMED module and then run ``plumed-patch -l`` to get a list of the included
engines.

| PLUMED  | 2019   | 2020   | 2021   | 2022   |
|:--------|:-------|:-------|:-------|:-------|
| 2.8.0   | 2019.6 | 2020.6 | 2021.4 |        |
| 2.7.4   | 2019.6 | 2020.6 | 2021.4 |        |
| 2.7.3   | 2019.6 | 2020.6 | 2021.4 |        |
| 2.7.2   | 2019.6 | 2020.6 | 2021   |        |
| 2.7.1   | 2019.6 | 2020.5 | 2021   |        |
| 2.7.0   | 2019.6 | 2020.4 |        |        |
| 2.6.4   | 2019.6 | 2020.4 |        |        |
| 2.6.3   | 2019.6 | 2020.4 |        |        |
| 2.6.2   | 2019.6 | 2020.4 |        |        |
| 2.6.1   | 2019.6 | 2020.2 |        |        |
| 2.6.0   | 2019.4 |        |        |        |


## EasyBuild

  * [GROMACS support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/g/GROMACS)

  * [GROMACS support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GROMACS)

  * [GROMACS support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/gromacs)


### Version 2020.6 for CPE 21.08

  * The EasyConfig is a straightforward port of the CSCS one with some information
    added borrowed from the UAntwerpen EasyConfig.

  * We added a bash function, ``gromacs-completion``, that can be used to turn the
    command completion for GROMACS on.

  * Note that the EasyConfig does not run the GROMACS tests, presumably because they
    require an mpirun script and/or should be run in the context of a suitable compute
    job.

  * The AMD-version does not support cray-hugepages. Activating this causes the Cray
    wrapper to add an option to the linker that it does not like.


### Version 2021.3 for CPE 21.08

  * We started from our own EasyConfig for 2020.6 but had to omit ``GMX_PREFER_STATIC_LIBS``
    and add ``BUILD_SHARED_LIBS=ON`` to the CMake options to avoid an error message about
    building GMXAPI.

  * Note that the EasyConfig does not run the GROMACS tests, presumably because they
    require an mpirun script and/or should be run in the context of a suitable compute
    job.

  * The AMD-version does not support cray-hugepages. Activating this causes the Cray
    wrapper to add an option to the linker that it does not like.


### Version 2020.4 with PLUMED 2.6.4 for CPE 21.08

  * The integration of the PLUMED patch is based on the CSCS EasyConfigs. We still
    compile single and double precision versions as the CSCS version does this.

    Old documents claim that one should only run GROMACS in double precision when
    using PLUMED, but then I found comments on PLUMED 2.x that claim that that one
    always runs in double precision, also when used with a single precision GROMACS,
    to avoid numerical problems that can occur in single precision in some of the
    PLUMED routines.
