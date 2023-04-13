#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J mummerplot_quality_control
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer/4.0.0beta2

# Variables
INPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/03_mummerplot"
REFERENCE="/proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/reference/OBMB01.fasta"

# Commands
mummer \
$REFERENCE \
$INPUT \
> $OUTPUT/mummer_match.mums

cd $OUTPUT

mummerplot \
-R $REFERENCE \
-Q $INPUT \
-p lferriphilum_mummerplot \
--png \
$OUTPUT/mummer_match.mums

gnuplot lferriphilum_mummerplot.gp
