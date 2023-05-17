#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J repeatMasker
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules

module load bioinfo-tools
module load RepeatMasker/4.1.2-p1

#path to repeatmasker
REPEATMASKER=/sw/bioinfo/RepeatMasker/4.1.2-p1


#genome to be masked
#GENOME=/proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_06_2/scaffold06_pilon_output/scaffold06_corrected.fasta
#OUTDIR=/proj/genomeanalysis2023/nobackup/work/liek_canu/repeatmasker_output_soft

# Commands
RepeatMasker -xsmall -pa 4 -lib /home/liek2222/GAproject/analyses/02genomeassembly/repeat_mod/RM_8438.FriMay51347482023/consensi.fa -dir /proj/genomeanalysis2023/nobackup/work/liek_canu/repeatmasker_output_soft /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_06_2/scaffold06_pilon_output/scaffold06_corrected.fasta
