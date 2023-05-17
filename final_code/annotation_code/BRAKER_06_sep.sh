#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J braker_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user liek2222@student.uu.se

# Load modules
module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1


#bam files paths
BAMS=(
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6040092_scaffold_06/Aligned.sortedByCoord.out.bam"
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6040093_scaffold_06/Aligned.sortedByCoord.out.bam"
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6040094_scaffold_06/Aligned.sortedByCoord.out.bam"
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6040096_scaffold_06/Aligned.sortedByCoord.out.bam"
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6040097_scaffold_06/Aligned.sortedByCoord.out.bam"
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6156066_scaffold_06/Aligned.sortedByCoord.out.bam"
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6156067_scaffold_06/Aligned.sortedByCoord.out.bam"
    "/proj/genomeanalysis2023/nobackup/work/liek_canu/STAR_out/SRR6156069_scaffold_06/Aligned.sortedByCoord.out.bam"
)



cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key
source $AUGUSTUS_CONFIG_COPY
export AUGUSTUS_CONFIG_PATH=/proj/genomeanalysis2023/nobackup/work/liek_canu/braker_output_sep/augustus_config;
export AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin;
export AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts;
export GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy;


# Loop over bam files
chmod a+w -R /proj/genomeanalysis2023/nobackup/work/liek_canu/braker_output_sep/augustus_config
# Loop over bam files
for BAM in "${BAMS[@]}"
do
    # Extract sample name from bam file
    SAMPLE=$(basename $(dirname $BAM))

    # Set output directory
    OUTDIR="/proj/genomeanalysis2023/nobackup/work/liek_canu/braker_output_sep/braker_${SAMPLE}_scaffold_06"

    # Create output directory if it doesn't exist
    if [ ! -d "$OUTDIR" ]; then
        mkdir -p "$OUTDIR"
    fi

    # Run Braker with the current bam file
    braker.pl --genome=/proj/genomeanalysis2023/nobackup/work/liek_canu/repeatmasker_output_soft/scaffold06_corrected.fasta.masked \
    --cores=8 --species=Durio_zibethinus \
    --bam="$BAM" \
    --workingdir="$OUTDIR" \
    --useexisting \
    --softmasking
done

