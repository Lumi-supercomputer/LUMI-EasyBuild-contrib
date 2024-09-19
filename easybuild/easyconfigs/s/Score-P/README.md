# Score-P

-   [Score-P web site](https://www.vi-hps.org/projects/score-p)

-   [Score-P read-only GitLab](https://gitlab.com/score-p/scorep)

The Score-P measurement infrastructure is a highly scalable and easy-to-use tool suite for profiling and event tracing of HPC applications.

It has been created in the German BMBF project SILC and the US DOE project PRIMA and will be maintained and enhanced in a number of follow-up projects such as LMAC, Score-E, and HOPSA. Score-P is developed under a BSD 3-Clause License and governed by a meritocratic governance model.

Score-P offers the user a maximum of convenience by supporting a number of analysis tools. Currently, it works with Scalasca, Vampir, and Tau and is open for other tools. Score-P comes together with the new Open Trace Format Version 2, the Cube4 profiling format and the OPARI2 instrumenter.


## EasyBuild support

-   [Score-P support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/Score-P)

-   [Score-P support in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/s/Score-P)

-   [Score-P support in the JSC repository]()


### Version 8.4 for CPE 23.09

-   The EasyConfig was contributed by Jan André Reuter from JSC as a direct 
    contribution of the developers.

-   For now, the package is not fully functional on LUMI-G. Basically, OpenMP
    instrumentation via OPARI2 does not work if OpenMP offload is also enabled,
    which happens if the `craype-accel-amd-gfx90a` module is loaded and the compiler
    wrappers are used. This is likely due to some bad ordering of the include files
    in that case.
    
-   For some reason, we still need to load the `rocm` module for the `cpeAMD` version
    as otherwise `roctracer` is not correctly detected. The `rocm` module does a few
    initialisations of environment variables that the `amd` module does not do.
    
 ### Version 8.4 for CPE 24.03

-   Conversion of the easyconfigs for 23.09 with some build dependencies moved
    to runtime dependencies as we don't want to rely on RPATH.

