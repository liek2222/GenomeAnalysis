#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J STAR
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

#modules
module load bioinfo-tools
module load star/2.7.9a

GENOME=/proj/genomeanalysis2023/nobackup/work/liek_canu/repeatmasker_output_soft
RNA_SEQ_DIR=/proj/genomeanalysis2023/nobackup/work/liek_canu/transcr_06 \
RNA_SEQ_SETS="SRR6040092_scaffold_06,SRR6040093_scaffold_06,SRR6040094_scaffold_06,SRR6040096_scaffold_06,SRR6040097_scaffold_06,SRR6156066_scaffold_06,SRR6156067_scaffold_06,SRR6156069_scaffold_06"
OUTPUT_DIR=/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out

# Run STAR for each RNA-seq set
#commands
STAR --runMode genomeGenerate \
     --genomeDir /proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out \
     --genomeFastaFiles /proj/genomeanalysis2023/nobackup/work/liek_canu/repeatmasker_output_soft/scaffold06_corrected.fasta.masked \
     --runThreadN 8 \
     --genomeSAindexNbases 11

for RNA_SEQ_SET in $(echo $RNA_SEQ_SETS | tr ',' ' '); do
    echo "Processing RNA-seq set $RNA_SEQ_SET"
    mkdir -p $OUTPUT_DIR/${RNA_SEQ_SET}  # create output directory for this RNA-Seq set
    STAR --runThreadN 8 \
         --genomeDir /proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out \
         --readFilesIn $RNA_SEQ_DIR/${RNA_SEQ_SET}.1.fastq $RNA_SEQ_DIR/${RNA_SEQ_SET}.2.fastq \
         --outFileNamePrefix $OUTPUT_DIR/${RNA_SEQ_SET}/ \
         --outSAMtype BAM SortedByCoordinate \
         --outSAMunmapped Within
done


#script for separate output files for each SRR..
