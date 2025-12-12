# fpocket technical information

LUST cannot guarantee the proper working of this code. Compiling produces lots
of warnings, and we even had to turn off some error messages. This is sloppy 
code and it is not up to LUST to debug the code. Also, when writing this, the
last update was on 9 September 2024, so the code may very well be 
abandonware. Use at your own risk but don't expect the LUST to fix issues.

-   [fpocket on GitHub](https://github.com/Discngine/fpocket)
    
    -   [GitHub releases](https://github.com/Discngine/fpocket/releases)


## EasyBuild

-   There is no support for fpocket in the EasyBuilders or CSCS repositories.

-   [fpocket in the Spack repository](https://packages.spack.io/package.html?name=fpocket)
    

### General remarks

The makefile of fpocket is broken as it pushes its own compiler options without taking
into account options set elsewhere, knows only `gcc` and `clang` as a compiler, and 
has the installation directory also hardcoded in the makefile. It then also tries to 
install QHull through a modified Makefile rather than the usual CMake procedure, and
makes some of the same mistakes.

Hence some serious patching is needed.


### Version 4.2.2 for cpeGNU 24.03 and later

-   The EasyConfig is developed by LUST.

-   We use the QHull package included with fpocket and don't try to install it as
    a separate dependency, as it is linked in statically anyway.
    
-   Some extensive patching was needed to work around problems with the makefiles of 
    the package.

-   Somehow we needed to add additional compiler flags for 25.03 to turn off some
    errors. This required an improved patch.
