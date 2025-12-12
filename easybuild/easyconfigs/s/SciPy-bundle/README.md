# SciPy-bundle technical information

SciPy-bundle is modeled after the 
[SciPy-bundle in the EasyBuilders packages](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/SciPy-bundle).
The module combines NumPy and SciPy and some dependencies.

The `cpeAMD` version is developed specifically for [VeloxChem](../../v/VeloxChem/) as that package
performs a lot better when compiled with the AMD compilers than when using the GNU compilers.
It is meant to replace the NumPy and SciPy packages from the Cray Python distribution with 
AMD-compiled ones as it is not possible to combine packages that use the OpenMP runtime
from different compilers. Note that in general, compiling with the GNU compilers is preferred
as that is also the compiler that is usually used to compile Python.

This module should be used with the greatest care because of this, and also because it is usually
a better idea to put Python packages in a container as the continuous loading of packages by Python
hurts both Python performance and filesystem performance for other users.

## EasyBuild

### Version 1.14.1-1.26.4 for cpeAMD 24.03

-   Developed by LUST based on the EasyBuilders version.

-   This version combines SciPy 1.14 with NumPy 1.26.4.

    These version were taken specifically for the compatibility with the VeloxChem package that
    uses them.
