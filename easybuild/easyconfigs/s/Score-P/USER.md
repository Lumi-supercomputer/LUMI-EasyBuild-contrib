# Score-P User Information

Score-P has moved to the contributed EasyConfigs as we cannot promise timely
ports to new versions of the software stack and as we cannot guarantee that 
it works in all cases on LUMI.

A nice introductory talk on the Score-P ecosystem and how all its
tools can be used, can be found on the 
[pop Center of Excellence web pages](https://pop-coe.eu/),
on the ["HPC.NRW Tool Talk - Application Profiling with Score-P and Cube" page](https://pop-coe.eu/blog/hpcnrw-tool-talk-application-profiling-with-score-p-and-cube)
(or [directly on YouTube](https://www.youtube.com/watch?list=PLhznUsiowt26GyqmTTO1joujbeSg2_WHK&v=3HtR89L2u9Q)).
Of particular interest is the section 
["The Score-P Ecosystem", starting at 22:38](https://www.youtube.com/watch?v=3HtR89L2u9Q&list=PLhznUsiowt26GyqmTTO1joujbeSg2_WHK&index=3&t=1358s), 
which builds up a graphical overview highlighting the role of several packages.

Note that there are a few things to note on LUMI:

-   cpeGNU will not offer support for our HIP adapter, as we require a Clang based compiler. 
    It is available for the others.

-   cpeAOCC will offer support for the OpenMP Tools Interface and enables it by default. 
    This is an alternative to OPARI2 and provides support for a wider range of OpenMP. 
    GNU GCC lacks the interface, CCE 16 still has some issues, 
    where we decide to not enable the adapter.

-   We cannot yet provide CubeGui due to the complexity of the installation, and the AppImage
    provided by the developers also cannot be used on LUMI.
