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
