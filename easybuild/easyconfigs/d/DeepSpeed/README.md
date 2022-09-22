# DeepSpeed instructions

-   [DeepSpeed web site](https://www.deepspeed.ai)

-   [DeepSpeed on PyPi](https://pypi.org/project/deepspeed/)

-   [DeepSpeed on GitHub](https://github.com/microsoft/DeepSpeed)

    -   [GitHub releases](https://github.com/microsoft/DeepSpeed/releases)


## EasyBuild

-   There is no DeepSpeed support in the EasyBuilders repository.

-   There is no DeepSpeed support in the CSCS repository.


### Version 0.7.2 for cpeGNU/22.08

-   The EasyConfig is a LUST development. It currently uses an installation from
    wheels rather than rebuilding from sources.

-   The `postinstallcmds` modifies one of the files as otherwise RCCL also detects
    a network interface it should not use and hangs.
