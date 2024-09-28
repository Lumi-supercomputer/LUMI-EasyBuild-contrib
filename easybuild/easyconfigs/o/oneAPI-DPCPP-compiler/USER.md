# Intel oneAPI Data Parallel C++ Compiler user instructions

The package includes the Intel oneAPI Data Parallel C and C++ compilers and
the Codeplay plugin for AMD GPU.

!!! warning "Purpose of this package"

    The purpose of this package is to provide the Intel SyCL toolchain. It is
    not a replacement for the Intel compiler. A such, it does not include the
    Intel Fortran compiler, the MKL libraries and Intel MPI.

## Installation

The first step is to prepare your environment for an EasyBuild installation as
[described here](https://docs.lumi-supercomputer.eu/software/installing/easybuild/#preparation-set-the-location-for-your-easybuild-installation). 
Once this setup is done, the package can be installed with the commands:

```
module load LUMI/24.03
module load partition/common
module load EasyBuild-user

eb oneAPI-DPCPP-compiler-2024.2.1.eb
```

## Usage

The installation includes a wrapper script that mimics a limited set of features 
of the Cray compiler wrapper:

  - automatic addition of the MPI compile and linking flags, disabled by loading the `craype-network-none` module
  - automatic addition of the `-march=<target>` flag depending on the `craype-x86-*` module loaded
  - automatic addition of the SyCL GPU target flags depending on the `craype-accel-*` module loaded

The MPI library you will link against depend programming environment loaded at
the time of compilation. The commands to use to set up your environment and compile
a SyCL code are presented below.

=== "Cray"

    By loading the `PrgEnv-cray` module, the wrapper will use the MPI library 
    compiled for the Cray compilers (`libmpi_cray`):

    ```
    module load LUMI/24.03
    module load partition/G
    module load PrgEnv-cray
    module load oneAPI-DPCPP-compiler
    
    icpx -fsycl -o <output_exec> <source.cpp>
    ```

=== "GNU"

    By loading the `PrgEnv-gnu` module, the wrapper will use the MPI library 
    compiled for the GNU compilers (`libmpi_gnu`):

    ```
    module load LUMI/24.03
    module load partition/G
    module load PrgEnv-gnu
    module load oneAPI-DPCPP-compiler
    
    icpx -fsycl -o <output_exec> <source.cpp>
    ```

=== "No MPI"

    If your code doesn't require MPI, you can disable it by loading the
    `craype-network-none` module:

    ```
    module load LUMI/24.03
    module load partition/G
    module load craype-network-none
    module load oneAPI-DPCPP-compiler
    
    icpx -fsycl -o <output_exec> <source.cpp>
    ```

In the example above, we load the `partition/G` module load the appropriate 
target modules for LUMI-G. This includes the `craype-accel-amd-gfx90a` module 
which will lead to the wrapper adding the flags:

```
-fsycl-targets=amdgcn-amd-amdhsa \
-Xsycl-target-backend=amdgcn-amd-amdhsa \
--offload-arch=gfx90a
```

The `gfx90a` target module also cause the wrapper to add the necessary flags


???+ note "Additionnal options for the wrapper"

    The wrapper script can be disabled by exporting:

    ```
    export LUMI_DPCPP_BYBASS_WRAPPER=1
    ```

    You can enable verbose output by exporting:

    ```
    export LUMI_DPCPP_VERBOSE_WRAPPER=1
    ```
    
    Be careful when enabling verbose output, it can cause configure scripts to
    fail.

## Linking against the LUMI software stack

Linking code compiled with the Intel compiler against `cpeGNU` and `cpeCray`
librairies of the software stack should be fine as long as these libraries and 
your code don't use OpenMP for multithreading. The same is true for the
libraries provided by Cray (`cray-libsci`, `cray-fftw`) as long as you don't use
the `_mp` variant of these libraries.