# libFLAME instructions

-   [libFLAME development and home page on GitHub](https://github.com/flame/libflame/)

-   [AMD's fork of libFLAME home page](https://developer.amd.com/amd-aocl/blas-library/#libflame)

-   [AMD's GitHub with the libFLAME fork](https://github.com/amd/libflame)


## Notes

-   The regular versions use 32-bit integers in the Lapack interfaces but we also created
    versions with a 64-bit interface.


## EasyBuild

-   [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/libFLAME)

-   No support in the CSCS repository.


### Version 3.1 for CPE 21.08 (archived)

-   Build from the AMD branch of libFLAME but starting from the EasyBuilders
    EasyConfig.


### Version 3.2 for CPE 22.06 and 22.08 (archived)

-   Almost straightforwared port of the 3.1 one but with a different
    edit of the configure script that might be more robust across
    versions.

-   Added `--enable-amd-flags` which is said to give better performance
    on AMD CPUs. Note that `--enable-amd-aocc-flags` is needed instead with
    the AOCC compiler. And then also added `--enable-amd-opt` which should
    take an AMD-specific code path.
    
-   Fixed the setup for the Cray compilers.
  
-   Added a cpeAOCC variant in 22.08.
  

### Version 4.0 for CPE 22.12 (archived) and 23.03

-   EasyConfig started as a port but needed some work:
  
    -   `-march` in configure is now `-mtune` so needed to adapt that line
      
    -   Need to patch a python script that has the Python-interpreter hard-coded as 
        `python` instead of `python3`. We do so with another `sed` in `preconfigopts`
        as the edit is so simple a ptach isn't really needed.'
  
  
### Version 4.2 for CPE 23.12 and 24.03

-   Trivial port of the EasyConfig file for 4.2
  
  
### Version 5.1 for CPE 25.03

-   Trivial port of the EasyConfig for 4.2 in 24.03, but we did change the name of 
    the downloaded files.
    
-   There are currently no ILP64 versions as the compiler rightfully complains about
    incompatible pointer types and produces other warnings also. This will require some
    code fixing to compile properly and work reliably afterwards.
