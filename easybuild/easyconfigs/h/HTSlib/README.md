# HTSlib instructions

-   [HTSlib home page](http://www.htslib.org/)
-   [Development on GitHub](https://github.com/samtools/htslib)


## General information

-   HTSlib is the underlying library of SAMtools
-   The build process creates three binaries, a shared and a static library.
-   HTSlib dependencies:
    -   zlib
    -   libdeflate can substitute for zlib for zlib compression
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

### Version 1.15.1 for cpeGNU 21.12

-   Trivial version bump, but we now also unload a few modules that are
    not needed for compilation, just in case that would solve some problems
    detected on LUMI.

    
### Version 1.15.1 for cpeGNU 22.06

-   Switched from zlib to libdeflate for zlib compression based on a recommendation on the SAMtools
    documentation page ["A comparison of zlib implementations"](http://www.htslib.org/benchmarks/zlib.html).
    
    The zlib module still comes in as a dependency through other libraries, but this does not seem to
    be a problem as the configure script indicates the APIs are different (looking 
    at the tests).
    
-   Checked the configure options, leading to a new `configopts` line. S3 and Google 
    Cloud Integration were not tested, so it is not clear if this fully works or not.

    