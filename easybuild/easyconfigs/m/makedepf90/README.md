# makedepf90 instructions

The makedepf90 tool was developed long ago by Erik Edelmann from CSC but is no
longer maintained, and the original repository is no longer available. Yet it is 
still included in several Linux distributions as an optional packages. Sources
for the last official version, 2.8.8, can also still be found as tar files
on archives.

  * [Unofficial GitHub with makedepf90 sources](https://github.com/outpaddling/makedepf90).
    This is an unofficial copy of the sources, with the claim also that some improvements
    have been made to the installation procedure.
    
This software is no longer maintained so is offered without any warranty
that it works properly or can continue to work on LUMI in the future.
It is fully offered "as-is", without support from the LUMI User Support
Team, unless someone would pick up development again.

    
## EasyBuild

  * [Support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/m/makedepf90)
  
  * There is no support in the CSCS repository
  
It is best to compile this program in `partition/common` so that it is available to
all partitions in a given LUMI stack.
  

### Version 2.8.8 for the SYSTEM toolchain

  * This is an adaptation of an old EasyBuilders recipe to compile with the
    SYSTEM toolchain as it makes no sense at all to compile with the Cray
    Programming Environment for such a little tool that is only used during
    the build process.
    

### Version 2.8.9 for the SYSTEM toolchain

  * This is a build based on the new GitHub repository.
  
  * Even though it claims improvements in the build process, it actually contains
    new bugs. E.g., it adds a dot in front of the paths in `make install` which we
    had to work around by setting `DESTDIR`.
    
  * An improvement though is that it installs the man page where it should.


