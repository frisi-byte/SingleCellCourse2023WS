#!/bin/bash
#SBATCH --job-name=eggnoog
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/eggnog/log/eggnog.log
#SBATCH --error=/scratch/course/2023w300106/alice/eggnog/log/eggnog.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load conda
conda activate eggnog-mapper-2.1.12
module list

cd /scratch/course/2023w300106/alice/eggnog
mkdir output
cd output

emapper.py --cpu 16 -i /scratch/course/2023w300106/alice/transdecoder/output/proteinTransdecoder.fasta --data_dir /scratch/mirror/eggnog-mapper/2.1.12 --output nemVec.eggnog --excel
