# ADIOS2

  * [ADIOS2 web site](https://www.olcf.ornl.gov/center-projects/adios/)

      * [ADIOS2 Documentation](https://adios2.readthedocs.io/en/latest/index.html)

  * [ADIOS2 on Github](https://github.com/ornladios/ADIOS2/)


## EasyBuild

  * No ADIOS2 support in the EasyBuilders repository

  * No ADIOS2 support in the CSCS repository

  * [ADIOS2 support in the JSC repository](https://github.com/easybuilders/JSC/tree/2022/Golden_Repo/a/ADIOS2)


### Version 2.7.1 for CPE 22.08

- Based on the JSC easyconfig


### Version 2.8.3 for CPE 22.12

- Based on the JSC easyconfig


### Version 2.9.1 fro CPE 23.09

-   Trivial port of the 1.8.3 EasyConfig.

-   But switched the homepage to the page on readthedocs as the old home page doesn't seem to
    be updated anymore.

### Version 2.10.1 for CPE 24.03

-   Trivial port, but took a nicer way of configuring the `configopts`.

-   Changed in May 2025: Turned profiling on as that is needed for VisIt.


### Version 2.10.2 for CPE 25.03

-   Trivial port of the 2.10.1 EasyConfig for 24.03, but added a versionsuffix
    to the version using `cray-hdf5` to make the differences clearer from the name.


### Version 2.11.0 for CPE 25.09

-   Mostly a trivial port of the 2.10.2 EasyConfig for 25.03, but changed the name of
    the download to a more meaningful name rather than just v2.11.0.tar.gz.

