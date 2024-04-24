# Package

-   [AdaptiveCpp on GitHub](https://github.com/AdaptiveCpp/AdaptiveCpp)
-   Formerly known as hipSYCL and Open SYCL
    

## EasyBuild

-   There is no support for AdaptiveCpp in the EasyBuilders repository.

-   There is no support for AdaptiveCpp in the CSCS repository.


### Release 23.10.0 for CPE 22.12 and CPE 23.09

-   Recommended version for CPE 23.09 is 23.10.0 with ROCm 5.4.6

-   Rely on cpeAMD EasyBuild toolchain

-   CPE 22.12 recipe uses default ROCm 5.2.3

-   CPE 23.09 recipe with ROCm 5.6.1 has issues with performance on multiple nodes due to driver and/or GTL library incompatibility

-   All the recipes rely on ROCm LLVM entirely which misses libraries required to 
    enable the single pass compiler feature of ACPP.
