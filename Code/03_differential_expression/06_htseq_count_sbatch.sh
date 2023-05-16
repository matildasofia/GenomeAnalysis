#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 12:00:00
#SBATCH -J map_count_htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load htseq

# Variables
INPUT="/proj/genomeanalysis2023/nobackup/work/matildas/"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/03_differential_expression/05_map_count_htseq"
ANNOTATION="/home/matildas/GenomeAnalysis/Data/processed_data/prokka/lferriphilum_nofasta.gff"

# Commands
# Copy to temprary directory to save storage when unzipping 
cp $INPUT*.gz $SNIC_TMP/
cd $SNIC_TMP/

# Run htseq to count mapped reads, start by unzipping the files.
count() {
    gzip -d $F
    f=$(basename "$F" _indexed_map.bam.gz)
    htseq-count -f bam -r pos -s reverse -t CDS -i ID \
    ${f}_indexed_map.bam $ANNOTATION > $OUTPUT/${f}.txt
}

# Run in parallel
for F in *.gz
do
count "$F" &
done
wait
