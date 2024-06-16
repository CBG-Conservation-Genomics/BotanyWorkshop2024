if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("gdsfmt")
BiocManager::install("SNPRelate")

# Load the R packages: gdsfmt and SNPRelate
library(gdsfmt)
library(SNPRelate)

#get the file https://drive.google.com/file/d/1-gJrJOy0zqkhIV7e496r4V4V4wkpJKjD/view?usp=drive_link
#and put on ~/Desktop
setwd("~/Desktop/Botany2024/")



vcf.fn <- "tgdr675_panel4SNPv3.vcf"

snpgdsVCF2GDS(vcf.fn, "test.gds", method="biallelic.only")
snpgdsSummary("test.gds")

genofile <- snpgdsOpen("test.gds")
#closefn.gds(genofile)

# Try different LD thresholds for sensitivity analysis
snpset <- snpgdsLDpruning(genofile, ld.threshold=0.2, autosome.only=FALSE)
str(snpset)
names(snpset)
snpset.id <- unlist(unname(snpset))

pca <- snpgdsPCA(genofile, snp.id=snpset.id, num.thread=2, autosome.only=FALSE)

# variance proportion (%)
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))

# make a data.frame
tab <- data.frame(sample.id = pca$sample.id,
                  EV1 = pca$eigenvect[,1],    # the first eigenvector
                  EV2 = pca$eigenvect[,2],    # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

# Draw
plot(tab$EV2, tab$EV1, xlab="eigenvector 2", ylab="eigenvector 1")

#Fst
sample.id <- read.gdsn(index.gdsn(genofile, "sample.id"))
pop_code <- read.gdsn(index.gdsn(genofile, "sample.annot/pop.group"))
