# GTK3 instructions

-   [General GTK web site](https://www.gtk.org/)

-   [GTK3 developers documentation](https://developer.gnome.org/gtk3/stable/)

-   [GTK GitLab](https://gitlab.gnome.org/GNOME/gtk/)


## EasyBuild

-   [GTK3 support in the EasyBuilders repsoitory](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/g/GTK3)
    
-   There is no support for GTK3 in the CSCS repository.

-   [GTK3 is supported through gtkplus in Spack](https://spack.readthedocs.io/en/latest/package_list.html#gtkplus)


### Version 3.24.33 for cpeGNU/22.08

-   The EasyConfig is a port of the EasyBuilders one for GCCcore/11.3.0 (2022a). 

-   Added options to the config of GTK+ 3.x

    -   `--disable-cups` as there is no printing on LUMI.
    
    -   `--disable-papi` as there is no printing on LUMI.

-   The third element of the bundle, `adwaita-icon-theme`, has been disabled as
    `autoreconf` generates a `configure` script that fails on line 2715. 
    (And also produces a warning about a non-existing `m4` subdirectory that some
    sources on the internet claim can be neglected.)
    
    The line that causes problems is 
    ```
    PKG_PROG_PKG_CONFIG(0.19)
    ```
    but it is not clear if that is a problem caused by the Cray version of 
    pkg-config that may miss a macro or so or if there is something else going on.
    