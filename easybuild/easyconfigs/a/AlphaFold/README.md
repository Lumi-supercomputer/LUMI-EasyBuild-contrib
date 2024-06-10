# AlphaFold

[AlphaFold home page](https://deepmind.google/technologies/alphafold/)

## General information

AlphaFold, the state-of-the-art AI system developed by Google Deepmind, is able to computationally predict protein structures with unprecedented accuracy and speed. There are over 200 million protein structure predictions by AlphaFold that are freely and openly available to the global scientific community. 


  * [AlphaFold tutorials](https://www.ebi.ac.uk/training/online/courses/alphafold/)

## Singularity container

The AlphaFold container is developed by AMD specifically for LUMI and contains the necessary parts to run AlphaFold on LUMI, including a suitable version of ROCm for the version of AlphaFold. The container includes the dependencies of AlphaFold, including TensorFlow, JAX, aria2 and OpenMM with HIP support.

The EasyBuild installation with the EasyConfigs mentioned below does three things:

1. It will copy the container to your own file space.
2. It will create a module file. When loading the module, a number of environment variables will be set to help you use the module and to make it easy to swap the module with a different version in your job scripts.
- SIF and SIFALPHAFOLD both contain the name and full path of the singularity container file.
- SINGULARITY_BINDPATH will mount all necessary directories from the system, including everything that is needed to access the project, scratch and flash file systems.
- RUNSCRIPTS and RUNSCRIPTSALPHAFOLD contain the full path of the directory containing some sample run scripts that can be used to run software in the container.
3. It creates currently 1 script in the $RUNSCRIPTS directory:
- conda-python-simple: This initialises Python in the container and then calls Python with the arguments of conda-python-simple. It can be used, e.g., to run commands through Python that utilise a single task but all GPUs.

## Easybuild installation 

 * [AlphaFold in the EasyBuilders repository](https://lumi-supercomputer.github.io/LUMI-EasyBuild-docs/a/AlphaFold/#user-documentation)
 
