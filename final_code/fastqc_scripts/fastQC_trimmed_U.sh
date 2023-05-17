#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 17:00:00
#SBATCH -J fastQC
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules

module load bioinfo-tools
module load FastQC/0.11.9

#commands
fastqc -o /proj/genomeanalysis2023/nobackup/work/liek_canu/fastqc_trimmed_out /proj/genomeanalysis2023/nobackup/work/liek_trim/scaffold_*U
