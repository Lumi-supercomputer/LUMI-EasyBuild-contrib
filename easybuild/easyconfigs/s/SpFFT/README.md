# SpFFT

  * [SpFFT repository](https://github.com/eth-cscs/SpFFT)

## General information

SpFFT - A 3D FFT library for sparse frequency domain data written in C++ with 
support for MPI, OpenMP, CUDA and ROCm. Inspired by the need of some 
computational material science applications with spherical cutoff data in 
frequency domain, SpFFT provides Fast Fourier Transformations of sparse 
frequency domain data. For distributed computations with MPI, slab decomposition
in space domain and pencil decomposition in frequency domain
(sparse data within a pencil / column must be on one rank) is used.


## EasyBuild

  * [SpFFT in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/s/SpFFT)


### Version 1.0.5 for CPE 21.08

  * The EasyConfig is derived from the CSCS one
  
 
### Version 1.0.6 for 22.08 and 23.09 with GPU support

  * The EasyConfig is an adaptation of the 1.0.5 one but now with GPU support
    enabled.
