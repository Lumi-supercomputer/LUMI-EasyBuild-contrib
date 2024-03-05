# PyTorch user instructions

We used to provide an EasyBuild recipe to install PyTorch on top of 
Cray Python. However, as Python packages tend to put a heavy strain
on the file system, installing Python packages in a container is the
preferred way. It also takes away the strain of trying to get PyTorch
talk to a proper version of the 
[AWS OFI RCCL plugin](https://github.com/ROCmSoftwarePlatform/aws-ofi-rccl) which is needed for
proper communication on the Slingshot 11 interconnect of LUMI.

We now provide prebuilt singularity containers that you can find below,
and an EasyBuild-generated module around them that eases work with those
containers.
