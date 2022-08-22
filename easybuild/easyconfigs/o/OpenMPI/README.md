# Open MPI instructions

Note that we cannot fully support Open MPI on LUMI. Users should get
decent performance on LUMI-C, but despite including the rocm modules,
this is not a GPU-zware version of MPI as currently UCX is required
for that but not supported on the SlingShot 11 interconnect of
LUMI.

The primary MPI implementation on LUMI and the only one which we can
fully support remains the implementation profided by the cray-mpich
modules on top of libfabric as the communication library.

  * [Open MPI web site](https://www.open-mpi.org/)

  * [Open MPI on GitHub](https://github.com/open-mpi/ompi)
  
## EasyBuild

  * [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OpenMPI)
  
  * [Support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/o/OpenMPI)
  

### Version 4.1.2 for cpeGNU 22.06

  * A development specifically for LUMI.
  
    The main goal was to have mpirun available, but it can be used
    with containers with some care to ensure that the container indeed
    uses the libraries from this module, and turns out to give good
    enough performance on LUMI for most purposes. It is not GPU-aware 
    though so there is no direct GPU-to-GPU communication.
    

### Version 4.1.3 for cpeGNU 22.08

  * A simple port of the 4.1.2 recipe, with the same restrictions.

