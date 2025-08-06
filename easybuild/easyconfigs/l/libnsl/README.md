# libnsl technical information

The libnsl package contains the public client interface for NIS(YP).

It turns out to be a dependency for libdap, even though that was not noted by
the EasyBuilders at the time we have added this package.

-   [libnsl on GitHub](https://github.com/thkukuk/libnsl)

    -   [GitHub releases](https://github.com/thkukuk/libnsl/releases)
    

## EasyBuild

-   [Support for libnsl in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/libnsl)

-   There is no support for libnsl in the CSCS repository.
    
-   [Spack package libnsl](https://packages.spack.io/package.html?name=libnsl)
    

### Version 2.0.1 for CPE 25.03

-   The EasyConfig is derived from the EasyBuilders one for GCCcore 13.3.0,
    but adapted to the LUST way of working and also with more extensive
    sanity checks.
