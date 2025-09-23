# CGAL release 4

 * It is intended as requirement for OpenFOAM
 
 * [CGAL home page](http://www.cgal.org/)
 

## OpenFOAM specific notes

 * Following suggestion from https://develop.openfoam.com/Development/openfoam/-/wikis/building 
   CGAL will normally need to be compiled without mpfr/gmp.
 
 * For this reason `-DCGAL_DISABLE_MPFR=TRUE -DCGAL_DISABLE_GMP=TRUE` cmake options are in place.

 
## EasyBuild
 
  * [CGAL in the easybuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/c/CGAL)

  * [CGAL in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/c/CGAL)
  
  
### Version 4.12.2 -OpenFOAM

  * The EasyConfig is mostly a LUST development with a version specifically tuned for 
    OpenFOAM.

### Version 5.6.3 -OpenFOAM

  * Trivial port of the EasyConfig for 4.12.2.