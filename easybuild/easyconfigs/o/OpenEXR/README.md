# OpenEXR instructions

-   [OpenEXR web site](https://www.openexr.com/)

-   [OpenEXR technical documentation](https://openexr.readthedocs.io/en/latest/)

-   [OpenEXR GitHub](https://github.com/AcademySoftwareFoundation/openexr)

    -   [GitHub releases](https://github.com/AcademySoftwareFoundation/openexr/releases)


## EasyBuild

-   [OpenEXR support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OpenEXR)

-   There is no support for OpenEXR in the CSCS repository.

-   [OpenEXR (openbexr) support in Spack](https://spack.readthedocs.io/en/latest/package_list.html#openexr)


### Version 3.1.5 for cpeGNU/22.08

-   The EasyConfig is based on the 3.1.1 EasyBuilders one for GCCcore/11.2.0 (2021b)
    as that was the newest one available at the time of development. The version was
    bumped to the latest 3.1 release at the time of development to have all the
    bug fixes.
    
    Dependencies were updated to the ones we use in 22.08 which is mostly based
    on the 2022a common toolchains in EasyBuild.

-   Changed the library install directory to `lib` instead of `lib64` for consistency
    and added a more exztensive sanity check.

