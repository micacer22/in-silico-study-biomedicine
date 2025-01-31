## Alignment of small RNA data using ShortStack ##
nohup ShortStack \
  --genome /home/cacermi/miriam/2024/TFM/Data/X204SC24104429-Z01-F001/Ath_R60.fa \
  --readfile /home/cacermi/miriam/2024/InSilico/proyecto_epigenetica/Data/SRR/combined/sra_files/*_trimmed.fq.gz \
  --outdir /home/cacermi/miriam/2024/InSilico/proyecto_epigenetica/Data/SRR/combined_output \
  --bowtie_cores 8 > combined_analysis.log 2>&1 &

# Separar el archivo merged de mapeo en los distintos archivos .bam separados
for rg in $(samtools view -H merged_alignments.bam | grep '@RG' | cut -f2 | sed 's/ID://'); do
    echo "Procesando $rg..."
    samtools view -b -r $rg merged_alignments.bam > ${rg}.bam
done

# Ordenar archivos .bam separados
nohup bash -c 'for bamfile in SRR*_trimmed.bam; do samtools sort $bamfile -o ${bamfile%.bam}_sorted.bam; done' &

# Generar los flagstats de los archivos BAM ordenados
nohup bash -c 'for file in *_sorted.bam; do samtools flagstat "$file" > "${file%.bam}_flagstat.txt"; done' &  

# Indexar archivos _soted.bam
nohup bash -c 'for file in *_trimmed_sorted.bam; do samtools index "$file"; done' > index.log 2>&1 &



