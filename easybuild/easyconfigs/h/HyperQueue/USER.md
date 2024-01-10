# HyperQueue user information

[HyperQueue](https://it4innovations.github.io/hyperqueue/)
is software developed at LUMI-partner [IT4Innovations](https://www.it4i.cz/en).

It is a tool designed to simplify execution of large workflows on HPC clusters. 
It allows you to execute a large number of tasks in a simple way, without having 
to manually submit jobs into batch schedulers like PBS or Slurm. You just specify 
what you want to compute – HyperQueue will automatically ask for computational 
resources and dynamically load-balance tasks across all allocated nodes and cores.
Hence it is one of the tools that can be used to work around the strict limits for
the number of jobs for the Slurm scheduler on LUMI.

Besides the [user documentation](https://it4innovations.github.io/hyperqueue/)
you may also want to have a look at the 
[change log of the code](https://github.com/It4innovations/hyperqueue/blob/main/CHANGELOG.md)
as breaking changes do occur from time to time.


## Installation

HyperQueue requires Rust as a dependency. Hence each version has a preferred
version of the LUMI software stack. However, from HyperQueue 0.17.0 on, we try 
to build our Rust build recipes so that they can also be installed in other
than the intended versions of the LUMI stack, using a different version of the
buildtools that are needed to compile Rust. We have not tested those combinations
though.

As HyperQueue doesn't really benefit from processor-specific optimisations (and
Rust as a compiler isn't run frequently so doesn't really need it either) we
suggest the following slightly non-standard procedures to install HyperQueue:
To install in a LUMI software stack, use `partition/common`, and afterwards
HyperQueue will be available in all main partitions of the software stack with
just a single install.

E.g.,
HyperQueue 0.17.0 was tested specifically in LUMI/23.09 (as can be seen
if you open the EasyConfig via the links on this page). So one can install
it as follows:

``` bash
module load LUMI/23.09 partition/common
module load EasyBuild-user
eb HyperQueue-0.17.0.eb -r
```

This will also install the required version of the Rust compiler first which
is actually a rather time-consuming thing, so don't be surprised if the build
takes one hour.

After a successful installation, Rust and HyperQueue will be available in 
all partitions of the LUMI/23.09 stack. 

Installation of HyperQueue 0.17.0 or later may work in other versions of the
LUMI stack also but this has not been tested neither do we support it.
