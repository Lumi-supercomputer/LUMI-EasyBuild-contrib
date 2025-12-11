# Yambo technical information

-   [Yambo web site](http://www.yambo-code.org)

-   [Yambo on GitHub](https://github.com/yambo-code/yambo)

    -   [GitHub releases](https://github.com/yambo-code/yambo/releases)
    
    -   [GitHub tags for subreleases](https://github.com/yambo-code/yambo/tags)
    

## EasyBuild

-   [Support for Yambo in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/y/Yambo)

-   [Support for Yambo in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/y/Yambo)

-   [Spack support for Yambo](https://packages.spack.io/package.html?name=yambo)


### 5.2.3 for CPE 23.09 and 24.03, CPU-only

-   The EasyConfig is mostly a LUST development.


### 5.2.4 for CPE 25.03, CPU-only

-   The EasyConfig is a trivial port of the 5.2.3 EasyConfig in 24.03

-   Yambo 5.3.0 was available at that time, but not supported in either Spack or EasyBuild,
    and there were issues with the installation of the internal DeviceXlib, which was not
    properly compiled, so we cannot offer this version at the moment.
    
    Yambo 5.3.0 is also the first version using this library, so it comes as no surprise 
    that we didn't see simimal issues in previous versions of Yambo.
