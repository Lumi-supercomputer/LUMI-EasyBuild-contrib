# QuEST - Quantum Exact Simulation Toolkit

  * [QuEST web site](https://quest.qtechtheory.org/)

  * [QuEST development on GitHub](https://github.com/QuEST-Kit/QuEST)

      * [GitHub releases](https://github.com/QuEST-Kit/QuEST/releases)


## General information

QuEST has a CMake-based installation process. It is in fact not meant for
central installation. Instead, users should just download QuEST, put their
application in the examples subdirectory and then use cmake with the right
options to initiate the build process.

The CMake configuration file for the main library is very buggy (at least
in version 3.3.0, the one that we checked). It hard-codes compiler options
that overwrite any option a user may specify which is rarely a good idea.
As QuEST was never meant to be installed separately, the CMake configuration
file also doesn't contain the necessary logic to do a proper install of the
software.

The EasyConfig setup in this directory provides its own ``CMakeLists.txt``
file that is meant to overwrite the one in ``QuEST/CMakeLists.txt``. It
installs the library part and also copies some example programs etc to the
install directory only as a reference.

Note that QuEST can be build in many different configurations. Users should
adapt their configuration using ``configopts`` before installing the
package! The configuration parameters combined can specify 24 different
configurations of which 14 are valid and produce a library (in version 3.3.0).

QuEST GPU acceleration is based on CUDA and hence is not suited for the
LUMI GPU partition.


## EasyBuild

  * There is no support for QuEST in the easybuilders repository (as of
    September 2021)

  * There is no support for Quest in the CSCS repository (as of September 2021).


### Version 3.3.0 tested with cpeGNU 21.08

  * Rather than using a patch, we inject the new CMakeLists.txt file for the
    ``QuEST`` subdirectory via the sources. This makes it much easier to edit
    the ``CMakeLists.txt`` file and to further refine it.

  * We only build the code in the ``QuEST`` subdirectory using the
    ``CMAKE - make - make install`` buildprocess. Other files are copied
    manually using ``postinstallcmds``.

  * As a centrally installed library has to be used in a different way then the
    manual explains, we provide some information in the module file.


### Version 3.3.0 for cpeGNU 22.06, 22.08

  * Not updated yet as it is not clear if this is being used and as the previous
    fixes need to be modified as the CMake build process has changed.
