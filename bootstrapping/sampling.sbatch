#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=52:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL

# define path variables
sample_path="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/sample"
fastq_path="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/read_filtering/second"
out_path="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/resampled_datasets"

# define amount of resamples
num=100
mkdir $out_path/"$num"

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
# make directory to output new files  
  mkdir $out_path/"$num"/sample_"${i}"
  
# count amount of reads in a sample fastq file
  var=$(wc -l $fastq_path/WWB_barcode${i}.fastq)
  lines=${var%% *}
  let reads=$lines/4
  
# make the defined amount resampled datasets per sample
  for ((j=1;j<=num;j++))
  do
    $sample_path/sample --sample-with-replacement -k $reads -l 4 $fastq_path/WWB_barcode${i}.fastq > $out_path/"${num}"/sample_"${i}"/boot_sample"${i}"_"${j}".fastq
  done
  echo "done with sample "${i}""
done
