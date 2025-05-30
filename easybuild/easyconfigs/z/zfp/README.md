# ZFP

  * [ZFP web site](https://computing.llnl.gov/projects/zfp)

      * [ZFP Documentation](https://zfp.readthedocs.io/en/release1.0.0/)

  * [ZFP on Github](https://github.com/LLNL/zfp)


## EasyBuild

  * [ZFP support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/z/zfp)

  * [ZFP support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/z/zfp)

  * [ZFP support in the JSC repository](https://github.com/easybuilders/JSC/tree/2022/Golden_Repo/z/zfp)


### Version 0.5.5 for CPE 22.08

-   Based on the JSC easyconfig
 
-   Unload the cray-libsci module to prevent linking to the threaded version of
    libsci which is not needed. It avoid the double linking problem with 
    applications that actually need libsci.


### Version 1.0.0 for CPE 23.09

-   Trivial port but adapted the source lines from the EasyBuild EasyConfig.

-   And build without the Python interfaces as those require cython which is
    not part of the Cray Python version used for 23.09.

### Version 1.0.1 for CPE 24.03

-   Trivial port of the EasyConfig for 1.0.0 in CPE 23.09.

-   May 2025: Added license information to the installation.
