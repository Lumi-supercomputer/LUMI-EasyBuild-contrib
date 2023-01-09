# glew instructions

-   [GLEW on GitHub](https://github.com/nigels-com/glew)
    
    -   [GitHub releases](https://github.com/nigels-com/glew/releases)
    
    
## Remarks

GLEW supports multiple backends, but unfortunately these have to be chosen at
compile time. Hence the EasyConfig files with different versionsuffix (that otherwise
are identical, as there is some logic in the EasyConfig to derive the backend from
the versionsuffix).

The back-ends are:

-   GLX: The default backend on Linux, for on-screen rendering or rendering using
    VirtualGL

-   EGL: Technically capable of both on-screen and off-screen rendering

-   OSMESA: Backend for off-screen rendering only.


## EasyBuild

-   [glew support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/glew)

-   There is no support for glew in the CSCS repository.


### Version 2.2.0 for cpeGNU/22.08

-   The EasyConfig is derived from the EaysyBuilders one for the 2021b toolchain and
    versions of dependencies were bumped to those of the 2022a toolchains that largely
    correspond to 22.08 on LUMI.
    
-   Some dependencies were adapted to the way we work on LUMI.

-   Note that GLEW does build two commands but they cannot be used to test the installation
    as they require the full graphical context to work.
