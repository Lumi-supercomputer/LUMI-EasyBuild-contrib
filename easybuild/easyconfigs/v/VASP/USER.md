[vasp]: https://www.vasp.at/
[lumi-c]: https://docs.lumi-supercomputer.eu/hardware/compute/lumic/
[lumi-g]: https://docs.lumi-supercomputer.eu/hardware/compute/lumig/
[eap]: https://docs.lumi-supercomputer.eu/hardware/compute/eap/
[slurm-quickstart]: https://docs.lumi-supercomputer.eu/runjobs/scheduled-jobs/slurm-quickstart/
[slurm-bindings]: https://docs.lumi-supercomputer.eu/runjobs/scheduled-jobs/distribution-binding#slurm-binding-options
[batch-job]: https://docs.lumi-supercomputer.eu/runjobs/scheduled-jobs/batch-job/
[EasyBuild]: https://docs.lumi-supercomputer.eu/software/installing/easybuild/

# VASP on LUMI

[VASP (Vienna Ab Initio Simulation Package)][vasp] is a popular software
package for "atomic scale materials modelling from first principles". In
general, it runs well on [LUMI-C][lumi-c].

**There is currently no version of VASP that can use the AMD GPUs in the [GPU
Early Access Platform][eap] or [LUMI-G][lumi-g].**

## Installing VASP

We provide automatic installation scripts for several versions of VASP. In
general, the installation procedure is described on the [EasyBuild
page][EasyBuild]. The step by step procedure to install VASP
6.4.2 is:

1. Download the VASP source code "vasp.6.4.2.tgz" from the [VASP portal][vasp].
2. Upload the file somewhere to your home directory on LUMI.
3. Load the LUMI software environment: `module load LUMI/23.09`.
4. Select the LUMI-C partition: `module load partition/C`.
5. Load the EasyBuild module: `module load EasyBuild-user`.

Then, you can run the install command:

```bash
$ eb --sourcepath=<directory-where-the-VASP-source-is-stored> VASP-6.4.2-cpeGNU-23.09-build02.eb -r
```

The installation process is quite slow. It will take about 20 minutes, but
afterwards, you will have a module called "VASP/6.4.2-cpeGNU-23.09" installed
in your home directory. Load the module to use it

```bash
$ module load VASP/6.4.2-cpeGNU-23.09-build02
```

The usual VASP binaries, `vasp_std`, `vasp_gam` etc. will now be in your
`PATH`. Launch VASP via the [Slurm scheduler][slurm-quickstart], e.g. `srun
vasp_std`. Please note that you must do `module load LUMI/22.12 partition/C` to
see the VASP module in the module system. The same applies to the Slurm batch
scripts which you send to the compute nodes.

You can see other versions of VASP that can be automatically installed in the
same way by running the EasyBuild command

```bash
$ eb -S VASP
```

or by checking the list further down this page 
or by checking the
[LUMI-EasyBuild-contrib](https://github.com/Lumi-supercomputer/LUMI-EasyBuild-contrib/tree/main/easybuild/easyconfigs/v/VASP)
repository on GitHub directly.

We build the VASP executables with bindings to several external libraries
activated: currently HDF5, Wannier90, DFTD4, and Libxc. There are also some patches
made to the reading of input files to less the load on the parallel file system.

## Description of the different VASP builds

There might be several installations of the same VASP version to choose from: `build01`, `build02` etc. For various reasons, it is often necessary to compile VASP in different ways for different users, for example with certain extra packages or to apply specific patches for LUMI.

* `VASP-5.4.4.pl2.build02-cpeGNU-22.08.eb`. This VASP has patches to read POTCAR files in read-only mode, which lessens the load on the LUMI parallel file systems. In some cases, VASP 5 could stall for 10 minutes at startup just reading input files.
* `VASP-6.3.2.build02-cpeGNU-22.08.eb`. VASP 6.3.2 with similar I/O patches to behave more nicely towards the parallel file system. We recommend that you use this version, especially if you work with HDF5 files in VASP. Passes the VASP test
* `VASP-6.4.1-cpeGNU-22.12-build01.eb`. VASP 6.4.1 release version built without any modifications. Passes the VASP test suite
* `VASP-6.4.1-cpeGNU-22.12-build02.eb`. VASP 6.4.1 with POTCAR and HDF5 I/O patches. Passes the VASP test suite
* `VASP-6.4.2-cpeGNU-23.09-build01.eb`. VASP 6.4.2 release version built without any modifications. Passes the VASP test suite
* `VASP-6.4.2-cpeGNU-23.09-build02.eb`. VASP 6.4.2 with POTCAR and HDF5 I/O patches. Passes the VASP test suite

## Example batch scripts

A typical VASP [batch job][batch-job] using 4 compute nodes and MPI only:

```bash
#!/bin/bash
#SBATCH -J GaAs512 
#SBATCH -N 4
#SBATCH --partition=small
#SBATCH -t 00:30:00
#SBATCH --mem=200G
#SBATCH --exclusive --no-requeue
#SBATCH -A project_XYZ
#SBATCH --ntasks-per-node=128
#SBATCH -c 1

export OMP_NUM_THREADS=1

module load LUMI/23.09 partition/C
module load VASP/6.4.2-cpeGNU-23.09-build02
srun vasp_std
```

A typical VASP batch job with MPI and 8 OpenMP threads per rank:

```bash
#!/bin/bash
#SBATCH -J GaAs512 
#SBATCH -N 4
#SBATCH --partition=small
#SBATCH -t 00:30:00
#SBATCH --mem=200G
#SBATCH --exclusive --no-requeue
#SBATCH -A project_XYZ
#SBATCH --ntasks-per-node=16
#SBATCH -c 8

export OMP_NUM_THREADS=8
export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_STACKSIZE=512m

module load LUMI/23.09 partition/C
module load VASP/6.4.2-cpeGNU-23.09-build02
srun vasp_std
```

## Tuning recommendations

!!! note
    Due to the restrictive license conditions imposed by the VASP group, which
    forbids sharing of any kind of benchmark numbers with anyone (including
    other licensed users!), we unfortunately cannot give detailed
    recommendations on the best way to run VASP.

* In general, try increasing `NCORE` to 16-32, and `NSIM` to 32.
* OpenMP works best with many threads, eg. `OMP_NUM_THREADS=8`. OpenMP works particularily well with exact exchange calculations.
* It is best to run with all 128 processor cores per compute node if you can,
  but reducing the number of cores per compute node does not decrease
  performance as much as you might expect. That can be useful when you are
  constrained by memory and need more available memory per MPI rank. It is
  important to explicitly [pin the MPI ranks to processor
  cores][slurm-bindings] if you
  run with less than 128 cores per node.
* If possible, use k-point parallelization `KPAR` up to the maxium number of
  k-points. It is often a good choice to use 1 compute node per k-point.
* We generally recommend using VASP version 6 when possible, and not VASP 5 (even though installation scripts are provided). VASP 5 on LUMI exhibits some problems with disk I/O, jobs may appear to hang for several minutes at launch before all input files are read and the calculation begins.

