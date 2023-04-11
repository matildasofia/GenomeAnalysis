#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 16:00:00
#SBATCH -J assembly_canu_genome_analysis
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# Variables
INPUT="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/DNA_raw_data/ERR2028*.fastq.gz"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/01_canu"

# Commands
canu \
-p lferriphilum \
-d $OUTPUT \
genomeSize=2.41m \
maxThreads=4 \
useGrid=false \
-raw \
-pacbio $INPUT
