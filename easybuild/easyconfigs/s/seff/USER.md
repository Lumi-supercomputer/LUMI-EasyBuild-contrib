# seff user instructions

This is the `seff` command to try to extract efficiency data from Slurm.

It is provided "as is". We know it is broken on LUMI and cannot deal properly
with all hyperthreading scenarios so the numbers reported may actually be wrong
by a factor of two. No need to send in tickets for that, and it is also the reason
why it is not in the central software stack.

Even when it works the results have to be taken with a grain of salt.
E.g., 100% CPU use says nothing about true efficiency as some runtimes use
busy waiting. Nor does it tell anything about, e.g., proper use of the caches.
Only thorough profiling of your application can give you proper efficiency 
information.
