# pbzip2 technical information

-   [pbzip2 home page](http://compression.great-site.net/pbzip2/)
    
The code has not been unmaintained since 2015.


## EasyBuild

-   [PBZIP2 in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PBZIP2)
    
### Version 1.1.13 for the system toolchain

-   The only dependency is libbz2, and we use a static version of it from the
    systools module.
    
-   The EasyConfig is heavily inspired on the EasyBuilders one.

-   We developed a small patch to detect the number of cores available via the
    `sched_getaffinity` function so that it works as expected in a Slurm job,
    and also limit the default number of threads to 16 on the login nodes.
