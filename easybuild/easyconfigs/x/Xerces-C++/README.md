# Xerces-C++ technical information

-   [Xerces-C++ home page](https://xerces.apache.org/xerces-c/)

    -   [Release info](https://xerces.apache.org/xerces-c/releases.html)


## EasyBuild

-   [Support for Xerces-C++ in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/x/Xerces-C%2B%2B)

-   [Support for Xerces-C++ in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/x/xerces-c)

-   [Support for Xerces-C++ in Spack: package xerces-c](https://packages.spack.io/package.html?name=xerces-c)


### Version 3.2.5 for 23.09

-   The EasyConfig is derived from the one in the EasyBuilders repository.

-   Checked to also run some commands to test if they load OK, but as the
    commands don't have a flag to request the version and as `-h`
    also returns an error code, there is no easy way to check them.
