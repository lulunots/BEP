#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=12:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
    artic guppyplex --skip-quality-check --min-length 400 --max-length 700 --directory /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/demultiplexing/basecalled_demultiplex/barcode"${i}" --prefix WWB
done
