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
3. Quality Assesment
4. Trimming
5. Post-trimming Quality Assesment
---

# 1. Fetching Data from the SRA Database
*About Data:
---
* Source: SRA Database (WGS)
* Organism: Mycolicibacterium sp. ELW1-p
* Name: WKCHC5_2
* Instrument: Illumina MIseq
* Strategy: WGC
* Layout: Paired

![image](https://github.com/user-attachments/assets/1c624327-aaf1-4fa0-88ce-d2f46f374e70)

*code to fetch the data
```
prefetch SRR33895318
```

Data downloading
![image](https://github.com/user-attachments/assets/b2a48507-304a-48f6-8d5a-77edcf1981f1)

---
# 2. Splitting files
As the data is in the Paired ends (PE), so we need to split it into forward and reverse directon with the help of fastq-dump
*code to split the file
```
fastq-dump --gzip --split-files SRR33895318
```
* OUTPUT

![image](https://github.com/user-attachments/assets/aeccefe3-6e49-447a-9153-302d19402f29)


# 3. Quality Assesment
This initial quality check helps us to spot potential issues with our data before moving to downstram analysis. It examines the various metrics such as per-base sequence quality, sequence lenght distribution and identify the data integrity checks like GC contetn or adapter contamination. This step help as an early warning system, saving us time and computational resoorces for downstream analysis.
* Code
```
fastqc *.fastq.gz 
```
* OUTPUT

![image](https://github.com/user-attachments/assets/91905cee-89f4-459b-a185-23d3de10e671)

* This tool generates the detailed html reports that includes the graphs and summary statistics in the html file.

* On clicking the html file we will get the report as shown below:
![image](https://github.com/user-attachments/assets/8566b770-0e0f-4ce9-8365-659821bd3140)

# 4. Trimming
This is a preprocessing step where we remove the unwanted or low quality reads before downstream analysis. For trimming I am using trimmomatric-0.39.
Here I am using the default value of Q score for LEADING  & TRAILING. The Q score value may varies according to the individual need. Here Q score value 3. indicates the 50% chance of incorrect base call.
* code
```
java -jar /usr/share/java/trimmomatic-0.39.jar PE /home/sne_desh/rna_seq/SRR33895318/SRR33895318_1.fastq.gz  /home/sne_desh/rna_seq/SRR33895318/SRR33895318> /home/sne_desh/rna_seq/SRR33895318/SRR33895318_1_paired.fastq.gz /home/sne_desh/rna_seq/SRR33895318/SRR33895318_1_unpaired.fastq.gz /home/sne_desh/rna_seq>ILLUMINACLIP:/usr/share/trimmomatic/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

```
* OUTPUT
  
![image](https://github.com/user-attachments/assets/de7475cb-4803-4f4a-8953-a00e50d2fe75)

As output I got four files, two paired and two unpaired. so we will use the Quality assesment for only paired files again.

# 4. Post trimming Quality Assesment
Post-trimming quality assesment typically focuses on the paired files. Because these files contain read pairs where both mates passed the quality and length filters, making them the primary input for most downstream analyses, such as alignment to a reference genome.

* Code
```
fastqc *fastq.gz
```
* OUTPUT
![image](https://github.com/user-attachments/assets/d621c5c9-84b0-4c42-a0ea-152587435c4e)

* It will generates the QC html file for all four files
![image](https://github.com/user-attachments/assets/315ed8f8-861d-40ee-93f7-9778bf5fadbe)

# Comparision
For comparision I will take only paired trimmed Quality control files.
![image](https://github.com/user-attachments/assets/bb424377-4d22-4762-a2d7-be5842011817)  ![image](https://github.com/user-attachments/assets/53eccb43-2dc4-48f6-bbbd-f134162df1f5)

![image](https://github.com/user-attachments/assets/f76367a2-8394-4ee9-bbb7-550fad1bc22e)  ![image](https://github.com/user-attachments/assets/82498a68-3348-4d31-b9e4-333633487b4d)

On comparing these, I can see the differences in the total sequencees and total bases size, which is due to trimming process got removed. The sequence lenght also got reduced. In summary, trimmed quality assessments tend to show a dataset that is cleaner and more reliable for subsequent analysis—a factor particularly crucial in high-stakes applications like gene expression studies—while untrimmed data, though more complete, may require additional downstream corrections to mitigate the impact of low-quality regions.

---









