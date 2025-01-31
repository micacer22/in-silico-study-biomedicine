## Data Preprocessing script ##

# Analisis de calidad con Fastqc antes de trimmear
nohup fastqc -t 8 *.fastq.gz &
 
# Trim_galore
 nohup trim_galore --length 10 --max_length 40 *.fastq.gz &

# Fastqc de los archivos trimeados
 for file in *_trimmed.fq.gz; do fastqc "$file" -o ./fastqc_trimming_results/; done

# Multiqc de los archivos fastqc trimeados
multiqc . 
