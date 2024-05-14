# OPARI2

-   [OPARI2 web site](https://www.vi-hps.org/tools/opari2.html)

OPARI2, the successor of Forschungszentrum Jülich's OPARI, is a source-to-source 
instrumentation tool for OpenMP and hybrid codes. It surrounds OpenMP directives 
and runtime library calls with calls to the POMP2 measurement interface. 
The POMP2 interface can be implemented by tool builders who want, for example, 
to monitor the performance of OpenMP applications. Like its predecessor, 
OPARI2 works with Fortran, C, and C++ programs. Additional features compared to 
OPARI are a new initialization method that allows for multi-directory and parallel 
builds as well as the usage of pre-instrumented libraries. Furthermore, an efficient 
way of tracking parent-child thread-relationships was added. Additionally OPARI2 was 
extended to support instrumentation of OpenMP 3.0 tied tasks. OPARI is used by many 
performance analysis tools (e.g. TAU, ompP, KOJAK, Scalasca, VampirTrace) whereas 
OPARI2 is currently used by Score-P and TAU.


## EasyBuild support

- [OPARI2 support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OPARI2)
- [OPARI2 support in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/o/OPARI2)


### Version 2.0.8 for CPE 23.09

-   The EasyConfig was prepared by Jan André Reuter of JSC based on EasyConfigs in use
    at JSC.
