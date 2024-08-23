# Amber technical information

-   [Amber web site](https://ambermd.org/)


## General information

Amber 22 can support AMD GPUs, but it still requires a patch with additional files that
has to be downloaded separately.

Amber 24 has native support for AMD GPUs.

## EasyBuild

-   [Amber support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/a/Amber)

-   [Amber support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/a/Amber)


## Amber 22 for cpeGNU 22.08, CPU version

-   This corresponds to the EasyConfig
    `Amber-22.0-cpeGNU-22.08-AmberTools-22.3.eb`.

-   The EasyConfig took some inspiration from the EasyBuilder ones, but is mostly
    developed by the LUMI User Support Team, with some more GUI-oriented features disabled.

-   When installing using this EasyConfig, the user should provide the
    `Amber22.tar.bz2` and `AmberTools22.tar.bz2` files in a place where EasyBuild can find them
    (e.g., in the current directory if you add `-r .` to the EasyBuild command line, or you can
    look for the first directory in `$EASYBUILD_SOURCEPATH`, create the subdirectory
    `a/Amber` in that directory and put the source files in that `a/Amber` subdirectory).

    EasyBuild cannot download these files automatically as a registration is required.


## Amber 22 for cpeGNU 22.08 with GPU support

-   This corresponds to the EasyConfig
    `Amber-22.0-cpeGNU-22.08-AmberTools-22.3-GPU.eb`.

-   The EasyConfig builds upon the CPU one.

-   When installing using this EasyConfig, the user should provide the
    `Amber22.tar.bz2` , `AmberTools22.tar.bz2` and `amber_amd.23jun22.tar.bz2` files
    in a place where EasyBuild can find them
    (e.g., in the current directory if you add `-r .` to the EasyBuild command line, or you can
    look for the first directory in `$EASYBUILD_SOURCEPATH`, create the subdirectory
    `a/Amber` in that directory and put the source files in that `a/Amber` subdirectory).

    EasyBuild cannot download these files automatically as a registration is required.


## Amber 24 for cpeGNU 23.09 with GPU support

-   This corresponds to the EasyConfig
    `Amber-24.0-cpeGNU-23.09-AmberTools-24.0-GPU.eb`.

-   HIP version (from AMD GPUs) requires ROCm 6.0 which is not supported with 23.09 toolchains;
    The older ROCm release used (5.2.3) may cause unexpected issues.

-   When installing using this EasyConfig, the user should provide the
    `Amber22.tar.bz2` and `AmberTools22.tar.bz2`.
    in a place where EasyBuild can find them
    (e.g., in the current directory if you add `-r .` to the EasyBuild command line, or you can
    look for the first directory in `$EASYBUILD_SOURCEPATH`, create the subdirectory
    `a/Amber` in that directory and put the source files in that `a/Amber` subdirectory).

    EasyBuild cannot download these files automatically as a registration is required.
