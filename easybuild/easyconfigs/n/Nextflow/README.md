# Nextflow instructions for LUMI

Nextflow comes as a binary Java package. It should be portable enough to run on LUMI.


Nextflow should be installed in the `partition/L`. Try with basic command: 
```
eb Nextflow-22.10.0.eb
```

## Enabling the SLURM executor

To enable the SLURM executor on LUMI, find or create `$HOME/.nextflow/nextflow.config` file and set `process.executor` property to slurm value:

```
profiles {

 lumi {
     process.clusterOptions = '--account=project_xxxx --ntasks-per-node=1 --cpus-per-task=4 --ntasks=1 --time=00:00:05'
     process.executor = 'slurm'
     process.queue = 'small'
     process.memory = '10G'
    }
    
}
```

Then, you can run a nextflow script with `lumi` profile: 

```
nextflow run <nextflow_script> -profile lumi
```


-   [Nextflow web site](https://nextflow.io/)

-   [Nextflow tutorial for Puhti at CSC](https://github.com/yetulaxman/Biocontainer/blob/master/_tutorials/nextflow_tutorial.md)


## EasyBuild

-   [Nextflow support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/n/Nextflow)

-   [Java support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/j/Java)


### Java 11

-   Nextflow requires Java 11. Standard Open JDK easyconfig is sufficient. 

### Nextflow 22.10.0

-   The EasyConfig is derived from the EasyBuilders one and installs from
    "binaries".
    
-   This version was tested with Java/11 on LUMI.
