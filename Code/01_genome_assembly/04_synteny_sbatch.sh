#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J synteny_comparison
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# Variables
INPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta"
SEQ2="/home/matildas/GenomeAnalysis/Data/raw_data/lferriphilum_YSK.fasta"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/04_synteny_comparison"

# Commands
# Blast for homology search
blastn -subject $INPUT \
-query $SEQ2 \
-outfmt 6 > $OUTPUT/synteny.txt
