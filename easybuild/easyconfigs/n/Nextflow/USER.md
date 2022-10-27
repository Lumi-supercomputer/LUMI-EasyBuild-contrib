# Nextflow user information

[NextFlow](https://www.nextflow.io/) can be installed with 
[EasyBuild](https://docs.lumi-supercomputer.eu/software/installing/easybuild/)
(`EasyBuild-user` configuration module), and for most users
`partition/L` is the one you want to use:
``` bash
eb Nextflow-22.10.0.eb -r
```

## Enabling the Slurm executor

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

Note however that the Slurm executor not suitable for large workflows 
involving tens of thousands of processes on HPC systems. In fact,
you'll quickly bump against the limit of the number of jobs that
a user can have in the queue.

The solution is to ust the [HyperQueue metascheculer](../../h/HyperQueue) as the executor.

## Links for further information

-   [Nextflow web site](https://nextflow.io/)

-   [Nextflow reference documentation on the Nextflow web site](https://www.nextflow.io/docs/latest/index.html)

-   There is some information on configuring Nextflow in 
    [the Nextflow GitHub repository](https://github.com/nextflow-io/nextflow)

-   [Nextflow tutorial for Puhti at CSC](https://github.com/yetulaxman/Biocontainer/blob/master/_tutorials/nextflow_tutorial.md)

-   There is a page on [using Nextflow with HuperQueue](https://docs.csc.fi/support/tutorials/nextflow-hq/)
    on the Finnish national system, but the job script will need some adaptation for LUMI.
