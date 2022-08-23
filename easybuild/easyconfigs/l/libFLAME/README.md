# libFLAME instructions

  * [libFLAME development and home page on GitHub](https://github.com/flame/libflame/)

  * [AMD's fork of libFLAME home page](https://developer.amd.com/amd-aocl/blas-library/#libflame)

  * [AMD's GitHub with the libFLAME fork](https://github.com/amd/libflame)


## EasyBuild

  * [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/libFLAME)

  * No support in the CSCS repository.


### Version 3.1 for CPE 21.08

  * Build from the AMD branch of libFLAME but starting from the EasyBuilders
    EasyConfig.


### Version 3.2 for CPE 22.06 and 22.08

  * Almost straightforwared port of the 3.1 one but with a different
    edit of the configure script that might be more robust across
    versions.

  * Added `--enable-amd-flags` which is said to give better performance
    on AMD CPUs. Note that `--enable-amd-aocc-flags` is needed instead with
    the AOCC compiler. And then also added `--enable-amd-opt` which should
    take an AMD-specific code path.
    
  * Fixed the setup for the Cray compilers.
  
  * Added a cpeAOCC variant in 22.08.
  
