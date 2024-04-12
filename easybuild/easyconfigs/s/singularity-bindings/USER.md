# singularity-bindings modules

The aim of the `singularity-bindings` module is to generate the necessary
`SINGULARITYENV_LD_LIBRARY_PATH` and `SINGULARITY_BIND` environment variables
to ensure that a container that has been built with an MPI compatible with 
Cray MPICH, to use the Cray MPICH libraries from the container.

Some of the files injected by the module may conflict with other versions of
libraries already in the module. Therefore you may have to adapt the EasyBuild
recipe to the particular container that you are using.

This module should never be used together with containers for which we already
provide a module through EasyBuild, and in fact, it is also not usable to bind
Cray MPICH in the containers that we provide in `/appl/local/containers` as 
many of the libraries that the module created by the `singularity-bindings`
EasyConfigs are already included in the container to make life a bit easier.

As this module needs access to the right version of the cray-mpich-abi module,
which depends on the compiler, it is currently designed to work in a specific
LUMI software stack (whose version can be derived from the name of the 
EasyConfig). You can however do a user installation in `partition/common`
so that afterwards the module will be automatically available on all node
types (be available in `partition/L`, `partition/C` and `partition/G`).

E.g., for the `cpeGNU-23.09` EasyConfig(s), you'dload:

``` bash
module load LUMI/23.09 partition/common EasyBuild-user`
```

to install the module, and afterwards it would be available whenever
`LUMI/23.09` is loaded (unless you explicitly load a "special" partition
that is only meant to configure EasyBuild to install software in a 
particular way).
