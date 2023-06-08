# execute in the virpool environment with minimap2 installed additionally

# ALIGNMENT
# input:  /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/read_filtering/second/
# output: /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/

# output of the alignment
out_path="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances"

# input of the reference genome .fasta file
reference="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta"

# input of the fastq files
in_path="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/resampled_datasets"

# number of resamples as defined in the previous step
num=100

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
  for ((j=1;j<=num;j++))
  do
    $out_path/"${num}"/sample_"${i}"/boot_sample"${i}"_"${j}".fastq
    minimap2 -ax map-ont $reference $in_path/"${num}"/sample_"${i}"/boot_sample"${i}"_"${j}".fastq > $out_path/alignment_boot_sample"${i}"_"${j}".sam
    samtools sort -o $out_path/alignment_boot_sample"${i}"_"${j}".bam $out_path/alignment_boot_sample"${i}"_"${j}".sam
    samtools index $out_path/alignment_boot_sample"${i}"_"${j}".bam
  done
  echo "done with sample "${i}""
done

for file in /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/read_filtering/second/*
do
    minimap2 -ax map-ont $loc4 ${file} > $loc1/alignment_"${file##*/}".sam
    samtools sort -o $loc1/alignment_"${file##*/}".bam $loc1/alignment_"${file##*/}".sam
    samtools index $loc1/alignment_"${file##*/}".bam
done

# ABUNDANCE ESTIMATION
# input:  /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/alignment_WWB_barcode${i}.fastq.bam
#         /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/All_pango_variants.tsv -g /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta
#         /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/All_pango_variants.tsv
# output: /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/abundance_estimation/virpool/new_all_variants/

conda activate virpool

# output of the abundance estimation
loc2=""

# input of the variants .tsv file 
loc3="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/All_pango_variants.tsv"

# input of the reference genome .fasta file
loc4="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta"

# input of the sample alignments
loc5="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/alignment_WWB_barcode${i}.fastq.bam"

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
    python3 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/virpool/src/virpool -o $loc2/ -v $loc3 -g $loc4 -s 0.05 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/alignment_WWB_barcode${i}.fastq.bam
    mv estimated_weights.yaml estimated_weights_"${i}".yaml
    mv posterior_coverage.svg posterior_coverage"${i}".svg
    mv significant_positions.svg significant_positions_"${i}".svg
done

