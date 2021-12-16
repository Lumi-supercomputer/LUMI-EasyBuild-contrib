# CGAL release 4

 * It is intended as requirement for OpenFOAM

## OpenFOAM specific notes

 * Following suggestion from https://develop.openfoam.com/Development/openfoam/-/wikis/building CGAL will normally need to be compiled without mpfr/gmp.
 
 * For this reason `-DCGAL_DISABLE_MPFR=TRUE -DCGAL_DISABLE_GMP=TRUE` cmake options are in place.
