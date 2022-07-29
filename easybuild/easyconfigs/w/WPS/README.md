# WPS

  * [WPS home page](https://www.mmm.ucar.edu/weather-research-and-forecasting-model)
  
  * [WPS on GitHub](https://github.com/wrf-model/WPS)


## EasyBuild

  * [WPS support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/w/WPS)

  * There is no WPS support in the CSCS repository

The build procedure is an in-place build in the installation directory as 
there is no proper install procedure.
 
 
 ### Version 4.3.1 for 21.12
 
   * The plotfmt.exe and plotgrid.exe tools are not included at the moment as 
     they require additional dependencies (NCAR Graphics).
     
     NCAR Graphics then became part of [NCL](http://www.ncl.ucar.edu/) 
     (NCAR Command Lanmguage) which tiself in in maintenance mode since 2019
     as NCAR is replacing its graphics tools with Python-based tools.
   

### Version 4.3.1 for 22.06

  * 22.06 uses a newer version of JasPer, but unfortunately WPS is incompatible with
    it causing the build of ungrib.exe to fail.

    So an EasyConfig for an older version of JasPer was also added to the contributed
    repository.

  * Improved the sanity checks. Adding sanity check commands turns out to be nontrivial
    or impossible as it is not possible to simply see if an executable at least loads 
    and starts correctly using something as `--help` or `--version`.

    The list of tools in the sanity check is based on the 
    [README.md file](https://github.com/wrf-model/WPS)
    but the last line adds two tools that were found in the installation directory.
    Also, plotfmt and plotgrids are not currently included as they require additional
    dependencies.
