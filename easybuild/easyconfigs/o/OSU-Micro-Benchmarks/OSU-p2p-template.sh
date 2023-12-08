#! /bin/bash
#SBATCH --job-name=OSU-p2p
#SBATCH --partition=standard
#SBATCH --exclusive
#SBATCH --nodes=2
#SBATCH --hint=nomultithread
#SBATCH --time=10:00
#SBATCH --output=%x-%j.txt
#SBATCH --error=%x-errors-%j.txt

# Number of threads per process for threaded tests.
# Note that twice the  number should fit in a node.
nr_threads=16

#
# Print the job script
#
echo -e "Case run:\n"
cat $0
echo -e "\n\n##########\n\n"

#
# Initialise the modules
#
ml LUMI/%toolchainversion% partition/C
ml lumi-CPEtools/%CPEtoolsversion%-%toolchain%-%toolchainversion%%suffix%
ml OSU-Micro-Benchmark/%OSUversion%-%toolchain%-%toolchainversion%%suffix%%cleanup%

echo -e "\nLoaded modules:\n"
module list 2>&1
#
# Check the distribution
#
echo -e "\n##########\n\nSingle-threaded tests between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 mpi_check -r
echo -e "\nSingle-threaded tests in a node:\n"
srun -N 1 -n 2 -c 1 mpi_check -r

#
# Single-threaded latency test
#
echo -e "\nOSU latency test osu_latency between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_latency
echo -e "\nOSU latency test osu_latency in a node:\n"
srun -N 1 -n 2 -c 1 osu_latency

#
# Single-threaded bandwidth test
#
echo -e "\nOSU bandwidth test osu_bw between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_bw
echo -e "\nOSU bandwidth test osu_bw in a node:\n"
srun -N 1 -n 2 -c 1 osu_bw

#
# Single-threaded bidirectional bandwidth test
#
echo -e "\nOSU bidirectional bandwidth test osu_bibw between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_bibw
echo -e "\nOSU bidirectional bandwidth test osu_bibw in a node:\n"
srun -N 1 -n 2 -c 1 osu_bibw

#
# Check the distribution
#
export OMP_NUM_THREADS=$nr_threads
export OMP_PLACES=cores
export OMP_PROC_BIND=close
echo -e "\n##########\n\nMulti-threaded tests with $OMP_NUM_THREADS threads per process, between nodes:\n"
srun -n 2 -c $OMP_NUM_THREADS --ntasks-per-node=1 hybrid_check -r
echo -e "\nMulti-threaded tests with $OMP_NUM_THREADS threads per process, in a node:\n"
srun -N 1 -n 2 -c $OMP_NUM_THREADS hybrid_check -r

#
# Multi-threaded latency test
#
echo -e "\nOSU latency test osu_latency between nodes (multithreaded $OMP_NUM_THREADS:$OMP_NUM_THREADS):\n"
srun -n 2 -c $OMP_NUM_THREADS --ntasks-per-node=1 osu_latency_mt -t $OMP_NUM_THREADS:$OMP_NUM_THREADS
echo -e "\nOSU latency test osu_latency in a node (multithreaded $OMP_NUM_THREADS:$OMP_NUM_THREADS):\n"
srun -N 1 -n 2 -c $OMP_NUM_THREADS osu_latency_mt -t $OMP_NUM_THREADS:$OMP_NUM_THREADS

