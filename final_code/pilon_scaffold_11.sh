#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 17:00:00
#SBATCH -J pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules
module load java/sun_jdk1.8.0_151
module load bioinfo-tools Pilon/1.24
module load samtools/1.17
module load bcftools/1.17


# COMMANDS
java -jar $PILON_HOME/pilon.jar --genome /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_11_2/canu_scaffold_11.contigs.fasta --frags /proj/genomeanalysis2023/nobackup/work/liek_trim/aligned_illumina/scaffold_11_sorted.bam \
--output scaffold11_corrected --outdir /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_11_2/scaffold11_pilon_output --threads 2
