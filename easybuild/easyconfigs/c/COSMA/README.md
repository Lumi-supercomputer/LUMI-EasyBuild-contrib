# COSMA technical documentation

-   [COSMA on GitHub](https://github.com/eth-cscs/COSMA)
    
    -   [GitHub releases](https://github.com/eth-cscs/COSMA/releases)
    
  
## EasyBuild

-   There is no support for COSMA in the EasyBuilders repository

-   There is no support for COSMA in the CSCS repository

-   [cosma support in Spack](https://spack.readthedocs.io/en/latest/package_list.html#cosma)


### Version 2.6.2 for cpeGNU in 22.08 and 22.12 with GPU support

-   The EasyConfig is a LUST development.


### Version 2.6.6 with CPU or GPU support for cpeGNU in 23.09, 23.12, 24.03 and 25.03

-   Trivial port of the 2.6.2 EasyConfig with CPU or GPU support.

-   Still supported in 25.03 as we use it for CP2K 2024.3 to not force users
    brutally on a 2025 CP2K version.
    
    Cleaned up a bit for 25.03 and added license information.


### Version 2.7.0 with CPU only or GPU support for 25.03

-   Port of the EasyConfigs for 2.6.6. for 25.03.

-   Checked why sources are cloned from GitHub: The tar file misses some piece of code
    included recursively in the GitHub repository, and cloning the whole thing from GitHub
    is simply easier then assembling the unpacked sources from different source files.
    