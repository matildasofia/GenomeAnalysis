#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_on_test_trimmed
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC

# Variables
INPUT="/home/matildas/GenomeAnalysis/Analysis/03_differential_expression/02_trimmomatic_processing/*"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/03_differential_expression/03_post_fastQC/test_trim"

# Commands
fastqc \
-t 4 \
-o $OUTPUT \
-d $OUTPUT \
$INPUT
