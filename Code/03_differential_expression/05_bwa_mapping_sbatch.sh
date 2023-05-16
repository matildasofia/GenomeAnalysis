#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 8:00:00
#SBATCH -J mapping_BWA
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Variables
INPUT="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/RNA_trimmed_reads/"
OUTPUT="/proj/genomeanalysis2023/nobackup/work/matildas"
REFERENCE="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta"

# Commands
# copy files into temporary directory
cp $INPUT*P1.trim.fastq.gz $SNIC_TMP/
cp $INPUT*P2.trim.fastq.gz $SNIC_TMP/
cd $SNIC_TMP/

# Index the reference sequence
bwa index $REFERENCE -p indexed_reference

# map each pair of reads, sort by position and compress.
map() {
 f=$(basename "$F" P1.trim.fastq.gz)
 bwa mem \
 -t 4 \
 indexed_reference \
 ${f}P1.trim.fastq.gz ${f}P2.trim.fastq.gz | samtools view -S -b | samtools sort -o ${f}indexed_map.bam
 gzip ${f}indexed_map.bam
}

for F in *P1.trim.fastq.gz
do
 map "$F" &
done
wait

cp *_indexed_map.bam.gz $OUTPUT
