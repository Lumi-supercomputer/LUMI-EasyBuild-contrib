# Neko

  * [Neko Website](https://neko.cfd)

## General information

Neko is a portable framework for high-order spectral element flow simulations. 
Written in modern Fortran, Neko adopts an object-oriented approach, allowing 
multi-tier abstractions of the solver stack and facilitating various hardware 
backends ranging from general-purpose processors, CUDA and HIP enabled accelerators.

### Version 0.8.1 for CPE GNU and CPE Cray 24.03 

  * Recipe for the GNU toolchain is only tested for single node runs; there is an issue 
    with device buffers on multiple nodes for this version

  * Recipes are tested agains ROCm release 6.0.3
