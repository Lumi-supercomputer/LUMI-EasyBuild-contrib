# CDO instructions

-   [CDO home page](https://code.mpimet.mpg.de/projects/cdo)

    -   [CDO downloads page](https://code.mpimet.mpg.de/projects/cdo/files)

    -   [Installation documentation in the full HTML documentation](https://code.mpimet.mpg.de/projects/cdo/embedded/index.html)


## EasyBuild

-   [CDO support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/c/CDO)

-   [CDO support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/c/CDO)


### Version 1.9.10 for cpeGNU and cpeCray 21.08

-   The EasyConfig is a mix of the CSCS and EasyBuilders one. Specifically
    the additional dependency on YAXT comes from the EasyBuilders version.

    -   cURL, a build dependency according to the CSCS recipe, was moved to
        the regular dependencies as the ``cdo`` executable links against it.

    -   The YAXT dependency (according to the EasyBuilders recipe) is left
        out as it doesn't seem to be used according to the log file of the
        build. This could be a leftover from an old version that used YAXT
        instead of ecCodes?

    -   The grib_api library was not used as the configure script claims
        GRIB support even when not including that library. In fact, checking
        the ECMWF web site shows the functionality of GRIB-API is now covered
        by ecCodes.

    -   Additional dependencies based on the configure script:

        -   FFTW

        -   libxml2

        -   CMOR - Though it is not clear if that support will actually work.
            It may require more data files and it is not clear where those should
            be installed. We did find reports on the web that using CDO CMOR did
            not work without certain additional files.

            We did need to use a trick to get CMOR to link in CDO as the configure
            script didn't add the json-c library when testing for the proper working
            of CMOR. So we added the options to link json-c to LDFLAGS. The path to
            the library was also included as otherwise the Fortran compiler cannot
            find it.

-   [Magics](https://confluence.ecmwf.int/display/MAGP/Magics), the ECMWF
    metheorological plotting software, is not yet integrated.

-   As some dependencies do no compile with cpeAMD 21.08, there is only a
    cpeGNU and cpeCray version.
    

### Version 2.0.5 for CPE 21.12

-   So far a straigthforward port. Some features are not supported but we did not yet
    look into them to see if it makes sense trying to get them working. In particular
    the output of configure says that the HIRLAM extensions are not supported and that
    no static CDI binary will be build.
    
-   Compilation in cpeAOCC fails with link errors about a Fortran routine that is not
    found.

### Version 2.2.0 for CPE 22.12 and later

-   Straightforward port of the 2.0.5 EasyConfig, except for one element: we 
    needed to explicitly add `--enable-openmp` as the options to compile with OpenMP
    are passed via the toolchainopts.

-   Added a copy of the LICENSE file to the installation directories.


### Version 2.3.0 for CPE 23.09 and later

-   A straightforward port of the 2.2.0 EasyConfig.


### Version 2.4.3 for CPE 24.03

-   A straightforward port of the 2.3.0 EasyConfig for 23.09.


### Version 2.5.4 for CPE 25.03

-   A straightforward port of the 2.4.3 EasyConfig for 24.03.

-   The cpeCray version had linking issues though and we had to allow undefined symbols.
    **It is not clear to what extent that can have an effect on the working of CDO.**
