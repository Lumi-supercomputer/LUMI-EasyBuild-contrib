# lumi-trainig-tools technical documentation

-   mkfile tool:   

    -   It was originally a tool included with Solaris and can still be found in some
        BSD distributions.
  
    -   A simple version with one option less is available on the
        [GitHub repository vogelchr/mkfile](https://github.com/vogelchr/mkfile).
        Its command line options are different though so we avoid using it for now.

## EasyConfigs

### Version 20240502 - Amsterdam 2-day LUST training in May 2024

-   Only includes the mkfile tool, but already uses a bundle for future
    extensions.

-   The Makefile that comes with `mkfile` is for the BSD make so we compiled
    with explicit commands using `CmdCp` and also modified the manual page a
    bit to fit better with our setup. 
