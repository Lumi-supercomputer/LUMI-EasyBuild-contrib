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


### 6.4.2

-   build01

    - Plain build with high optimization, but no source code modifications.

-   build02

    - A few patches to the source code to improve the disk I/O on LUMI which led to slow startup times. This is the recommended version.


### 6.4.3

-   build02 is a trivial port of build02 for VASP 6.4.2.


### 6.5.0

-   build01

    - Plain build with high optimization, but no source code modifications.

-   build02

    - A few patches to the source code to improve slow VASP startup times by improving the disk I/O on LUMI. This is the recommended version.

    
### 6.5.1 for LUMI/24.03

-   build02: Contributed by a user and a trivial port of the 6.5.0 EasyConfig.

### 6.5.1 for LUMI/25.03

- build01

  - Plain build with high optimization, but no source code modifications.

- build02

    - A few patches to the source code to improve slow VASP startup times by improving the disk I/O on LUMI. This is the recommended version.

