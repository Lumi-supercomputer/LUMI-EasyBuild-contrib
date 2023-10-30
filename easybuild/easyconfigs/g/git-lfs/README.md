# git-lfs instructions

-   [git-lfs GitHub](https://git-lfs.github.com/)
    
-   [git-lfs project on GitHub](https://git-lfs.github.com/)


## EasyBuild

-   [git-lfs support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/git-lfs). 
    The EasyBuilders install from sources, but then Go is needed.
    
-   [git-lfs support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/git-lfs).
    CSCS installs generic downloaded binaries.
    
    
### Version 3.3.0 (for the whole system)

-   The EasyConfig is a direct rework of the CSCS EasyConfigs,
    with a version bump. We decided for an installation from 
    binaries to avoid having to install Go which is also not a good
    fit in our current software stacks.


### Version 3.4.0

-   The EasyConfig is a straightforward port of our EasyConfig for 3.3.0,
    so with an installation from binaries to avoid having to install Go.

    This version already supports some features of git 2.41.
