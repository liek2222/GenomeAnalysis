#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J bwa_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules

module load bioinfo-tools
module load bwa
module load samtools

# Set input and output file paths
input_dir=/home/liek2222/GAproject/results/01preprocessing/trimmomatic_output
output_dir=/proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina

#index reference genome
bwa index /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_06_2/canu_scaffold_06.contigs.fasta

# Align reads to reference genome
bwa mem -t 4 /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_06_2/canu_scaffold_06.contigs.fasta \
        /home/liek2222/GAproject/results/01preprocessing/trimmomatic_output/scaffold_06_1P.fasta /home/liek2222/GAproject/results/01preprocessing/trimmomatic_output/scaffold_06_2P.fasta \
        > /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina/scaffold_06.sam



