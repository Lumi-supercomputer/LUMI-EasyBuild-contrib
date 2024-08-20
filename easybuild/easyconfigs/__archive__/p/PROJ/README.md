# PROJ instructions

-   [PROJ web site](https://proj.org/)
    
-   [PROJ on GitHub](https://github.com/OSGeo/PROJ)
    
    -   [GitHub releases](https://github.com/OSGeo/PROJ/releases)
    

## EasyBuild

-   [PROJ in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PROJ)
    
-   [PROJ in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/p/PROJ)
    

### Version 9.1.1 for cpeGNU/22.08

-   The EasyConfig is derived from th EasyBuilders one, but we are using the internal
    nlohmann/json library. As that is a header file-only library there is no need
    to have this on the system.
    
    We currently also use the internal gtest rather than one installed with EasyBuild.

-   Switched to `lib` as the install directory for the libraries.
    
