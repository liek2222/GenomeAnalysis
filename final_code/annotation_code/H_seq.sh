#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J hseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

#modules
module load bioinfo-tools
module load samtools/1.17
module load htseq/2.0.2

#bam files paths
BAM_file=/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6156069_scaffold_06/Aligned.sortedByCoord.out.bam

GTF_file=/proj/genomeanalysis2023/nobackup/work/liek_canu/braker_output_sep/braker_SRR6040094_scaffold_06_scaffold_06/GeneMark-ET/genemark.gtf

samtools index $BAM_file
htseq-count -f bam -i gene_id -t exon -s no $BAM_file $GTF_file -o /proj/genomeanalysis2023/nobackup/work/liek_canu/h_seq_out_69/69_hseq_counts.txt
