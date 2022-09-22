# PyTorch instructions

-   [PyTorch web site](https://pytorch.org/)

-   [torch - PyTorch on PyPi](https://pypi.org/project/torch/)

-   [PyTorch on GitHub](https://github.com/pytorch/pytorch)

    - [GitHub releases](https://github.com/pytorch/pytorch/releases)


## EasyBuild

-   [PyTorch in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PyTorch)

-   [PyTorch in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/p/PyTorch)

### Version 1.12.1

-   The EasyConfig is a LUST development and based on wheels rather than compiling
    ourselves due to the difficulties of compiling PyTorch correctly. We do however
    use a version of the RCCL library installed through EasyBuild, with the 
    aws-ofi-rccl plugin which is needed to get good performance on LUMI.

-   A different version of NumPy was needed as in the Cray Python module that is 
    used. It is also installed from a wheel hence is not using the Cray Scientific
    Libraries for BLAS support.
