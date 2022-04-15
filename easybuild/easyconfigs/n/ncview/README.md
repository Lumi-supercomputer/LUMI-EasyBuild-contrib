# ncview

Ncview is a visual browser for netCDF format files. Typically you would use
ncview to get a quick and easy, push-button look at your netCDF files. You
can view simple movies of the data, view along various dimensions, take a
look at the actual data values, change color maps, invert the data, etc.

  * [ncview web site](http://meteora.ucsd.edu/~pierce/ncview_home_page.html)

  * [ncview download via ftp](ftp://cirrus.ucsd.edu/pub/ncview/) - may contain
    versions that are newer than those discussed on the home page

The 2.1.8 release dates from 2017 and as of September 2021 there haven't been
any further releases. Hence there is no guarantee that this package can be
supported in the future as it may become incompatible with newer versions of
libraries that it uses.


## EasyBuild

  * [ncview in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/n/ncview)

  * [ncview in the CSCS repostory](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/n/ncview)


### Version 2.1.8 for the CPE 21.08

  * The EasyConfig is a mix of the CSCS and default EasyBuilders one (as the latter
    had a more complete list of dependencies), and with some additional documentation
    added.


### Version 2.1.8 for CPE 21.12

   * Switched the download location to [fossies.org](https://fossies.org/linux/misc/ncview-2.1.8.tar.gz/)
     to avoid having to use FTP.
