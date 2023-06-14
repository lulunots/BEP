#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=0:40:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=5000
#SBATCH --mail-type=END,FAIL

for i in 08 09 11 12 13 14 21 22
do
    python3 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/virpool -o /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/abundance_estimation/virpool/Frey_list/ -v /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/Frey_variants.tsv -g /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta -s 0.05 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/alignment_WWB_barcode${i}.fastq.bam
    mv estimated_weights.yaml estimated_weights_"${i}".yaml
done
