# hipSYCL instructions

-   [hipSYCL web site](https://hipsycl.github.io/)

-   [hipSYCL on GitHub](https://github.com/illuhad/hipSYCL)

    -   [GitHub releases](https://github.com/illuhad/hipSYCL/releases)


## EasyBuild

-   No support in the EasyBuilders repository at the time of writing.

-   No support in the CSCS repository at the time of writing.

### Version 0.9.3 for cpeGNU/22.08

-   This EasyConfig is contributed by Jørgen Nordmoen, USIT, University of Oslo.

-   Note that the module will also set an environment variable that sets the hipSYCL
    target architecture to the architecture of the MI250x GPU. Hence it will not work
    without modifications on the older MI100 GPUs!
