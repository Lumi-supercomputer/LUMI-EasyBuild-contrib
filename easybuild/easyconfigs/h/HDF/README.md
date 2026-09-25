# HDF (HDF4) instructions

This is a module for those packages that would still use the old HDF4 format.

Its main use seems to be as a dependency for GDAL. One should not develop new code 
using it.

-   [HDF(4) web site](https://www.hdfgroup.org/solutions/hdf4/)
    
    
## EasyBuild

-   [Support for HDF in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/h/HDF)
    
-   [Support for HDF in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/h/HDF)
    
    
### Version 4.2.15 for cpeGNU 22.08 and later

-   The EasyConfig is a mix of the CSCS and EasyBuilder ones.


### Version 4.2.16-2 for cpeGNU 23.09 and later

-   Trivial port of the EasyConfig for 4.2.15

-   Switched to EB6-compatible parameters in 26.03.

-   In September 2026, The Szip dependency was replaced by libaec in the 25.03 and 26.03 
    versions to ensure that there are no library conflicts when used with own-compiled
    HDF5 libraries as the newer ones really encourage the use of libaec.

