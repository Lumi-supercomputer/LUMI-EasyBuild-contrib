# GSL

  * [GSL home page](https://www.gnu.org/software/gsl/)

      * [GSL download from the GNU server](https://ftp.gnu.org/gnu/gsl/)


## EasyBuild

  * [GSL support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/main/easybuild/easyconfigs/g/GSL)

  * [GSL support in the CSCS repository](https://github.com/eth-cscs/production/tree/master/easybuild/easyconfigs/g/GSL)


### Version 2.7-seq from CPE 21.12 on

  * The EasyConfig is a mix of the CSCS and Univerity of Antwerpen ones.
  * The EasyConfig has OpenMP disabled for compatibility with BCFtools
  
  
### CPE 22.06

  * The base software stack now contains both sequential and OpenMP versions of
    GSL, so EasyConfigs in the contributed repository are not needed if the
    version in the main software stack is OK.
