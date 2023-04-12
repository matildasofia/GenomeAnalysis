#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J quast_quality_control
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

# Variables
INPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/02_quast_QC"
REFERENCE="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/reference/OBMB01.fasta"

# commands
quast.py $INPUT \
-o $OUTPUT \
-r $REFERENCE \
-t 4 \
--gene-finding
