#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=short
#SBATCH --time=1:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50
#SBATCH --mail-type=END,FAIL

for i in 03 04 08 09 13 14 21 22
do
  python lineage_variance.py $i 16 100 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances_final/sample_"${i}"/estimated_weights_"${i}"_ | grep 'sample' >> variances_final.txt
done
