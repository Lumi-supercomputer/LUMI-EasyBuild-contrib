# Amber technical information

-   [Amber web site](https://ambermd.org/)


## General information

Amber 22 can support AMD GPUs, but it still requires a patch with additional files that
has to be downloaded separately.


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
    n a place where EasyBuild can find them
    (e.g., in the current directory if you add `-r .` to the EasyBuild command line, or you can
    look for the first directory in `$EASYBUILD_SOURCEPATH`, create the subdirectory
    `a/Amber` in that directory and put the source files in that `a/Amber` subdirectory).

    EasyBuild cannot download these files automatically as a registration is required.



