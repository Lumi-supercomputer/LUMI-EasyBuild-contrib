# Quantum ESPRESSO

-   [Quantum ESPRESSO website](https://www.quantum-espresso.org/)
  
-   [Quantum ESPRESSO GitLab](https://gitlab.com/QEF/q-e)
    with direct downloads that don't require registration.


## General information

Quantum ESPRESSO is an integrated suite of computer codes for 
electronic-structure calculations and materials modeling at the nanoscale. It is
based on density-functional theory, plane waves, and pseudopotentials (both 
norm-conserving and ultrasoft).


## EasyBuild

-   [QuantumESPRESSO in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/q/QuantumESPRESSO)

-   [QuantumESPRESSO in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/q/QuantumESPRESSO)


### Version 6.8.0 for cpeGNU 21.08

-   The EasyConfig is derived from the CSCS one


### Version 7.0 for cpeGNU 21.12

-   The EasyConfig is a port of the 6.8.0 one.


### Version 7.1 for cpeGNU 22.06, 22.08

-   The EasyConfig is a port of the 7.0 one. 
  

### Version 7.2 for cpeGNU 22.12 and 23.09

-   The EasyConfig is a port of the 7.1 one. 

-   Added copying of the license information in 23.09

  
### Version 7.3 for cpeGNU 23.09

-   Trivial port of the 7.2 EasyConfig file.


### Version 7.4.1 for CPE 24.03

-   Port of the 7.3 EasyConfig file, but we ran into issues the EasyBuilders also ran 
    into:

-   There are issues with the d3q version that is pointed to in
    `external/submodule_commit_hash_records`. We used the version used by the EasyBuilders,
    that has its own issues though for which they have a patch. See also
    [this d3q issue](https://github.com/anharmonic/d3q/issues/22), opened by Davide Grassano who
    develops for EasyBuild.
    
-   There is an issue with qe-gipaw if the commit is used that 
    `external/submodule_commit_hash_records` pointed to. 
    Code in `external/qe-gipaw/src/gipaw_setup.f90`
    tries to use the module `uspp_data`, but that module is nowhere to be found in 
    the sources of QE or its dependencies that are installed along with it. There are
    `uspp` and `uspp_params` modules, but no `uspp_data`.
    
    It turned out that in the 
    [`qe-gipaw` repository](https://github.com/dceresoli/qe-gipaw),
    a different commit was tagged as version 7.4.1, and we used that commit.

-   We also employed another patch from the EasyBuilders that claims to fix an issue with symmetrization.

