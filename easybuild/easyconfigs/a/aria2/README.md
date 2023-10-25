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

-   As of July 2023, the testing step fails. There is one error in the log 
    where it is not clear if it is the result of one of the other errors or not.
    But the log file also contains errors in `LpdMessageDispatcherTest.cc` and
    `LpdMessageReceiverTest.cc`, and inspection of the code indicates that those
    routines try to communicate with an external service that may no longer exist.
