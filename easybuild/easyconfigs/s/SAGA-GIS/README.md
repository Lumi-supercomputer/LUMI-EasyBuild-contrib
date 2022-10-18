# SAGA-GIS instructions

-   [SAGA-GIS web site](https://saga-gis.sourceforge.io/)

-   [SAGA-GIS on SourceForge](https://sourceforge.net/projects/saga-gis/)

    -   [SAGA-GIS downloads](https://sourceforge.net/projects/saga-gis/files/)
    
    -   [SAGA-GIS code development in SourceForge git system](https://sourceforge.net/p/saga-gis/code/ci/master/tree/)


## EasyBuild

-   There is no support for SAGA-GIS in the EasyBuilders repository
    
-   There is no support for SAGA-GIS in the CSCS repository
    
-   [SAGA-GIS (saga-gis) in Spack](https://spack.readthedocs.io/en/latest/package_list.html#saga-gis)


### Version 8.4.0 for cpeGNU/22.08

-   The EasyConfig file is a LUST development based on 
    [the Wiki page on compiling SAGA](https://sourceforge.net/p/saga-gis/wiki/Compiling%20SAGA%20on%20Linux/)
    and the Spack package.
    
-   Tried 8.3.0 first but that had a problem with a CMake function that didn't work
    if the download is not a git repository (which it is not if you download from
    the SourceForge files section).


