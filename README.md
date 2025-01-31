# **The Role of Small RNAs in the Epigenetic Control of Plant Virus-Responsive Genes**  

## **Description**  
This project investigates the role of small RNAs (sRNAs) in the epigenetic regulation of virus-responsive genes in *Arabidopsis thaliana*. It analyzes the differential expression of sRNAs in epigenetic mutants and their relationship with nearby transposable elements (TEs).  

## **Project Structure**  
📂 **data/** – Input files, including sequencing data.  
📂 **scripts/** – Bash and R scripts for data analysis.  
📂 **results/** – Intermediate and final analysis results.  
📄 **README.md** – This document.  
📄 **main.tex** – Main LaTeX manuscript file.  

## **Requirements**  
- Operating system: Linux or macOS (HPC with SLURM recommended).  
- Required bioinformatics tools:  
  - FastQC  
  - Trim Galore  
  - MultiQC  
  - ShortStack  
  - Samtools  
  - IGV  
  - featureCounts  
  - R (packages: `DESeq2`, `edgeR`)  

## **Usage Instructions**  

### **1. Download Data**  
Run the script to download sRNA sequencing data from GEO/SRA:  
```bash
bash scripts/download_srna_data.sh
```

### **2. Quality Control and Preprocessing**  
```bash
bash scripts/preprocessing.sh
```

### **3. Sequence Alignment**  
```bash
bash scripts/alignment.sh
```

### **4. Differential Expression Analysis**  
Run in R:  
```r
source("scripts/diff_expression_analysis.R")
```

### **5. Visualization in IGV**  
Load the BAM files into IGV to explore expression patterns.  

## **Expected Results**  
- Identification of differentially expressed sRNAs in epigenetic mutants.  
- Analysis of the relationship between TEs and virus-responsive genes.  
- Integration of methylation and expression data.  

## **Authors and Credits**  
This project was developed by **Miriam Caballero Cerveró**, in collaboration with the *Epigenetic Complexes in Plant Immunity* group at I2SysBio.  

## **Contact**  
📧 miriam.caballero@csic.es  
