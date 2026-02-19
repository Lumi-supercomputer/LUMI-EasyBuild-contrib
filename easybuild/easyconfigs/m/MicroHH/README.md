# MicroHH

MicroHH is a computational fluid dynamics code designed to simulate turbulent flows 
in the atmosphere using Direct Numerical Simulation (DNS) and Large-Eddy Simulation (LES) techniques. 
Its capabilities span a range from highly idealized flows to realistic atmospheric boundary layers, 
incorporating all relevant processes, such as moist thermodynamics, radiation, land surface processes, and microphysics. 
The code is written in C++/CUDA and runs on both CPUs and GPUs (but only NVIDIA at 
the time of writing).

-   [MicroHH website](http://www.microhh.org/)

-   [MicroHH User Guide](https://microhh.readthedocs.io/en/latest/)


## EasyBuild

### Version 2.0.1 for cpeGNU

-   The EasyConfig was contributed by the EPICURE project.

-   When having trouble after a system update, it may be a good idea to move Boost 
    to the regular depencencies as now many system libraries are used that may or
    may not be present after a system update.

-   `MicroHH-2.0.1-cpeGNU-24.03.eb`: version for the Cray Programming Environment 
    with GNU compiler version 24.03.

-   `MicroHH-2.0.1-cpeGNU-25.03.eb`: version for the Cray Programming Environment 
    with GNU compiler version 25.03.

    This version also adds some testing in the "testing" step.