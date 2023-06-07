#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL

loc="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter"

for file in /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/read_filtering/second/*
do
    minimap2 -ax map-ont /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta ${file} > $loc/alignment_"${file##*/}".sam
    samtools sort -o $loc/alignment_"${file##*/}".bam $loc/alignment_"${file##*/}".sam
    samtools index $loc/alignment_"${file##*/}".bam
done
