# nvtop

-   [nvtop on Github](https://github.com/Syllo/nvtop)


## EasyBuild

-   [nvtop support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/n/nvtop)

-   [nvtop support in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/n/nvtop)


### Version 3.0.2

-   Easyconfig created for LUMI

-   Corrections in the summer of 2026: Location of ncurses include files, and added license
    information.

-   We had issues compiling `nvtop` in the container for 26.03 development. As this may have
    been due to an issue with a header file from the system, we decided to implement a workaround
    suggested by Gemini: Replace `tgmath.h` with `math.h`. It compiles with that change, and 
    just running it still works fine.


### Version 3.3.2

-   Trivial version update of the summer 2026 version of 3.0.2, including the switch to `math.h`.

-   Switched to EB6-compatible parameters.
