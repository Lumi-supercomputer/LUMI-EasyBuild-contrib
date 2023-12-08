#! /bin/bash
#SBATCH --job-name=OSU-1sided
#SBATCH --partition=standard
#SBATCH --exclusive
#SBATCH --nodes=2
#SBATCH --hint=nomultithread
#SBATCH --time=10:00
#SBATCH --output=%x-%j.txt
#SBATCH --error=%x-errors-%j.txt

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
ml OSU-Micro-Benchmarks/%OSUversion%-%toolchain%-%toolchainversion%%suffix%%cleanup%

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
# Single-threaded put latency test
#
echo -e "\nOSU one-sided put latency test osu_put_latency between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_put_latency
echo -e "\nOSU one-sided put latency test osu_put_latency in a node:\n"
srun -N 1 -n 2 -c 1 osu_put_latency

#
# Single-threaded get latency test
#
echo -e "\nOSU one-sided get latency test osu_get_latency between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_get_latency
echo -e "\nOSU one-sided get latency test osu_get_latency in a node:\n"
srun -N 1 -n 2 -c 1 osu_get_latency

#
# Single-threaded one-sided put bandwidth test
#
echo -e "\nOSU one-sided put bandwidth test osu_put_bw between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_put_bw
echo -e "\nOSU one-sided put bandwidth test osu_put_bw in a node:\n"
srun -N 1 -n 2 -c 1 osu_put_bw

#
# Single-threaded one-sided get bandwidth test
#
echo -e "\nOSU one-sided get bandwidth test osu_get_bw between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_get_bw
echo -e "\nOSU one-sided get bandwidth test osu_get_bw in a node:\n"
srun -N 1 -n 2 -c 1 osu_get_bw

#
# Single-threaded bidirectional bandwidth test
#
echo -e "\nOSU one-sided put bidirectional bandwidth test osu_put_bibw between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_put_bibw
echo -e "\nOSU one-sided put bidirectional bandwidth test osu_put_bibw in a node:\n"
srun -N 1 -n 2 -c 1 osu_put_bibw

#
# Latency Test for Accumulate with Active/Passive Synchronization
#
echo -e "\nOSU one-sided latency test for accumulate with active/passive synchronisation osu_acc_latency between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_acc_latency
echo -e "\nOSU one-sided latency test for accumulate with active/passive synchronisation osu_acc_latency in a node:\n"
srun -N 1 -n 2 -c 1 osu_acc_latency

#
# Latency Test for Compare and Swap with Active/Passive Synchronization
#
echo -e "\nOSU one-sided latency test for compare and swap with active/passive synchronisation osu_cas_latency between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_cas_latency
echo -e "\nOSU one-sided latency test for compare and swap with active/passive synchronisation osu_cas_latency in a node:\n"
srun -N 1 -n 2 -c 1 osu_cas_latency

#
# Latency Test for Fetch and Op with Active/Passive Synchronization
#
echo -e "\nOSU one-sided latency test for fetch and op with active/passive synchronisation osu_fop_latency between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_fop_latency
echo -e "\nOSU one-sided latency test for fetch and op with active/passive synchronisation osu_fop_latency in a node:\n"
srun -N 1 -n 2 -c 1 osu_fop_latency

#
# Latency Test for Get_ccumulate with Active/Passive Synchronization
#
echo -e "\nOSU one-sided latency test for get_accumulate with active/passive synchronisation osu_get_acc_latency between nodes:\n"
srun -n 2 -c 1 --ntasks-per-node=1 osu_get_acc_latency
echo -e "\nOSU one-sided latency test for get_accumulate with active/passive synchronisation osu_get_acc_latency in a node:\n"
srun -N 1 -n 2 -c 1 osu_get_acc_latency

