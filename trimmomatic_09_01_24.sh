#!/bin/bash
#SBATCH --job-name=trimControl
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=10:00:00
#SBATCH --partition=basic
#SBATCH --output=/scratch/course/2023w300106/alice/trimmomatic/trimm.log
#SBATCH --error=/scratch/course/2023w300106/alice/trimmomatic/trimm.err
#SBATCH --mail-type=END
#SBATCH --mail-user=alice.frisinghelli@univie.ac.at

module load trimmomatic/0.39
module list

cd /scratch/course/2023w300106/alice/ex3/SRR24348400/trim

trimmomatic PE -threads 8 \
	-phred33 \
	-summary trim.summary.txt \
	/scratch/course/2023w300106/alice/ex3/SRR24348400/SRR24348400_1.fastq \
	/scratch/course/2023w300106/alice/ex3/SRR24348400/SRR24348400_2.fastq \
	/scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_R1.qc.fastq \
	/scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_S1.qc.fastq \
	/scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_R2.qc.fastq \
	/scratch/course/2023w300106/alice/ex3/SRR24348400/trim/SRR24348400_S2.qc.fastq \
	ILLUMINACLIP:/scratch/course/2023w300106/alice/adapters.fa:2:30:10 \
	SLIDINGWINDOW:6:15 \
	MINLEN:75
