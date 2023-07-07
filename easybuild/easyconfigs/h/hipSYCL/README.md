# hipSYCL instructions

-   [hipSYCL/OpenSYCL web site](https://opensycl.github.io/)

-   [hipSYCL on GitHub](https://github.com/illuhad/hipSYCL)

    -   [GitHub releases](https://github.com/illuhad/hipSYCL/releases)


## EasyBuild

-   No support in the EasyBuilders repository at the time of writing.

-   No support in the CSCS repository at the time of writing.


### Version 0.9.3 for cpeGNU/22.08

-   This EasyConfig is contributed by Jørgen Nordmoen, USIT, University of Oslo.

-   Note that the module will also set an environment variable that sets the hipSYCL
    target architecture to the architecture of the MI250x GPU. Hence it will not work
    without modifications on the older MI100 GPUs!


### Version 0.9.4 for cpeGNU/22.08

-   Version bump of hipSYCL/OpenSYCL based on the previous configuration 0.9.3, it also uses the LUMI custom rocm/5.3.3 module. 

-   cpeCray/22.08 version:

    -   Configuration based on a suggestion by a user.

    -   It looks like hipSYCL refuses to fully integrate with Cray clang and instead 
        still uses the ROCm clang which means that this is version 15.0.
        
    -   The user suggested that `-DWITH_SSCP_COMPILER=OFF` is needed. This is according
        to the hipSYCL documentation indeed needed for Clang 14, but since hipSYCL
        keeps integrating with ROCm Clang which is based on version 15 for the version
        of ROCm used here, it doesn't seem to be needed.
        
-   cpeCray/23.03 version:

    -   Basically the same remarks as for the cpeCray/22.08 version.

