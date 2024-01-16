# DL_POLY_4 technical instructions

DL_POLY is a general purpose classical molecular dynamics (MD) simulation 
software developed at Daresbury Laboratory (UK).

-   [Home page](https://www.scd.stfc.ac.uk/Pages/DL_POLY.aspx)

-   [Documentation](https://ccp5.gitlab.io/dl-poly/)
    
-   [GitLab repository](https://gitlab.com/ccp5/dl-poly)
    
    -   [Release tags](https://gitlab.com/ccp5/dl-poly/-/releases)
    
-   [GitHub repository](https://github.com/ccp5UK/dl-poly/)
    
    -   [GitHub releases via tags](https://github.com/ccp5UK/dl-poly/tags)
    
    
Note that there is also an older version, DL_POLY_Classic, also available
in [a GitLab repository](https://gitlab.com/DL_POLY_Classic/dl_poly).


## Building instructions

-   This code is a Fortran code.

-   It can use several external libraries but this is not very well documented.
    The best way to learn about build options is to study all configuration examples
    in the `utils` subdirectory of the sources.
    

## EasyBuild

-   [Support for DL_POLY_4 in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/d/DL_POLY_4)

-   There is no support for DL_POLY_4 in the CSCS repository.

-   [EasyConfigs by the authors in the DL_POLY GitLab repository](https://gitlab.com/ccp5/dl-poly/-/tree/devel/easybuild?ref_type=heads)


### Version 5.1.0-pre for cpeCray/23.09

-   EasyConfig is a simple derivative of the EasyBuilder ones, but with some more
    information in the module help.
    
-   Added the OpenMP option.
    
-   **Note: Tried compile 5.1.0 and 5.2.0-pre, but both failed with error messages
    about the code. Though the code has been used on Archer2 and the documentation
    indicates that the Cray compiler was used, it looks like newer versions were 
    not tested (5.1.0-pre was the version found in the documentation for building
    on Archer2 at the time of the development of the EasyConfig).**
    

### Version 5.1.0 for cpeGNU/23.09

-   Trivial port of the EasyConfig developed for cpeCray, but it needs a particular
    flag with gfortran to avoid type mismatch errors.
    
-   It appears though that OpenMP support is no longer present as `WITH_OPENMP`
    remains unused, despite examples in the `utils` subdirectory claiming
    the opposite...
    
    
### Version 5.2.0-pre for cpeGNU/223.09

-   Trivial port of the EasyConfig for 5.1.0.

