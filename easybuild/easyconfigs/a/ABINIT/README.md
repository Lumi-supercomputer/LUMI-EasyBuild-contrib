# ABINIT technical information

ABINIT is a software suite to calculate the optical, mechanical, vibrational,
and other observable properties of materials. Starting from the quantum
equations of density functional theory, you can build up to advanced
applications with perturbation theories based on DFT, and many-body Green's
functions (GW and DMFT).

ABINIT can calculate molecules, nanostructures and solids with any chemical
composition, and comes with several complete and robust tables of atomic
potentials.

-   [ABINIT web site](https://www.abinit.org/)

    -   [Abinit documentation](https://docs.abinit.org/)

    -   [Abinit tutorials](https://docs.abinit.org/tutorial/)
  
-   [ABINIT on GitHub](https://github.com/abinit/abinit)

    -   [GitHub releases](https://github.com/abinit/abinit/releases)


## EasyBuild

-   [Abinit in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/a/ABINIT)

-   [Abinit in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/a/ABINIT)


### Abinit 9.6.2 from CPE GNU 21.08 and 21.12 on LUMI

Adapted from CSCS Easyconfig


### ABINIT 10.6.3

-   Contributed by a user from the ABINIT team.

-   For 26.03, we switched to EB6-compatible EasyConfig parameters and added license info to the installation.


### ABINIT 10.8.3

-   The EasyConfig is a direct port of the 10.6.3 one for 26.03, but with updated dependencies and an updated
    download location.

-   Needed to run `autogen.sh` before `configure` as the configure script was not yet built in the download.
