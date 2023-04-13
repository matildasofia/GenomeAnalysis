#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J prokka_geneannot
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka/1.45-5b58020

# Variables
INPUT="/home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/01_canu/lferriphilum.contigs.fasta"
OUTPUT="/home/matildas/GenomeAnalysis/Analysis/02_annotation/01_prokka/"

# Commands
prokka \
--outdir $OUTPUT --prefix lferriphilum --addgenes --force \
--genus Leptospirillum --species ferriphilum --strain DSM_14647 \
--gram neg --usegenus \
$INPUT
