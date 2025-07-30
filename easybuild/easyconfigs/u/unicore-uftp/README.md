# unicore-uftp technical instructions

-   [unicore on GitHub](https://github.com/UNICORE-EU): When first putting uftp in 
    the LUMI repositories, the organisation was in the process of moving more from
    SourceForge to GitHub.
    
    -   [uftp-client GitHub repository](https://github.com/UNICORE-EU/uftp-javaclient)
    
        -   [GitHub releases](https://github.com/UNICORE-EU/uftp-javaclient/releases)
        
-   [Older pages on SourceForge](https://sourceforge.net/projects/unicore/)

    -   [uftp client download on SourceForge](https://sourceforge.net/projects/unicore/files/Clients/UFTP-Client/)
    
    
## EasyBuild

-   [unicore-uftp client support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/u/unicore-uftp)

-   There is no support for the UFTP client in the CSCS repository.

-   There is no support for UFTP in Spack


### Version 1.8.0

-   Started from the EasyBuilders EasyConfig, but

    -   Moved to downloads from GitHub and the new homepage
    
    -   Even though the code seems built with Java 11, we decided to move to Java 21
        as that is likely more useful for users who want to use other Java packages also.
        
-   Moved the license file etc. to our standard location in share/licenses.


### Version 2.2.2

-   Trivial update of the 1.8.0 EasyConfig.
