# ESMF technical information

  * [ESMF on SourceForge](https://sourceforge.net/projects/esmf/)

  * [ESMF on GitHub](https://github.com/esmf-org/esmf)

      * [GitHub releases](https://github.com/esmf-org/esmf/releases)


## General build instructions

ESMF does not use a configure script. The configure phase can be skipped (though this is not
done in the EasyConfig as the configure phase will still be used to set environment variables
through an EasyBlock).

Configuration is done through a large set of environment variables that are picked up by the
Makefile of the ESMF code. It does call CMake for 3rd party codes that are provided internally,
e.g., the PIO IO library. 

The combination of OS and compiler selected through `ESMF_` environment variables (though the
code does a good job at detecting the OS environment) determines which configuration subdirectory
of `build_config` will be used. That subdirectory contains a long file with definitions that will
be included in the Makefile and tries to set defaults, and some system-specific small include
files.

The `make info` command will show how the Makefile interprets those environment variables.
It is also called when doing a build, so if a ConfigureMake process would be used rather
than the custom EasyBlock, setting environment variables through `prebuildopts` and 
`preinstallopts`, one could skip the configure step alltogether.


## EasyBuild

  * [ESMF support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/e/ESMF)

  * [ESMF support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/e/ESMF)

Note that ESMF uses a custom EasyBlock which needs adaptations for Cray systems.


## EasyBuild

### Version 8.8.0 for cpeGNU 24.03 with MPI and PIO

-   This EasyConfig is a straightforward port of the EasyConfig for
    8.6.0 in the stack of pre-installed software with these options, 
    also using the updated EasyBlock.


### Version 8.6.0 for LUMI/24.03

  * ESMF was originally in the pre-installed software stack but was moved to contrib
    with 25.03 as we started to need too many variants and intermediate upgrades.
    
    The original EasyConfig was derived from the CSCS one
  
  * Added buildtools starting with 8.6.0.
  
  * It seems that on the GPU nodes, some code is compiled that is otherwise not compiled
    (as it caused a problem) so there may be some support for GPU acceleration.
    
  * The cpeCray version does not compile on LUMI-G when the accelerator target module
    is loaded, so that module is unloaded when compiling for `partition/G`.

  * The MPI version required a heavily reworked EasyBlock that can still
    compile the older versions. So for 8.6.0 in 24.03 we needed significant changes
    that we continue to use here:

      * PIO required a more extensive configuration of netCDF then the default 
        EasyBlock (from which our custom block was derived) can give. We decided
        to update the EasyBlock when developing 8.6.0 for 24.03  as it had no 
        consequences for building the other 24.03 configurations.
      
      * Note that the OS should be Unicos rather than Linux to enable the automatic 
        configuration of the compilers. The autodetect does this right, but be careful
        not to overwrite.
        
      * Somehow the behaviour for ESMF_OPTLEVEL changed with the updated EasyBlock, 
        but it is not clear why. We solved this by adding a parameter to set the optimisation
        level (and set it to 2 which is what the code did automatically before).
        
      * Also changed the easyblock to honour `preconfigopts`. `prebuildops` was honoured,
        but `preconfigopts` not and that lead to misleading information from `make info`
        which is what happens during the configure phase.

    