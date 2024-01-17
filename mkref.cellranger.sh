#!/bin/bash
#SBATCH --job-name=mkref.cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16G
#SBATCH --time=2:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/cellranger/log/cellranger.mkref.log
#SBATCH --error=/scratch/course/2023w300106/alice/cellranger/log/cellranger.mkref.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load cellranger
module list

cd /scratch/course/2023w300106/alice/cellranger
mkdir mkref.cellranger_output
cd mkref.cellranger_output

cellranger mkref --genome NemVec.cellranger.ref --fasta /scratch/course/2023w300106/Nv2_wnt4_pcna_fluo.fa --genes /scratch/course/2023w300106/Nv2_wnt4_pcna_fluo.gtf --nthreads 16
