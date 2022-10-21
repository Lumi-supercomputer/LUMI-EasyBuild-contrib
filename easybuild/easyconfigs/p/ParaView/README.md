# ParaView

  * [ParaView web site](https://www.paraview.org/)

      * [ParaView Documentation](https://docs.paraview.org/en/latest/)

  * [ParaView Git repository](https://gitlab.kitware.com/paraview/paraview)


## EasyBuild

  * [ParaView support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/p/ParaView)

  * [ParaView support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/p/ParaView)

### Version 5.10.1 for CPE 22.08

Created from scratch for LUMI. Some remarks about the build configuration:

  - Need `CMAKE_SHARED_LINKER_FLAGS=-lpthread` to prevent build failure of protobuf
  - Built with FFmpeg support as it's available in the central software stack.
    However, the build fails due to API changes in version 5.x of FFmpeg. Created
    a patch based of this VTK [pull request](https://gitlab.kitware.com/vtk/vtk/-/commit/34276346ac379fecbd615322f18de837bd2c9ea2).