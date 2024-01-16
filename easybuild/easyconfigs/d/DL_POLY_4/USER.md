# DL_POLY_4 user instructions

[DL_POLY](https://www.scd.stfc.ac.uk/Pages/DL_POLY.aspx)
is a general purpose parallel molecular dynamics simulation package 
developed at Daresbury Laboratory by I.T. Todorov & W. Smith. 

There is some [web based documentation](https://ccp5.gitlab.io/dl-poly/)
and the [GitLab repository](https://gitlab.com/ccp5/dl-poly/) also 
contains some information on building if you want to try an independent
build.


## Installation

Currently, the release version of 5.1.0 and pre-release version 5.2.0-pre
do not compile with the Cray Fortran compiler. Some code changes between
5.1.0-pre and 5.1.0 are not appreciated by that compiler.

The code also produces several warnings that may point to bugs, and though
5.1.0 and later do compile with the GNU compilers, we cannot guarantee that
the generated binaries will be correct (though it does appear that the 
developers use GNU Fortran more often).

Generally speaking the code seems to be a bit of a mess. In version
5.1.0-pre it is possible to configure with OpenMP, but in 5.1.0 this
is no longer possible even though the example build configurations
still show OpenMP support. 

SINCE INSTRUCTIONS ARE SO UNCLEAR, SINCE SO MANY WARNINGS APPEAR DURING
COMPILATION, AND SINCE THERE ARE SEEMINGLY VERY UNLOGICAL CHANGES BETWEEN
VERSIONS, IT IS CLEAR THAT THIS IS A RATHER EXPERIMENTAL CODE FOR WHICH
WE CANNOT OFFER MORE SUPPORT THAN SIMPLE COMPILE EXAMPLES THAT GENERATE
A BINARY.

