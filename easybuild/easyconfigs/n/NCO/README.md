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

  * Does not yet work. There are crashes in Cray BLAS.
