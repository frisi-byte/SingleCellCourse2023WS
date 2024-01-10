#!/bin/bash
#SBATCH --job-name=TrimBAMfilter
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --time=02:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/BAMfiltering/log/bamFilter.log
#SBATCH --error=/scratch/course/2023w300106/alice/BAMfiltering/log/bamFilter.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

#modules
module load samtools
module list

#script
samtools view -b -o /scratch/course/2023w300106/BAMS/SRR24348400.f.bam \
	-q 20 \
	-f 0x2 \
	-F 0x4 \
	-@ 8 \
	/scratch/course/2023w300106/alice/afterTrimmoMapping/output/SRR24348400_trimmoAligned.sortedByCoord.out.bam
