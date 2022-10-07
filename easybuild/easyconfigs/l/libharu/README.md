# libharu instructions

The Haru Free PDF Library is a library for generating PDF files. It is not much used though.

-   [Haru web site](http://libharu.org/), but this site is not up-to-date with
    the GitHub.
    
-   [Haru GitHub](https://github.com/libharu/libharu/)
    
    -   [libharu releases](https://github.com/libharu/libharu/releases)
    

## EasyBuild

-   [libharu support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/libharu)
    
-   There is no support for libharu in the CSCS repository.
    
-   [Spack package for libharu](https://github.com/spack/spack/blob/develop/var/spack/repos/builtin/packages/libharu/package.py)
    

### Version 2.4.2 for cpeGNU/2.4.2

-   We started from the EasyConfig for version 2.3.0 for GCCcore 11.2.0 as that was
    the most recent one.
    
-   The zlib dependency was made explicit even though it does get pulled in through
    libpng. But this makes it quicker to compare with the Spack build recipe also.
    




