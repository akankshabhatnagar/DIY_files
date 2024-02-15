This folder contains all results and scripts used in DIY Transcriptomics, Spring 2024.
Homo sapiens reference Genome was obtained from ensembl (GRCh38) and indexed using kallisto.
Fastq raw files were checked for qualiy using FASTQC.
Read mapping was performed using kallisto quant function, single reads.
FASTQC and kallisto outputs are summarized in Multiqc.
Kallisto outputs were improted into R using Tximport and aligned against human annotation using EnsDb.Hsapiens.v86 library in R.
Reads were counted as length scaled PTM and gene level data was obtained with txOut= FALSE argument in txImport.
