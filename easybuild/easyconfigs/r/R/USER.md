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
    
    A solution is to use the `availableCores()` function from the 
    [*parallelly* package](https://cran.r-project.org/web/packages/parallelly/readme/README.html).
    That package can, e.g., recognize the CPU set a program will be running in when started 
    through `srun`.
    
    As a result of packages not being sophisticated enough to recognise they are not 
    running on the full node, it can be expected that some packages using shared memory multiprocessing 
    will launch one thread per virtual core rather one thread per available core, which can
    lead to heavy oversubscription of the cores in your job and very bad parallel performance.


## Some noteworthy packages included in the regular EasyConfig

-   Shared memory parallel computing

    -   [*parallelly*](https://cran.r-project.org/web/packages/parallelly/index.html),
        with improvements over the system *parallel*  package that are more aware of 
        the typical environment on an HPC cluster.

-   Distributed memory computing:
    
    -   [*Rmpi*](https://cran.r-project.org/web/packages/Rmpi/index.html), 
        build to interface properly with Cray MPICH.
    
    -   [*snow*](https://cran.r-project.org/web/packages/snow/index.html), 
        Simple Network Of Workstations.

    -   [*snowfall*](https://cran.r-project.org/web/packages/snowfall/index.html)
    
-   Unified shared and distributed memory computing:

    -   [*foreach*](https://cran.r-project.org/web/packages/foreach/index.html)
        with several adapters:

        -   [*doParallel*](https://cran.r-project.org/web/packages/doParallel/index.html)
            for multicore computing.

        -   [*doMPI*](https://cran.r-project.org/web/packages/doMPI/index.html)
            interfacing with *Rmpi* for distributed memory parallel computing.

        -   [*doSNOW*](https://cran.r-project.org/web/packages/doSNOW/index.html)
            for interfacing with the *SNOW*  package for distributed memory parallel computing.

    -   [*future*](https://cran.r-project.org/web/packages/future/index.html), see also 
        the [documentation web site](https://future.futureverse.org/).

    -   [*future.apply*](https://cran.r-project.org/web/packages/future.apply/index.html)
    
-   Interfacing with Slurm

    -   [*batchtools*](https://cran.r-project.org/web/packages/batchtools/index.html)
    
    -   [*future.batchtools*](https://cran.r-project.org/web/packages/future.batchtools/index.html)


## Some examples

These examples are inspired by the examples in the 
[LRZ documentation, section "Parallelization Using R"](https://doku.lrz.de/parallelization-using-r-10747291.html)


### A shared memory (multicore) computing example with the *parallel* and *parallelly* packages
 
Example R script that you can store in `script_parallel.R`: 

``` R
library(parallel)
library(parallelly)
  
ac <- detectCores()
sprintf( "Number of cores according to parallel::detectCores: %d", ac )
nc <- availableCores()
sprintf( "Number of cores according to parallelly::availableCores: %d", nc )
  
print( "lapply:" )
system.time(
    lapply(1:20, function(x) sum(sort(runif(1e7))))
)
  
print( "mclapply with mc.cores = 1:" )
system.time(
    mclapply(1:20, function(x) sum(sort(runif(1e7))), mc.cores = 1)
)

sprintf( "mclapply with mc.cores = %d:", nc )
system.time(
    mclapply(1:20, function(x) sum(sort(runif(1e7))), mc.cores = nc)
)

print( "mclapply without mc.cores argument:" )
system.time(
    mclapply(1:20, function(x) sum(sort(runif(1e7))))
)
print( "Not sure what is happening here as user time goes down but elapsed goes up." )
```

Example submit script to store in `submit.slurm`:

``` bash
#!/bin/bash
#SBATCH --job-name=R_parallel_test
#SBATCH --partition=small
#SBATCH --time=2:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --output=%x_%j.txt
#SBATCH --account=project_46YXXXXXX

module load LUMI/22.12 partition/C R/4.3.1-cpeGNU-22.12

echo -e "Running Rscript from $(which Rscript).'\n"

srun Rscript script_parallel.R
```

The `srun` command doesn't seem to make a difference here but it usually ensures that
all Slurm flags, including hints for multithreading, are correctly applied to the
executable that is starting.

Note the difference between the `detectCores` routine from `parallel` and the
`availableCores` routine from `parallelly`. The former fails to correctly detect the
resources available for R while the latter does detect that there are only 8 CPUs 
available.

This script was written by someone who is not an expert to to whom it is completely
unclear what is happening in the last call to `mclapply` as the user time goes doen
while elapsed goes up.
 

### A distributed memory computing example with the *snow*  package

Example R script `script_snow.R`: 

``` R
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

``` bash
#!/usr/bin/bash
#SBATCH --job-name=snow_test
#SBATCH --partition=small
#SBATCH --time=5:00
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --hint=nomultithread
#SBATCH --output=%x_%j.txt
#SBATCH --account=project_46YXXXXXX

module load LUMI/22.12 partition/C
module load R/4.3.1-cpeGNU-22.12

echo -e "\\n# Running on 2 task\n\n"
srun -W 10 -n 2 $EBROOTR/lib/R/library/snow/RMPISNOW <script_snow.R

echo -e "\\n# Running on 3 task\n\n"
srun -W 10 -n 3 $EBROOTR/lib/R/library/snow/RMPISNOW <script_snow.R

echo -e "\\n# Running on 4 tasks\n\n"
srun -W 10 -n 4 $EBROOTR/lib/R/library/snow/RMPISNOW <script_snow.R

echo -e "\\n# Running on $((SLURM_NTASKS + 1)) tasks\n\n"
srun -W 10 -n $((SLURM_NTASKS + 1)) -O $EBROOTR/lib/R/library/snow/RMPISNOW <script_snow.R
```

The `-W` option ensures that the `srun` command will end 10 seconds after the first
process ends as an additional precaution.

Note that we use the `EBROOTR` environment variable for the path to the `RMPISNOW` 
script which is needed to run this example. This variable is defined by all EasyBuild-installed
R modules so one does not need to adapt the line when switching to a newer version of R.
The `RMPISNOW` command takes care of some initialisations in
particular when the job spans multiple nodes.

There is another important thing to note in this example. If you analyse the timings 
in the results carefully you will see that the 3-task case runs in half the time of
the 2-task case and the 4-task case in little over one third of the time of the
2-task case. This is because one of the MPI tasks is used internally as the master
process and is in fact not doing much while the remaining tasks are used 
to build the cluster and do the computations in the `parLapply` call. This is solved
with the last `srun` call: we start one more task than requested in the `#SBATCH`
lines which we can do by adding the `-O` or `--overcommit` flag to the `srun` command.
We now get a speedup of about 4 compared to the timing we got with 2 tasks which 
effectively was running the sequentially as there was a master and one slave.


### Examples with *foreach*

#### *foreach* for shared memory (multi-core) computation

For this example, we combine the *foreach*  package with the *doParallel*  adapter 
package and with *parallelly* to determine the number of available cores.

The R script `script_foreach_MC.R` is:

``` R
library(foreach)
library(doParallel)
library(parallelly)

sprintf( "Running on %d core(s).", availableCores())
registerDoParallel(cores = availableCores())

system.time(
    foreach(i = 1:100) %dopar% sum(sort(runif(1e7)))  # parallel execution
)
```

The corresponding job script `submit.slurm` is

``` bash
#!/bin/bash
#SBATCH --job-name=R_foreach_doParallel_test
#SBATCH --partition=standard
#SBATCH --time=2:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --hint=nomultithread
#SBATCH --output=%x_%j.txt
#SBATCH --account=project_46YXXXXXX
 
module load LUMI/22.12 partition/C R/4.3.1-cpeGNU-22.12
#module load CrayEnv cray-R/4.2.1.1

echo -e "Running Rscript from $(which Rscript).'\n"

echo -e "\n\nStarting on 1 core.\n\n"
srun -n 1 -c 1 Rscript script_foreach_MC.R

echo -e "\n\nStarting on 4 cores.\n\n"
srun -n 1 -c 4 Rscript script_foreach_MC.R
```

The first `srun` command starts the example on a single core, so it effectively runs in a serial way,
while the second `srun` command uses 4 cores. When you inspect the results you'll notice that the `user`
and `system` time in the second case are a bit higher which is normal as parallel computing alsways 
comes with some overhead, but from the `elapsed` time we get a speedup of 3.4.


### *foreach*  with the *doSNOW*  adapter for distributed memory computing

The R script `script_foreach_SNOW.R` is now

``` R
library(foreach)
library(doSNOW)

cl <- makeCluster()
registerDoSNOW(cl)

system.time(
    foreach(i = 1:100) %dopar% sum(sort(runif(1e7)))  # parallel execution
)

stopCluster(cl)
```

The `foreach` line is the same as before, but the setup is different. This implies that the core
of the code actually remains the same as before. 

The script is started with the jobscript `submit.slurm`: 

``` bash
#!/usr/bin/bash
#SBATCH --job-name=R_foreach_SNOW_test
#SBATCH --partition=small
#SBATCH --time=5:00
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --hint=nomultithread
#SBATCH --output=%x_%j.txt
#SBATCH --account=project_46YXXXXXX

module load LUMI/22.12 partition/C
module load R/4.3.1-cpeGNU-22.12

echo -e "\\n# Running on 2 task\n\n"
srun -W 10 -n 2 $EBROOTR/lib/R/library/snow/RMPISNOW <script_foreach_SNOW.R

echo -e "\\n# Running on 3 task\n\n"
srun -W 10 -n 3 $EBROOTR/lib/R/library/snow/RMPISNOW <script_foreach_SNOW.R

echo -e "\\n# Running on 4 tasks\n\n"
srun -W 10 -n 4 $EBROOTR/lib/R/library/snow/RMPISNOW <script_foreach_SNOW.R

echo -e "\\n# Running on $((SLURM_NTASKS + 1)) tasks\n\n"
srun -W 10 -n $((SLURM_NTASKS + 1)) -O $EBROOTR/lib/R/library/snow/RMPISNOW <script_foreach_SNOW.R
```

The `user` and `system` time is rather irrelevant now as that is for the master process. That it is still
rather high is likely due to a busy waiting strategy. The `elapsed` time shows again the behaviour we've
seen before already, with the time for 2 tasks the time for serial execution of the `foreach` 
function.


### *foreach*  with the *doMPI*  adapter for distributed memory computing

The R script `script_foreach_MPI.R` is now

``` R
library(foreach)
library(doMPI)

cl <- startMPIcluster()  # use verbose = TRUE for detailed worker message output
registerDoMPI(cl)

system.time(
    foreach(i = 1:100) %dopar% sum(sort(runif(1e7)))  # parallel execution
)

closeCluster(cl)
mpi.quit()
```

The `foreach` line is again the same as before, but the setup is different. 

The script is started with the jobscript `submit.slurm`: 

``` bash
#!/usr/bin/bash
#SBATCH --job-name=R_foreach_SNOW_test
#SBATCH --partition=small
#SBATCH --time=5:00
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --hint=nomultithread
#SBATCH --output=%x_%j.txt
#SBATCH --account=project_46YXXXXXX

module load LUMI/22.12 partition/C
module load R/4.3.1-cpeGNU-22.12

echo -e "\\n# Running on 2 task\n\n"
srun -n 2 Rscript script_foreach_MPI.R

echo -e "\\n# Running on 3 task\n\n"
srun -n 3 Rscript script_foreach_MPI.R

echo -e "\\n# Running on 4 task\n\n"
srun -n 4 Rscript script_foreach_MPI.R

echo -e "\\n# Running on $((SLURM_NTASKS + 1)) tasks\n\n"
srun -n $((SLURM_NTASKS + 1)) -O Rscript script_foreach_MPI.R
```

It appears that here also one process is used as the master in the background while the other processes
execute the `foreach` commands. With this adapter we can actually start the script in the way we are
used to start parallel programs, but we still need to oversubscribe (because of the master process)
to get the best speedup from using 4 tasks (and hence 4 cores).


## Information on the web

-   [LRZ documentation: "Parallelization Using R"](https://doku.lrz.de/parallelization-using-r-10747291.html)

    The job scripts need to be adapted to LUMI but the general principles are valid.
    
-   [Cornell virtual workshop on R, section "Parallel R"](https://cvw.cac.cornell.edu/r/parallelr)

-   [CRAN Task View: High-Performance and Parallel Computing with R](https://cran.r-project.org/web/views/HighPerformanceComputing.html)
 