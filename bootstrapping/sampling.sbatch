# count amount of reads in a sample fastq file
var=$(wc -l test.txt)
nb_lines=${var%% *}
let reads=$nb_lines/4
echo "$reads"

/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/read_filtering/second/WWB_barcode${i}.fastq

var=$(wc -l /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/read_filtering/second/WWB_barcode01.fastq)
nb_lines=${var%% *}
let reads=$nb_lines/4
echo "$reads"

ONLY FOR THE ONES WITH >1000 reads (??)

do times 0.80 and round up

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
  var=$(wc -l /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/read_filtering/second/WWB_barcode${i}.fastq)
  nb_lines=${var%% *}
  let reads=$nb_lines/4
  echo "$reads"
done

/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/sample/sample -k 1000 -l 4 huge_file.fastq > 1k_sample.fq
