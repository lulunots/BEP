#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=168:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=90000
#SBATCH --mail-type=END,FAIL

# execute in the virpool environment with minimap2 and samtools installed additionally

# number of resamples as defined in the previous step
num=100

# ALIGNMENT
# output of the alignment
out_path="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances"

# input of the reference genome .fasta file
reference="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta"

# input of the fastq files
in_path="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/resampled_datasets"


# ABUNDANCE ESTIMATION
# output of the abundance estimation
abundance_out="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances"

# input of the variants .tsv file 
variants="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/All_pango_variants.tsv"


for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
  mkdir $out_path/sample_"${i}"
  mkdir $abundance_out/sample_"${i}"
  for ((j=1;j<=num;j++))
  do
    # alignment
    $out_path/sample_"${i}"/"${num}"/sample_"${i}"/boot_sample"${i}"_"${j}".fastq
    minimap2 -ax map-ont $reference $in_path/"${num}"/sample_"${i}"/boot_sample"${i}"_"${j}".fastq > $out_path/sample_"${i}"/alignment_boot_sample"${i}"_"${j}".sam
    samtools sort -o $out_path/sample_"${i}"/alignment_boot_sample"${i}"_"${j}".bam $out_path/sample_"${i}"/alignment_boot_sample"${i}"_"${j}".sam
    samtools index $out_path/sample_"${i}"/alignment_boot_sample"${i}"_"${j}".bam
    
    # abundance estimation
    python3 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/virpool -o $abundance_out/sample_"${i}" -v $variants -g $reference -s 0.05 $out_path/sample_"${i}"/alignment_boot_sample"${i}"_"${j}".bam
    mv $abundance_out/sample_"${i}"/estimated_weights.yaml $abundance_out/sample_"${i}"/estimated_weights_"${i}"_"${j}".yaml
    mv $abundance_out/sample_"${i}"/posterior_coverage.svg $abundance_out/sample_"${i}"/posterior_coverage"${i}"_"${j}".svg
    mv $abundance_out/sample_"${i}"/significant_positions.svg $abundance_out/sample_"${i}"/significant_positions_"${i}"_"${j}".svg
  done
  echo "done with sample "${i}""
done
