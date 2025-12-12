# pybind11 technical information

The pybind11 package came in the software stack as an indirect dependency of 
[VeloxChem](../../v/VeloxChem/).

-   [pybind11 on PiPy](https://pypi.org/project/pybind11/)

-   [pybind11 on GitHub](https://github.com/pybind/pybind11)

    -   [GitHub releases](https://github.com/pybind/pybind11/releases)


## General remarks

The `cpeAMD` version was built specifically to install VeloxChem which performs better with the 
AMD compilers.

In general, it is not a good idea to use another compiler than the GNU compiler with Python as that is
what Python itself is usually compiled with and what precompiled wheels are compiled with. Mixing compilers
can create compatibility issues.

Moreover, in most cases it is much better to install Python in a container using tools provided on LUMI,
as the small file problem impacts the performance of both Python for you as a user and the Lustre filesystem
for all users of LUMI.


## EasyBuild

-   [pybind11 in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/pybind11)


### Version 2.12.0 for cpeAMD in 24.03

-   The EasyConfig is a LUST development.
