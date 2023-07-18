# R user instructions

We do provide some EasyBuild recipes for a plain R installation with only the
standard packages and Rmpi (the -raw versions, Rmpi provided as it needs special
options to install on LUMI), and a regular version with a lot of packages for
parallel computing already included.

## Known restrictions

It should be said that R was never developed for parallel computing. Parallel computing 
is only added through a mess of packages and not an intrinsic part of the language. 
Moreover the packages for parallel computing often evolved from multicore computing
on a workstation, or some disctributed computing on a network of workstations not
managed by a scheduler. As a result some packages are not fully functional on LUMI.

Some known restrictions:

-   *Rmpi*: `mpi.spawn.Rslaves` is not suppoted as Cray MPI does not support `MPI_Comm_spawn`.
    
-   *parallel*: `detectCores` detects the total number of (virtual) cores, not the number of cores
    available to the application. This happens with both Cray R and R built with EasyBuild.
    
    A solution is to use the z availableCores()` function from the 
    [*parallelly* package](https://cran.r-project.org/web/packages/parallelly/readme/README.html).
    That package can, e.g., recognize the CPU set a program will be running in when started 
    through `srun`.
    
    As a result of packages not being sophisticated enough to recongnize they are not 
    running on the full node, it can be expected that some packages using shared memory multiprocessing 
    will launch one thread per virtual core rather one thread per available core, which can
    lead to heavy oversubscription of the cores in your job and very bad parallel performance.


## Some noteworthy packages included in the regular EasyConfig

-   Shared memory parallel computing

    -   [*parallelly*](https://cran.r-project.org/web/packages/parallelly/index.html),
        with improvements over the system *parallel*  package that are more aware of 
        the typical environment on an HPC cluster.

    -   [*doParallel*](https://cran.r-project.org/web/packages/doParallel/index.html)

-   Distributed memory computing:
    
    -   [*Rmpi*](https://cran.r-project.org/web/packages/Rmpi/index.html), 
        build to interface properly with Cray MPICH.
    
    -   [*snow*](https://cran.r-project.org/web/packages/snow/index.html), 
        Simple Network Of Workstations.

    -   [*snowfall*](https://cran.r-project.org/web/packages/snowfall/index.html)
    
    -   [*doSNOW*](https://cran.r-project.org/web/packages/doSNOW/index.html)

-   Unified shared and distributed memory computing:

    -   [*future*](https://cran.r-project.org/web/packages/future/index.html), see also 
        the [documentation web site](https://future.futureverse.org/).

    -   [*future.apply*](https://cran.r-project.org/web/packages/future.apply/index.html)
    
-   Interfacing with Slurm

    -   [*batchtools*](https://cran.r-project.org/web/packages/batchtools/index.html)
    
    -   [*future.batchtools*](https://cran.r-project.org/web/packages/future.batchtools/index.html)


## Some examples

These examples were adapted from the examples in the 
[LRZ documentation, section "Parallelization Using R"](https://doku.lrz.de/parallelization-using-r-10747291.html)


### A distributed memory computing example with the *snow*  package

Example R script stored in `script_Snow.R`: 

```
library(snow)
  
cl <- makeCluster()
  
system.time(
    parLapply(cl, 1:167, function(x){
        sum(sort(runif(1e7)))
        }
    )
)
  
stopCluster(cl)

q(save="no")
```

Example submit script `submit.slurm`:

```
#!/usr/bin/bash
#SBATCH --job-name=snow_test
#SBATCH --partition=small
#SBATCH --time=3:00
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --hint=nomultithread
#SBATCH --output=%x_%j.txt
#SBATCH --account=project_46YXXXXXX

module load LUMI/22.12 partition/C
module load R/4.2.3-cpeGNU-22.12

srun -W 10 $EBROOTR/lib/R/library/snow/RMPISNOW <script_snow.R
```

The `-W` option ensures that the `srun` command will end 10 seconds after the first
process ends as an additional precaution.

Note that we use the `EBROOTR` environment variable for the path to the `RMPISNOW` 
script which is needed to run this example.


## Information on the web

-   [LRZ documentation: "Parallelization Using R"](https://doku.lrz.de/parallelization-using-r-10747291.html)

    The job scripts need to be adapted to LUMI but the general principles are valid.

-   [CRAN Task View: High-Performance and Parallel Computing with R](https://cran.r-project.org/web/views/HighPerformanceComputing.html)