# ncview

Ncview is a visual browser for netCDF format files. Typically you would use
ncview to get a quick and easy, push-button look at your netCDF files. You
can view simple movies of the data, view along various dimensions, take a
look at the actual data values, change color maps, invert the data, etc.

-   [ncview web site](https://cirrus.ucsd.edu/ncview/)

-   [New web-based downloads of ncview](https://cirrus.ucsd.edu/~pierce/ncview/)

-   [old ncview download via ftp](ftp://cirrus.ucsd.edu/pub/ncview/) - may contain
    versions that are newer than those discussed on the home page

Releases where dormant between 2017 and 2023, but there have been some bug
fix releases in 2023 and 2024. However, it is not clear how well it is still
being developed as it looks more like a side-project for the developer so we
cannot guarantee continuing support for this package. Also, there are currently
issues with 2.1.10 and 2.1.11 on LUMI that we do not understand (compatibility
issues with an X11 library).


## EasyBuild

-   [ncview in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/n/ncview)

-   [ncview in the CSCS repostory](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/n/ncview)


### Version 2.1.8 for the CPE 21.08

-   The EasyConfig is a mix of the CSCS and default EasyBuilders one (as the latter
    had a more complete list of dependencies), and with some additional documentation
    added.


### Version 2.1.8 for CPE 21.12, 22.06, 22.08, 22.12

 -   Switched the download location to [fossies.org](https://fossies.org/linux/misc/ncview-2.1.8.tar.gz/)
     to avoid having to use FTP.
 -   (2023-09-14): Switched back to FTP as the fossie URL is not longer valid 


### Version 2.1.9 from 23.09 on

-   Trivial port of the EasyConfig except that the download link has changed again.

-   Stuck to 2.1.9 also for 25.03 even though there was already a 2.1.10 and 2.1.11. 
    But these had issues with the Xaw X11 library.
