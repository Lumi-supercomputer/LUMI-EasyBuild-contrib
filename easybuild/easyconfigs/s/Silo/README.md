# Silo technical information

Silo is a library for reading and writing a wide variety of scientific data to
binary disk files. The files Silo produces and the data within them can be easily
shared and exchanged between wholly independently developed applications running
on disparate computing platforms. Consequently, Silo facilitates the development
of general purpose tools for processing scientific data.

It is used in the LUMI graphics stack, in ParaView and VisIt.

-   [Silo website](https://wci.llnl.gov/simulation/computer-codes/silo/)
    
-   [Silo GitHub](https://github.com/LLNL/Silo)

    -   [GitHub releases](https://github.com/LLNL/Silo/releases)


## EasyBuild

-   There is no support for Silo in the EasyBuilders repository.

-   There is no support for Silo in the CSCS repository

-   [Silo in the JSC EasyConfigs repository](https://github.com/easybuilders/JSC/tree/2025/Golden_Repo/s/Silo)

-   [The silo package in Spack](https://packages.spack.io/package.html?name=silo)


### Version 4.11.1 for cpeGNU/24.03 and 25.03

-   The EasyConfig is based on the JSC EasyConfigs for Silo.

-   Added an additional sanity check for 25.03.


### 4.12.1 for 26.03

-   A major rework was needed as the package has switched to CMake only.

-   To build libsilo and libsiloh5 both in static and shared version, 4 iterations
    are needed (shared/static and with/without HDF5).

-   Removed the bogus Szip dependency. Szip actually only comes in through HDF5, and
    modern HDF5 libraries are often compiled with libaec instead of Szip. Loading two
    libraries supporting the same API may lead to errors. Analysing the CMakeLists file,
    Szip is only needed explicitly on Windows if HDF5 is also compiled with Szip but
    is not needed on Linux as a direct dependency.

-   Looks like there is a permission issue after the installation with EasyBuild as the
    shared libraries have no execution rights.
