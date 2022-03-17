# HTSlib instructions

-   [HTSlib home page](http://www.htslib.org/)
-   [Development on GitHub](https://github.com/samtools/htslib)


## General information

-   HTSlib is the underlying library of SAMtools
-   The build process creates three binaries, a shared and a static library.
-   HTSlib dependencies:
    -   zlib
    -   libbz2
    -   liblzma
    -   libcurl: Optional but recommended for network access.
    -   libcrypto: We always take this one from the OS to ensure that security patches
        are applied.

## EasyBuild

-  [Support for HTSlib in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/h/HTSlib)

-   There is no support for HTSlib in the CSCS repository.

### Version 1.14 for cpeGNU 21.12

-   We started from the EasyBuilders EasyConfig for the 2021b common
    toolchains but added documentation from UAntwerpen.
