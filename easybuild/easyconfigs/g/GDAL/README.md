# GDAL instructions

-   [GDAL home page](https://gdal.org/)

-   [GDAL on GitHub](https://github.com/OSGeo/GDAL)
    
    -   [GitHub releases](https://github.com/OSGeo/gdal/releases)
    
    
## EasyBuild

-   [GDAL support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/GDAL)
    
-   [GDAL support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GDAL)
    
    
### GDAL 3.5.2 for cpeGNU 3.5.2

-   The EasyConfig file is derived from the EasyBuilders recipes, and with some
    adaptations copied from the CSCS EasyConfigs.
    
-   It looks like there may be timing issues during the build. With the same EasyConfig
    builds sometimes fail and sometimes succeed. Hence we need to do a slow sequential
    build.
    
-   GDAL has way more optional features than are enabled in this EasyConfig, so feel free
    to further extend.

