# WPS

WPS (WRF Preprocessing System) is a set of programs that prepare meteorological data for use with the WRF (Weather Research and Forecasting) model. It includes tools for reading, interpolating, and formatting meteorological data from various sources.
It is part of the WRF software suite and is used to preprocess input data for WRF simulations.

-   [WPS home page (same as WRF)](https://www.mmm.ucar.edu/weather-research-and-forecasting-model)
  
-   [WPS on GitHub](https://github.com/wrf-model/WPS)

-   [WRF Users' Page](https://www2.mmm.ucar.edu/wrf/users/)

  
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
   

### Version 4.3.1 for 22.06 and 22.08

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

    
### Version 4.4 for use with WRF-SFIRE W4.4-S0.1

-   EasyConfig contributed by the EPICURE project, based on earlier WPS EasyConfigs.

-   `WPS-v4.4-cpeGNU-24.03-WRF-SFIRE-W4.4-S0.1.eb`: The EasyConfig is intended to be used
    together with the WRF-SFIRE version W4.4-S0.1. Built for the Cray PE GNU toolchain version 24.03.

-   `WPS-v4.4-cpeGNU-25.03-WRF-SFIRE-W4.4-S0.1.eb`: The EasyConfig is intended to be used
    together with the WRF-SFIRE version W4.4-S0.1. Built for the Cray PE GNU toolchain version 25.03.
