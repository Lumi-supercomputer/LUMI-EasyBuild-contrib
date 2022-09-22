# aws-ofi-rccl instructions

This is a plug-in for the RCCL library to use libfabric as a network
provider in RCCL based applications. This plugin is essential to get
good bandwidth and scalability in RCCL applications on the SlingShot 11
interconnect of LUMI. It was originally developed for the AWS EC2
network infrastructure, hence its name.

The plug-in maps RCCLs connection-oriented transport 
APIs to libfabric's connection-less reliable interface. This allows RCCL 
applications to take benefit of libfabric's transport layer services like 
reliable message support and operating system bypass.

-   [GitHub for the plugin](https://github.com/ROCmSoftwarePlatform/aws-ofi-rccl)


## EasyBuild

The EasyConfigs are a development of the LUST team. As there are no release 
versions, we currently refer to commits.

