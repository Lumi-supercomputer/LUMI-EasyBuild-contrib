# Graphene instructions

-   [Graphene web site](This library provides types and their relative API; it does not deal with windowing system surfaces, drawing, scene graphs, or input. You're supposed to do that yourself, in your own canvas implementation, which is the whole point of writing the library in the first place.)

-   [Graphene GitHub](https://github.com/ebassi/graphene)

    -   [GitHub releases](https://github.com/ebassi/graphene/releases)


## EasyBuild

-   [Graphene support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/Graphene)

-   There is no support for Graphene in the CSCS repository.

-   No support for Graphene found in Spack.


### Version 1.10.8 dor cpeGNU/22.08

-   The EasyConfig is a direct port of the EasyBuilders one for GCCcore/11.3.0 (2022a).

-   Added the directory with the include files themselves to the CPATH also to avoid having
    to use `#include <graphene-1.0/x.h>` but it is not clear if this is required for 
    software using Graphene.
