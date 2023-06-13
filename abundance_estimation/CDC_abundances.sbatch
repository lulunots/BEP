#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=0:40:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=5000
#SBATCH --mail-type=END,FAIL

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
    python3 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/virpool -o /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/abundance_estimation/CDC_list/ -v /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/CDC_variants.tsv -g /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta -s 0.05 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/alignment_WWB_barcode${i}.fastq.bam
    mv estimated_weights.yaml estimated_weights_"${i}".yaml
done
