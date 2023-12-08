#! /bin/bash
#SBATCH --job-name=OSU-coll
#SBATCH --partition=standard
#SBATCH --exclusive
#SBATCH --nodes=2
#SBATCH --hint=nomultithread
#SBATCH --time=30:00
#SBATCH --output=%x-%j.txt
#SBATCH --error=%x-errors-%j.txt

# Number of ranks per node.
nr_ranks=128

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
echo -e "\n##########\n\nSingle-node runs:\n"
srun -N 1 -n $nr_ranks -c 1 mpi_check -r
echo -e "\nTwo-node runs:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 mpi_check -r

################################################################################
#
# BLOCKING
#

#
# Collectives bcast test
#
echo -e "\nOSU collectives bcast test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_bcast
echo -e "\nOSU collectives bcast test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_bcast

#
# Collectives barrier test
#
echo -e "\nOSU collectives barrier test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_barrier
echo -e "\nOSU collectives barrier test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_barrier

#
# Collectives all-to-all test
#
echo -e "\nOSU collectives alltoall test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_alltoall
echo -e "\nOSU collectives alltoall test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_alltoall

#
# Collectives allgather test
#
echo -e "\nOSU collectives allgather test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_allgather
echo -e "\nOSU collectives allgather test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_allgather

#
# Collectives allreduce test
#
echo -e "\nOSU collectives allreduce test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_allreduce
echo -e "\nOSU collectives allreduce test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_allreduce

#
# Collectives gather test
#
echo -e "\nOSU collectives gather test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_gather
echo -e "\nOSU collectives gather test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_gather

#
# Collectives reduce test
#
echo -e "\nOSU collectives reduce test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_reduce
echo -e "\nOSU collectives reduce test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_reduce

#
# Collectives scatter test
#
echo -e "\nOSU collectives scatter test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_scatter
echo -e "\nOSU collectives scatter test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_scatter

################################################################################
#
# NON-BLOCKING
#

#
# Collectives non-blocking bcast test
#
echo -e "\nOSU collectives ibcast test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_ibcast
echo -e "\nOSU collectives ibcast test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_ibcast

#
# Collectives non-blocking barrier test
#
echo -e "\nOSU collectives ibarrier test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_ibarrier
echo -e "\nOSU collectives ibarrier test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_ibarrier

#
# Collectives non-blocking all-to-all test
#
echo -e "\nOSU collectives ialltoall test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_ialltoall
echo -e "\nOSU collectives ialltoall test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_ialltoall

#
# Collectives non-blocking allgather test
#
echo -e "\nOSU collectives iallgather test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_iallgather
echo -e "\nOSU collectives iallgather test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_iallgather

#
# Collectives non-blocking allreduce test
#
echo -e "\nOSU collectives iallreduce test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_iallreduce
echo -e "\nOSU collectives iallreduce test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_iallreduce

#
# Collectives non-blocking gather test
#
echo -e "\nOSU collectives igather test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_igather
echo -e "\nOSU collectives igather test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_igather

#
# Collectives non-blocking reduce test
#
echo -e "\nOSU collectives ireduce test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_ireduce
echo -e "\nOSU collectives ireduce test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_ireduce

#
# Collectives non-blocking scatter test
#
echo -e "\nOSU collectives iscatter test, 1 node:\n"
srun -N 1 -n $nr_ranks -c 1 osu_iscatter
echo -e "\nOSU collectives iscatter test, 2 nodes:\n"
srun -N 2 -n $(($nr_ranks*2)) -c 1 osu_iscatter

