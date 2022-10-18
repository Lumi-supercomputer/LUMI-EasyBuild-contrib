# OpenCV instructions

-   [OpenCV web site](https://opencv.org/)

-   [OpenCV on GitHub](https://github.com/opencv/opencv)

    -   [GitHub releases](https://github.com/opencv/opencv/releases)


## EasyBuild

-   [OpenCV support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/o/OpenCV)

-   [(Old) OpenCV support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/o/OpenCV)

-   [OpenCV (opencv) support in Spack](https://spack.readthedocs.io/en/latest/package_list.html#opencv)


### Version 4.5.5 for cpeGNU/22.08 for CPU

-   The EasyConfig is based on the EasyBuilders one from the foss/2021b toolchain
    as that was the most recent EasyConfig available at the time of development.
    
    Dependencies were updated to the ones already in use on LUMI.
    
-   FFmpeg in the version that we use in 22.08 causes compile problems and has 
    been removed. It is likely that OpenCV is only compatible with FFmpeg 4 and
    not 5 but that this is not properly tested in this version.
