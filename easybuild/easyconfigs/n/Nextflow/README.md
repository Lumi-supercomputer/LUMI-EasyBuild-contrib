# Nextflow

* [Nextflow web site](https://www.nextflow.io/index.html)

## General Information

* Nextflow is a workflow system for creating scalable, portable and reproducible workflows.
* It is based on the dataflow programming model, which greatly simplifies the writing of parallel and distributed pipelines, allowing you to focus on the flow of data and computation.
* Nextflow can deploy workflows on a variety of execution platforms, including your local machine, HPC schedulers, AWS Batch, Azure Batch, Google cloud Batch, and Kubernetes.
* It also supports many ways to manage your software dependencies, including Conda, Spack, Docker, Podman, Singularity, and more.

## EasyBuild

* No Nextflow support in the EasyBuilders repository

## Installation

**Note:** It is highly recommeded to install software in the `/projappl/project-<>` folder (where `project-<>` refers to your own project account e.g., `project-46xxxxxxx`). It is also a good practice to create a separate `software` directory where you can install your own software.

* Install Nextflow

```bash
cd /projappl/project-<>/software

curl -s https://get.nextflow.io | bash
```
This will create the `nextflow` executable in the current directory

* Make Nextflow executable

```bash
chomd +x nextflow
```

* Set the executable path for using Nextflow.

*Note: You will also need to set the path in the bash script that you use to submit the job*

```bash
export PATH=/projappl/project-<>/software:$PATH
```

* Confirm that Nextflow is installed correctly

```bash
nextflow info
```

## Citation

If you use Nextflow in your work, please cite

* P. Di Tommaso, et al. Nextflow enables reproducible computational workflows. Nature Biotechnology 35, 316-319 (2017) doi:[10.1038/nbt.3820](https://www.nature.com/articles/nbt.3820)
