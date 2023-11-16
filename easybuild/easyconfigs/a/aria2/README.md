# aria2 instructions

-   [aria2 web page](https://aria2.github.io/)
    

## EasyBuild

-   [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/a/aria2)

-   There is no support in the CSCS repository


### Version 1.35.0 for CPE 21.12

-   Adapted from the EasyBuilders EasyConfig.


### Version 1.36.0 for CPE 22.06 and 22.08

-   Switched back to using dependencies build with EasyBuild just to
    be sure but otherwise a trivial upgrade.

-   There is extensive testing during the build process that can take 7 
    minutes or more.

-   Some extensions to the sanity checks.

-   For 23.09: The tests fail in a way that the testing does not continue, but it 
    is not clear what the cause is. The program may only be partially functional.
    Testing is now disabled so that it builds at least.
