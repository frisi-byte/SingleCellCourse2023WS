#!/bin/bash
#SBATCH --job-name=eggnoog
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/eggnog/log/eggnog_juan.log
#SBATCH --error=/scratch/course/2023w300106/alice/eggnog/log/eggnog_juan.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load conda
conda activate eggnog-mapper-2.1.12
module list

cd /scratch/course/2023w300106/alice/eggnog
mkdir output_juan
cd output_juan

emapper.py --cpu 16 -i /scratch/course/2023w300106/alice/transdecoder/output/proteinTransdecoder.fasta --data_dir /scratch/mirror/eggnog-mapper/2.1.12 --pident 60 --query_cover 60 --subject_cover 70 --tax_scope 'eukaryota_broad' --go_evidence all --output jaNemVec1.1 --temp_dir ${TMPDIR} --resume

#TMPDIR is created everytime that I submit a slurm job and it's on the hardware of the computer cluster
#way faster to write there than to the network


