# Java user information

Note that there is also a version of Java already on the system installed with the 
OS. The contributed EasyConfigs are for those who need a more recent version then
what may be on the system at that time.

As Java is already on the system and can be provided by modules also, you'll
have to ensure that any program using Java is using the intended version. 
After loading the module provided by EasyBuild all variables should refer to
that version and it should be first in the path. Also be careful when checking
the manual pages. In the standard configuration of the `man` command on LUMI,
you may be asked which section to use. In that case, `1` should give you the
manual pages for the version in these modules while `1+1` should give you
those from the system as they are further in the search path for manual pages.

We currently only provide installation recipes for LTS releases of Java.

Users are recommended to always load a Java module using only the major version, e.g.,

```
module load Java/17
```

rather then whatever patch level is currently installed on the system. That way it 
is easier to always load the latest patched version.

When installing using EasyBuild:

-   For a first install of a major version it is sufficient to simply call `eb`
    with the `-r` flag and the EasyConfig with the major-only version number, e.g.:
    
    ```
    eb Java-17.eb -r
    ```
    
-   However, due to the way EasyBuild searches for EasyConfigs on LUMI, if you want 
    to update to a new version, you'll have to go to the directory with the right
    versions of the EasyConfig (`.eb`) files, e.b.,
    
    ```
    cd /appl/lumi/LUMI-EasyBuild-contrib/easybuild/easyconfigs/j/Java
    ```
    
    if you are just using the centrally provided EasyConfigs for Java, as otherwise
    EasyBuild will try to reproduce the previous installation automatically.
