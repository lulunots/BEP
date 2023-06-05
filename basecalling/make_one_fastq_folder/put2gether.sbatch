#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL

for i in 1 2 3 4 5 6
do
    for file in /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/split/output${i}/pass/*
    do
        cp ${file} /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/basecalled/
        mv /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/basecalled/"${file##*/}" /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/basecalled/"${file##*/}""${i##*/}".fastq
    done
done
