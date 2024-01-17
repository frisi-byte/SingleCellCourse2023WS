#!/bin/bash
#SBATCH --job-name=mkref.cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/cellranger/log/cellranger.count.log
#SBATCH --error=/scratch/course/2023w300106/alice/cellranger/log/cellranger.count.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load cellranger
module list

cd /scratch/course/2023w300106/alice/cellranger
mkdir count.cellranger_output
cd count.cellranger_output

cellranger count --id 12hrs_cellranger_count \
--transcriptome /scratch/course/2023w300106/alice/cellranger/mkref.cellranger_output/NemVec.cellranger.ref \
--fastqs /scratch/course/2023w300106/12hr1/run1,/scratch/course/2023w300106/12hr1/run2,/scratch/course/2023w300106/12hr1/run3 \
--sample 89085 --nosecondary --localcores 16
