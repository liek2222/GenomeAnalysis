#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 17:00:00
#SBATCH -J trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules
module load bioinfo-tools
module load trimmomatic/0.36

#paths to files
#INFILES= /proj/genomeanalysis2023/Genome_Analysis/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz
 # = /proj/genomeanalysis2023/Genome_Analysis/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz/proj/genomeanalysis2023/Genome_Analysis/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_06.1P.fastq.gz
#OUTDIR= /proj/genomeanalysis2023/nobackup/work/liek_trim/

#run trimmomatic
trimmomatic PE -threads 2 -phred33 \
/proj/genomeanalysis2023/Genome_Analysis/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz \
/proj/genomeanalysis2023/Genome_Analysis/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz \
ILLUMINACLIP:/home/liek2222/GAproject/code/trimmomatic_scripts/TruSeq3-PE.fa:2:30:10 \
-baseout /proj/genomeanalysis2023/nobackup/work/liek_trim/scaffold_10
