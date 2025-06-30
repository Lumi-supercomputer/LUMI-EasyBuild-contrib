# CuPy instructions

CuPy is a NumPy/SciPy-compatible array library for GPU-accelerated computing with Python. CuPy acts as a drop-in replacement to run existing NumPy/SciPy code on NVIDIA CUDA or AMD ROCm platforms.

-   [CuPy web site](https://cupy.dev)

-   [CuPy on PyPi](https://pypi.org/project/cupy/)

-   [CuPy on gitHub](https://github.com/cupy/cupy/)


## EasyBuild

-   [CuPy support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/c/CuPy)

-   There is no support for CuPy in the CSCS repository.


### Version 11.0.0 for cpeGNU 22.08 (archived)

-   The EasyConfig is an internal development of LUST.


### Version 12.2.0 and 13.2.0 for CPE 24.03

-   Need a patch in order to support ROCm 6.0

-   Version with ROCm 6.2.2 as that solves some FFT issues that affect [GPAW](../../g/GPAW/index.md).


### Version 13.4.1 for CPE 24.03

-   Supports ROCm 6.
-   Requires Cython 3 (not available in cray-python).

