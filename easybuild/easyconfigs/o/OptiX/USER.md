# OptiX user instructions

Downloading OptiX requires registration. As it is not clear to us if every user needs 
to register, this software will not be installed centrally.

You'll have to download an install script for the version mentioned in the name of 
the EasyBuild recipe.

Download locations are:

-   [developer.nvidia.com/designworks/optix/download](https://developer.nvidia.com/designworks/optix/download)
    for the latest version,
    
-   [developer.nvidia.com/designworks/optix/downloads/legacy](https://developer.nvidia.com/designworks/optix/downloads/legacy)
    for older versions. This page can also be reached from the page with the most recent version.
    

Store the file that you downloaded (e.g., `NVIDIA-OptiX-SDK-8.0.0-linux64-x86_64.sh`) 
in a place where EasyBuild can find it (integrate in the sources structure if you're 
an EasyBuild expert) or, more easily, simply tell it where to find it by adding the
option `--sourcepath <directory>` to the `eb` command line, of course replacing
`<directory>` with the actual directory that contains the downloaded file.
