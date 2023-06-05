#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=168:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL

/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/jasper/ont-guppy-cpu/bin/guppy_basecaller --input_path /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/data/data02 --save_path /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/split/output2 --flowcell FLO-MIN106 --kit SQK-LSK109 --trim_adapters --trim_primers --num_callers 32 --cpu_threads_per_caller 32
