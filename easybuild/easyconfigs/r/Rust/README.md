# Rust

  * [Rust home page](https://www.rust-lang.org)


## EasyBuild

  * [Rust support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/r/Rust)

  * There is no support for Rust in the CSCS repository


### Rust 1.54.0 from LUMI/21.06 on

  * The EasyConfig builds upon the one of the EasyBuilders repository. It uses
    the SYSTEM toolchain however so that it can be used to generate packages
    for the SYSTEM toolchain or any other toolchain on LUMI.

  * It is intended for installation in ``partition/common`` as processor-specific
    binaries don't make much sense for compilers and as it can then be used to
    compile software for that partition also.

### Rust 1.55.0 from LUMI/21.08 on

  * Straightforward adaptation of the EasyConfig for version 1.54.0.

### Rust 1.60.0 for LUMI/21.12 and LUMI/22.06

  * Port of the one for 1.55.0, but with some clean-up of loaded modules in the pre
    options as we have experienced that otherwise Rust might pick up the wrong 
    compiler.
    
  * Modification based on the default EasyConfigs: use x.py for build and install 
    steps.
    
  * TODO: We set CFLAGS and CXXFLAGS but it is not clear at all if this is of any 
    use during the install procedure.

### Rust 1.70.0, developed for LUMI/22.12

  * Now loading the gcc/11.2.0 module for the build process as building with the
    system gcc was problematic.
    
  * Added config options to also build all tools. This seems to solve the link problems
    that we appeared to have with the 1.60.0 version.
    
  * Checked with what the EasyBlock for Rust in an upcoming version of EasyBuild does.
