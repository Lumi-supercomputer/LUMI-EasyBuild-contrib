# ParaView user instructions

## Running ParaView with OpenGL acceleration

To run ParaView with OpenGL accelleration, it should be started via `vglrun -d egl0`.

This version of ParaView is mostly offered for power users for whom the configuration 
in the LUMI web interface is not sufficient. The EasyBuild recipe can be a starting
point for further customisations.

The compilation time for ParaView is very long. It can easily take two hours on busy
login nodes...
