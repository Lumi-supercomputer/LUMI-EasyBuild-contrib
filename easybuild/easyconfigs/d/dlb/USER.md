# DLB on LUMI


## Installing DLB

The installation procedure is described on the [EasyBuild page][EasyBuild].
The step by step procedure to install DLB 3.5.3 is:

1. Load the LUMI software environment: `module load LUMI/24.03`.
2. Select the LUMI-C partition: `module load partition/C`.
3. Load the EasyBuild module: `module load EasyBuild-user`.


Then, you can run the install command:

```bash
$ eb -r dlb-3.5.3-cpeGNU-24.03.eb
```

The installation takes about a minute. Afterwards, you will have a module
called "dlb/3.5.3-cpeGNU-24.03" installed in your home directory.
Load the module to use it:

```bash
$ module load dlb/3.5.3-cpeGNU-24.03
```

The dlb binaries will now be in your `PATH`. Launch `dlb --help` to
check the current configuration options.


You can see other versions of DLB that can be automatically installed by running
the EasyBuild command:

```bash
$ eb -S dlb
```

or checking the [LUMI-EasyBuild-contrib](DLB-LUMI-EasyBuild-contrib)
repository on GitHub directly.


## TALP example

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


module load LUMI/24.03
module load partition/C
module load dlb/3.5.3-cpeCray-24.03

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


[EasyBuild]: https://docs.lumi-supercomputer.eu/software/installing/easybuild/
[DLB-LUMI-EasyBuild-contrib]: https://github.com/Lumi-supercomputer/LUMI-EasyBuild-contrib/tree/main/easybuild/easyconfigs/d/dlb
