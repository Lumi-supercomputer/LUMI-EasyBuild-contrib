# UppASD user instructions

The UppASD build recipes are contributed by KTH but adapted for LUMI.

The build recipes do install the Python ASD_GUI and ASD_Tools code 
(in $EBROOTUPPASD/ASD_GUI and $EBROOTUPPASD/ASD_Tools respectively) but do not build a Python
environment with all dependencies of those packages. Given that several of the
dependencies link to graphics UI libraries which are notoriously hard to run on
LUMI, it may be better to either build a conda container using lumi-container-wrapper
or cotainr, or simply run the Python code on a workstation.
`$EBROOTUPPASD/requirements.txt` is the Python pip requirements file included in 
the GitHub repository, but `$EBROOTUPPASD/ASD_GUI` contains a different one also.
