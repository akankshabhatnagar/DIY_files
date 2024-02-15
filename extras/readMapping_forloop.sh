# This script checks the qualitiy of our fastq files and performs an alignment to the human cDNA transcriptome reference with Kallisto.
# To run this 'shell script' you will need to open your terminal and navigate to the directory where this script resides on your computer.
# This should be the same directory where you fastq files and reference fasta file are found.
# Change permissions on your computer so that you can run a shell script by typing: 'chmod 777 readMapping.sh' (without the quotes) at the terminal prompt 
# Then type './readMapping.sh' (without the quotes) at the prompt.  
# This will begin the process of running each line of code in the shell script.

# First we want to build an index from our reference fasta file 
# I get my reference mammalian transcriptome files from here: https://useast.ensembl.org/info/data/ftp/index.html
kallisto index -i Homo_sapiens.GRCh38.cdna.all.index Homo_sapiens.GRCh38.cdna.all.fa.gz

# FASTQ is a parameter that is searching through files that have fastq in their file name
#For every file with fastq in it, it will first run fastqc and then kallisto
# // is used to search and / is used to replace

for FASTQ in *fastq*
do
	OUT=${FASTQ//.fastq.gz/_mapped}
	LOG=${FASTQ//.fastq.gz/_mapped.log}
	fastqc $FASTQ
	kallisto quant -i Homo_sapiens.GRCh38.cdna.all.index -o $OUT --single -l 250 -s 30 $FASTQ -t 8 &> $LOG
done

# summarize fastqc and kallisto mapping results in a single summary html using MultiQC
multiqc -d . 

echo "Finished"