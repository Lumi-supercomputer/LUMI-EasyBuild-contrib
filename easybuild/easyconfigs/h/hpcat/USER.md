# User information for hpcat

`hpcat` is a tool developed by HPE to display process and thread distribution
and binding on LUMI and other clusters.

The tool is currently considered a bit experimental and only offered for use
in the Cray Compilation Environment. Since the default OpenMP thread-to-core binding
depends on the compiler, the tool may not produce the right result to check
binding for a program compiled with a different compiler. It is an alternative
to the tools offered in [lumi-CPEtools](../../l/lumi-CPEtools/index.md)
with the advantage that it can also give information about the binding to
NICs on the LUMI GPU nodes.

Over time, it will be integrated in a new version of the 
[lumi-CPEtools module](../../l/lumi-CPEtools/index.md) and not be maintained
anymore as a separate user-installable program.
