# Charm++

-   [Charm++ Website](http://charmplusplus.org/)

## General information

Charm++ is a parallel programming framework in C++ supported by an adaptive 
runtime system, which enhances user productivity and allows programs to run 
portably from small multicore computers (your laptop) to the largest
supercomputers.

## EasyBuild

-   [Charm++ in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/c/Charm%2B%2B)


### Version 6.10.2 for CPE GNU 21.08

-   The EasyConfig is derived from the CSCS one


### Version 7.0.0 for 23.09

/

### Version 8.0.0 for 24.03 and 25.03

-   There are several configurations

    -   Two are used for CPU of NAMD and differ in the communication mechanism: via MPI 
        (`-mpi-crayshasta`) or talking directly to the libfabric library (`-ofi-crayshasta`)
        
    -   Two are used for GPU configuration of NAMD: `-multicore` without support for 
        distributed memory computing and `-mpi-crayshasta-smp`.

