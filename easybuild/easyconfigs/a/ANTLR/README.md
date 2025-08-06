# ANTLR instructions

This package is only needed for NCO. As of September 2021, there are no other
packages in the EasyBuilders repository that use it.

-   [Web site](https://www.antlr.org/)

-   [ANTLR version 4 on GitHub](https://github.com/antlr/antlr4)

However, NCO needs the latter antique ANTLR2 versions.

-   [Web site for ANTLR version 2](https://www.antlr2.org/)


## EasyBuild

-   [ANTLR support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/a/ANTLR)

-   [ANTLR support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/a/ANTLR)


### Version 2.7.7 for CPE 21.08, 21.12, 22.06, 22.08, 22.12, 23.03, 23.09

-   Note that 2.7.7 is a very old version. NCO however does seem to require
    this very old version rather than the current version 4.

-   The EasyConfig is a mix of the CSCS and EasyBuilder ones.

    -   For now we did not include Java as a dependency (it is included in the
        EasyBuilders version).

-   For 22.12 and later we switched to the new way of specifying multiple checksums
    and added the license file to the installation.

-   Checked the docs of NCO while developing 25.03 and it still requires ANTLR 2.7.7 
    and not the 3.0 version.
    
-   For 25.03, added Java as a dependency rather than relying on the system one as 
    we did the development in a container without Java.
