#!/bin/bash
#SBATCH --job-name=starAlign
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=05:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/alignToTranscriptome/Log/star.log
#SBATCH --error=/scratch/course/2023w300106/alice/alignToTranscriptome/Log/star.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load star
module list

cd /scratch/course/2023w300106/alice/alignToTranscriptome
mkdir output
cd output

STAR --runThreadN 16 --genomeDir /scratch/course/2023w300106/alice/HADO01_STAR/ --readFilesIn /scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_R1.qc.fastq /scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_R2.qc.fastq --twopassMode Basic --outSAMtype BAM SortedByCoordinate --outFileNamePrefix SRR24348400_HADO01

