#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 17:00:00
#SBATCH -J quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

#commands
quast.py -t 2 -o /proj/genomeanalysis2023/nobackup/work/liek_canu/quast_after_masking /proj/genomeanalysis2023/nobackup/work/liek_canu/repeatmasker_output/scaffold06_corrected.fasta.masked
