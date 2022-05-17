# BCFtools instructions

  * [BCFtools development and home page on GitHub](https://samtools.github.io/bcftools/)

  * [BCFtools installation guide](https://samtools.github.io/bcftools/howtos/install.html)


## EasyBuild

  * [BCFtools support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/b/BCFtools)

  * There is no support for BCFtools in the CSCS repository.


### Version 1.14 for CPE 21.12

  * The EasyConfig file is a direct port from the EasyBuilders one
  
  * We took care of linking with a version of GSL compiled without OpenMP support
    as compiling GSL with and BCFtools without OpenMP support causes a problem
    with BLAS (that crashes when the program ends).
