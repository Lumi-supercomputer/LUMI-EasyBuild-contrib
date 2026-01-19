# UppASD instructions

-   [UppASD home page](https://github.com/UppASD/UppASD)
  
-   [UppASD development on GitHub](https://github.com/UppASD/UppASD/)

    -   [GitHub releases](https://github.com/UppASD/UppASD/releases)
 
-   [UppASD documentation](https://uppasd.github.io/UppASD-manual/)


## EasyBuild

-   There is no support for UppASD in the EasyBuilders repository.

-   There is no support for UppASD in the CSCS repository.

-   There is no support for UppASD in Spack


### Version 6.0.2 for CPE 22.06

  * Contributed by the UppASD developers (and also used on Dardel).
  

### Version 6.0.2 for CPE 22.08

  * Some slight reworking of the EasyConfig of 22.06 which was contributed
    by the developers to follow better the standard approach used in other
    EasyConfigs for LUMI.
    
  * The GUI functionality is not installed as LUMI doesn't currenbtly offer
    all needed packages.

### UppASD-6.0.2 with cpeGNU-22.12 and later

-   Derived from the previous ones.

-   Still does not install the Python packages that are needed to run the included
    Python code in the ASD_BUI and ASD_Tools directories.
    
-   The cpeAOCC version is a near trivial adaptation.

-   There is a `crayftn-ftn` target to compile with Cray Fortran but in the 
    release version of the code there is a problem with the link line. 
    The `-cpp` option also appears on the 
    link line which is not appreciated by Cray Fortran. It then expects also to
    find source files and complains that no valid file names are specified on
    the command line.
    
    To patch this, changes need to be made to `source/make/makefile.template`
    which we do via a patch file.
    
    Note that the compilation does produce some scary warnings, so it is not clear
    if the Cray version will work correctly.
