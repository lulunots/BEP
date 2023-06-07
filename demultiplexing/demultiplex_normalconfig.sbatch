#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL

/tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/jasper/ont-guppy-cpu/bin/guppy_barcoder --input_path /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/basecalling/basecalled --save_path /tudelft.net/staff-umbrella/SARSCoV2WastewaterBratislava/lulu/demultiplexing/basecalled_demultiplex --config configuration.cfg --require_barcodes_both_ends --barcode_kits "EXP-NBD104 EXP-NBD114" --enable_trim_barcodes
