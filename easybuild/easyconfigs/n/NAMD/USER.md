# NAMD user instructions

NAMD requires signing up for a license before you can get access to the
sources. Hence EasyBuild cannot download the sources itself and you will
have to provide the source tarball to EasyBuild.

To download and install NAMD:

1.  Downloads can be found on the 
    ["Software Downloads" page of the NAMD web site](https://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD).
    
2.  Look for the version that corresponds with the EasyConfig version and
    download via the "Source Code" link. This will ask you to log in and
    offer you the opportunity to register if you haven't done so yet.
    
    You'll have to do that from your desktop.
    
3.  On LUMI, create a temporary directory somewhere (e.g., in your home directory)
    and upload the NAMD sources to that directory.
    
    Alternatively you can put the sources in the
    `$EBU_USER_PREFIX/sources/n/NAMD` subdirectory (assuming you are using that 
    environment variable to point to your EasyBuild installation, otherwise this
    would be `$HOME/EasyBuild/sources/n/NAMD`).
    
4.  You're now ready to start the installation. Make sure that your EasyBuild
    environment is set up properly and load the suitable `LUMI` and `partition`
    modules and the `EasyBuild-user` module.
    
    From within the temporary directory in which you put the source tarball,
    run the `eb` command using the flag `-r .` which tells EasyBuild to also consider
    the current directory for EasyConfigs and source files. Eg.g, to install 
    NAMD with the `NAMD-2.14-cpeGNU-22.08-MPI.eb` recipe, execute:
    
    ```
    eb NAMD-2.14-cpeGNU-23.09-MPI.eb -r .
    ```

## NAMD with AMD GPU support

There are two specific NAMD recipes enabling support for AND GPUs. These easyconfigs
allow installation of NAMD3 with different modes of GPU acceleration:

*  GPU offload: offloads most of the force calculations to GPU devices and runs the 
   other calculations on CPU; this version runs with MPI and multi-threading.

*  GPU resident: calculates the entire dynamics calculations on GPU; this version 
   only works on a single GPU node with multi-threading.

For more details on GPU support please refer to [the NAMD GPU Acceleration](https://www.ks.uiuc.edu/Research/namd/3.0.2/ug/node102.html).
