# ScaLAPACK instructions

  * [ScaLAPACK home page](https://www.netlib.org/scalapack/)
  
  * [ScaLAPACK on GitHub](https://github.com/Reference-ScaLAPACK/scalapack)
  
  * [AMD fork of ScaLAPACK in GitHub](https://github.com/amd/aocl-scalapack)
  
 
## Notes

  * AMD ScaLAPACK 4.0 seems to be based on version 2.1 which does not yet contain
    support for 64-bit integers in the routine interfaces.


## EasyBuild

  * [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/ScaLAPACK)
  
  * There is no support in the CSCS repository.


### Version 3.1 for CPE 21.08

  * Own EasyConfig, only superficially based on the EasyBuilders one.


### Version 3.2 for CPE 22.06 and 22.08

  * Straightforward port of the 3.1 EasyConfig.

  * Re-tried a Cray version also, but that still fails.
  
      * CMake adds the `-cpp` option to the Fortran compiler command line to force
        preprocessing of `.f` files but that is not correct for the Cray compiler.
        So one should edit `CMakeLists.txt` to replace `-cpp` with the roughly 
        equivalent Cray option `-eT`.
        
      * But that is apparently not enough, compilation still breaks for the 
        `SRC/icopypv.f` file on line 89, with the message that a scalar integer expression
        is needed as a subscript. It is unclear though why the expression in the code
        is not considered a scalar integer expression by the compiler. The problem is that
        the parameter `CTXT_`, though seemingly initialized with an integer, is considered
        a floating point number by the compiler as any type declaration is missing. 
        The solution is to declare this parameter as an integer which is easily done 
        through a patch file.
        
      * But then linking of the shared library still fails with undefined symbols for 
        the IDMIN and ISMIN functions,
        and there are also a lot of warnings. Those IDMIN and ISMIN functions should be
        in BLAS or an extension thereof so it is not clear why they are found in the
        GNU version but not in the Cray version.


### Version 4.0 for CPE 22.12

  * Trivial port of the 3.2 EasyConfigs for cpeGNU and cpeAOCC.
  
  * The Cray version is still broken.

### Version 4.2 for CPE 23.12 and 24.03

  * Mostly a trivial port to 4.2.
  
  * The problem with the Cray Fortran Compiler is now resolved. After 
    investigation, it turns out the Cray compiler optimize some part of the code
    into a BLAS call, causing the undefined symbols error as cray-libsci was
    unloaded. To work around this issue, we now use `-hnopattern` when compiling
    with `cpeCray`.

