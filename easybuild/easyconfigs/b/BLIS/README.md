# BLIS instructions

  * [BLIS development and home page on GitHub](https://github.com/flame/blis)

  * [AMD's fork of BLIS home page](https://developer.amd.com/amd-aocl/blas-library/)

  * [AMD's GitHub with the BLIS fork](https://github.com/amd/blis/)


## EasyBuild

  * [BLIS support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/b/BLIS)

  * There is no support for BLIS in the CSCS repository.


### Version 3.1 for CPE 21.08

  * The EasyConfig file is a direct port from the EasyBuilders one

  * Some logic was added to select zen3 depending on the partition loaded to
    support cross-compiling.

### Version 3.2 for CPE 22.06 and 22.08

  * Trivial port of the EasyConfig file for 3.1.

