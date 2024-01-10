#!/bin/bash
#SBATCH --job-name=stringtieAnn
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=5:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/BAMfiltering/log/stringtieAnn.log
#SBATCH --error=/scratch/course/2023w300106/alice/BAMfiltering/log/stringtieAnn.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

#Modules
module load stringtie
module list
cd /scratch/course/2023w300106/alice/BAMfiltering
mkdir StringtieOutput
cd StringtieOutput

#Execution
stringtie /scratch/course/2023w300106/BAMS/SRR24348400.f.bam -l NemVec1 -o NemAnnotation.gtf -p 8 -f 0.05 -u

