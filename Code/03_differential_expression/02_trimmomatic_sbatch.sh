#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J trimming_trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load trimmomatic/0.39

# Variables
INPUT="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/RNA_raw_data/ERR2036629_1.fastq.gz"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/03_differential_expression/02_trimmomatic_processing/ERR2036629_trimmed.fq.gz"

# Commands
trimmomatic \
PE -threads 4 \
-basein $INPUT \
-baseout $OUTPUT \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36 \
