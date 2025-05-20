# VisRTX technical information

-   ANARI Software Development Kit. It is a Khronos group specification

    -   [Anari on GitHub](https://github.com/KhronosGroup/ANARI-SDK/)
    
        -   [GitHub releases](https://github.com/KhronosGroup/ANARI-SDK/releases)

-   VisRTX is the NVIDIA Optix based implementation of Anari
    
    -   [VisRTX GitHub](https://github.com/NVIDIA/VisRTX/)
    
        -   [GitHub releases](https://github.com/NVIDIA/VisRTX/releases)

Specific versions of VisRTX require specific versions of Anari, so be careful when 
updating versions!

    
## EasyBuild

-   ANARI

    -   There is no support for Anari in the EasyBuilders repository at the time of 
        writing.
        
    -   There is no support for Anari in the CSCS repository.

    -   [ANARI-SDK in the JSC repository](https://github.com/easybuilders/JSC/tree/2025/Golden_Repo/a/ANARI-SDK)
    
    
-   VisRTX

    -   There is no support for VisRTX in the EasyBuilders repository at the time of 
        writing.
        
    -   [Ancient support for VisRTX in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/v/VisRTX)

    -   [VisRTX in the JSC repository](https://github.com/easybuilders/JSC/tree/2025/Golden_Repo/v/VisRTX)



### Version 0.9.0 for cpeGNU/24.03

-   The EasyConfig is partly a LUST development, bundling VisRTX with Anari.
    It is inspired by the work at JSC.

