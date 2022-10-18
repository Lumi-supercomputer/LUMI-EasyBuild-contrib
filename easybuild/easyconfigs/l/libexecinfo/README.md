# libexecinfo inbstructions

This is an optional dependency for PDAL.

-   [libexecinfo GitHub 1](https://github.com/resslinux/libexecinfo)
    Is this the original one? Probably not as it is not owned by the
    writer of the software or FreeBSD..
    
-   [libexec fork that tries to add CMake support](https://github.com/leleliu008/libexecinfo)
    
-   [libexec fork with better Makefile, Meson and pkg-config file](https://github.com/alfredfo/libexecinfo)
    
-   [libexecinfo fork with better Makefile](https://github.com/mikroskeem/libexecinfo)

    -   [Releases via tags](https://github.com/mikroskeem/libexecinfo/tags)
    
    
## EasyBuild

-   There is no support for libexecinfo in the EasyBuilders repository.

-   There is no support for libexecinfo in the CSCS repository.

-   No package found in the Spack repository.


### Version 1.1-3 for cpeGNU/22.08

-   For now we follow [https://github.com/mikroskeem/libexecinfo](https://github.com/mikroskeem/libexecinfo).

-   The EasyConfig is a LUST development

-   One optional dependency is not yet included: absl, which is likely theAbseil Python 
    Common Libraries.
    
    