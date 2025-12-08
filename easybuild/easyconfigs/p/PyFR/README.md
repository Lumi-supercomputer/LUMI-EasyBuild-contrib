# PyFR

-   [PyFR web site](https://www.pyfr.org/)

    -   [PyFR Documentation](https://pyfr.readthedocs.io/en/latest/)

-   [PyFR on GitHub](https://github.com/PyFR/PyFR)


## EasyBuild

-   [PyFR support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/PyFR)

-   [PyFR support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/p/PyFR)


### Version 1.15.0 for CPE GNU 22.08

-   Created from scratch for LUMI

### Version 2.0.3 for CPE GNU 24.03

-   Based on previous easyconfigs with addition of an extra dependency, 
    libspatialindex required by the Rtree python package
    
  
### Version 2.1 for CPE GNU 25.03

-   Based on the EasyConfig for 2.0.3 for 24.03.

-   **Warning: This version (but 2.0.3 also) officially requires a newer version 
    of NumPy, so issues cannot be excluded! Unfortunately the only other way
    to install PyFR would be to build a container and build PyFR during the 
    container build process, which is hard to automate and make easy for a
    user**
    
    This is also one of the reasons why `sanity_pip_check` had to be set to `False`.
    
-   `hatchling` was left at 1.25.0 and not updated to 1.28.0 as that one did not
    install properly and required packages that we don't have yet.'
    
-   `rtree` was also left at 1.3.0 instead of upgrading to 1.4.1 due to install
    issues.
    
    These install issues may be due to a too old version of `setuptools`.

-   `pytools` was not upgraded from 2024.1.13 to 2025.2.5 as that version required
    additional packages and extra work to install.
    
-   `hatcpvcs` was not updated from 0.4.0 to 0.5.0 as that version requires a newer
    version of `setuptools-vcm`
