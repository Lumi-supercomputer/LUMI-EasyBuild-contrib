# SPLA - Specialized Parallel Linear Algebra

SPLA is a dependency of CP2K.

-   [SPLA repository](https://github.com/eth-cscs/spla)


## General information

SPLA provides specialized functions for linear algebra computations with a C++
and C interface, which are inspired by requirements in computational material
science codes.

SPLA provides functions for distributed matrix multiplications with specific 
matrix distributions, which cannot be used directly with a ScaLAPACK interface.


## EasyBuild

-   [SPLA in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/s/SPLA)


### Version 1.5.1 for CPE 21.08

-   The EasyConfig is derived from the CSCS one


### Version 1.5.4 for CPE 22.08 with GPU support

-   The EasyConfig is based on the 1.5.1 one but with extensions to be
    able to support GPU also.


### Version 1.5.5 for CPE 23.09 with GPU support

-   The EasyConfig is a trivial port of the 1.5.4 one with GPU support.

