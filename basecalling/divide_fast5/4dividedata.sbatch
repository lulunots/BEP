#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=5:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL

counter=0
folder=1
for file in /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/data/fast5/*
do
    let counter++
    echo $counter
    cp ${file} /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/data/data0${folder}
    if [ "$counter" -eq "265" ]
    then
        echo "folder $folder is full"
        let folder++
        counter=0
    fi
done
