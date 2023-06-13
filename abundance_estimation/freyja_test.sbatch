reference="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta"
bamfile="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/alignment_WWB_barcode03.fastq.bam"

samtools mpileup -aa -A -d 600000 -Q 20 -q 0 -B -f $reference $bamfile | cut -f1-4 > sample_03.depth

reference="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/EPI_ISL_402124.fasta"
bamfile="/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/alignment/after_readfilter/alignment_WWB_barcode03.fastq.bam"

freyja variants $bamfile --variants trialvars_03 --depths sample_03.depth --ref $reference

freyja demix trialvars_03.tsv sample_03.depth --output freyja_abundances_03


