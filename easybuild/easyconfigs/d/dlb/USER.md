# DLB on LUMI


## Installing DLB

The installation procedure is described on the [EasyBuild page](https://docs.lumi-supercomputer.eu/software/installing/easybuild/).
The step by step procedure to install DLB 3.6.1 is:

1. Load the LUMI software environment: `module load LUMI/25.03`.
2. Select the LUMI-C partition: `module load partition/C`.
3. Load the EasyBuild module: `module load EasyBuild-user`.


Then, you can run the install command:

```bash
$ eb -r dlb-3.6.1-cpeGNU-25.03.eb
```

The installation takes a few minutes. Afterwards, you will have a module
called "dlb/3.6.1-cpeGNU-25.03" installed in your home directory.
Load the module to use it:

```bash
$ module load dlb/3.6.1-cpeGNU-25.03
```

The dlb binaries will now be in your `PATH`. Launch `dlb --help` to
check the current configuration options.


You can see other versions of DLB that can be automatically installed by running
the EasyBuild command:

```bash
$ eb -S dlb
```

or checking the list further down this page.
<!-- USER.md is processed in the LUMI Software Library, but you won't see the list in GitHub -->


## TALP example (MPI + OpenMP profiling)

TALP is a low-overhead performance profiling tool integrated within DLB,
designed to collect detailed runtime metrics from applications that use MPI and
OpenMP. To enable the collection of OpenMP-specific metrics, the target program
must be linked against LLVM-based OpenMP runtime. If the application is built
with non-LLVM OpenMP runtimes (such as the GNU implementation), TALP will
still capture MPI-related metrics but will not provide OpenMP performance data.

A typical batch job of a hybrid MPI+OpenMP application:

```bash
#!/bin/bash -l
#SBATCH --job-name=examplejob   # Job name
#SBATCH --output=examplejob.o%j # Name of stdout output file
#SBATCH --error=examplejob.e%j  # Name of stderr error file
#SBATCH --partition=standard    # partition name
#SBATCH --nodes=2               # Total number of nodes
#SBATCH --ntasks-per-node=16    # Number of mpi tasks per node
#SBATCH --cpus-per-task=8       # Number of cores (threads) per task
#SBATCH --time=1-12:00:00       # Run time (d-hh:mm:ss)
#SBATCH --account=project_<id>  # Project for billing


module load LUMI/25.03
module load partition/C
module load dlb/3.6.1-cpeCray-25.03

# Set DLB options
export DLB_ARGS="--talp --ompt --talp-openmp"
dlb_preload="$EBROOTDLB/lib/libdlb_mpi.so"

# Set the number of threads based on --cpus-per-task
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Launch application preloading DLB
srun env LD_PRELOAD="$dlb_preload" ./your_application
```

With the options shown above, TALP will generate a summary at the end of
execution showing the POP performance metrics. For additional output formats and
customization options, refer to the documentation.

## TALP example (MPI + GPU profiling)

Since DLB version 3.6.0, TALP can also profile GPU metrics when used with ROCm
6.2 or later. The provided EasyBuild recipes already include support for ROCm:

```bash
#!/bin/bash -l
#SBATCH --job-name=examplejob   # Job name
#SBATCH --output=examplejob.o%j # Name of stdout output file
#SBATCH --error=examplejob.e%j  # Name of stderr error file
#SBATCH --partition=standard-g  # partition name
#SBATCH --nodes=2               # Total number of nodes
#SBATCH --ntasks-per-node=8     # Number of mpi tasks per node
#SBATCH --gpus-per-node=8       # Allocate one gpu per MPI rank
#SBATCH --time=1-12:00:00       # Run time (d-hh:mm:ss)
#SBATCH --account=project_<id>  # Project for billing


module load LUMI/25.03
module load partition/G
module load dlb/3.6.1-cpeCray-25.03

# Set DLB options
export DLB_ARGS="--talp --plugin=rocprofiler-sdk"
dlb_preload="$EBROOTDLB/lib/libdlb_mpi.so"

# Launch application preloading DLB
srun <binding options> env LD_PRELOAD="$dlb_preload" ./your_application
```
