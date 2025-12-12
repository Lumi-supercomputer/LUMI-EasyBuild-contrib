# Cython instructions

These EasyConfigs are meant to be used when the version of Cython in 
`cray-python` is too old.

- [Cython documentation](https://cython.org/)

- [Cython on GitHub](https://github.com/cython/cython)


## EasyBuild

- [Cython support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/c/Cython)


### Cython 3.0.10 for cpeGNU 24.03

- EasyConfig file from the EasyBuilders repository adapted to LUMI.

- This recipe allows using Cython 3.0 in contrast to Cython 0.29 in cray-python/3.11.7.


### Cython 3.1.2 for cpeGNU 25.03

-   Cray Python comes with Cython but the version is too old for some packages.

-   Mostly a port of the 3.0.10 EasyConfig for 24.03.
