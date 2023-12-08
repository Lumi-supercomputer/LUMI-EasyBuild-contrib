# OSU benchmarks user info

These benchmarks are mostly provided for users who want to experiment with
Open MPI, to test those Open MPI builds and to compare performance with
Cray MPICH.

Currently only the C MPI benchmarks are provided.

Each module also contains a number of example scripts to run the benchmarks.
After loading the module, those example scripts can be found in the subdirectory
`$OSU_EXAMPLES`. Note that in some cases additional software needs to be 
installed to run those scripts. Please check the module help of the respective
`OSU-Micro-Benchmarks` module as that information is different for all modules.
When all software is installed, you should be able to launch the example scripts
just using `sbatch -A project_46YXXXXXX $OSU_EXAMPLES/<scriptname>` (at least
on the CPU partition of LUMI), but of course you may want to copy and modify them.

