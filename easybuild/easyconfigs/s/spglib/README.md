# spglib

-   [spglib wesite](https://spglib.github.io/spglib/)
  
-   [spglib on GitHub](https://github.com/spglib/spglib)
  
   -    [Releases via tags](https://github.com/spglib/spglib/tags)
     

## General information

Spglib is a library for finding and handling crystal symmetries written in C.
There are the python, fortran, rust, and ruby interfaces.


## EasyBuild

-   [Spglib in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/spglib)

-   [Spglib in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/s/spglib)


### Version 1.16.0 for CPE 21.08

-   The EasyConfig is derived from the CSCS one


### Version 1.16.3 for CPE 22.08 and 22.12

-   Trivial port of a previous EasyConfig


### Version 2.3.1 for 23.09

-   Trivial port of the EasyConfig for 1.16.3.


### Version 2.5.0 for 24.03

-   Port of the EasyConfig for 2.3.1 for 23.09, but took care to ensure that 
    Cray PE modules that are not needed, are also unloaded.

    
### Version 2.6.0 for 25.03

-   Almost trivial port, but took care to add license information to the installation.

