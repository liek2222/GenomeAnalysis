#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 17:00:00
#SBATCH -J canu_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules

module load bioinfo-tools
module load canu

# Commands
canu -p canu_primary_fasta -d canu_pacbio_primary -assemble /home/liek2222/GAproject/analyses/code/canu_configuration
