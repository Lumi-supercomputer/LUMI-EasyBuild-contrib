# lumi-allocations user instructions

This is a tool to check the use of your allocations on LUMI. It is currently far
from bullet-proof, so if you make an error in the command line arguments you may
see nasty error messages from Python. Use at your own risk, we know it is not made
bullet-proof, so don't bombard us with tickets about Python error messages. The tool
is currently provided as-is, without any warranty.

The basic command to check all your allocations

```bash
$ lumi-allocations
```

should work, but other options shown by

```bash
$ lumi-allocations -h
```

may throw nasty Python error messages at you if the option is not meant for you
or if you make a typo in, e.g., the project number or specify a project that is
not yours.

The data shown is not accurate up to the second as the information is gathered 
periodically on the system and stored in a cache that lumi-allocations then 
uses, as it is not possible to access all necessary data with regular user permissions
on the system. There is a chance that the automatic updating routine fails and that
the data shown is very inaccurate.

When the tool becomes more robust, it will become part of the `lumi-tools` module in 
the pre-installed software stack.

To install, use

```bash
$ module load LUMI/22.08 partition/common
$ module load EasyBuild-user
$ eb lumi-allocations-20230103.eb
```

after which the module `lumi-allocations/20230103` will be available with the usual 
caveat about Lmod caches that may not update automatically immediately.
