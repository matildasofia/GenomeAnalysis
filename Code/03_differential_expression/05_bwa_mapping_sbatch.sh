#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 8:00:00
#SBATCH -J mapping_BWA
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa

# Variables
INPUT="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/RNA_trimmed_reads/"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/03_differential_expression/04_mapping_bwa/mapping.sam"
REFERENCE="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/reference/OBMB01.fasta"

# Commands
# copy files into temporary directory
cp $INPUT*P1.trim.fastq.gz $SNIC_TMP/
cp $INPUT*P2.trim.fastq.gz $SNIC_TMP/
cd $SNIC_TMP/

bwa index $REFERENCE -p indexed_reference

# map each pair of reads
for F in *P1.trim.fastq.gz
do
FILE=$F
f=$(basename "$FILE" P1.trim.fastq.gz)
bwa mem \
-t 4 \
indexed_reference \
${f}P1.trim.fastq.gz ${f}P2.trim.fastq.gz \
> $OUTPUT
done
