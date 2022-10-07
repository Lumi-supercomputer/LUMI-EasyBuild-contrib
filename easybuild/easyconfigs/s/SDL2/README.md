# SDL2 instructions

Simple DirectMedia Layer is a cross-platform development library designed to 
provide low level access to audio, keyboard, mouse, joystick, and graphics 
hardware via OpenGL and Direct3D.

-   [SDL2 home page](https://www.libsdl.org/)
    
    
## EasyBuild

-   [SDL2 support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/SDL2)

-   There is no SDL2 support in the CSCS repository.

-   [SDL2 (sdl2) support in Spack](https://spack.readthedocs.io/en/latest/package_list.html#sdl2)


### Version 2.0.22 for cpeGNU/22.08

-   The EasyConfig is a direct port of the EasyBuilders one.
    
-   This may be a problematic tool on the compute nodes of LUMI as it detects DBUS
    which does not work on the compute nodes.
    
    Also, the recipe may need further work as it looks like some libraries from the
    system are picked up that may conflict with libraries used in other packages
    that also use SDL2.
