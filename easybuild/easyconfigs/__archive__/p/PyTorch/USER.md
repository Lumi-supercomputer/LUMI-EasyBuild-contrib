# PyTorch user instructions

We used to provide an EasyBuild recipe to install PyTorch on top of 
Cray Python. However, as Python packages tend to put a heavy strain
on the file system, installing Python packages in a container is the
preferred way. It also takes away the strain of trying to get PyTorch
talk to a proper version of the 
[AWS OFI RCCL plugin](https://github.com/ROCmSoftwarePlatform/aws-ofi-rccl) which is needed for
proper communication on the Slingshot 11 interconnect of LUMI.

We now provide prebuilt singularity containers
with EasyBuild-generated module around them that eases work with those
containers. The use is documented in the next section, 
["User documentation (singularity container)"](index.md#user-documentation-singularity-container)
while the user-installable EasyBuild recipes for each container can
be found in the 
["Singularity containers with modules for binding and extras" section](index.md#singularity-containers-with-modules-for-binding-and-extras).
