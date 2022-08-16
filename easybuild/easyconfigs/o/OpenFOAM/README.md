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

Subsequent compilation with Allwmake will now run largely without any
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

 
### Issues with OpenFOAM v2106 and GCC 11
 
 * Linking fails for OpenFOAM v2106 and GCC 11. We run into 
   [issue 2147](https://develop.openfoam.com/Development/openfoam/-/issues/2147)
   
   The fix proposed there is to compile with `-D_GLIBCXX_USE_CXX11_ABI=0`. However, 
   as OpenFOAM does not honour the pretty standard `CXXFLAGS` environment variable, 
   the only solution is to inject this option using `FOAM_EXTRA_CXXFLAGS` and this
   has to be done after calling the `etc/bashrc` script as that script unsets the
   variable to avoid accidentally using settings from a previous compile in the 
   same shell. 

 
 
 
    