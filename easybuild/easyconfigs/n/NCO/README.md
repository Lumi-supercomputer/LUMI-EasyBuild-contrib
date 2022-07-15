# NCO - NetCDF Operators instructions

  * [NCO on GitHub](https://github.com/nco/nco)

      * [GitHub releases](https://github.com/nco/nco/releases)

## EasyBuild

  * [NCO support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/n/NCO)

  * [NCO support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/n/NCO)


### Version 5.01 for CPE 21.08

  * The EasyConfig is a mix of the CSCS and EasyBuilder ones, the latter having
    more dependencies and hence supporting more options.

  * For now we disable udunits2 as configure is complaining that udunits2 misses
    some XML data files.

  * The EasyBuilders recipe claims ESMF is needed but it is nowhere linked into the
    code so that dependency is omitted.


### 5.0.6 for CPE 21.12

  * Needed to compile with cray-libsci unloaded as that causes crashes.

  * The cpeAOCC version had problems initially due to the faulty aocc/3.1.0 module,
    requiring a further fix to cpeAOCC/21.12 to make the cray-hdf5 module available.

  * Note that at inspection of the log file you will see that the configure command
    complains that the XML data file is not found. This is because the test is wrong,
    not because the installation is wrong, as the test only looks in some fixed locations
    on the system that assume that UDUNITS-2 is installed in the system directories.


### Version 5.1.0 for CPE 22.06

  * This is a grivial port of the 5.0.6 one.
  
