# TAU technical information

-   [TAU web page](https://www.cs.uoregon.edu/research/tau/home.php)

    -   [Download page](https://www.cs.uoregon.edu/research/tau/downloads.php): The latest 
        version requires filling in a form, so not clear if we can do an automatic download.

    -   [Documentation](https://www.cs.uoregon.edu/research/tau/docs.php)

-   On LUMI, there is commercial support via [ParaTools, Inc.](https://www.paratools.com/)


## Installation

The problem with TAU is that to cover all use cases, one needs multiple installations.
In particular, one can configure with the maximum number of external packages, as those are
only selected by the user when using TAU. However, one needs to be careful with compiler
and MPI library options. Each different set of compiler and MPI libraries requires a 
different setup of TAU. For LUMI this really only means that currently TAU needs to be 
built for each compiler in each LUMI stack, as there is only one supported MPI configuration
in each toolchain.


## EasyBuild

-   [There is no support for TAU in the EasyBuilders repository](https://docs.easybuild.io/version-specific/supported-software/#t)

-   [There is no support for TAU in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/t)

-   [Support for tau in Spack](https://packages.spack.io/package.html?name=tau)

The Spack package suggests a lot of dependencies, but many are software that 
comes with the GPU software stack or other system software.


### Version 2.35

-   The EasyConfig is a LUST development.


