# Scalasca

  * [Scalasca web site](http://www.scalasca.org/)

Scalasca is a software tool that supports the performance optimization of
parallel programs

## EasyBuild support

-   [Scalasca support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/s/Score-P)

-   [Scalasca support in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/s/Score-P)

-   [Scalasca support in the JSC repository](https://github.com/easybuilders/JSC/tree/2024/Golden_Repo/s/Scalasca)


### Version 2.6.1 for CPE 23.09

-   The EasyConfig was contributed by Jan André Reuter of JSC and based on their
    EasyConfigs.


### Version 2.6.1 for CPE 24.03

-   Reuse of EasyConfig for CPE 23.09.


### Version 2.6.2 for CPE 24.03

-   Mostly a bugfix release. We omitted the message about Score-P for now.

-   Needed to unload `craype-accel-amd-gfx90a` for the cpeCray build as otherwise compilation
    failed. (This effectively turns off OpenMP offload when OpenMP is enabled.)
