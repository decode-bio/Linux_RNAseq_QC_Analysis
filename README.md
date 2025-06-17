# RNA-seq Quality Control (QC) Analysis
RNA-seq quality control (QC) analysis is an essential phase in transcriptomics workflows—it ensures that the data we feed into our downstream analyses is reliable and free from systematic biases. It is a multistep process that ensures our data us reliable before we proceed to more complex downstream analyses.

# Tools
* SRA(Sequence Read Archive) toolkit (prefetch, fastq-dumo, fastqc)
* Trimmomatic
* Linux OS
* Bash scripting
  
# Contents
1. Fetching data from the SRA database
2. Splitting files
3. Evaluating the fies using FASTQC
4. Adapter Removal and Quality Trimming
5. Re-assesment of Pre-processed data
---

# 1. Fetching Data from the SRA Database
# About Data:
* Source: SRA Database (WGS)
* Organism: Mycolicibacterium sp. ELW1-p
* Name: WKCHC5_2
* Instrument: Illumina MIseq
* Strategy: WGC
* Layout: Paired

![image](https://github.com/user-attachments/assets/1c624327-aaf1-4fa0-88ce-d2f46f374e70)

Downloading the Data
![image](https://github.com/user-attachments/assets/b2a48507-304a-48f6-8d5a-77edcf1981f1)

---
# 2. Splitting files
As the data is in the Paired ends (PE), so we need to split it into forward and reverse directon with the help of fastq-dump
![image](https://github.com/user-attachments/assets/95603a79-98ab-49bd-a53f-65ce94978af0)


# 3. Evaluating the files using FASTQC
This initial quality check helps us to spot potential issues such as a drop in quality at the 3′ ends, overrepresented sequences, or adapter contamination. We can also check for the per-base sequence quality, nucleotide composition, sequence duplication levels, and GC content.

![image](https://github.com/user-attachments/assets/37c4dd3c-d54d-46eb-9f06-1533867377fd)





