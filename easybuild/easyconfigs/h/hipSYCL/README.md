# hipSYCL instructions

-   [hipSYCL web site](https://hipsycl.github.io/)

-   [hipSYCL on GitHub](https://github.com/illuhad/hipSYCL)

    -   [GitHub releases](https://github.com/illuhad/hipSYCL/releases)


## EasyBuild

-   No support in the EasyBuilders repository at the time of writing.

-   No support in the CSCS repository at the time of writing.

### Version 0.9.4 for cpeAMD/22.12

-   Version of hipSYCL for AMD toolchain with default rocm/5.2.3 version. 

-   Avoid using `cc` and `CC` wrappers with AMD programming environment at this version while it confuses CMake.

-   This version should replace any other based on GNU toolchain which results in dynamic libraries incosistency (OpenMP runtime). 

### Version 0.9.4 for cpeGNU/22.08

-   Version bump of hipSYCL/OpenSYCL based on the previous configuration 0.9.3, it also uses the LUMI custom rocm/5.3.3 module. 

### Version 0.9.3 for cpeGNU/22.08

-   This EasyConfig is contributed by Jørgen Nordmoen, USIT, University of Oslo.

-   Note that the module will also set an environment variable that sets the hipSYCL
    target architecture to the architecture of the MI250x GPU. Hence it will not work
    without modifications on the older MI100 GPUs!
