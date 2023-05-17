#Script for Differential expression analysis using DESeq2

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DESeq2", version = "3.16")

library(DESeq2)
setwd("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/")
# get a list of all the count files
count_files <- list.files()
count_matrix <- matrix(0, nrow = 3972, ncol = length(count_files))

htseq_92 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_92", header=FALSE)
htseq_93 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_93", header=FALSE)
htseq_94 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_94", header=FALSE)
htseq_96 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_96", header=FALSE)
htseq_97 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_97", header=FALSE)  
htseq_66 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_66", header=FALSE)
htseq_67 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_67", header=FALSE)
htseq_69 <- read.delim("C:/Users/linne/OneDrive/Skrivbord/Genome Analysis/htseq_counts/htseq_69", header=FALSE)


colnames(htseq_92)<- c('gene name', 'counts')
colnames(htseq_93)<- c('gene name', 'counts')
colnames(htseq_94)<- c('gene name', 'counts')
colnames(htseq_96)<- c('gene name', 'counts')
colnames(htseq_97)<- c('gene name', 'counts')
colnames(htseq_66)<- c('gene name', 'counts')
colnames(htseq_67)<- c('gene name', 'counts')
colnames(htseq_99)<- c('gene name', 'counts')

htseq_66$counts_67<-c(htseq_67$counts)
htseq_66$counts_69<-c(htseq_69$counts)
htseq_66$counts_92<-c(htseq_92$counts)
htseq_66$counts_93<-c(htseq_93$counts)
htseq_66$counts_94<-c(htseq_94$counts)
htseq_66$counts_96<-c(htseq_96$counts)
htseq_66$counts_97<-c(htseq_97$counts)

colname_counts<-c("gene name", "SRR6156066", "SRR6156067", "SRR6156069", "SRR6040092", "SRR6040093", "SRR6040094", "SRR6040096", "SRR6040097")
counts_matrix<-htseq_66[, c(1,2,3,4,5,6,7,8,9)]
gene_ids <- c(htseq_66$`gene name`, htseq_67$`gene name`, htseq_69$`gene name`,htseq_92$`gene name`, htseq_93$`gene name`, htseq_94$`gene name`, htseq_96$`gene name`,htseq_97$`gene name`)

counts_matrix<-cbind(htseq_66$counts, htseq_67$counts, htseq_69$counts, htseq_92$counts, htseq_93$counts, htseq_94$counts, htseq_96$counts, htseq_97$counts)
rownames(counts_matrix) <- gene_ids
colnames(counts_matrix)<-colname_counts
metadat_SRA<-SraRunTable[c(1,2,4,8,9,10,12,13), ]

rownames(counts_matrix) <-counts_matrix$`gene name`
count_data<-counts_matrix[, c(2,3,4,5,6,7,8,9)] #dont include gen_id column
colnames(count_data) <-metadat_SRA$Run

#table with column total
counts_matrix_summed <- counts_matrix
counts_matrix_summed$Total <- rowSums(counts_matrix_summed[,2:9])
write.csv(counts_matrix_summed, file = "Count_matrix_summed.csv", row.names = FALSE)

count_data <- counts_matrix

#DeSeq condition Tissue
library(DESeq2)
#metadat_SRA$Tissue <- factor(metadat_SRA$Tissue)

dds <- DESeqDataSetFromMatrix(countData = count_data,
                              colData = metadat_SRA,
                              design = ~ Tissue)
dds <- DESeq(dds)
res <- results(dds)

#show significant results
adjp_threshold <- 0.05
significant_results <- subset(res, padj < adjp_threshold)
write.csv(significant_results, file = "significant_results.csv", row.names = TRUE)


#DeSeq condition cultivar
dds2 <- DESeqDataSetFromMatrix(countData = count_data,
                              colData = metadat_SRA,
                              design = ~ Cultivar)
dds2 <- DESeq(dds)
res2 <- results(dds2)

#show significant results
adjp_threshold <- 0.05
significant_results2 <- subset(res2, padj < adjp_threshold)

#create csvs
write.csv(significant_results, file = "significant_results.csv", row.names = TRUE)
write.csv(significant_results2, file = "significant_results2.csv", row.names = TRUE)


