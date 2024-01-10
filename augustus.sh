#!/bin/bash
#SBATCH --job-name=augustus
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/augustus/log/augustus.log
#SBATCH --error=/scratch/course/2023w300106/alice/augustus/log/augustus.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load conda
conda activate augustus-3.5.0
cd /scratch/course/2023w300106/alice/augustus

mkdir output
cd output

augustus --strand=both  --genemodel=complete --gff3=on  --outfile=nemVec_augustus.gff --species=nematostella_vectensis /scratch/course/2023w300106/alice/ncbi_dataset/data/GCF_932526225.1/Nvechr2.fasta
