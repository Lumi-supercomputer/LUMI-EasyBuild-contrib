# Info-ZIP Zip/UnZip instructions

This EasyConfig is a bundle of the Zip and UnZip EasyConfigs to offer a full
suit of zip file tools, an ported to the Cray PE.

This is just for in case one for some reason needs the utilities built with
the Cray PE compilers rather than the versions of the tools installed in the
system image of LUMI. The package only contains binaries and no libraries,
so this is likely not needed.

-   [Info-ZIP Zip home page](http://www.info-zip.org/Zip.html)
  
-   [Info-ZIP UnZip home page](http://www.info-zip.org/UnZip.html)
  
-   [Info-ZIP on SourceForge](https://sourceforge.net/projects/infozip/files/)
  

## EasyBuild

-   [Zip support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/z/Zip)
  
-   [UnZip support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/u/UnZip)
  
-   There is no support for UnZip or Zip in the CSCS repository

-   [Spack zip package](https://github.com/spack/spack/blob/develop/var/spack/repos/builtin/packages/zip/package.py)
 
-   [Spack unzip package](https://github.com/spack/spack/blob/develop/var/spack/repos/builtin/packages/unzip/package.py)
 

### Zip version 3.0 and unzip version 6.0 for cpeGNU 22.06 and later

-   The EasyConfig is a straightforward adaptation and bundling of the EasyBuilders ones for the
    `GCCcore` toolchains.
    
-   It may need work for Clang-based compilers.

-   Major reworking for of the EasyConfig for 25.03, partly because of compile errors 
    that showed that before already builds where not with the options that we expected.
    The build process of both Zip and UnZip now fully follows the process in the 
    EasyBuilders EasyConfigs.
  