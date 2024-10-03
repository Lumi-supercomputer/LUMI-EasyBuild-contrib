# STAR technical information

-   [STAR on GitHub](https://github.com/alexdobin/STAR)
    
    -   [STAR GitHub releases](https://github.com/alexdobin/STAR/releases)
    

## EasyBuild

-   [STAR support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/STAR)
    
-   There is no STAR support in the CSCS repository

-   [STAR support in Spack](https://packages.spack.io/package.html?name=star)


### Version 2.7.11b in 24.03

-   The EasyConfig is an adaptation of the EasyBuilders one, with some
    reorganisation to align with what we usually do on LUMI.
    
-   Played a bit with `toolchainopts` so that the options that are set 
    by EasyBuild correspond to those used in the Makefile already so to
    not lower the optimisation level normally used by the authors.
