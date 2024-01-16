library(reshape2)
library(tidyverse)

getowd() #to get actual working directory
setwd("/scratch/course/2023w300106/alice/featureCount_11BAM/output/")

## read the count matrix and setting column names
my.counts <- read_tsv("NVEfeatCount", comment = "#", col_names = TRUE)
names(my.counts) #to get the names of the columns
col.name <- c("geneID", "Chr", "Start", "End", "Strand", "Length", "SRR24348395.f.bam", "SRR24348396.f.bam", "SRR24348397.f.bam", "SRR24348398.f.bam", "SRR24348400.f.bam", "SRR24348401.f.bam", "SRR24348402.f.bam", "SRR24348403.f.bam", "SRR24348404.f.bam", "SRR24348405.f.bam", "SRR24348406.f.bam")
colnames(my.counts) <- col.name #reset the colnames of the matrix

## filtering out non important information
my.counts <- my.counts[, c(1,6:17)]

## normalization of the counts 
#corrects for gene length (count per one thousand)
my.rpk <- my.counts[, 3:13] / unlist(my.counts[,2]) * 1000
#check of the first 5 rowns and 5 columns
my.rpk[1:5, 1:5]
#transcripts per million
my.tpm <- cpm(my.rpk)
my.tpm[1:5, 1:5]
#assign row.names to the tpm matrix
rownames(my.tpm) <- unlist(my.counts[,1])
my.melNorm <- melt(my.tpm)
head(my.melNorm)

ggplot(my.melNorm) + geom_boxplot(aes(x = Var2, y = value, col = Var2)) + scale_color_viridis_d()
#most of the counts are null

##remove all the zero from the original dataset
my.tpm.filtered <- my.tpm[rowSums(my.tpm) > 0, ]
#reshaping
my.melNorm <- my.melt(my.tpm.filtered)

## plotting
ggplot(my.melNorm, aes(x = Var2, y = value, col = Var2)) + geom_boxplot(aes(x = Var2, y = value, col = Var2)) + scale_color_viridis_d() + geom_jitter(width = 0.2) + scale_y_log10()
ggplot(my.melNorm) + geom_violin(aes(x = Var2, y = value, col = Var2)) + scale_color_viridis_d() + scale_y_log10() + theme(axis.text.x = element_text(angle = 45))
ggplot(my.melNorm, aes(x = Var2, y = value, col = Var2)) + geom_violin() + geom_boxplot(width = 0.1) + scale_y_log10() + theme_bw() + labs(y = "Read counts per gene (TPM)", x = "" , col = "Library") + theme(axis.text.x = element_blank()) 

## plotting accorind to the genes 
my.melNorm %>% group_by(Var2) %>% arrange(desc(value), .by_group = TRUE) %>% dplyr::filter(row_number() <= 5) %>% ungroup() %>% group_by(Var1) %>% summarise(count = n()) %>% arrange(desc(count))

my.melNorm %>% filter(value >= 1) %>% dim()

#how many genes are expressed significantly across all libraries
#most genes are expressed significantly in all libraries
my.melNorm %>% filter(value >= 1) %>% group_by(Var1) %>% summarise(count = n()) %>% head()
my.melNorm %>% filter(value >= 1) %>% group_by(Var1) %>% summarise(count = n()) %>% ggplot(aes(x = count, y = "reads")) + geom_violin()
#read expression values / library
my.melNorm %>% filter(value >= 1) %>% ggplot(aes(x = value, col = Var2)) + geom_density() + scale_y_log10() + scale_x_log10() + labs(y = "log of frequency", x = "log of  gene expression")
#or
my.melNorm %>%
  filter(value >= 1) %>%                        #filtering values greater than 1
  ggplot(aes(y = value, col = Var2)) +        # plotting and setting aesthetics
  geom_violin(aes(x = Var2)) +                # we chose violin plot 
  scale_y_log10() +                           # we scale the y axis to soften the long distances from min-max
  geom_boxplot(width = 0.15, aes(x = Var2))   # we draw a boxplot for reference
