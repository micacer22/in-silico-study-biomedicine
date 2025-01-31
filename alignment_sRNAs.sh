## Alignment of small RNA data using ShortStack ##
nohup ShortStack \
  --genome /home/cacermi/miriam/2024/TFM/Data/X204SC24104429-Z01-F001/Ath_R60.fa \
  --readfile /home/cacermi/miriam/2024/InSilico/proyecto_epigenetica/Data/SRR/combined/sra_files/*_trimmed.fq.gz \
  --outdir /home/cacermi/miriam/2024/InSilico/proyecto_epigenetica/Data/SRR/combined_output \
  --bowtie_cores 8 > combined_analysis.log 2>&1 &
