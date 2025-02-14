# VASP technical information

-   [VASP home page](https://www.vasp.at/)


## EasyBuild

-   [VASP support in EasyBuild](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/v/VASP).
    Given the licensing conditions of VASP, it is difficult to maintain in the regular EasyBuild repository.

-   [VASP support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/v/VASP)

The VASP EasyConfig files for LUMI are build upon those of the CSCS repository, with Makefiles 
specifically for LUMI.

### 6.5.0

-   build01

    - Plain build with high optimization, but no source code modifications.

-   build02

    - A few patches to the source code to improve slow VASP startup times by improving the disk I/O on LUMI. This is the recommended version.

