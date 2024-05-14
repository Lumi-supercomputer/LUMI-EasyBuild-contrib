# libbfd 

libbfd is distrubuted as part of binutils 

-   [binutils home page](https://www.gnu.org/software/binutils/)
  
    -   [binutils downloads](https://ftp.gnu.org/gnu/binutils/) for version info

BFD is a package which allows applications to use the same routines to operate
on object files whatever the object file format. A new object file format can
be supported simply by creating a new BFD back end and adding it to the library.

BFD is split into two parts: the front end, and the back ends (one for each
object file format).

-   The front end of BFD provides the interface to the user. It manages memory
    and various canonical data structures. The front end also decides which back
    end to use and when to call back end routines.
-   The back ends provide BFD its view of the real world. Each back end provides
    a set of calls which the BFD front end can use to maintain its canonical
    form. The back ends also may keep around information for their own use, for
    greater efficiency.

This package also include libiberty as most tools requiring libbfd also
requires it.

## EasyBuild

-   There is no package for libbfd in the EasyBuilders repository, likely as it can be part of binutils.

-   There is no package for libbfd in the CSCS repository


### Version 2.42 for CPE 23.09

-   Created for LUMI, contributed by Jan André Reuter of JSC.
  
