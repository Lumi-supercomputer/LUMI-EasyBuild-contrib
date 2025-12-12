# Libxc

-   [Libxc website](https://libxc.gitlab.io/)

-   [Libxc on GitLab](https://gitlab.com/libxc/libxc)

    -   [GitLab releases](https://gitlab.com/libxc/libxc/-/releases)


## General information

Libxc is a library of exchange-correlation and kinetic energy functionals for 
density-functional theory. The original aim was to provide a portable, well 
tested and reliable set of LDA, GGA, and meta-GGA  functionals.

-   [Libxc documentation](https://libxc.gitlab.io/manual/)

-   [Available functionals](https://libxc.gitlab.io/functionals/)


## EasyBuild

-   [libxc in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/libxc)
    
-   [libxc in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/l/libxc)
    
-   [libxc in Spack](https://packages.spack.io/package.html?name=libxc)


### Version 5.2.2 for cpeGNU 22.08

-   Derived from the EasyConfigs used at CSCS.
    

### Version 6.1.0 for cpeGNU 22.08 and 22.12

-   Derived from the 5.2.2 one, but currently only generating shared libraries.
    

### Version 6.2.2 for cpeGNU 22.12 and 23.09 and later

-   Derived from the 6.1.0 EasyConfig.

-   6.2.2 is still the prefered version for all CP2K 2024.x versions so it was ported 
    to 25.03 as well.


### Version 7.0.0 for cpeGNU 24.03

-   Derived from the 6.2.2 EasyConfig.

-   **NOTE**: Update on March 31, 2025: Disabled checksums as they seem unstable on 
    on the GitLab.
    
-   For 25.03, revised this documentation as the tddft.org domain does no longer exist,
    made the names of the modules more logical and improved the documentation of the
    easyconfigs.
    
    The `-NoFHC` version is required for some VASP configurations.
