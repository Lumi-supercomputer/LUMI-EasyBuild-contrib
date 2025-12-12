# GDAL instructions

-   [GDAL home page](https://gdal.org/)

-   [GDAL on GitHub](https://github.com/OSGeo/GDAL)
    
    -   [GitHub releases](https://github.com/OSGeo/gdal/releases)
    
## General remarks
    
Installing GDAL takes a lot of time. It is a huge package and parallel compile is known
to sometimes fail so the build process has to be entirely sequential and can take hours.    
    
    
## EasyBuild

-   [GDAL support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/GDAL)
    
-   [GDAL support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GDAL)
    
    
### GDAL 3.5.2 for cpeGNU 22.08

-   The EasyConfig file is derived from the EasyBuilders recipes, and with some
    adaptations copied from the CSCS EasyConfigs.
    
-   It looks like there may be timing issues during the build. With the same EasyConfig
    builds sometimes fail and sometimes succeed. Hence we need to do a slow sequential
    build.
    
-   GDAL has way more optional features than are enabled in this EasyConfig, so feel free
    to further extend.


### GDAL 3.5.3 for cpeGNU 23.09

-   3.5 is the last version of GDAL that can be built using autoconf, and this is the
    most recent bugfix release as of now.
    
-   The EasyConfig is a trivial port of the 3.5.2 one, with the usual version updates 
    and aligning the structure a bit more to other recent LUMI easyconfigs.


### GDAL 3.9.0 for 24.03

-   The EasyConfigs are a straightforward port of those for 3.5.3 in 23.09


### GDAL 3.12.0 for 25.03

-   The EasyConfigs are a straightforward port of those for 3.9.0 in 24.03.
