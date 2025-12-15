# SAMtools installation instructions

-   [SAMtools web site](http://www.htslib.org/)

-   [SAMtools on GitHub](https://github.com/samtools/samtools)


## General information

-   Note that some time ago SAMtools was split in three different packages
    -   HTSlib
    -   SAMtools itself
    -   BCFtools
-   SAMtools contains a number of binaries, a static libraries, several Perl
    scripts but also two LUA scripts.


## EasyConfigs


-  [Support for SAMtools in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/master/easybuild/easyconfigs/s/SAMtools).
   The support uses an EasyBlock that installs a library and include file that are
   not installed by `make install`.

-   There is no support for SAMtools in the CSCS repository.


### Version 1.14 for cpeGNU 21.12

-   The EasyConfig is based on the one from the 2021b toolchain of the
    EasyBuilders repository. HTSlib was added as a dependency though,
    something that is done in the UAntwerpen version and it does show
    up in ``samtools version``.


### Version 1.15.1 for cpeGNU 21.12

-   Trivial version bump, but we now also unload a few modules that are
    not needed for compilation, just in case that would solve some problems
    detected on LUMI.
   
   
### Version 1.15.1 for CPE 22.06 and 22.08

-   Cleaned up dependencies and removed those that are pulled in through
    HTSlib.
    
-   Did another check of the configure options.


### Version 1.17 for cpeGNU 22.12

-   Trivial port of the 1.15.1 EasyConfig.


### Version 1.18 from CPE 23.09 on

-   Trivial port of the 1.18 EasyConfig.


### Version 1.20 for 24.03

-   Trivial port of the EasyConfig of 1.18 for 23.09.


### Version 1.22.1 for 25.03

-   Trivial port of the EasyConfig of 1.20 for 24.03, but needed to point
    explicitly to ncurses.
