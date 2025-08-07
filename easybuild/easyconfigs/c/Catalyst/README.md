# Catalyst technical information

Catalyst is an in situ visualization framework created as part
of ParaView.

-   [Catalyst on the kitware GitLab](https://gitlab.kitware.com/paraview/catalyst/)

    -   [GitLab releases](https://gitlab.kitware.com/paraview/catalyst/-/tags)
    

## EasyBuild

-   There is no support for Catalyst in the EasyBuilders repository.

-   [Support for Catalyst in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/c/Catalyst)

-   [Support for Catalyst in the JSC repository](https://github.com/easybuilders/JSC/tree/2025/Golden_Repo/c/Catalyst)

-   [libcatalyst package in Spack](https://packages.spack.io/package.html?name=libcatalyst)


### Version 2.0.0 for cpeGNU/24.03 and 25.03

-   The EasyConfig is derived from the JSC ones with changes for LUMI.

!!! Note "Not sure if the Python integration works..."

    We could not test due to lack of proper documentation, but something we would expect
    would work does not.
