# OpenFOAM user instructions

OpenFOAM is a toolbox to develop CFD codes with lots of examples included. It is not very well
suited to an installation in a software stack as users may want to work in the code tree.

We cannot support each and every version and each and every subsequent bug fix release
for those versions. However, if you want a newer version or a bugfix version, the 
EasyConfigs offered here may be a nice start, though it would be easy to just extract
the proper build instructions from them and do a manual build if needed.

Note that we also cannot keep supporting older versions of codes. Computers evolve, the
software environment of those computers evolve, and older versions may simply not compile
anymore. OpenFOAM is notorious for such problems, sometimes requiring rather old versions
of libraries also that can conflict with newers ones on the system.

Use OpenFOAM with care on LUMI. Some file access strategies of OpenFOAM (basically using 
one or more files per MPI rank) do not scale to thousands of MPI ranks but can take down
a supercomputer filesystem as these are optimised to work with large files and parallel I/O
and not for simultaneously writing to thousands of files.
