# Package

- [Celerity (runtime) on GitHub](https://github.com/celerity/celerity-runtime) 

## EasyBuild

- There is no support for Celerity in the EasyBuilders repository.
- There is no support for Celerity in the CSCS repository.

### Release 0.6.0 for CPE 24.03

- `Celerity-0.6.0-cpeAMD-24.03.eb` is the first release of Celerity for LUMI.
- Rely on:
  - cpeAMD EasyBuild toolchain
  - AdaptiveCpp 24.10.0 with ROCm 6.0.3
- The recipe relies on ROCm LLVM entirely.

### Release 0.7.0 for CPE 25.03

- `Celerity-0.7.0-cpeAMD-25.03.eb`, same as 0.6.0 but for CPE 25.03.
- Rely on:
  - cpeAMD EasyBuild toolchain
  - AdaptiveCpp 25.02.0 with ROCm 6.3.4
- The recipe relies on ROCm LLVM entirely.
