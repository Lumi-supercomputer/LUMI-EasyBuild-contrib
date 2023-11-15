# PLUMED user information

**Note: Recent versions of PLUMED need to be build on the compute nodes if you want
to optimise for them (and hence use `partition/C` or `partition/G`).**

**After the March-April 2023 system update the EasyConfigs of PLUMED were replaced with 
two versions due to build problems on the updated system.**

-   `-cray-python-3.9.12.1` versions include Python support as before, with the
    `cray-python` module now loaded explicitly as a dependency.
    
    These EasyConfigs in particular are currently workarounds as we are not sure about
    the root cause of the problem yet and suspect the configure process may still be 
    picking up unintended versions of packages.
 
-   `-noPython` versions have Python support disabled.
