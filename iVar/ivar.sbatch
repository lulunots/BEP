#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=2:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=90
#SBATCH --mail-type=END,FAIL

reference="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta"
input=/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
  samtools mpileup -aa -A -d 0 -B -Q 0 --reference $reference $input/alignment_WWB_barcode"${i}".fastq.bam | ivar variants -p ivar_sample_"${i}" -q 0
done
