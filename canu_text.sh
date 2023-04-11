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
canu -p canu_primary_fasta -d canu_pacbio_primary genomeSize=738m -maxThreads=4 useGrid=false\
  -pacbio-raw /home/liek2222/GAproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_06.fq.gz \
  -pacbio-raw /home/liek2222/GAproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz \
  -pacbio-raw /home/liek2222/GAproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_11.fq.gz

