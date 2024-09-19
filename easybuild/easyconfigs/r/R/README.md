# R instructions

This module may be a replacement for some users for the HPE-provided version in cray-R.

The `-raw`-version of the EasyConfigs is for R without any additional packages, while
the other EasyConfigs offer examples of how to add packages.

  * [R web site](http://www.r-project.org)
  
  
## Some notes

*   `bin/R` is really only a script that starts R. The relevant executable
    is in `lib64/R/bin/exec`.
  
  
## EasyBuild

  * [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/r/R)
    
    R uses an [application-specific EasyBlock](https://github.com/easybuilders/easybuild-easyblocks/blob/develop/easybuild/easyblocks/r/r.py)
  
  * [Support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/r/R)
  
  
### R packages considered for inclusion

-   Packages for parallel computing and their dependencies
    -   [Rmpi](https://cran.r-project.org/web/packages/Rmpi/)
    -   [Rcpp](https://cran.r-project.org/web/packages/Rcpp)
    -   [codetools](https://cran.r-project.org/web/packages/codetools/)
    -   [Runit](https://cran.r-project.org/web/packages/RUnit)
    -   [tinytest](https://cran.r-project.org/web/packages/tinytest)
    -   [backports](https://cran.r-project.org/web/packages/backports)
    -   [rlang](https://cran.r-project.org/web/packages/rlang)
    -   [parallelly](https://cran.r-project.org/web/packages/parallelly)
    -   [iterators](https://cran.r-project.org/web/packages/iterators)
    -   [foreach](https://cran.r-project.org/web/packages/foreach)
    -   [doParallel](https://cran.r-project.org/web/packages/doParallel)
    -   [doMPI](https://cran.r-project.org/web/packages/doMPI)
    -   [snow](https://cran.r-project.org/web/packages/snow)
    -   [snowfall](https://cran.r-project.org/web/packages/snowfall)
    -   [doSNOW](https://cran.r-project.org/web/packages/doSNOW)
    -   [base64url](https://cran.r-project.org/web/packages/base64url)
    -   [brew](https://cran.r-project.org/web/packages/brew)
    -   [checkmate](https://cran.r-project.org/web/packages/checkmate)
    -   [data.table](https://cran.r-project.org/web/packages/data.table)
    -   [fs](https://cran.r-project.org/web/packages/fs)
    -   [cli](https://cran.r-project.org/web/packages/cli)
    -   [glue](https://cran.r-project.org/web/packages/glue)
    -   [lifecycle](https://cran.r-project.org/web/packages/lifecycle)
    -   [pkgconfig](https://cran.r-project.org/web/packages/pkgconfig)
    -   [vctrs](https://cran.r-project.org/web/packages/vctrs)
    -   [hms](https://cran.r-project.org/web/packages/hms)
    -   [prettyunits](https://cran.r-project.org/web/packages/prettyunits)
    -   [R6](https://cran.r-project.org/web/packages/R6)
    -   [crayon](https://cran.r-project.org/web/packages/crayon)
    -   [progress](https://cran.r-project.org/web/packages/progress)
    -   [rappdirs](https://cran.r-project.org/web/packages/rappdirs)
    -   [stringi](https://cran.r-project.org/web/packages/stringi)
    -   [withr](https://cran.r-project.org/web/packages/withr)
    -   [digest](https://cran.r-project.org/web/packages/digest)
    -   [batchtools](https://cran.r-project.org/web/packages/batchtools)
    -   [globals](https://cran.r-project.org/web/packages/globals)
    -   [listenv](https://cran.r-project.org/web/packages/listenv)
    -   [future](https://cran.r-project.org/web/packages/future)
    -   [future.apply](https://cran.r-project.org/web/packages/future.apply)
    -   [future.batchtools](https://cran.r-project.org/web/packages/future.batchtools)
-   Additional packages included in Cray-R
    -   [lattice](https://cran.r-project.org/web/packages/lattice)
    -   [Matrix](https://cran.r-project.org/web/packages/Matrix)
    -   [MASS](https://cran.r-project.org/web/packages/MASS)
    -   [class](https://cran.r-project.org/web/packages/class)
    -   [foreign](https://cran.r-project.org/web/packages/foreign)
    -   [KernSmooth](https://cran.r-project.org/web/packages/KernSmooth)
    -   [nlme](https://cran.r-project.org/web/packages/nlme)
    -   [mgcv](https://cran.r-project.org/web/packages/mgcv)
    -   [nnet](https://cran.r-project.org/web/packages/nnet)
    -   [rpart](https://cran.r-project.org/web/packages/rpart)
    -   [spatial](https://cran.r-project.org/web/packages/spatial)
    -   [survival](https://cran.r-project.org/web/packages/survival)
-   Additional packages on top of the previous two groups for benchmarking 
    and their dependencies
    -   [fansi](https://cran.r-project.org/web/packages/fansi)
    -   [utf8](https://cran.r-project.org/web/packages/utf8)
    -   [pillar](https://cran.r-project.org/web/packages/pillar)
    -   [profmem](https://cran.r-project.org/web/packages/profmem)
    -   [magrittr](https://cran.r-project.org/web/packages/magrittr)
    -   [tibble](https://cran.r-project.org/web/packages/tibble)
    -   [bench](https://cran.r-project.org/web/packages/bench)
    -   [microbenchmark](https://cran.r-project.org/web/packages/microbenchmark)
    -   [SuppDists](https://cran.r-project.org/web/packages/SuppDists).
        Used by the popular R-benchmark-25.R script, 
        originally developed by Philippe Grosjean, UMons.
        See also the ["R benchmarks" page on the R for macOS site](https://mac.r-project.org/benchmarks/).
    -   [generics](https://cran.r-project.org/web/packages/generics)
    -   [tidyselect](https://cran.r-project.org/web/packages/tidyselect)
    -   [dplyr](https://cran.r-project.org/web/packages/dplyr)
    -   [curl](https://cran.r-project.org/web/packages/curl)
    -   [jsonlite](https://cran.r-project.org/web/packages/jsonlite)
    -   [mime](https://cran.r-project.org/web/packages/mime)
    -   [sys](https://cran.r-project.org/web/packages/sys)
    -   [askpass](https://cran.r-project.org/web/packages/askpass)
    -   [openssl](https://cran.r-project.org/web/packages/openssl)
    -   [httr](https://cran.r-project.org/web/packages/httr)
    -   [sringi](https://cran.r-project.org/web/packages/stringi)
    -   [benchmarkmeData](https://cran.r-project.org/web/packages/benchmarkmeData)
    -   [benchmarkme](https://cran.r-project.org/web/packages/benchmarkme).
        For the ["Crowd sourced benchmarks" page at CRAN](https://cran.r-project.org/web/packages/benchmarkme/vignettes/a_introduction.html).
  
  
### Version 4.2.1 for cpeGNU 22.06, 22.08

  * Worked from the EasyBuilders EasyConfig but removed all OpenGL-related stuff
    and also removed all extensions to create the `-raw` version which has no
    external packages at all.
    
  * PROBLEM: Suffers from the multiple Cray LibSci libraries linked in problem, and
    it is not clear how they come in.
    
      * The R `infoSession()` command shows that the non-MPI multithreaded library
        is used.
    
      * The configure script does discover the right option to compile with OpenMP.
      
      * Enforcing the OpenMP compiler flag through `toolchainopts` though fails. It 
        is not used at link time, resulting in undefined OpenMP symbols when linking.
    
    SOLUTION: Enforce OpenMP through `toolchainopts` and manually add `-fopenmp` to
    `LDFLAGS` in `preconfigopts`.
    
  * Extensions: List based on the foss-2022a version of R in EasyBuild.
  
      * Rmpi:
      
          * Typically uses an EasyBlock, but that EasyBlock does not support the Cray
            environment so we avoid using it and instead manually build the right
            `--configure-args` flag for the R installation command.
            
          * There is still a problem as when loading `Rmpi.so`, the load fails because
            `mpi_universe_size` cannot be found. Now this is a routine defined in Rmpi 
            itself but only compiles in certain cases. However, it looks like routines 
            that reference to this function are not correctly disabled when this routine
            is not included in the compilation.
            
            Now in fact, the configure script does correctly determine that it should 
            add `-DMPI2` to the command line. However, it does so after a faulty `-I`
            flag that does not contain a directory. Hence the compiler interprets the
            `-DMPI2` flag as the argument of `-I` instead.
            
            The solution to this last problem is a bit complicated.
            
              * The empty `-I` argument is a bug in the configure script that occurs 
                when `--with-Rmpi-include` is not used.
                
              * Adding just any directory with that argument does not work; the configure
                script checks if it contains `mpi.h`. We used an environment variable to
                find the directory that Cray MPI uses.
                
              * But adding `--with-Rmpi-include` also requires adding `--with-Rmpi-libpath`
                for which we used the same environment variable.
                
              * So hopefully these options do not conflict with anything the Cray compiler
                wrappers add. `--with-Rmpi-include` and `--with-Rmpi-libpath` really should
                not be needed when using the Cray wrappers.
                
                
## Version 4.3.1 for 22.12

-   Based on the 4.2.1 work but now focused on adding packages for parallel
    computing (and developed the USER.md page explaining options for parallel
    computing).
  
-   One way to figure out how to do this is to install the `-raw` version and
    then add the desired packages by hand and see what other packages R pulls in
    and when it does so.
    

## Version 4.3.2 for 23.09

-   Quick port with minor version updates of the 22.12 one.


## VErsion 4.4.1 for 24.03

-   Quick port with version updates of the 23.09 EasyConfigs.

-   Changed the naming to stress that we link with the multithreaded BLAS libraries.

            
            

