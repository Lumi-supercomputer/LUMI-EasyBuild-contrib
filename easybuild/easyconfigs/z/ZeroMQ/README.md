# ZeroMQ

  * [ZeroMQ web site](https://www.zeromq.org/)

      * [ZeroMQ Documentation](https://zeromq.org/get-started/)

  * [ZeroMQ on Github](https://github.com/zeromq/libzmq)


## EasyBuild

  * [ZeroMQ support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/z/ZeroMQ)

  * [ZeroMQ support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/z/ZeroMQ)

  * [ZeroMQ support in the JSC repository](https://github.com/easybuilders/JSC/tree/2022/Golden_Repo/z/ZeroMQ)


### Version 4.3.4 for CPE 22.08 and CPE 22.12

-   Based on the JSC easyconfig

-   Unload the cray-libsci module to prevent linking to the threaded version of
    libsci which is not needed. It avoid the double linking problem with 
    application that actually need libsci


### Version 4.3.5 from CPE 23.09 on

-   Trivial version bump from 4.3.4.
