# HTSlib instructions

-   [HTSlib home page](http://www.htslib.org/)
-   [Development on GitHub](https://github.com/samtools/htslib)
    -   [HTSlib GitHub releases](https://github.com/samtools/htslib/releases)


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

    
### Version 1.15.1 for cpeGNU 22.06 and 22.08

-   Switched from zlib to libdeflate for zlib compression based on a recommendation on the SAMtools
    documentation page ["A comparison of zlib implementations"](http://www.htslib.org/benchmarks/zlib.html).
    
    The zlib module still comes in as a dependency through other libraries, but this does not seem to
    be a problem as the configure script indicates the APIs are different (looking 
    at the tests).
    
-   Checked the configure options, leading to a new `configopts` line. S3 and Google 
    Cloud Integration were not tested, so it is not clear if this fully works or not.

    
### Version 1.17 for cpeGNU 22.12

-   Trivial port of the EasyConfig for 1.15.1.

-   Some reworking for our system to update versions of dependencies.

-   Some reworking to also copy the LICENSE and README files to the system.


### Version 1.18 from 23.09 on

-   Trivial port of the 1.17 EasyConfig


### 1.19.1 for 24.03

-   Trivial port of the 1.18 EasyConfig for 23.09


### 1.22.1 for 25.03

-   Trivial port of the 1.19.1 EasyConfig for 24.03
