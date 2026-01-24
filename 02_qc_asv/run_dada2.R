#!/usr/bin/env Rscript
library(dada2); library(tidyverse)
s <- commandArgs(trailingOnly = TRUE)[1]
filt <- paste0("02_trim/", s, "_trim.fq.gz")
out  <- paste0("03_table/", s, "_asv.tsv")
if (!file.exists(filt)) { write_tibble(tibble(ASV=character(), readCount=integer()), out); quit() }
err <- learnErrors(filt, multithread = TRUE)
dadaFs <- dada(filt, err = err, multithread = TRUE)
seqtab <- makeSequenceTable(dadaFs)
seqtab.nochim <- removeBimeraDenovo(seqtab, method = "consensus")
write_tibble(tibble(ASV = colnames(seqtab.nochim), readCount = colSums(seqtab.nochim)), out)
cat("【DADA2完成】样本", s, "ASV数=", nrow(seqtab.nochim), "\n")
