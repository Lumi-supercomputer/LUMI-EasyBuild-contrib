# pbzip2 user information

This package has been unmaintained since 2015, so there is no guarantee that
we can continue to provide it. Issues with it will not get fixed.

Recommended installation: Use the hidden `partition/common` in a LUMI stack and
it will be available for all partitions in that stack. E.g.,

```bash
module load LUMI/24.03 partition/common EasyBuild-user
eb pbzip2-1.1.13.eb
```

This package may move to the central software stack in a later version of the
stack, likely as part of the `systools` module.

Note however that this is very old and dead code that was never truly adapted
the the 64-bit world. Memory management is still 32-bit code, limiting the
amount of memory one can request via the `-m` parameter to 2000 blocks.

