# TODO's

## hipfort

HipFORT now seems to be an official product with the version numbering also changed
to the version of ROCm it is meant to be used for.

Hence the old EasyConfigs likely don't work anymore. It doesn't make sense to 
replace them now though, but for 25.03 we should use the last 6.3 version.


## LAMMPS for GPU

LAMMPS for GPU does not yet build. It complains it cannot find the HIP runtime and 
that a compiler flag should be specified, but that flag is specified...


## Rust and HyperQueue

Tried to build Rust 1.91.1. It builds without issues with our EasyConfig, but the
resulting compiler fails to link programs properly (at least when I then tried it
with HyperQueue).

HyperQueue 0.24.0 on the other hand doesn't build with Rust 1.80.1, our previous
version that worked so far for us. It requires a special Cargo feature that only
appeared in newer versions of Rust.


## Neko

I believe this EasyConfig was contributed by the authors, as it contains lots of
unnecessary preconfigopts.

1.0.0 compiles with neither the GNU compilers (known issue with the C API according
to the release notes) and with the Cray compilers (issues with recent Cray Fortan
compilers also mentioned in the release notes).

So keep an eye on the evolution and eventual bug fixes.


## nvtop

The issues that we run into are likely due to libraries that are on LUMI but not in
the container on which we test. So let's wait for a LUMI update to see what needs
to be done.


## Rust

Tried to build a new Rust version, but it turned out that the resulting compiler 
couldn't link.

## Siesta

Haven't had a look at it yet as it may require some testing also.

