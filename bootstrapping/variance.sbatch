#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=1:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50
#SBATCH --mail-type=END,FAIL

for i in 03 04 05 06 07 08 09 11 12 13 14 15 16 17 18 19 21 22 24
do
  python variance.py $i 100 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances/sample_"${i}"/estimated_weights_"${i}"_ | grep 'sample' >> variances.txt
done
