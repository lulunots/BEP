#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=8:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=80000
#SBATCH --mail-type=END,FAIL

./process_gisaid_22v3.pl metadata_tsv_2022_08_18.tar.xz sequences_fasta_2022_08_18.tar.xz metadata_sample.tsv gisaid_sample.fasta.gz
