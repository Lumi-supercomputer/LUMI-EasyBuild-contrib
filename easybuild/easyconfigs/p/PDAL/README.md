# PDAL instructions

PDAL or Point Data Abstraction Library is an optional component of SAGA-GIS.

-   [PDAL web site](https://pdal.io/)
    
-   [PDAL on GitHub](https://github.com/PDAL/PDAL)
    
    -   [GitHub releases](https://github.com/PDAL/PDAL/releases)
    
 
## EasyBuild

-   There is no support for PDAL in the EasyBuilders repository
    
-   There is no support for PDAL in the CSCS repository
    
-   No support found in the Spack package list, unless that is in there under a
    different name.
    
    
### Version 2.4.3 for cpeGNU/22.08

-   The EasyConfig is a LUST development.

-   Failed so far to get it to detect absl. Or does absl in the manual mean something
    different?
    
-   It is not clear how to enable various plugins. The manual is very unclear on what 
    is needed for which plugin, but it is clear they almost all need additional
    dependencies.
    
-   TODO for a later version: Consider switching to CMakeNinja.
