#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH -J quast_quality_control
#SBATCH --mail-type=ALL
#SBATCH --mail-user matilda.styfberg.4481@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

# commands
python quast.py REFERENCE TO ASSEMBLY \
-o /home/matildas/GenomeAnalysis/Analysis/01_genome_assembly/02_quast_QC \
-r /proj/genomeanalysis2023/Genome_Analysis/2_Christel_2017/reference/OBMB01.fasta \
-t 4

