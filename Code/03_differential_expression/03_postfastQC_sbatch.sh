#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_post_trim
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC

# Variables
INPUT="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/RNA_trimmed_reads/*"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/03_differential_expression/03_post_fastQC"

# Commands
fastqc \
-t 4 \
-o $OUTPUT \
-d $OUTPUT \
$INPUT
