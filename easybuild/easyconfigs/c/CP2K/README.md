# CP2K instructions

-   [CP2K web site](https://www.cp2k.org/)

-   [CP2K on GitHub](https://github.com/cp2k/cp2k)

    -   [GitHub releases](https://github.com/cp2k/cp2k/releases)


## EasyBuild

-   [CP2K in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/c/CP2K)

-   [CP2K in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/c/CP2K)


### Brief descriptions of available EasyConfigs (up to 23.09)

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


### Version 2024.3 for 25.03

-   Dependency check in the code of CP2K:

    -   [stage 3](https://github.com/cp2k/cp2k/tree/v2024.3/tools/toolchain/scripts/stage3)
        
    		-   [Libint 2.6.0](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage3/install_libint.sh#L15).
    		    We've used Libint 2.7.2 (regular release) before so will stick to that one for now.
    		    The decision to switch to 2.7.2 in an earlier version of the EasyConfigs was likely taken
    		    because that was also used in the EasyBuilders repository for an already older version of 
    		    CP2K.

        -   It was tested with [libxc 6.2.2](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage3/install_libxc.sh#L9).
            Given that there were some breaking changes in 7.0.0, it is better to stick to 6.2.2
            for this version.
            
    -   [Stage 4](https://github.com/cp2k/cp2k/tree/v2024.3/tools/toolchain/scripts/stage4)

        -   [COSMA 2.6.6](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage4/install_cosma.sh#L9)
            is the preferred version. COSMA 2.7.0 was available when this EasyConfig 
            was developed, but we stock to the last 2.6 version to be on the safe side.
    
        -   [libxsmm 1.17](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage3/install_libxc.sh#L9)
            should be OK.
            
    -   [Stage 5](https://github.com/cp2k/cp2k/tree/v2024.3/tools/toolchain/scripts/stage5)
        
    		-   The version was tested by the developers with [ELPA 2024.03.001](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage5/install_elpa.sh#L10).
       		 	We've used 2024.05.001 before with users not reporting problems so stick to that one.
       		 	
    -   [Stage 6](https://github.com/cp2k/cp2k/tree/v2024.3/tools/toolchain/scripts/stage6)
    
        -   [GSL 2.7](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage6/install_gsl.sh#L9)
            but we stick to 2.8 as we did not get any reported issues before.
            
        -   Tested with [PLUMED 2.9.0](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage6/install_plumed.sh#L9)
            but we stick to the bugfix release 2.9.4.
        
    -   [Stage 7](https://github.com/cp2k/cp2k/tree/v2024.3/tools/toolchain/scripts/stage7)
    
        -   Tested with [libvori 220621](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage7/install_libvori.sh#L10).
        
        -   Tested with [spglib 2.3.1](https://github.com/cp2k/cp2k/blob/v2024.3/tools/toolchain/scripts/stage7/install_spglib.sh#L8).
            CP2K seems to be slow upgrading that one. We build with 2.6.0 but consider reverting to 
            2.3.1 is users report issues. the ChangeLog of spglib also does not mention anything too scary.
            
-   Otherwise a rather trivial port of the corresponding 2024.2 versions for LUMI/24.03.   
        
### Version 2025.2 for 25.03 GPU

-	DBCSR - a dependency that is shipped with CP2K - contains code that is not compatible with newer versions of rocm so this has been patched in CP2K-2025.2-rocm-dbcsr.patch to enable compilation of CP2K for GPU.

- A few updates to the PSMP-file concerning flags.

- Otherwise a trivial port of the corresponding 2024.2 version for LUMI/24.03
