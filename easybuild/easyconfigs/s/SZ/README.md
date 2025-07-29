# SZ

-   [SZ web site](https://szcompressor.org)

-   [SZ on Github](https://github.com/szcompressor/SZ)

    -   [GitHub releases](https://github.com/szcompressor/SZ/releases)


## EasyBuild

-   No SZ support in the EasyBuilders repository

-   No SZ support in the CSCS repository

-   [SZ support in the JSC repository](https://github.com/easybuilders/JSC/tree/2022/Golden_Repo/s/SZ)


### Version 2.1.12 for CPE 22.08 and CPE 22.12

-   Based on the JSC easyconfig

-   Unload the cray-libsci module to prevent linking to the threaded version of
    libsci which is not needed. It avoid the double linking problem with 
    application that actually need libsci


### Trying 2.1.12.5 for CPE 23.09

-   Did not work: the bin/sz binary was not built, so reverted to plain 2.1.12.


### 2.1.12.5 for CPE 24.03

-   Still without `bin/sz`, but this executable does not exist anymore?

-   Added license information in May 2025.

-   May 2025: Version added with `cray-hdf5-parallel` which was somewhat nontrivial.

-   September 2025: The SZ repositories have been restructured with the release of 
    SZ version 3. `github.com/szcompressor/SZ` is now empty repo. 
    The source is now at `github.com/szcompressor/SZ2`

-   Changed the name of the one using `cray-hdf5` for the 25.03 stack so that the 
    difference between the two variants becomes clearer just from the name.

