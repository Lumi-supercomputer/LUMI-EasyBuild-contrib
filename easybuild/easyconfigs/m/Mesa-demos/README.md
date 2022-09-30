# Mesa-demos instruction

-   [Mesa-demos on GitLab](https://gitlab.freedesktop.org/mesa/demos)
    
-   [Mesa-demos downloads](https://archive.mesa3d.org/demos/)
    
    
## EasyBuild

-   [Support for Mesa-demos in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/m/Mesa-demos)

-   There is no support for Mesa-demos in the CSCS repository.


### Version 8.5.0 for cpeGNU/22.08

-   The EasyConfig is inspired by the one for version 8.4.0 in the EasyBuilders
    repository as there was none available for 8.5.0 yet. However, the build system
    was switched to Meson and Ninja in this version.
    
-   Note that most commands will not run without a GLX-enabled X server. The server
    in the lumi-vnc module at the time of writing does NOT offer this facility.




