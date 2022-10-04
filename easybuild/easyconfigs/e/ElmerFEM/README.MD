# ElmerFEM instructions

-   [Elmer FEM home page](https://www.csc.fi/elmer)

-   [Elmer FEM blog](http://www.elmerfem.org./),
    updated more often.
    
-   [Elmer FEM on GitHub](https://github.com/ElmerCSC/elmerfem)

    - [GitHub releases currently via tags](https://github.com/ElmerCSC/elmerfem)


## EasyBuild

-   There is currently no support for Elmer FEM in the EasyBuilders repository.

-   There is currently no support for Elmer FEM in the CSCS repository

-   [Spack package elmerfem](https://github.com/spack/spack/blob/develop/var/spack/repos/builtin/packages/elmerfem/package.py)

The Spack package suggests that the Elmer code can be way more complicated to compile than
the [instructions in the documentation](https://www.csc.fi/web/elmer/sources-and-compilation)
suggest, which would make it a candidate for a custom EasyBlock with a custom configure step
to set the right CMake options depending on which toolchainopts are set and which dependencies
are loaded.


### Version 9.0mod-cpeGNU-22.08-minimal

-   This is a custom-build EasyConfig based on the 
    [installation instructions in the manual](https://www.csc.fi/web/elmer/sources-and-compilation)
    but with MPI and OpenMP enabled.
    
    It may be that some of the external libraries that can be used are still included through
    versions included in the distribution, but an Elmer expert should look into this.
    
-   The version tagged `release-9.0` does not compile on LUMI with errors from the
    gfortran compiler. This EasyConfig is based on a later commit that does compile
    and was the most recent one on 3 OCtober 2022 when this EasyConfig was developed.

-   The additional environment variables that are defined are not only based on the compile
    instructions in the manual but also on what was found in the Spack recipe.
