# Chapel Documentation

The [main website for Chapel](https://chapel-lang.org/) provides an introduction to Chapel programming language and the project. The following list is an non-exhaustive list of relevant pages that was used to create the EasyBuild recipes for Chapel:
- [Chapel Documentation](https://chapel-lang.org/docs/index.html)
    - [Using Chapel on HPE Cray Systems](https://chapel-lang.org/docs/platforms/cray.html#)
    - [Using SLURM](https://chapel-lang.org/docs/usingchapel/launcher.html#using-slurm)
    - [Using Chapel with libfabric](https://chapel-lang.org/docs/platforms/comm-layers/libfabric.html)
    - [Multilocale Chapel Execution](https://chapel-lang.org/docs/usingchapel/multilocale.html)
    - [Setting up Your Environment for Chapel](https://chapel-lang.org/docs/usingchapel/chplenv.html)
    - [GPU Programming](https://chapel-lang.org/docs/technotes/gpu.html)
-   [Chapel on GitHub](https://github.com/chapel-lang/chapel)

    -   [GitHub releases](https://github.com/chapel-lang/chapel/releases)

## Usage

Currently we only support the CPU version of Chapel with the included LLVM backend. To use Chapel load the module and configure the launcher:
```
module load LUMI partition/C Chapel/2.6.0
export CHPL_LAUNCHER_CORES_PER_LOCALE=128
export CHPL_LAUNCHER_PARTITION=<LUMI partition>
export CHPL_LAUNCHER_ACCOUNT=<Your project>
```

## EasyBuild
-   There is no support for Chapel in the EasyBuilders repository.

-   There is no support for Chapel in the CSCS repository.

-   [Spack package chapel](https://packages.spack.io/package.html?name=chapel)

Currently we only offer a CPU version of Chapel. We are working on adding GPU support.

* `Chapel-2.6.0-24.03.eb`: CPU version of Chapel for CPE 24.03 with bundled LLVM support.

## Version 2.6.0

Chapel 2.6.0 can be configured with different backends. It is recommended to use an LLVM backend. Since the LLVM in the Cray Programming Environment is not complete the EasyBuild installation builds the bundled LLVM (19.1.3). These are the default settings that are set by Chapel.
