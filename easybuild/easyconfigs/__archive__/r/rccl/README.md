# rccl instructions

RCCL is a stand-alone library of standard collective communication routines for GPUs,
implementing all-reduce, all-gather, reduce, broadcast, reduce-scatter, gather, scatter,
and all-to-all. There is also initial support for direct GPU-to-GPU send and receive
operations. It has been optimized to achieve high bandwidth on platforms using PCIe, 
xGMI as well as networking using InfiniBand Verbs or TCP/IP sockets. Plugins can be used
for other network architectures so LUMI users should have a look at the aws-ofi-rccl
plugin to extract the full performance out of the SlingShot 11 interconnect of LUMI.

As AMD sometimes uses upercase and sometimes lowercase letters, we had to make a choice
and went with lowercase letters for the module name.

-   [RCCL on GitHub](https://github.com/ROCmSoftwarePlatform/rccl)

    -   [GitHub releases](https://github.com/ROCmSoftwarePlatform/rccl/releases)


## EasyBuild

The RCCL EasyConfigs are a development of the LUST team.