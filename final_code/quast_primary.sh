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
quast.py -t 2 -o /proj/genomeanalysis2023/nobackup/work/liek_canu/quast_2/ /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_06_2/canu_scaffold_06.contigs.fasta /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_10_2/canu_scaffold_10.contigs.fasta /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_11_2/canu_scaffold_11.contigs.fasta
