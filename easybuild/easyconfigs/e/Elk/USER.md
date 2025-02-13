[elk]: https://elk.sourceforge.net
[lumi-c]: https://docs.lumi-supercomputer.eu/hardware/lumic/
[lumi-g]: https://docs.lumi-supercomputer.eu/hardware/lumig/
[slurm-quickstart]: https://docs.lumi-supercomputer.eu/runjobs/scheduled-jobs/slurm-quickstart/
[batch-job]: https://docs.lumi-supercomputer.eu/runjobs/scheduled-jobs/batch-job/
[EasyBuild]: https://docs.lumi-supercomputer.eu/software/installing/easybuild/

# Elk on LUMI

[Elk][elk] is "an all-electron full-potential linearised augmented-planewave (FP-LAPW) code. Designed to be as developer friendly as possible so that new developments in the field of density functional theory (DFT) can be added quickly and reliably.". Elk can be run on [LUMI-C][lumi-c].

**There is currently no version of Elk that can use the AMD GPUs
in the [LUMI-G][lumi-g].**

## Installing Elk

We provide automatic installation scripts for several versions of Elk. In
general, the installation procedure is described on the [EasyBuild
page][EasyBuild]. The step by step procedure to install Elk 10.3.12
is:

1. Load the LUMI software environment: `module load LUMI/24.03`.
2. Select the LUMI-C partition: `module load partition/C`.
3. Load the EasyBuild module: `module load EasyBuild-user`.

Then, you can run the install command

```bash
$ eb -r Elk-10.3.12-cpeGNU-24.03.eb
```

The installation takes about 3 minutes. Afterwards, you will have a module
called "Elk/10.3.12-cpeGNU-24.03" installed in your home directory.
Load the module to use it

```bash
$ module load Elk/10.3.12-cpeGNU-24.03
```

The main Elk binary, `elk`, as well as the `spacegroup` and `eos` utility programs
will now be in your `PATH`. Launch Elk via the [Slurm scheduler][slurm-quickstart]
with `srun elk`. Please note that you must do `module load LUMI/24.03 partition/C`
to see your Elk module in the module system. The same applies to the Slurm batch
scripts which you send to the compute nodes.

You can see other versions of Elk that can be automatically installed by running
the EasyBuild command

```bash
$ eb -S Elk
```

or checking the list further down on this page

## Example batch script

A typical [batch job][batch-job] with 16 MPI ranks per node and 8 OpenMP threads per rank:

```bash
#!/bin/bash
#SBATCH -A project_XYZ
#SBATCH -J elkjob
#SBATCH -p standard
#SBATCH -t 10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=8

ml LUMI/24.03
ml Elk/10.3.12-cpeGNU-24.03

export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK
export OMP_NUM_THREADS=8
export OMP_PLACES=cores
export OMP_PROC_BIND=false
export OMP_STACKSIZE=256M
ulimit -Ss unlimited

echo "Script initiated at `date` on `hostname`"
srun elk > out.log
echo "Script finished at `date` on `hostname`"
```

## Species files, example input files, and Elk make.inc file.

Elk species files and example input files can be found
in the directories
```bash
$EBROOTELK/species
$EBROOTELK/examples
```
For the case that you would like to build a custom version
of Elk, you can find the Elk `make.inc` file which was generated
when building with EasyBuild at
```bash
$EBROOTELK/make.inc
```
