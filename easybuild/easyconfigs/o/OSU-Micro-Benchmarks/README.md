# OSU benchmarks technical information.

-   [Home page](https://mvapich.cse.ohio-state.edu/benchmarks/)
    

## EasyBuild
    
-   [Support for the OSU micro-benchmarks in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OSU-Micro-Benchmarks)
    
-   [Support for the OSU micro-benchmarks in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/o/OSU-Micro-Benchmarks)
    
-   [Support for the OSU micro-benchmarks in Spack](https://packages.spack.io/package.html?name=osu-micro-benchmarks)


### Version 7.3 for Cray MPICH

-   The starting point were the EasyBuilders EasyConfigs for the `gompi` toolchains.

-   Some example scripts are included. They are build from templates also stored in 
    the LUMI-EasyBuild-contrib repository that are processed with `sed` in the 
    EasyConfig to load the appropriate modules in the right versions.
    
-   There is also more documentation in the module. That documentation is partly 
    specific to each module as we also have some variants for Open MPI.
    
    
### Version 7.3 for Open MPI

-   These modules are part of a regular EasyBuild toolchain even though that
    does not make much sense as we even need to unload some modules to avoid
    conflicts. Setting up specific toolchains in EasyBuild using just a 
    pre-installed compiler or pre-installed compiler + Cray wrapper is a lot
    of work though so this solution is preferred for now.
