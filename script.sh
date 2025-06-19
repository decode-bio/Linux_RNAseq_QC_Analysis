#!/bin/bash


# RNA Sequence QC Analysis

# Step1: Fetching the data from the SRA database

prefetch SRR33895318

# Step2: To split the files into the forward and reverse direction with the help of fastq-dump

fastq-dump --gzip --split-files SRR33895318

# Step3: To do the initial Quality check using the fastqc

fastqc *.fastq.gz

# Step 4:Using the trimmomatic, to remove the adapter contamination or low quality reads etc.


java -jar /usr/share/java/trimmomatic-0.39.jar PE /home/sne_desh/rna_seq/SRR33895318/SRR33895318_1.fastq.gz  /home/sne_desh/rna_seq/SRR33895318/SRR33895318_2.fastq.gz \
/home/sne_desh/rna_seq/SRR33895318/SRR33895318_1_paired.fastq.gz /home/sne_desh/rna_seq/SRR33895318/SRR33895318_1_unpaired.fastq.gz /home/sne_desh/rna_seq/SRR33895318/SRR33895318_2_paired.fastq.gz /home/sne_desh/rna_seq/SRR33895318/SRR33895318_2_unpaired.fastq.gz \
ILLUMINACLIP:/usr/share/trimmomatic/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# Step 5: Post trimming Quality assesment using fastqc

fastqc *.fastq.gz
