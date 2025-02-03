# singularity-AI-bindings user instructions.

## What is the module for?

LUMI offers a range of containers mostly for AI applications in /appl/local/containers:

-   Subdirectory `sif-images`: Link to the most recent version of a particular container.

-   Subdirectory `tested-containers`: Latest container builds, the content changes 
    all the time.
    
-   Subdirectory `easybuild-sif-images`: Copies of current and former containers from
    `tested-containers` to keep a more stable repository which is needed for the 
    EasyBuild modules that install containers and offer some extras (see, e.g.,
    the [PyTorch container](../../p/PyTorch)).
    
These containers use the CXI provider and MPI libraries from the system to guarantee
good performance for network communications through RCCL and MPI (also used by 
the Python package `mpi4py`). Furthermore, singularity on LUMI by default only gives you
access to your home directory, but not to your data in `/project`, `/scratch` and 
`/flash`. This module sets the environment variable `SINGULARITY_BIND` which instructs
singularity which files and directories from the system should be made available where
in the container and takes care binding the necessary files for CXI, MPI and full file
system access. 


## Install

In short, the module can be installed once to be available in all versions of the `CrayEnv` 
and `LUMI` stacks:

```
module load LUMI partition/container EasyBuild-user
eb singularity-AI-bindings-24.03.eb
```

The long: If you will install more user-installable software from the LUMI Software Library,
please check our [documentation on installing software with EasyBuild in the LUMI
documentation](https://docs.lumi-supercomputer.eu/software/installing/easybuild/).
