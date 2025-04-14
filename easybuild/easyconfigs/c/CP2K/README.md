# CP2K instructions

-   [CP2K web site](https://www.cp2k.org/)

-   [CP2K on GitHub](https://github.com/cp2k/cp2k)

    -   [GitHub releases](https://github.com/cp2k/cp2k/releases)


## EasyBuild

-   [CP2K in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/c/CP2K)

-   [CP2K in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/c/CP2K)


### Brief descriptions of available EasyConfigs

-   `CP2K-9.1-cpeGNU-21.08.eb`: The EasyConfig file is a direct port of the CSCS one.
-   `CP2K-9.1-cpeGNU-21.12.eb`: Same as above, but compiled with Cray Programming Environment 21.12. 
    No signficiant performance difference observed. Links to a newer ELPA version (2021.11.001).
-   `CP2K-2022.1-cpeGNU-22.08.eb`: CP2K 2022.1 released compiled with Cray Programming Environment 22.08, 
    built with PLUMED 2.8.0, Libxc 5.2.2, and Libvori 220621.
-   `CP2K-2023.1-cpeGNU-22.08-GPU.eb`: CP2K 2023.1 release compiled with AMD GPU support enabled for CP2K 
    itself and several of the libraries (SpFFT, SpLA). Cray Programming Environment 22.08 used together with 
    the unsupported `rocm/5.3.3` module installed by the LUMI Support Team, as CP2K requires at ROCm 5.3.3.
-   `CP2K-2023.1-cpeGNU-22.12-CPU.eb`: A CPU-only build of CP2K release 2023.1 compiled with the GNU compilers
    and with support for PLUMED.
-   `CP2K-2023.2-cpeGNU-22.12-CPU.eb`: A CPU-only build of CP2K release 2023.2 compiled with the GNU compilers
    and with support for PLUMED.
-   `CP2K-2024.1-cpeGNU-23.09-GPU.eb`: CP2K 2024.1 release compiled with AMD GPU support enabled for CP2K 
    itself and several of the libraries (SpFFT, SpLA). Cray Programming Environment 23.09 used together with 
    the unsupported `rocm/5.6.1` module installed by the LUMI Support Team.

    
### Version 2024.2 with libcp2k

-   Build instructions in the CP2K manual

    It turns out that one needs to build this option after doing the regular build,
    and `make all libcp2k` to do it in a single step, cannot be done. Since a two-phase
    build is no option either as the second build starts clean, the solution is to play
    with buildopts and add the second make command as
    `&& make ARCH=LUMIC-20242 VERSION={local_buildtype} libcp2k`.
    
-   The `libcp2k.pc` file is completely broken. CP2K does not have a proper `make install`
    script but really assumes an in-place build. Hence all directories set in the .pc file
    are wrong and refer to the EasyBuild build directory. The `Libs:` field is completely 
    off and contains even compiler options and not just options for the linker.
    
    We've tried to fix this through edits of the `libcp2k.pc` file. However, if the list of
    dependencies changes, this bit of code in `postinstallcmds` will have to be checked again.

**TODO**: It likely does no harm to simply always include the `libcp2k` library rather than
having two EasyConfigs, one with and one without, so we may simply integrate the support for
future toolchains.
