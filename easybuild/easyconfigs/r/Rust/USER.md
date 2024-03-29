# Rust user instructions

Rust is offered "as is", without support from the LUMI User Support Team as it
is not a typical HPC language and as we don't have the personpower to build up
proper knowledge about Rust. 

The Rust compiler is known to conflict with the Cray PE in certain circumstances
and recent versions are also incompatible with the system GCC of LUMI causing the
bootstrap procedure during installation to fail.

The Rust EasyConfig files that we provide rely on GCC for the installation of
the compiler but don't need GCC anymore afterwards which is why no toolchain is
loaded explicitly.
    
We cannot guarantee that object files generated by the Rust compiler can link with
object files or libraries from the Cray PE as the Rust compiler is based on its own
version of LLVM which may not correspond with any Cray or AMD compiler version on 
the system at a given time.
    