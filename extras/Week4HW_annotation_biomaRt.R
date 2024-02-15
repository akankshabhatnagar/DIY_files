#load packages----
library(biomaRt)
library(tidyverse)

#Task 1 Retrieve annotation data for ferrets----
listMarts()
myMart <- useMart(biomart = "ENSEMBL_MART_ENSEMBL")
available.datasets <- listDatasets(myMart)
View(available.datasets)
myMart <- useMart(biomart = "ENSEMBL_MART_ENSEMBL",dataset = "mpfuro_gene_ensembl")

ferret.anno <- useMart(biomart = "ENSEMBL_MART_ENSEMBL", dataset = "mpfuro_gene_ensembl")
ferret.attributes <- listAttributes(ferret.anno)
View(ferret.attributes)

Tx.ferret <- getBM(attributes=c('ensembl_transcript_id','start_position', 'end_position',
                                'external_gene_name','description','entrezgene_trans_name',
                                'pfam'),
                   mart = ferret.anno)

Tx.ferret <- as_tibble(Tx.ferret)


#Task 2 Retrieve promotor sequence----
Promotorseq <- getSequence(id=c("IFIT2","OAS2","IRF1","IFNAR1","MX1"),
                           type="external_gene_name",
                           seqType="gene_flank",
                           upstream = 1000,
                           mart= myMart)
View(Promotorseq)
