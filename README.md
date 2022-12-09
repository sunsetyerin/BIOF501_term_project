# BIOF501_term_project
# Differential m6A RNA methylation with Direct RNA sequencing 

## 1. Background

N6-methyladenosine (m6A) is the most common RNA modifications modulating functions of cellular RNA species.

[xPore](https://doi.org/10.1038/s41587-021-00949-w) is a Python package identifying differentail RNA modifications from Nanopore sequencing data.

xPore can identify positions of m6A sites at single-base resolution.

## 2. Dataset Description

Demo samples are downloaded from [link](https://zenodo.org/record/5162402/files/demo.tar.gz) provided by xPore.

METTL3 is the most dominant m6A methylation writter.

`HEK293T-METTL3-KO-rep1` is METTL3 knockout (KO) of HEK293T cell line. `(m6a_test/HEK293T-METTL3-KO-rep1/fastq/)`

`HEK293T-WT-rep1` is wild-type (WT) of HEK293T cell line. `(m6a_test/HEK293T-WT-rep1/fastq/)`

By comparing two different conditions, xPore will run differnetial m6a methylation analysis.

## 3. Workflow Visualization

<p align="lef">
<img src="figs/snakemake_workflow.png" width="150" height="500">
</p>

1. Align to transcriptome 
2. Bam files indexing 
3. Resquiggle using `nanopolish`
4. `xPore` differentail RNA modifications analysis

## 4. Results 

Result table will be generated `m6a_test/out/diffmod.table`

Result table shown below:

```
id                position   kmer  diff_mod_rate_KO_vs_WT  pval_KO_vs_WT  z_score_KO_vs_WT  ...  sigma2_unmod  sigma2_mod  conf_mu_unmod  conf_mu_mod  mod_assignment        t-test
ENSG00000114125  141745412  GGACT               -0.823318  4.241373e-115        -22.803411  ...      5.925238   18.048687       0.968689     0.195429           lower  1.768910e-19
ENSG00000159111   47824212  GGACT               -0.828023   1.103790e-88        -19.965293  ...      2.686549   13.820089       0.644436     0.464059           lower  5.803242e-18
ENSG00000159111   47824138  GGGAC               -0.757891   1.898161e-73        -18.128515  ...      3.965195    9.877299       0.861480     0.359984           lower  9.708552e-08
```

## 5. Cloning

Clone this repository and also submodules not manageable by conda(or pip)

```bash
git clone --recursive https://github.com/sunsetyerin/BIOF501_term_project.git
```

## 6. Python 3 environment

This repository has been developped using python3.7.3 through python3.7.6 in a
[miniconda](https://docs.conda.io/en/latest/miniconda.html) environment.

Though [conda](https://docs.conda.io/projects/conda/en/latest/) is not
required, it is highly recommended in order to manage the dependencies.

__Using snakemake to manage the environment__

From a bash terminal:

```bash
snakemake --use-conda --conda-create-envs-only --cores [cores available]
```

## 7. Snakemake usage of this repo

All scripts, steps and jobs are managed using
[snakemake](https://snakemake.readthedocs.io/en/stable/#)

Input files, workflow parameters and output path are provided through config
files (`configs/sample_config.yaml`).

The workflow is designed to run differentially methylated m6A RNA analysis with different conditions 

```bash
# To display the jobs and commands including subworkflows
snakemake general -np

# to visualize the acyclic rulegraph
snakemake general --forceall --rulegraph | dot -Tpdf > dag.pdf

# To launch the jobs
snakemake general --use-conda
```

## 8. Perform the processing of a single sample

Config files contains the values of variables needed to perform Differential RNA modifications analysis.

Most of the data directories hosting results will be created *when necessary* by the
snakemake manager, although it is possible to create the folders in advance.



