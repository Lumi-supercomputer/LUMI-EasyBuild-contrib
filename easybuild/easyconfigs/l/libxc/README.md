# Libxc

-   [Libxc website](https://www.tddft.org/programs/libxc/)

    -   [Libxc downloads from the web site](https://www.tddft.org/programs/libxc/download/)

-   [Libxc on GitLab](https://gitlab.com/libxc/libxc)

    -   [GitLab releases](https://gitlab.com/libxc/libxc/-/releases)


## General information

Libxc is a library of exchange-correlation and kinetic energy functionals for 
density-functional theory. The original aim was to provide a portable, well 
tested and reliable set of LDA, GGA, and meta-GGA  functionals.

-   [Libxc documentation](https://www.tddft.org/programs/libxc/manual/)

-   [Available functionals](https://www.tddft.org/programs/libxc/functionals/)


## EasyBuild

-   [libxc in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/libxc)
    
-   [libxc in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/l/libxc)
    
-   [libxc in Spack](https://packages.spack.io/package.html?name=libxc)


### Version 5.2.2 for cpeGNU 22.08

-   Derived from the EasyConfigs used at CSCS.
    

### Version 6.1.0 for cpeGNU 22.08 and 22.12

-   Derived from the 5.2.2 one, but currently only generating shared libraries.
    

### Version 6.2.2 for cpeGNU 22.12 and 23.09

-   Derived from the 6.1.0 EasyConfig.


### Version 7.0.0 for cpeGNU 24.03

-   Derived from the 6.2.2 EasyConfig.

-   **NOTE**: Update on March 31, 2025: Disabled checksums as they seem unstable on 
    on the GitLab.
