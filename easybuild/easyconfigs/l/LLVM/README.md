# LLVM instructions

LLVM, mostly meant to be used in the OpenGL stack. These EasyConfigs are certainly 
not meant to be a replacement for the HPE Cray or AMD compilers on LUMI.

-   [LLVM web site](https://llvm.org/)

    -   [LLVM Documentation](https://llvm.org/docs/)

-   [GitHub](https://github.com/llvm/llvm-project)
    
    -   [GitHub releases](https://github.com/llvm/llvm-project/releases) 
    
    
## EasyBuild

-   [LLVM support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/l/LLVM)
    
-   [LLVM support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/l/LLVM)
    

### Version 14.0.6 for cpeGNU/22.08

-   This EasyConfig is a direct port of the EasyBuilders one.

### Version 17.0.6 for cpeGNU 24.03

-   Based on previous easyconfigs with some changes coming from the EasyBuilders
    repository: building LLVM now requires three source archives while the
    previous version only required one.
