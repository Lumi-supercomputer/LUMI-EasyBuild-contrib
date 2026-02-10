#!/bin/bash -l
#SBATCH -J lsdft
#SBATCH -p standard-g
#SBATCH -A project_462000008
#SBATCH --time=00:30:00
#SBATCH --nodes=4
#SBATCH --gres=gpu:8

export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_NUM_THREADS=6

ulimit -s unlimited
export OMP_STACKSIZE=512M

export MPICH_OFI_NIC_POLICY=GPU
export MPICH_GPU_SUPPORT_ENABLED=1

init-lumi-h
module load LUMI/25.03
module load partition/G
module load CP2K/2025.2-cpeGNU-25.03-rocm

# Approach: Linear GCDs, reorder the CCDs.
srun --nodes=4 --ntasks=32 \
     --cpu-bind=mask_cpu:7e000000000000,7e00000000000000,7e0000,7e000000,7e,7e00,7e00000000,7e0000000000 \
     ./select_gpu.sh \
     cp2k.psmp -i H2O-dft-ls.inp -o H2O-dft-ls.out
