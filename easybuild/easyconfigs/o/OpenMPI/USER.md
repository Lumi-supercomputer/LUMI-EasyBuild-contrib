# Open MPI User Information

**Open MPI is currently provided as-is, without any support promise. It is not entirely
free of problems as Open MPI 4 was not really designed for the interconnect of LUMI
while Open MPI 5 requires software that is not yet on the system for security reasons.
Our only fully supported MPI implementaton on LUMI is HPE Cray MPICH as provided by
the `cray-mpich` module. We also do not intend to rebuild other software with 
Open MPI beyond what is needed for some testing.**

Open MPI has UCX as the preferred communication library, with OFI (libfabric) often
treated as a second choice, certainly when it comes to GPU support. On LUMI the 
use of the HPE Cray provided libfabric library is rather important, especially to
link to the libfabric provider for the Slingshot 11 network of LUMI. Currently
that libfabric+provider implementation is not entirely feature-complete so not all
routines that are not needed for Cray MPICH are provided. Hence we cannot exclude 
that there will be compatibility problems.


## Two builds from 4.1.6 onwards

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

1.  When starting a job on a single node, one gets a warning starting with

    ```
    Open MPI failed an OFI Libfabric library call (fi_domain).  This is highly
    unusual; your job may behave unpredictably (and/or abort) after this.
    ```

    So far it appears that this warning can be safely ignored. It is not entirely
    clear what the cause is. It may be related to the Slingshot network plugin
    of Slurm not initialising a virtual network interface as Cray MPICH doesn't
    use libfabric for intra-node communication.

It is not clear if or when these issues can be solved.
