# aws-ofi-nccl technical information

This plugin is the successor the [aws-ofi-rccl](../aws-ofi-rccl/index.md) plugin, 
with the same code now supporting both NCCL and RCCL.

-   [aws-ofi-nccl on GitHub](https://github.com/aws/aws-ofi-nccl)


## EasyBuild

The EasyConfigs build on the ones LUST developed for aws-ofi-rccl.

The critical element is to figure out which versions of the plugin work with which versions
of libfabric.


### 1.18.0

The EasyConfig is a LUST development, suited for the system after the January 2026 system update.


### 1.20.0

-   Straightforward version bump of the 1.18.0 EasyConfig.

-   Tested with the 26.03 ccpe container after the January 2026 system update and may no longer
    work after the January 2027 system update as libfabric may be updated.
