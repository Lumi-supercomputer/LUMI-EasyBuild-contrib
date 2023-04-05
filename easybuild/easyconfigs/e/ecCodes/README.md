# ecCodes

  * [ecCodes home page](https://confluence.ecmwf.int/display/ECC/ecCodes+Home)

      * [Downloads from the home page](https://confluence.ecmwf.int/display/ECC/Releases)


## EasyBuild

  * [ecCodes support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/e/ecCodes)

  * [ecCodes support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/e/ecCodes)

  * [ecCodes in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/eccodes),
    with additional dependencies compared to the EasyBuild builds as of September 2021.


### Version 2.23.0 in CPE 21.08

  * Started from the CSCS EasyConfig file but added JasPer as a dependency.

  * The Spack recipe seems to have options for various other packages also
    but the CMake process doesn't seem to look for those. We can't find a trace
    of those packages in the documentation, in``CMakeLists.txt`` or in the CMake
    cache after the configure step.

  * Switched to installing libraries in lib rather than lib64 for consistency with
    most other installs in the LUMI software stack.

    
### Version 2.25.0 for CPE 21.12

  * Trivial port from 2.23.0.


### Version 2.26.0 for CPE 22.06 and 22.08

  * Trivial port from 2.25.0
  
  * Checked for additional sanity check commands but it looks like showing help also
    returns an error code in almost all commands.
    
  * Build without Python support as that is for Python2. Python3 support supposedly
    comes via the eccodes PyPi package but was not tested.


### Version 2.30.0 for CPE 22.12 and 23.03

  * Trivial port from 2.26.0, with all remarks still valid.



TODO: ecCodes comes with samples. Can we figure out how to use them and build some quick
sanity checks with them?



