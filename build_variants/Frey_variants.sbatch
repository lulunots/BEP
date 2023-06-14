#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=2:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=5000
#SBATCH --mail-type=END,FAIL

python profile_estimation.py variant_list.txt ../../../GISAID/success/aliases.json ../../../GISAID/redo/metadata_sample.tsv ../../../GISAID/redo/gisaid_sample.cram \
    --reference /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta \
    -o Frey_variants.tsv \
    --date-min 2020-12-01 \
    --date-max 2022-02-01
