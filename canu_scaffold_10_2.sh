#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J canu_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules

module load bioinfo-tools
module load canu/1.8


# Commands
canu -p canu_scaffold_10 -d /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_10_2 genomeSize=37m -maxThreads=4 useGrid=false \
  -pacbio-raw /home/liek2222/GAproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz 

