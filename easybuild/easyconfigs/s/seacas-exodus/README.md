# SEACAS Exodus technical information

Exodus is part of SEACAS, The Sandia National Laboratory Engineering Analysis Code 
Access System.

The Exodus library is a model developed to store and retrieve data for finite element analyses. 
It is used for preprocessing (problem definition), postprocessing (results visualization), 
as well as code to code data transfer. An Exodus data file is a random access, machine independent, 
binary file that is written and read via C, C++, or Fortran library routines which comprise the 
Application Programming Interface. Exodus uses NetCDF Library as the on-disk storage format.

-   [SEACAS/Exodus documentation](https://sandialabs.github.io/seacas-docs/sphinx/html/index.html)

-   [SEACAS on GitHub](https://github.com/sandialabs/seacas/)

    -   [GitHub releases](https://github.com/sandialabs/seacas/releases)
    
Note that there is also an alternative, Python-only implementation known as
[ExodusII](https://github.com/sandialabs/exodusii).

    
## EasyBuild

-   There is currently no support in the EasyBuilders repository


### v2025-04-29 for cpeGNU/24.03

-   The EasyConfig is a LUST development.

