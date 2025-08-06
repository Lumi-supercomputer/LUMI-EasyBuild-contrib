# Libint (CP2K version) instructions

-   [Libint for CP2K on GitHub](https://github.com/cp2k/libint-cp2k)

    -   [GitHub releases](https://github.com/cp2k/libint-cp2k/releases)

-   [Regular Libint GitHub](https://github.com/evaleev/libint)


## EasyBuild

-   [Libint-CP2K in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/l/Libint-CP2K)


### Version 2.6.0 for CP2K 9.1 and later

-   The EasyConfig is a direct port from the CSCS one.
  
-   Always update to the Boost version for the specific toolchain.


### Version 2.7.2.

-   Adapted using the EasyBuilders one as a guidance. It is an unusual version
    for CP2K.
    
-   Kept in 25.03 also due to uncertainties about compatibility of newer versions with
    CP2K. In fact, the CP2K authors still test with 2.6.0, but the EasyBuilders use
    2.7.2.
