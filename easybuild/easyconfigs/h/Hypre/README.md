# Hypre instructions

A library of scalable linear solvers and multigrid methods, used by PETSc.

-   [HYPRE web site](https://computing.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods)

-   [HYPRE GitHub repo](https://github.com/hypre-space/hypre)

    -   [GitHub releases via tags](https://github.com/hypre-space/hypre/tags)


## EasyBuild

-   [HYPRE support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/h/Hypre)
  
-   There is no HYPRE support in the CSCS repository


### Version 2.26.0 for cpeGNU 22.08 up to 23.09

-   The EasyConfig is adapted from those in the EasyBuilders repository.
    It does use a common EasyBlock from EasyBuild unmodified.


### Version 2.31.0 for cpeGNU 24.03

-   Trivial port of the EasyConfig for 2.26.0 in 23.09


### Version 2.33.0 for cpeGNU 25.03

-   There is a newer version (3.0.0), but we stick to the version used in the 2025a and 2025b
    toolchains and included with EasyBuild 5.1.2 for which this EasyConfig was originally
    developed, to ensure compatibility with the EasyBlock.

-   Furthermore a trivial port of the EasyConfig for 2.31.0 in 24.03.
