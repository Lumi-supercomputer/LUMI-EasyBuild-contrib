# HyperQueue

  * [HyperQueye home page and documentation](https://it4innovations.github.io/hyperqueue/)

  * [HyperQueue GitHub](https://github.com/It4innovations/hyperqueue)

      * [GitHub releases](https://github.com/It4innovations/hyperqueue/releases)

  * [Guide for Cargo, the package manager used to install HyperQueue](https://doc.rust-lang.org/cargo/guide/)


## Installation

  * HyperQueue is installed via the Rust package manager ``cargo`` which in its
    default setup may not be compatible with the file systems on the cluster as
    it needs ``$HOME/.cargo`` and will try to lock a file in there. This does not
    work on GPFS. It does work on a Lustre file system though.

    The workaround is to use the CARGO_HOME environment variable and to point to a
    file system where locking is possible. It does work pointing to a subdirectory
    in ``$XDG_RUNTIME_DIR``.

  * Add the end of the build with ``cargo build --release``, the ``hq`` executable
    can be found in ``target/release`` in the source directory.

## EasyBuild

  * There is no support for HyperQueue in the EasyBuilders repository

  * There is no support for HyperQueue in the CSCS repository

We build our own EasyConfig. Two big warnings are needed though:

  * It would likely not pass the criteria set forward by the EasyBuild community for
    inclusion as the build process itself downloads a lot of files. It is very hard to
    figure out which files are neede and where they can be put in a way that ``cargo``
    can find them, if this is possible at all.

    As a result of this there is no way to get this to work on a cluster that does
    not allow outgoing https connections.

    It also implies that it might be impossible to reproduce the build at a later time
    as not all sources are stored locally. So if the sources that are downloaded change
    or are removed, the build may produce a different result or fail alltogether.

  * The ``cargo`` command needs a directory in which it can lock files which may not be
    possible on all file systems. We currently redirect cargo to the file system used
    for ``EASYBUILD_BUILDPATH`` as that is often on a local tmp directory or RAM disk
    that supports file locking. Building on GPFS fails.

### 0.4.0 for 21.06

  * We created our own EasyConfig file using the generic ``CmdCp`` EasyBlock.

      * In the build phase we execute the ``cargo build --release`` command via the
        command map (and first create the directory that we point to with ``CARGO_HOME``)

      * In the install step we copy the binary.

  * As this is not performance-critical software and as it should work with all toolchains
    and on all partitions, we decided to use the system compilers and install in
    ``partition/common``.

  * As EasyBuild doesn't support Rust, we have to set the target CPU by hand or rely on the
    default which should be to compile to the current CPU. To ensure compatibility with all
    nodes of LUMI we currently set '`RUSTFLAGS="-C target-cpu=znver2"`'. You will have to change
    ``cmds_map`` for other platforms or to simply compile to the CPU target that the compile is
    run on.
