# OpenFOAM notes

This easyconfig is based on the public CSCS version using `Binary` easyblock.

Rewritten to use recent configuration layers built-in the OpenFOAM.

OpenFOAM in two flavours (branches) from: `openfoam.com` (YYMM release numbering) and `openfoam.org` (`N` release numbering). 

## Configuring

### openfoam.com

https://develop.openfoam.com/Development/openfoam/-/wikis/configuring

### openfoam.org

Follows approach for ".com" version.

## Build Issues 

### openfoam.com

Subequent compilation with Allwmake will now run largely without any
problems, except that the components linking against CGAL
(foamyMesh and surfaceBooleanFeatures) will also try to link against
a nonexistent mpfr library. As a workaround, the link-dependency can
be removed in wmake/rules/General/CGAL :
```
CGAL_LIBS = \
    -L$(BOOST_ARCH_PATH)/lib \
    -L$(BOOST_ARCH_PATH)/lib$(WM_COMPILER_LIB_ARCH) \
    -L$(CGAL_ARCH_PATH)/lib \
    -L$(CGAL_ARCH_PATH)/lib$(WM_COMPILER_LIB_ARCH) \
    -lCGAL
```

Fixed overwriting `wmake/rules/General/cgal` with `wmake/rules/General/cgal-no-mpfr` 

### openfoam.org

Missing `linux64Cray` rules files are in the patch file consisting options from Esko Järvinen (CSC). 

## Building with EasyBuild

https://develop.openfoam.com/Development/openfoam/-/wikis/building#easybuild

### Notes on CPE

 * This easyconfig produces `linux64Cray` platform binaries using `Cray` compiler option which is in fact CPE GNU. 
