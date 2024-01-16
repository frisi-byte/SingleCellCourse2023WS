#!/bin/bash
#SBATCH --job-name=interProScan
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=8G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/interproscan/log/interproscan.log
#SBATCH --error=/scratch/course/2023w300106/alice/interproscan/log/interproscan.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load interproscan
module list
cd /scratch/course/2023w300106/alice/interproscan
mkdir output
cd output

interproscan.sh -b NemVec.function -cpu 16 -etra -f TSV,GFF3 -goterms -i /scratch/course/2023w300106/alice/transdecoder/output/proteinTransdecoder.fasta -iprlookup -pa -t p
