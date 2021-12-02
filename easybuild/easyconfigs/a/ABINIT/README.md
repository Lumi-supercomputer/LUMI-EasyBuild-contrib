# Abinit

[Abinit home page](https://www.abinit.org/)

## General information

ABINIT is a software suite to calculate the optical, mechanical, vibrational, 
and other observable properties of materials. Starting from the quantum 
equations of density functional theory, you can build up to advanced 
applications with perturbation theories based on DFT, and many-body Green's
functions (GW and DMFT).

ABINIT can calculate molecules, nanostructures and solids with any chemical 
composition, and comes with several complete and robust tables of atomic 
potentials.

  * [Abinit documentation](https://docs.abinit.org/)
  * [Abinit tutorials](https://docs.abinit.org/tutorial/)

## EasyBuild

  * [Abinit in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/a/ABINIT)
  * [Abinit in the CSCS repository](https://github.com/easybuilders/CSCS/tree/master/easybuild/easyconfigs/a/ABINIT)

### Abinit 9.6.2 from CPE 21.08 on LUMI

Adapted from CSCS Easyconfig:
  
  * Add configuration options to make sure that Cray LibSci is used
  * Enable MPI I/O

#### About enabling OpenMP

Enabling OpenMP has been tested but results in a Segmentation Fault at the end
of the runs:

```
Thread 1 "abinit" received signal SIGSEGV, Segmentation fault.
0x00007fffef21258d in __freeBlasMemPool () from /opt/cray/pe/lib64/libsci_gnu_82_mp.so.5
```

Setting the stack size to `unlimited` command or setting the environment 
variable `CRAYBLAS_ALLOC_TYPE=2` or `CRAYBLAS_FORCE_HEAP_ALLOC=1` as recommended
by Cray solve this problem. 

While the program runs fine this error at the end may confuse users. OpenMP is
thus disabled at the moment.