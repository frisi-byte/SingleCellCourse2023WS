install.packages("ggsci")
library(ggsci)
library(ggrepel)
library(ggplot2)

## set the directory
getwd() #get the wd
setwd("/lisc/scratch/course/2023w300106/stats") #set it 

## load the stats files
genome.stats <- read_tsv("genome.stats", col_names = TRUE)
transcriptome.stats <- read_tsv("transcriptome.stats", col_names = TRUE)

## preparing for merging 
genome.stats$reference <- "genome"
transcriptome.stats$reference <- "transcriptome"

## merging
#rbinds concatenates two tables as long as they have the same column names
merged.stats <- rbind(genome.stats, transcriptome.stats)

## plotting
merged.stats %>% filter(category == "Uniquely_mapped_reads_Percentage") %>% 
  ggplot(aes(y = value, col = reference)) + 
  geom_boxplot(width = 0.2) + 
  theme_bw() + labs(y = "Percentage of Uniquely Mapped Reads", x = "Reference", title = "Uniquely_mapped_reads_Percentage")

merged.stats %>% filter(category == "Percentage_of_reads_mapped_to_multiple_loci") %>% 
  ggplot(aes(y = value, col = reference)) + 
  geom_boxplot() +
  theme_bw() + labs(y = "Percentage_of_reads_mapped_to_multiple_loci", x = "Reference", title = "Percentage_of_reads_mapped_to_multiple_loci")

#to visualize at the same time all cathegories use facet_grid(~NameOfCategory)
merged.stats %>% filter(grepl("Percentage", category)) %>% 
  ggplot(aes(y = value, col = reference)) + facet_grid(~category) + geom_boxplot()

## Dimensional reduction to compare the transcriptome profiles of the libraries
#library = individuals
#genes = dimensions
dim(my.tpm.filtered)
my.pcaRes <- prcomp(t(my.tpm.filtered), center = TRUE, scale = FALSE)
names(my.pcaRes) #x is the table that contains the PCA
pcaRes$sdev #percentage of variance explained

#umap to visualize the differences between libraries
ggplot(as.data.frame(my.pcaRes$x), aes(x = PC1, y = PC2)) + 
  geom_point(aes(col = rownames(my.pcaRes$x))) + 
  geom_label_repel(size = 2, aes(label = rownames(my.pcaRes$x))) +
  scale_color_futurama() + theme_bw()



