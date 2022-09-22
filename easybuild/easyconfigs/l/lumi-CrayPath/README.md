# lumi-CrayPath instructions

The lumi-CrayPath EasyConfig doesn't install any software but it does install
a hand-written module that adds `CRAY_LD_LIBRARY_PATH` to the front of
`LD_LIBRARY_PATH` and removes the added directories again when unloading
the module (providing that the user did not manually change or clear the 
environment variable `_CRAYPATH_STORED_CRAY_LD_LIBRARY_PATH` which is essential
to the proper working of this module). 

After loading modules that have changed `CRAY_LD_LIBRARY_PATH` is is sufficient
to load the `lumi-CrayPath` module again to correct `LD_LIBRARY_PATH` as Lmod 
will automatically first unload `lumi-CrayPath` and then load it again, effectively
first resetting the operations done on `LD_LIBRARY_PATH` the previous time the
module was loaded and then applying the changes with the current `CRAY_LD_LIBRARY_PATH`,
ensuring that all those directories are at the front of the `LD_LIBRARY_PATH` again.

This module can easily be installed in `partition/common` of each software stack
which would trigger an automatic reload whenever a change to a different software
stack is made, or in each regular partition. Note however that that automatic
reload my not have the desired effect as Lmod may do this before reloading other
modules that change `CRAY_LD_LIBRARY_PATH`, so it is always safer to do it by 
hand.

## EasyConfigs

### Version 0.1

This is the first still somewhat experimental implementation. It does assume that
the HPE Cray PE modules never add the same path to both `CRAY_LD_LIBRARY_PATH` and
`LD_LIBRARY_PATH` which does seem to be the case in all versions of the HPE Cray PE
that were inspected during the development of this module.
