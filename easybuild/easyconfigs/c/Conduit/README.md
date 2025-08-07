# Conduit technical information

-   [Conduit homepage](https://software.llnl.gov/conduit/)

-   [Conduit on GitHub](https://github.com/LLNL/conduit/)
    
    -   [GitHub releases](https://github.com/LLNL/conduit/releases)


## EasyBuild

-   There is no support for Conduit in the EasyBuilders repository
    
-   [Conduit in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/c/Conduit)
    
-   [Conduit in the JSC repository](https://github.com/easybuilders/JSC/tree/2025/Golden_Repo/c/Conduit)
    
-   [conduit package in Spack](https://packages.spack.io/package.html?name=conduit)


### Version 0.9.2 for cpeGNU/24.03

-   The EasyConfig is largely a LUST development.


### Version 0.9.4 for cpeGNU/25.03

-   Trivial port of the 0.9.2 EasyConfig for 24.03. The patch is no longer needed.

    We also checked for better sanity checks, but as even the help option already
    returns an error code, this is hard to check until we have an actual issue
    and can see how that differs from the regular behaviour.
