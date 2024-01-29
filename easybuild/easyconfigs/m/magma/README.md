# Magma

- [Magma web page](https://icl.utk.edu/magma/)
    

## EasyBuild

- [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/m/magma)

- [Support in the EasyBuilders CSCS](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/m/magma)


### Version 2.7.2 for CPE 23.09

- Created for LUMI with a patch to separate HIP and C++ compilation to allow
  linking to the OpenMP runtime corresponding to the PrgEnv used.

  The patch also uses the standard CMake way of setting the GPU architecture
  rather than the non-standard way used in Magma (which even had an outdated
  list of architectures).

- For CPE GNU and AMD, static and shared libraries are built.

- For CPE Cray, only the shared library is available.
  