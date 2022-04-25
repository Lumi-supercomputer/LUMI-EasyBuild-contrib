MAKE = make
F90 = ftn
F90_OPTS = -O3 -ffast-math -funroll-loops -fopenmp -fallow-argument-mismatch
F77 = ftn
F77_OPTS = -O3 -ffast-math -funroll-loops -fopenmp -fallow-argument-mismatch
AR = ar
LIB_SYS = 
LIB_FFT = fftlib.a
SRC_OMP = 
SRC_MPI =
SRC_MKL = mkl_stub.f90
SRC_OBLAS = oblas_stub.f90
SRC_BLIS = blis_stub.f90
SRC_libxc = libxcifc_stub.f90
SRC_FFT = zfftifc.f90
SRC_W90S = w90_stub.f90