#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=short
#SBATCH --time=1:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50
#SBATCH --mail-type=END,FAIL

for i in 08 09 11 12 13 14 21 22
do
  mkdir "${i}"
  cd "${i}"
  python boxplot.py $i 16 100 /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/bootstrapping/abundances_final/sample_"${i}"/estimated_weights_"${i}"_
  cd ..
done
