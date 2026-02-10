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
