# VASP technical information

-   [VASP home page](https://www.vasp.at/)


## EasyBuild

-   [VASP support in EasyBuild](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/v/VASP).
    Given the licensing conditions of VASP, it is difficult to maintain in the regular EasyBuild repository.

-   [VASP support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/v/VASP)

The VASP EasyConfig files for LUMI are build upon those of the CSCS repository, with Makefiles 
specifically for LUMI.

### 6.4.1 

-   build01

    -   Some improvements to the Makefile, including stronger optimization and 
        different HDF5 library compared to the 6.3.2 version

-   build02

    -   Same improvements as for build01.
