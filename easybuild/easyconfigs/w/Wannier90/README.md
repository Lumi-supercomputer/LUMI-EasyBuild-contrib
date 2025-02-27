# Wannier90

[Wannier website](http://www.wannier.org/)

## General information

Wannier90 is an open-source code (released under GPLv2) for generating 
maximally-localized Wannier functions and using them to compute advanced 
electronic properties of materials with high efficiency and accuracy.

  * [Wannier user guide and tutorial](http://www.wannier.org/support/)

## Known Issues

  * There is a problem with the code version 3.1.0 and GCC 12/13 reported 
    [in the wannier GitHub as issue 521](https://github.com/wannier-developers/wannier90/issues/521)
    which may result in `wannier` program faults.

    For mitigating the issue develop code version (end of Jan 2025) is available with eb file:
    - Wannier90-24Jan2025-cpeGNU-24.03.eb  
