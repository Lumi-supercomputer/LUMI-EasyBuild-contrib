# json-c

-   [json-c development on GitHub](https://github.com/json-c/json-c)

-   [Downloads from Amazon](https://s3.amazonaws.com/json-c_releases/releases/index.html)


## EasyBuild

-   [json-c support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/j/json-c)

-   No support for json-c in the CSCS repository


### Version 0.15 for CPE 21.08

-   The EasyConfig is derived from the EasyBuilders one with a change of
    the download location to avoid having to use the suffix used in the
    GitHub downloads.

-   Install libraries in lib instead of lib64 for consistency with the
    majority of packages installed on the system.

    
### Version 0.16 for CPE 21.12, 22.06, 22.08, 22.12, 23.03
    
-   Trivial version bump.

-   Added a simple sanity check testing if pkg-config can find the package.
  
-   For Clang 15 and later the error messages about strict prototypes need to
    be turned off as the code is not compliant with C standards when it comes
    to the use of prototypes.


### Version 0.17 for CPE 24.03

-   A rather straightforward port of 0.16 for CPE 23.03, but switching to a different
    source repository and also adding license information in the installation.
    

### Version 0.18 with the SYSTEM compiler

-   Version derived from the 0.17 EasyConfigs for CPE 24.03, but now using the SYSTEM
    toolchain specifically for use with a special version of libfabric used by Open MPI 5.    
    
