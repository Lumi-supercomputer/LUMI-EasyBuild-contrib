# Open MPI User Information

**Open MPI is currently provided as-is, without any support promise. It is not entirely
free of problems as Open MPI 4 was not really designed for the interconnect of LUMI
while Open MPI 5 requires software that is not yet on the system for security reasons
for optimal integration with Slurm, and needs a custom libfabric library and CXI provider.
Our only fully supported MPI implementaton on LUMI is HPE Cray MPICH as provided by
the `cray-mpich` module. We also do not intend to rebuild other software with 
Open MPI beyond what is needed for some testing.**

Open MPI has UCX as the preferred communication library, with OFI (libfabric) often
treated as a second choice, certainly when it comes to GPU support. On LUMI the 
use of a HPE Cray provided libfabric library is rather important, especially to
link to the libfabric provider for the Slingshot 11 network of LUMI. Currently
that default libfabric+provider implementation is not entirely feature-complete so not all
routines that are not needed for Cray MPICH are provided. Hence we cannot exclude 
that there will be compatibility problems. For Open MPI 5, a special version is used
but that too is a relatively early release with specific features for Open MPI 5.


## Two Open MPI 4 builds from 4.1.6 onwards

Building Open MPI in the cpe\* toolchains may seem to make no sense as the MPI
module loaded by those toolchains cannot be used, and neither can the MPI
routines in LibSci. However, as it is a lot of work to set up specific toolchains
without Cray MPICH (or possibly even LibSci and other PE modules), we've 
chosen to still use the cpe\* toolchains and then unload certain modules.

-   The `-noCrayWrappers` modules provide MPI compiler wrappers that directly call
    the underlying compiler.
        
-   The regular modules provide MPI compiler wrappers that in turn call the 
    HPE Cray compiler wrappers so, e.g., adding target architecture options 
    should still work via the target modules.

Note that as a user of these modules you will have to unload some modules manually
after loading the OpenMPI module. Failing to do so may result in wrong builds of
software. However, due to LMOD limitations it was not possible to automate this.


## Known issues

1.  When starting a job on a single node with Open MPI 4, one gets a warning starting with

    ```
    Open MPI failed an OFI Libfabric library call (fi_domain).  This is highly
    unusual; your job may behave unpredictably (and/or abort) after this.
    ```

    Slurm on LUMI does not initialise a virtual network interface for a job step
    that uses only one node, as Cray MPICH will never use it. However, Open MPI 
    relies on libfabric also for intra-node communication and does check the network
    interface, leading to this message. It can be safely ignored, but you can also 
    get rid of it by using the `--network=single_node_vni` flag with `srun`.
    (The Cray documentation says that there are cases where 
    `--network=single_node_vni,job_vni,def_tles=0` is needed but we haven't seen such
    cases yet.)

It is not clear if or when these issues can be solved.
