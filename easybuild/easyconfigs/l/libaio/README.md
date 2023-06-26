# libaio instructions

-   [libaio home page](https://pagure.io/libaio)

    -   [libaio releases](https://pagure.io/libaio/releases)


## EasyBuild

-   [libaio support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/libaio)

-   There is no support for libaio in the CSCS repository.

-   [Spack support for libaio](https://spack.readthedocs.io/en/latest/package_list.html#libaio)


### Version 0.3.113 for 22.12/23.03

-   The EasyConfig is derived from the 2022b one in the EasyBuilders repository.

-   Extensions: include license information, and install the manual pages.

-   The toolchain option for position-independent code is not needed as that is
    already hardcoded in the Makefile.

-   A version compiled with the SYSTEM toolchain is also included for just in case.
