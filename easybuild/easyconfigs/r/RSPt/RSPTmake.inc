#   RSPt make.inc for Gnu toolchain
#   ml swap PrgEnv-cray/8.2.0 PrgEnv-gnu/8.2.0
#   ml add cray-fftw/3.3.8.12 
#
FHOME            =
FCOMPILER        = ftn
FCOMPILERFLAGS   = -O3 -march=znver2 -mtune=znver2 -mfma -mavx2 -m3dnow -fomit-frame-pointer -ffree-line-length-0 -fallow-argument-mismatch
FCPPFLAGS        = -DMPI -DMEMORY_STORE -fallow-argument-mismatch
FTARGETARCH      =
FORTRANLIBS      =
F90COMPILER      = ftn
F90COMPILERFLAGS = $(FCOMPILERFLAGS) -ffree-form
# gcc
CCOMPILER        = ftn
#CCOMPILER        = cc -lmpifort_cray
CCOMPILERFLAGS   = -O3 -march=znver2 -mtune=znver2 -mfma -mavx2 -m3dnow -fomit-frame-pointer
CTARGETARCH      = 
CPPFLAGS         = -DMPI -DMEMORY_STORE -fallow-argument-mismatch
CLOADER          = 

## LIBRARIES AND INCLUDE DIRECTORIES
LAPACKLIB        =
BLASLIB          =
FFTWLIB          =
EXTRALIBS        = -z muldefs
INCLUDEDIRS      =
