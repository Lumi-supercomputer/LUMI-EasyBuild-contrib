# elfutils instructions

-   [elfutils web site](https://sourceware.org/elfutils/)
    
-   [elfutils git repository](https://sourceware.org/git/?p=elfutils.git;a=summary)


## EasyBuild

-   [elfutils support in the EasyBuilders repsoitory](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/e/elfutils)

-   [elfutils support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/e/elfutils)

-   [elfutils support in Spack](https://spack.readthedocs.io/en/latest/package_list.html#elfutils). 
    There are additional dependencies compared to the EasyBuilders build.


### Version 0.187 for cpeGNU/22.08

-   The EasyConfig is a port of the EasyBuilders one for GCCcore/11.3.0 (2022a).

-   There was a problem with linking to the includes `libdw.so` as for some reason 
    the path to the library was wrongly hard-linked as `../libdw/libdw.so`.
    
    For noe we edit the binaries and shared objects with `patchelf` to remove that
    bad link.
    
TODO: What is the function of the additional dependencies in Spack?

