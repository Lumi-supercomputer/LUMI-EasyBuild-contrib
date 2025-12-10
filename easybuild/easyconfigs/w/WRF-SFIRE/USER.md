# WRF-SFIRE User Information

We cannot support building WRF-SFIRE in the 25.03 or newer environments due to quality
problems with the code.

The compilation produces many errors and only some can be worked around with compiler
flags (that themselves serve to mask dangerous behaviour that can lead to wrong code).
Moreover, the `compile` script continues to try to compile the remaining code after 
the first error, which implies that we cannot see the environment in which the first
error occured.

As debugging installation scripts is not a LUST task, and as for this code this is
also far from trivial, we cannot offer EasyBuild recipes for WRF-SFIRE in 25.03 or 
newer. If you need this code, we suggest you request an 
[EPICURE support project](https://epicure-hpc.eu/) from EuroHPC so that they can 
see if they have an expert who can further debug the installation procedure.
They already made several corrections to get it to work with the 24.03 environment
on the system.
