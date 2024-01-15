#!/bin/bash
#SBATCH --job-name=featureCount
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=8G
#SBATCH --time=5:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/featureCount_11BAM/log/featCount.log
#SBATCH --error=/scratch/course/2023w300106/alice/featureCount_11BAM/log/featCount.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load subread
module list

cd /scratch/course/2023w300106/alice/featureCount_11BAM
mkdir output
cd output

#stranded: if it doesn't work (proportion of successfully assigned alignments is low) with -s 1, try -s 2
#I use the already filtered BAM file 
featureCounts -O -p --countReadPairs -C -T 16 --primary -a /scratch/course/2023w300106/jmontenegro/ex2/annotation/tmp.gtf -o NVEfeatCount /scratch/course/2023w300106/BAMS/*.bam

