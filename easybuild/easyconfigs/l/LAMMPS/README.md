# LAMMPS instructions

-   [LAMMPS web site](https://www.lammps.org/)

-   [LAMMPS GitHub](https://github.com/lammps/lammps)
  
-   JSC had public notes on LAMMPS optimization (link was 
    [fzj-jsc.github.io/tuning_lammps/](https://fzj-jsc.github.io/tuning_lammps/))
    but these are no longer available.
  
    Basically the advice from JSC is to use Kokkos as it covers multicore and GPU, 
    but it does need to be enabled also by users running LAMMPS. 


## Known issues

-   LAMMPS may hang when specifying a non-existing input file, though it seems this
    may be an issue when using LAMMPS from Python which is not really supported in
    the build recipes below.

    See [LAMMPS issue #5248](https://github.com/lammps/lammps/issues/5248) and
    [LAMMPS issue #3773](https://github.com/lammps/lammps/issues/3773) which is
    a slightly different issue but likely with a common cause in the Python
    interface.


## EasyBuild support

-   [LAMMPS support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/LAMMPS).
    This is based on a custom EasyBlock with support for most but not yet all optional packages.
    Likely due to this and the continyous rapid changes in the package the support for recent
    versions is lagging.

-   [LAMMPS support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/l/LAMMPS).
    CSCS uses the plain CMakeMake generic easyblock but does not support most of the additional
    packages. There are recipes for newer versions though, but often for Piz Daint. They should
    port over easily though.

-   [LAMMPS support in Spack](https://github.com/spack/spack/tree/develop/var/spack/repos/builtin/packages/lammps)


### 29Oct20-*-minimal for cpeGNU 21.08

-   This is an EasyConfig file directly derived from the CSCS one.

-   Added support for jpeg and png based on the Spack recipe.

-   It does not yet work with cpeCray because FFmpeg does not compile.


### 23Jun22_update2-*-minimal for cpeGNU 22.08

-   Fairly trivial update of the one for the 29Oct20 version.


### 2Aug2023_update3 for cpeGNU 24.03

-   Based on previous easyconfigs but adapted to make it closer to the 
    EasyBuilders one. We enable packages which requires no extra dependency
    or with dependency already present in the central software stack.
    
-   It turns out this version is only compatible with PLUMED 
    2.4.x, 2.5.x, 2.6.x, 2.7.x, 2.8.x and not with the 2.9.x version which
    we tried to use for other software in 24.03.

    
### 22Jul2025_update2 for cpeGNU 25.03

-   Fairly trivial update of the 2Aug2023_update3 for CPU.

-   Tried adding ADIOS also, but compilation failed for some reason not yet understood.

-   It is not clear what PLUMED version to use. The manual says 2.4.x, 2.5.x or 2.6.x, 
    which are ancient versions and hence a regression. For now we went with a 2.9
    version, but this may not work when running. We are not LAMMPS specialists however.

-   **During the configure step, some extra files are being downloaded for which we 
    have no solution yet in the EasyConfig.**


### 22Jul2025_update3 for cpeAMD

-   Update of the previous GPU version (2Aug2023_update3 in 24.03).

-   Needed to use the `craype` module from 25.09, so this is a dirty EasyConfig that
    may fail in the future. This was done to work around a bug in the compiler wrappers.


### 22Jul2025_update4 for cpeGNU 25.03 (CPU)

-   Evolution of the EasyConfig for 22Jul2025_update2 for cpeGNU 25.03.

-   Switched to EB6-compatible parameters.

-   Went through the package list and compared with the manual.

    -   The manual says PLUMED 2.4.x, 2.5.x or 2.6.x, the download script 
        downloads version 2.7.2... We installed the latest 2.7 version just to 
        be on the safe side.

    -   Added a few additional ones that are new or that we had issues with in the past.

    -   The **QUIP** extension is explicitly not supported as it is impossible to build this
        code properly on LUMI. Its Meson config script is way too primitive, fails to
        detect the HPE Cray PE and doesn't allow to overwrite the settings easily to tell
        it that the MPI, BLAS and ScaLAPACK libraries will be linked properly.

        Neither Spack nor EasyBuild currently offer any support for QUIP which says a lot...

    -   The **ML-HDNNP** is explicitly not included as it requires the n2p2 library which
        itself has a lot of dependencies, many of which don't belong on an HPC system (TeX)
        or directly on Lustre (lots of Python packages needed). It is not clear if a minimal
        installation is possible and would be good enough to at least provide the parts that
        LAMMPS needs.

    -   The **QMMM** extension is also not included because this creates a terrible dependency
        tree, also pulling in QuantumESPRESSO, making quick updates after system upgrades
        totally impossible.

    -   **VTK** would make the whole graphics stack a dependency. As it is hard to build that stack
        and is not even done for all versions of the PE, this is not included.

-   Hidden downloads found:

    -   https://download.lammps.org/potentials/C_10_10.mesocnt to the `potentials` subdirectory
        in the sources.

        However, it looks like that one too is first downloaded to `easybuild_obj`. But putting
        the file ourselves in the `potentials` subdirectory seems to prevent the download.

    -   https://github.com/ICAMS/lammps-user-pace/archive/refs/tags/v.2023.11.25.fix2.tar.gz
        but that one is uncompressed in `easybuild_obj`... Download is first stored as
        `libpace.tar.gz` in `easybuild_obj`.

        It looks like the sources may be uncompressed elsewhere if then LOCAL_ML_PACE is set
        to the location.

        Or simply making sure `libpace.tar.gz` is in `easybuild_obj` when the configure step
        starts, also works.

    -   It looks like we have an issue with Eigen also (wants to download version 3.4.0).

        This was solved by using Eigen 3.4.0 and explicitly pointing CMake to it.

    TODO: Understand the script tools/offline/scripts/init_http_cache.sh and when it plays a role.
