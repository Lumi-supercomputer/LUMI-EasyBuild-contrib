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

    
### Version 1.15.1 for CPE 21.12

  * A straightforward port of the easyconfig for 1.14, triggered by problems with
    HTSlib on LUMI.
    

### Version 1.15.1 forr CPE 22.06 and 22.08

  * Checked the configure script for additional useful options. Considered adding
    '--enable-perl-filters` but that used libperl from the system. As it turns out
    that the current Perl module does not provide libperl.so, the option was not
    added. 
    
  * Cleaned up dependencies as most are pulled in anyway through HTSlib.

