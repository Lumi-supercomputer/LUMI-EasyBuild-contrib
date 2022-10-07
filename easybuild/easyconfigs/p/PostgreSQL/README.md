# PostgreSQL instructions

-   [PostgreSQL web site](https://www.postgresql.org/)
    
    -   [Downloads](https://www.postgresql.org/ftp/source/)
    
 
## EasyBuild

-   [PostgreSQL support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PostgreSQL)
    
-   There is no PostgreSQL support in the CSCS repository.
    
    
### Version 14.5 for cpeGNU/22.08

-   This is a direct port of the 14.4 EasyConfig for GCCcore 11.3.0 in the 
    EasyBuilders repository.
    
-   It is unclear what Python does here. In the EasyBuilders EasyConfig it is only 
    a build dependency, and no Python code seems to be installed, but we do
    not exclude that Python is called from some of the binaries in one way or
    another so we decided to include it as a dependency just to be sure.

    The compilation does use a Python header file, but no dependencies on Python 
    libraries can be found in the binaries or shared libraries.
    

