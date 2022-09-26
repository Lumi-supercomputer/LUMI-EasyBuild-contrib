# GEOS instructions

-   [GEOS web site](https://libgeos.org/)

-   [GEOS on GitHub](https://github.com/libgeos/geos)

    -   [GitHub releases](https://github.com/libgeos/geos/releases)


## EasyBuild

-   [GEOS in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/GEOS)

-   [GEOS in the CSCS repoistory](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GEOS)


### Version 3.11.0 for cpeGNU 22.08

-   The EasyConfig is based on the EasyBuilders one.

-   The option was added to install libraries in lib instead of lib64 as most software 
    that we build with EasyBuild is currently installed in lib. This may make it easier
    to transform this EasyConfig into a bundle component where it is important that all
    components use the same directory.

