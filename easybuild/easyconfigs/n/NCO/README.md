# NCO - NetCDF Operators instructions

-   [NCO on GitHub](https://github.com/nco/nco)

    -   [GitHub releases](https://github.com/nco/nco/releases)


## General remarks

NCO has a lot of dependencies and the EasyBuilders configuration does not include all.
It is not a full build and neither is ours currently.

Some special ones:

-   UDUNITS does not show up when you check which libraries are linked dynamically,
    but the build does fail if it cannot find the header files.
    
-   ESMF does not show up when you check libraries that are linked. However, for some
    operations, an executable from ESMF is called (and this is the case for the 
    sanity check that we added in 5.3.4 for 25.03).

-   There is a feature called [CCR or Community Codec Repository](https://github.com/ccr/ccr)
    with extra compression algorithms for netCDF and HDF5, but it doesn't seem to 
    be well maintained recently. It is also not yet included in the EasyBuilders
    build nor can we find an EasyConfig for CCR. A Spack package also seems to 
    be non-existent.

-   Another feature is support for [MOAB](https://sigma.mcs.anl.gov/moab-library/)
    or Mesh-Oriented datABase, that is not
    included in our builds or in the EasyBuilders one.
    
    The [MOAB library](https://sigma.mcs.anl.gov/moab-library/) itself
    is [supported in Spack](https://packages.spack.io/package.html?name=moab).
    The package has a huge number of optional dependencies.


## EasyBuild

-   [NCO support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/n/NCO)

-   [NCO support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/n/NCO)


### Version 5.01 for CPE 21.08

-   The EasyConfig is a mix of the CSCS and EasyBuilder ones, the latter having
    more dependencies and hence supporting more options.

-   For now we disable udunits2 as configure is complaining that udunits2 misses
    some XML data files.

-   The EasyBuilders recipe claims ESMF is needed but it is nowhere linked into the
    code so that dependency is omitted.


### 5.0.6 for CPE 21.12

-   Needed to compile with cray-libsci unloaded as that causes crashes.

-   The cpeAOCC version had problems initially due to the faulty aocc/3.1.0 module,
    requiring a further fix to cpeAOCC/21.12 to make the cray-hdf5 module available.

-   Note that at inspection of the log file you will see that the configure command
    complains that the XML data file is not found. This is because the test is wrong,
    not because the installation is wrong, as the test only looks in some fixed locations
    on the system that assume that UDUNITS-2 is installed in the system directories.


### Version 5.1.0 for CPE 22.06 and 22.08

-   This is a trivial port of the 5.0.6 one.


### Version 5.1.5 for CPE 22.12 and 23.03

-   This is a trivial port of the 5.1.5 one.
  
-   Added license and citation information files to the installation.


### Version 5.1.8 from CPE 23.09 on

 -   Trivial version bump of the EasyConfig for version 5.1.5


### Version 5.2.7 for 24.03

-   Trivial version bump of the EasyConfig for version 5.1.8 in 23.09


### Version 5.3.4 for 25.03

-   We did a more thorough check for this one.

    -   It looks like the ldap dependency does nothing, it doesn't seem to be picked 
        up in the configure phase and we cannot find where it would link to the library.
        
        We also cannot find any reference to the `getdap` or `getdap4` commands, so 
        we left out the dependency in this version.
        
    -   It looks like the JasPer dependency does nothing. It is not picked up in the 
        configure phase and we cannot find where it would link to the library.
        
        We also cannot find any reference to one of its commands, so left out the 
        dependency in this version.
        
-   We added a sanity check and the C++ build based on parameters used in the EasyBuilders
    EasyConfig.
    
-   We added ESMF as a dependency as suggested in the EasyBuilders build. The newly 
    added sanity check shows that one of its commands is being used, even though the 
    library is not linked directly.

        
