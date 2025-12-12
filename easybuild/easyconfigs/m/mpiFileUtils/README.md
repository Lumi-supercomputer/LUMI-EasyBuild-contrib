# mpiFileUtils

-   [mpiFileUtils web site](https://hpc.github.io/mpifileutils/)
    
    -   [mpiFileUtils documentation](https://mpifileutils.readthedocs.io/en/latest/)
    
-   [mpiFileUtils Github](https://github.com/hpc/mpifileutils)

The EasyConfig compiles some additional libraries right into the package:

-   [attr - Commands for mnaipulating filesystem extended attributes](https://savannah.nongnu.org/projects/attr)
    ([version check](https://download.savannah.nongnu.org/releases/attr/)]

-   [dtcmp - Datatype Compare](https://github.com/LLNL/dtcmp) ([version check](https://github.com/LLNL/dtcmp/releases))

-   [libcircle](https://hpc.github.io/libcircle/) ([version check](https://github.com/hpc/libcircle/releases))

-   [lwgrp - Light-Weight Group Library](https://github.com/LLNL/lwgrp) ([version check](https://github.com/LLNL/lwgrp/releases))
    

## EasyBuild

-   [mpiFileUtils support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/m/mpifileutils)
   

### Version 0.11.1

-   Custom easyconfig for LUMI


### Version 0.12 from 25.03 on

-   Trivial port of the EasyConfigs for 24.03 for 25.03.
    
-   Found the source of the compiler error in mpiFileUtils and corrected that by adding 
    `-D_GNU_SOURCE` to `FLAGS` so that the flags that were needed to avoid an error 
    in Clang are no longer needed. They were also needed for GCC 14.
