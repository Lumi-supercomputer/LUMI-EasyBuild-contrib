# aria2 user instructions

The aria2 software is currently not completely functional on LUMI and the installation 
fails during the tests with error messages for which we cannot find any information.

To install without running the tests, try

```
eb aria2-1.36.0-cpeGNU-22.12.eb --skip-test-step
```

It is to be expected though that some functionality will not work correctly
(certainly some of the Metalink functionality seems missing), though it may
also simply be a broken test...

