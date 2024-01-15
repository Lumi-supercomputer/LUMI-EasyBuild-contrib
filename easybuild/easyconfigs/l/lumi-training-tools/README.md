# lumi-trainig-tools technical documentation

-   mkfile tool:   

    -   It was originally a tool included with Solaris. 
        A simple version with one option less is available on the
        [GitHub repository vogelchr/mkfile](https://github.com/vogelchr/mkfile)

## EasyConfigs

### Version 0.1

-   Only includes the mkfile tool, but already uses a bundle for future
    extensions.

-   `mkfile` comes with a Makefile that can take care of compilation and
    installation if the right additional variables are specified when calling
    the Makefile, but there is no configure step needed.
