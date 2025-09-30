# Open MPI instructions

Note that we cannot fully support Open MPI on LUMI. Users should get
decent performance on LUMI-C, but despite including the rocm modules,
this is not a GPU-aware version of MPI as currently UCX is required
for that but not supported on the SlingShot 11 interconnect of
LUMI.

The primary MPI implementation on LUMI and the only one which we can
fully support remains the implementation provided by the cray-mpich
modules on top of libfabric as the communication library. The Cray
MPICH implementation also contains some optimisations that are not
available in the upstream MPICH installation but are essential for
scalability in certain large runs on LUMI.

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

  * A simple port of the 4.1.2 recipe, with the same restrictions, but one
    addition to automatically detect the libfabric version so that it can
    still work after a system update that installs a new libfabric.

  * Later on the ROCm dependency which should not even have been there 
    was removed.


### Version 4.1.5 for cpeGNU 22.12

  * A straightforward port of the 4.1.3 EasyConfig.
  
  
### Version 4.1.6 for 23.09

  * The EasyConfig is heavily reworked, now also building a module that provides
    more help information.
    
    Two approaches were chosen:
    
      * The `-noCrayWrappers` modules provide MPI compiler wrappers that directly call
        the underlying compiler.
        
      * The regular modules provide MPI compiler wrappers that in turn call the 
        HPE Cray compiler wrappers so, e.g., adding target architecture options 
        should still work via the target modules.
        
    It doesn't really make sense to use the cpe\* toolchains, as cray-mpich and
    the MPI support in cray-libsci cannot be used. In fact, it is even better to
    unload cray-mpich (and required for the HPE Cray compile wrapper version) to 
    avoid that the wrong libraries are picked up.
    
  * Also added the license information to the installation.

  * We tried to extend the module to unload the Cray PE components that are 
    irrelevant or even damaging, but that didn't work as doing a load and unload of
    the same module in the same call to the module command does not work. This happens
    if the cpe* module is not yet loaded when loading the OpenMPI module.

### Experimental GPU support with 5.0.8 version for 24.03

  * There is EasyConfig with experimental support for ROCm (AMD GPUs) that uses custom
    dependencies:
   
      * Slinghost Host Software (SHS) elements with updated LibCXI
      * Recent OFI Libfabric release (v2.3.0) with the ROCm support
      * ROCm 6.2.2
 
   * it also requires careful build and runtime configuration:

      * there is no direct SLURM integration via `pmix` `mpi` plugin and programs need
        to be launched via `mpirun`

      * SLURM affinity bindings are not necessarily honored and one needs to apply mpirun
        specific bind options

      * There is experimental OFI provider used, LinkX, to allow intra-node shared memory
        communication along cxi network (Slingshot) for intra-node trnasfers

      * To run with the CXI provider only (network only) one needs to overwrite this 
        environmental variables:

           - `OMPI_MCA_opal_common_ofi_provider_include=cxi` for mpirun

           - moreover to allow multiple processes per node one needs to enable network VNIs
             using SLURM's job allocation option:

             `--network=single_node_vni`

       * To run interactively from existing SLURM jobstep one needs to allow OpenMPI daemon
         to overlap resources of actual allocation with environmental variable:

          - `PRTE_MCA_plm_slurm_args="--overlap --exact"`
        

     
