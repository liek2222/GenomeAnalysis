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

module load samtools

# Set input and output file paths
#input_dir=/proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina
#output_dir= /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina

#commands
#srun samtools view -b /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina/scaffold_11.sam > /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina/scaffold_11.bam
srun samtools sort /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina/scaffold_11b.bam -o /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina/scaffold_11b_sorted.bam
srun samtools index /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina/scaffold_11b_sorted.bam
