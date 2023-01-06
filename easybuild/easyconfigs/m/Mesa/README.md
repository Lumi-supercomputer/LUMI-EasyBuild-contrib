# Mesa instructions

-   [Mesa web site](https://www.mesa3d.org/)
    
    -   [Mesa documentation](https://docs.mesa3d.org/)
    
-   [Mesa GitLab](https://gitlab.freedesktop.org/mesa)
    

## EasyBuild

-   [Mesa support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/m/Mesa)
   
    Mesa is installed through a [custonm EasyBlock](https://github.com/easybuilders/easybuild-easyblocks/blob/develop/easybuild/easyblocks/m/mesa.py).
   
-   [Mesa support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/m/Mesa)


### Version 22.0.3 for cpeGNU/22.08

-   The EasyConfig is a direct port of the EasyBuilders one for the GCCcore toolchain,
    replacing:
    
    -   Some dependencies that are in buildtools. Note that since it includes Meson, 
        a different variant of buildtools will be needed as we are moving out some
        Pythhon stuff that causes problems with other packages.
        
    -   libdrm as we have it in the X11 module.
    

### Version 22.2.1 for CPE 22.08

-   Based on the EasyBuilders easyconfig.
  
