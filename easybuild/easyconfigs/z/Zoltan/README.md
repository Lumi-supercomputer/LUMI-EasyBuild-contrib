# Zoltan


## EasyBuild


### 3.901 for cpeGNU 25.03

-   Checked the Zoltan source code in https://github.com/trilinos/Trilinos/blob/master/packages/zoltan/src/tpls/third_library_const.h
    and other files in that directory.

    They show that Zoltan expects ParMETIS in its standard configuration, which is 32-bit indices and
    32-bit floating point.
