# R instructions

This module may be a replacement for some users for the HPE-provided version in cray-R.

The `-raw`-version of the EasyConfigs is for R without any additional packages, while
the other EasyConfigs offer examples of how to add packages.

  * [R web site](http://www.r-project.org)
  
  
## EasyBuild

  * [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/r/R)
    
    R uses an [application-specific EasyBlock](https://github.com/easybuilders/easybuild-easyblocks/blob/develop/easybuild/easyblocks/r/r.py)
  
  * [Support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/r/R)
  
  
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
  
            
            

