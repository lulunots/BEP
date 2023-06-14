#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=4:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50
#SBATCH --mail-type=END,FAIL

reference="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta"
bamloc="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter"

for i in 03 04 05 06 07 08 09 11 12 13 14 15 16 17 18 19 21 22 24
do
  samtools mpileup -aa -A -d 600000 -Q 20 -q 0 -B -f $reference $bamloc/alignment_WWB_barcode"${i}".fastq.bam | cut -f1-4 > sample_"${i}".depth
  freyja variants $bamloc/alignment_WWB_barcode"${i}".fastq.bam --variants trialvars_"${i}" --depths sample_"${i}".depth --ref $reference
  freyja demix trialvars_"${i}".tsv sample_"${i}".depth --output freyja_abundances_"${i}"
done

