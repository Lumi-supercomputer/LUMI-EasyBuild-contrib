# OTF2

- [OTF2 web site](https://www.vi-hps.org/projects/score-p)

The Open Trace Format Version 2 (OTF2) is a highly scalable, memory efficient 
event trace data format plus support library. It is the standard trace format for 
Scalasca, Vampir, and Tau and is open for other tools.

OTF2 is the common successor format for the Open Trace Format (OTF) and the Epilog 
trace format. It preserves the essential features as well as most record types of 
both and introduces new features such as support for multiple read/write substrates, 
in-place time stamp manipulation, and on-the-fly token translation. In particular, 
it will avoid copying during unification of parallel event streams.


## EasyBuild support

- [OTF2 support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OTF2)
- [OTF2 support in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/o/OTF2)


### Version 3.0.3 for CPE 23.09

-   EasyConfig prepared by Jan André Reuter of JSC based on the EasyConfigs in use at JSC.

    Compilation is done via the custom EasyBlock for Score-P.
