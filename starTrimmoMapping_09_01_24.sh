#!/bin/bash
#SBATCH --job-name=starAlign
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=10:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/afterTrimmoMapping/log/star.log
#SBATCH --error=/scratch/course/2023w300106/alice/afterTrimmoMapping/log/star.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

##loading of modules needed
module load star
module list

##preparing environment
cd /scratch/course/2023w300106/alice/afterTrimmoMapping

mkdir output
cd output

##script for STAR
STAR --runThreadN 16 --genomeDir /scratch/course/2023w300106/alice/ncbi_dataset/data/GCF_932526225.1/jaNemVect1.1_STAR --readFilesIn /scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_R1.qc.fastq /scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_R2.qc.fastq --outSAMtype BAM SortedByCoordinate --twopassMode Basic --outSAMstrandField intronMotif --outFileNamePrefix SRR24348400_trimmo


