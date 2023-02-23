# p7zip technical documentation

The p7zip package is a port to Linux of the 7zip compression tools
that originally only worked for Windows (though that team has
also made a Linux port by now).

-   [p7zip on GitHub](https://github.com/p7zip-project/p7zip)

    -   [GitHub releases](https://github.com/p7zip-project/p7zip/releases)

-   [p7zip web page on Sourceforge](https://p7zip.sourceforge.net/) from
    which the above configuration is forked.

    -   [p7zip file repository on SourceForge](https://sourceforge.net/projects/p7zip/)
    
-   [Original 7zip web site](https://www.7-zip.org/)    

-   [ORiginal 7zip on SourceForge](https://sourceforge.net/projects/sevenzip/)


## EasyBuild

-   [Support for p7zip in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/p7zip)

-   There is no support for p7zip in the CSCS repository.

-   [Support for p7zip in Spack](https://spack.readthedocs.io/en/latest/package_list.html#p7zip)

    Spack is also using the same fork as EasyBuilders from version 17 on.


### Version 17.05

-   We started from the EasyBuilders EasyConfig with some additional
    documentation added to it from a UAntwerpen EasyConfig.
    
-   Switched to the SYSTEM toolchain to also use the tool in CrayEnv.

-   The documentation with build instructions is confusing. At one
    place it tells to copy the architecture-specific makefile to
    `makefile.linux`, while at other places it tells to copy to
    `makefile.machine. 
    
    Some analysis shows that `makefile` includes `makefile.common`
    which then includes `makefile.machine` so the EasyConfig was
    modified to copy to `makefile.machine` (with the original copy
    left in just in case we misinterpreted something).

-   Added testing which was not done in the original EasyBuilders
    EasyConfig. It actually turns out that two of the executables do
    not pass all tests. Unfortunately tests fail at the first error
    so it is not possible to assess how broken the executables are.
    