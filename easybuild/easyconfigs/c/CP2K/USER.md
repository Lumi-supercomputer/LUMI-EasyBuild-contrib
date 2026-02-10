# CP2K on LUMI

[CP2K](https://www.cp2k.org/) is a quantum chemistry and solid state
physics software package that can perform atomistic simulations of solid state,
liquid, molecular, periodic, material, crystal, and biological systems. In
general, it runs well on LUMI-C and several of the simulation methods such as
LS-DFT and RPA calculations can utilize the GPUs on LUMI-G with some speed-up.

## Installing CP2K

We provide automatic installation scripts for several versions of CP2K. In
general, the installation procedure is described on the [EasyBuild
page](https://docs.lumi-supercomputer.eu/software/installing/easybuild/). 
For example, the step by step procedure for installing CP2K 2025.2 with ROCm 
support is:

1. Load the LUMI software environment: `module load LUMI/25.03`.
2. Select the LUMI-G partition as we want to use a GPU version: `module load partition/G`.
3. Load the EasyBuild module: `module load EasyBuild-user`.

Then you can run the install command

```bash
$ eb -r CP2K-2025.2-cpeGNU-25.03-rocm.eb
```

The installation process is quite slow. It can take up to 1 hour to compile
everything, but afterwards, you will have a module called 
`CP2K/2025.2-cpeGNU-25.03-rocm` installed in your home directory. Load the 
module to use it:

```bash
$ module load CP2K/2025.2-cpeGNU-25.03-rocm
```

The  CP2K binary `cp2k.psmp` will now be in your
`PATH`. Launch CP2K via the 
[Slurm scheduler](https://docs.lumi-supercomputer.eu/runjobs/scheduled-jobs/slurm-quickstart/), 
e.g. `srun cp2k.psmp`. Please note that you must do `module load LUMI/25.03 partition/G` to
see the CP2K module in the module system. The same applies to the Slurm batch
scripts which you send to the compute nodes.

You can see other versions of CP2K that can be automatically installed in the
same way by running the EasyBuild command

```bash
$ eb -S CP2K
```

or by checking the list further down this page 
or by checking the
[LUMI-EasyBuild-contrib](https://github.com/Lumi-supercomputer/LUMI-EasyBuild-contrib/tree/main/easybuild/easyconfigs/c/CP2K)
repository on GitHub directly.

We build the CP2K executables with bindings to several external libraries
activated: currently COSMA, SpLA, SpFFT, spglib, HDF5, LibXSMM, LibXC, FFTW3,
Libvori and hipFFT+hipBLAS from ROCm. 


## Example batch scripts

A typical CP2K batch job using 4 compute nodes on LUMI-C with 2 OpenMP thread
per rank, using the [CP2K H2O-256 benchmark](https://github.com/cp2k/cp2k/blob/master/benchmarks/QS/H2O-256.inp)
as an example:

```bash
#!/bin/bash
#SBATCH -J H2O
#SBATCH -N 4
#SBATCH --partition=small
#SBATCH -t 00:10:00
#SBATCH --mem=200G
#SBATCH --exclusive --no-requeue
#SBATCH -A project_46YXXXXXX
#SBATCH --ntasks-per-node=64
#SBATCH -c 2

export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

module load LUMI/25.03
module load partition/C
module load CP2K/2024.3-cpeGNU-25.03-CPU
srun cp2k.psmp -i H2O-256.inp -o H2O-256.out
```

Running on LUMI-G requires careful process binding to CPU and GPUs. Here, we 
run a batch job on 4 LUMI-G compute nodes with 8 MPI ranks (1 per GPU) and 6 
OpenMP threads per rank. Below an example using the 
[`H2O-dft-ls.inp` file](https://github.com/cp2k/cp2k/blob/master/benchmarks/QS_DM_LS/H2O-dft-ls.inp) from the
[CP2K "Quickstep Density Matrix Linear Scaling" benchmark](https://github.com/cp2k/cp2k/tree/master/benchmarks/QS_DM_LS).

```bash
#!/bin/bash
#SBATCH -J lsdft
#SBATCH -p standard-g
#SBATCH -A project_46YXXXXXX
#SBATCH --time=00:30:00
#SBATCH --nodes=4
#SBATCH --gres=gpu:8

export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

ulimit -s unlimited
export OMP_STACKSIZE=512M

export MPICH_OFI_NIC_POLICY=GPU
export MPICH_GPU_SUPPORT_ENABLED=1

module load LUMI/25.03
module load partition/G
module load CP2K/2025.2-cpeGNU-25.03-rocm

srun --nodes=4 --ntasks=32 \
     --cpu-bind=mask_cpu:7e000000000000,7e00000000000000,7e0000,7e000000,7e,7e00,7e00000000,7e0000000000 \
     ./select_gpu.sh \
     cp2k.psmp -i H2O-dft-ls.inp -o H2O-dft-ls.out
```

The `select_gpu.sh` helper script is useful to get the GPU to CPU binding correct on LUMI.

```bash
$ cat select_gpu.sh 
#!/bin/bash

export ROCR_VISIBLE_DEVICES=$SLURM_LOCALID
exec $*
```

Since the January 2026 system update, a simpler trick using `--cpu-bind` and `--gpu-bind` also works:

```bash
#!/bin/bash
#SBATCH -J lsdft
#SBATCH -p standard-g
#SBATCH -A project_46YXXXXXX
#SBATCH --time=00:30:00
#SBATCH --nodes=4
#SBATCH --gres=gpu:8

export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

ulimit -s unlimited
export OMP_STACKSIZE=512M

export MPICH_OFI_NIC_POLICY=GPU
export MPICH_GPU_SUPPORT_ENABLED=1

module load LUMI/25.03
module load partition/G
module load CP2K/2025.2-cpeGNU-25.03-rocm

srun --nodes=4 --ntasks=32 \
     --cpu-bind=mask_cpu:7e,7e00,7e0000,7e000000,7e00000000,7e0000000000,7e000000000000,7e00000000000000 \
     --gpu-bind=map:4,5,2,3,6,7,0,1 --gres-flags=allow-task-sharing \
     cp2k.psmp -i H2O-dft-ls.inp -o H2O-dft-ls.out
```

In the latter variant, we use a linear assignment of the CCDs, using 6 cores per CCD, and then map each to
the appropriate GCD with `--gpu-bind`. The option `--gres-flags=allow-task-sharing` is essential though as
otherwise intra-node communication does not work.

This script is useful for many applications using GPU on LUMI, not only CP2K.


## Tuning recommendations

-   In general, try to use parallelization using both MPI and OpenMP. Use at least
    `OMP_NUM_THREADS=2`, and when running larger jobs (say more than 16 compute
    nodes), it often faster with `OMP_NUM_THREADS=4/8`.

-   When running on LUMI-G, run using 8 MPI ranks per compute node, where each
    rank has access to 1 GPU in the same NUMA zone. This also means that you have
    to `OMP_NUM_THREADS=6-7` to utilize all CPU cores. Please note that using all
    64 cores will not work as the first core in each CCD is reserved for the
    operating system, so that only 56 cores are available.
