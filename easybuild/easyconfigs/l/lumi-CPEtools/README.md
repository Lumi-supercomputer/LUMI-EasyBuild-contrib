# Technical information contributed versions of lumi-CPEtools

## EasyBuild

### Version 1.1 for Open MPI

-   The EasyConfigs are similar to those for the Cray MPICH versions, but
    
    -   Compilers need to be set manually in `buildopts` to use the Open MPI
        compiler wrappers.
        
    -   Before building some modules need to be unloaded again (which ones
        depends on the specific `OpenMPI` module).



