#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J repeatmod
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se


# load modules
module load bioinfo-tools
module load RepeatModeler

#commands
BuildDatabase -pa 4 -name /proj/genomeanalysis2023/nobackup/work/liek_canu/repeat_mod/scaffold06_repeat_library /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_06_2/scaffold06_pilon_output/scaffold06_corrected.fasta 
BuildDatabase -pa 4 -name /proj/genomeanalysis2023/nobackup/work/liek_canu/repeat_mod/scaffold11_repeat_library /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_11_2/scaffold11_pilon_output/scaffold11_corrected.fasta

RepeatModeler -database /proj/genomeanalysis2023/nobackup/work/liek_canu/repeat_mod/scaffold06_repeat_library -pa 4 /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_06_2/scaffold06_pilon_output/scaffold06_corrected.fasta
RepeatModeler -database /proj/genomeanalysis2023/nobackup/work/liek_canu/repeat_mod/scaffold11_repeat_library -pa 4 /proj/genomeanalysis2023/nobackup/work/liek_canu/canu_pacbio_11_2/scaffold11_pilon_output/scaffold11_corrected.fasta
