# ANTLR instructions

This package is only needed for NCO. As of September 2021, there are no other
packages in the EasyBuilders repository that use it.

  * [Web site](https://www.antlr.org/)

  * [ANTLR version 4 on GitHub](https://github.com/antlr/antlr4)

However, NCO needs the latter antique ANTLR2 versions.

  * [Web site for ANTLR version 2](https://www.antlr2.org/)


## EasyBuild

  * [ANTLR support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/a/ANTLR)

  * [ANTLR support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/a/ANTLR)


### Version 2.7.7 for CPE 21.08, 21.12

  * Note that 2.7.7 is a very old version. NCO however does seem to require
    this very old version rather than the current version 4.

  * The EasyConfig is a mix of the CSCS and EasyBuilder ones.

      * For now we did not include Java as a dependency (it is included in the
        EasyBuilders version).
