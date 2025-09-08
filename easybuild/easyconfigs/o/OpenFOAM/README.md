# OpenFOAM notes

This easyconfig is based on the 
[public CSCS version using `Binary` easyblock](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/o/OpenFOAM).

Rewritten to use recent configuration layers built-in the OpenFOAM.

OpenFOAM in two flavours (branches) from: `openfoam.com` (YYMM release numbering) and `openfoam.org` (`N` release numbering). 

Links:

-   [openfoam.com](https://www.openfoam.com/)

    -   [News page with release announcements](https://www.openfoam.com/news/main-news)

    -   [Developers Wiki](https://develop.openfoam.com/Development/openfoam/-/wikis/home) which includes the
        [GitLab-style repository](https://develop.openfoam.com/Development/openfoam/-/tree/master).

-   [OpenFOAM Foundation (openfoam.org)](https://openfoam.org/)

    -   [Download page for latest version](https://openfoam.org/download/)

    -   [Repositories on GitHub](https://github.com/OpenFOAM)

        Development is done in the [OpenFOAM-dev repository](https://github.com/OpenFOAM/OpenFOAM-dev).
        As soon as a version is released, it gets a separate repository rather than a branch, and further
        bug fixes for specific versions are applied in those repositories. So it might be possible to
        find a newer variant of a particular OpenFOAM version including many bug fixes.

        It is however impossible for us to track all versions and update the EasyConfigs all the time.

-   EasyBuild support

    -   [EasyBuild is mentioned on the openfoam.com Wiki](https://develop.openfoam.com/Development/openfoam/-/wikis/building#easybuild)
  
    -   The [standard EasyBuild EasyConfigs](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OpenFOAM)
        use a [custom EasyBlock](https://github.com/easybuilders/easybuild-easyblocks/blob/develop/easybuild/easyblocks/o/openfoam.py) 
        as OpenFOAM has its own build process that does not pick up compiler options from the environment.

        The EasyBlock changes configuration files of OpenFOAM to inject the options that are set via the `toolchainopts` options
        (and the defaults for those if nothing is specified).

    -   The [CSCS EasyConfigs](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/o/OpenFOAM) 
        which we use take a completely different approach and just use the configuration that is already used
        in the configuration files that come with OpenFOAM.


## Configuring

### openfoam.com

[Instructions in the OpenFOAM.com Wiki](https://develop.openfoam.com/Development/openfoam/-/wikis/configuring).


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


### Issues reported in the EasyBuild community

-   [easybuild-easyconfigs issue #20297](https://github.com/easybuilders/easybuild-easyconfigs/issues/20927)
    mentions that OpenFOAM with recent versions of the GNU compilers can sometimes produce wrong results
    when compiling with `-O2 -ftree-vectorize` which are the default options for the EasyBuild GNU
    toolchains.

    The issue has also been reported to openfoam.org as
    [issue #004076](https://bugs.openfoam.org/view.php?id=4076)
    where it was reported that the OpenFOAM developers could not reproduce the error.
    This is because when trying to reproduce, I assume the standard compiler options were used,
    which is `-O3` instead of `-O2 -ftree-vectorize`.

    There is also an older [easybuild-easyconfigs issue #15495](https://github.com/easybuilders/easybuild-easyconfigs/pull/15495)
    on the same topic.

    It got fixed in EasyBuild by using a `toolchainopts` to turn off `-ftree-vectorize` and just
    compile with `-O2`.

    The fix is irrelevant to the LUMI setup as we simply use the very reasonable options that
    the OpenFOAM build process choses by default and don't overwrite those with EasyBuild-generated
    flags.


## Building with EasyBuild

https://develop.openfoam.com/Development/openfoam/-/wikis/building#easybuild

### Notes on CPE

 * This easyconfig produces `linux64Cray` platform binaries using `Cray` compiler option which is in fact CPE GNU.
  
   Note that the compiler flags set by EasyBuild are completely neglected during the build, so that we
   effectively build with the GNU compiler options that the developers likely tested with.
   
 
### Issues with OpenFOAM v2106 and GCC 11
 
-   Linking fails for OpenFOAM v2106 and GCC 11. We run into 
    [issue 2147](https://develop.openfoam.com/Development/openfoam/-/issues/2147)
   
    The fix proposed there is to compile with `-D_GLIBCXX_USE_CXX11_ABI=0`. However, 
    as OpenFOAM does not honour the pretty standard `CXXFLAGS` environment variable, 
    the only solution is to inject this option using `FOAM_EXTRA_CXXFLAGS` and this
    has to be done after calling the `etc/bashrc` script as that script unsets the
    variable to avoid accidentally using settings from a previous compile in the 
    same shell. 


### OpenFoam v2212 
 
-   Trivial port of the EasyConfig


### OpenFOAM v2312

-   For now a trivial port of the 2212 EasyConfig


### OpenFOAM.org 10

-   Needed some patching compared to the very old version 9 EasyConfigs.


### OpenFOAM.org 12

-   Patching needed as it did not work correctly with `gcc-13`. Some files were compiled
    with the correct compiler while others were compiled with the SYSTEM compiler.

-   Uses now also ParMETIS, which needed a shared library build of ParMETIS.

### OpenFOAM.org 13

-   Fairly trivial port of the EasyConfig for version 12, but improved the name of the
    downloaded file.

