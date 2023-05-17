#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J eg
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

#modules
module load bioinfo-tools
module load samtools
module load eggNOG-mapper/2.1.9

#output_dir="/proj/genomeanalysis2023/nobackup/work/liek_canu/eggnog_out"

#commands
emapper.py -m diamond --itype CDS --cpu 4 -i /proj/genomeanalysis2023/nobackup/work/liek_canu/braker_output_sep/braker_SRR6040094_scaffold_06_scaffold_06/transcripts.fa -o e_out_4 

