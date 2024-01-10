# GDAL User Instructions

## What is GDAL?

GDAL is a translator library for raster geospatial data formats that is released
under an X/MIT style Open Source license by the Open Source Geospatial
Foundation. As a library, it presents a single abstract data model to the 
alling application for all supported formats. It also comes with a variety of
useful commandline utilities for data translation and processing.


## Installing

The GDAL 3.5.x versions all use a similar installation process. 
GDAL has an enormous amount of optional features, each requiring additional
dependencies. The GDAL modules built by the available EasyConfigs are far
from feature-complete (and several features would in fact not even make
sense on LUMI). However, in version 3.5.3 (from LUMI/23.09 on) we did
enable some additional features.

The build process of GDAL is not completely stable and for that reason we
cannot use a parallel build process. As a result, building GDAL 3.5.x is
extremely slow and can easily take 2 hours or more.

From GDAL 3.6 on, a different build process was imposed and the older build
process is no longer supported. Unfortunately this new build process comes with
several so far unsolved problems on LUMI so we cannot currently offer newer
versions of GDAL.
