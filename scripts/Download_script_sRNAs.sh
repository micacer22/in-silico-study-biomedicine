## Download script for small RNA adapters ##
#!/bin/bash
# Ruta al archivo de la lista de SRRs 
SRR_LIST="lista_small-rna.txt"

# Directorio para guardar los archivos descargados
OUTPUT_DIR="./sra_files"

# Directorio de salida 
mkdir -p "$OUTPUT_DIR"

# Archivo para guardar los logs
LOG_FILE="download_srr.log"

# Limpiar el archivo de logs anterior
echo "Iniciando proceso de descarga..." > "$LOG_FILE"

# Iterar sobre cada SRR en la lista
while read -r SRR_ID; do
    echo "Descargando: $SRR_ID" | tee -a "$LOG_FILE"
    
    # Descargar el archivo .sra
    prefetch -v "$SRR_ID" -o "$OUTPUT_DIR/$SRR_ID.sra" >> "$LOG_FILE" 2>&1

    # Verificar la descarga 
    if [[ $? -ne 0 ]]; then
        echo "Error al descargar $SRR_ID. Saltando." | tee -a "$LOG_FILE"
        continue
    fi

    echo "Extrayendo FASTQ: $SRR_ID" | tee -a "$LOG_FILE"

    # Extraer a FASTQ comprimido
    fastq-dump --gzip --outdir "$OUTPUT_DIR" 
    "$OUTPUT_DIR/$SRR_ID.sra" >> "$LOG_FILE" 2>&1

    # Verificar la extraccion 
    if [[ $? -ne 0 ]]; then
    echo "Error al extraer $SRR_ID. Saltando." | tee -a "$LOG_FILE"
    continue
    fi

    echo "Completado: $SRR_ID" | tee -a "$LOG_FILE"
done < "$SRR_LIST"

echo "Proceso terminado." | tee -a "$LOG_FILE"

## Download script for Illumina adapters ##
#!/bin/bash
# Ruta al archivo con la lista de SRRs 
SRR_LIST="lista_illumina.txt"

# Directorio donde guardar los archivos descargados
OUTPUT_DIR="./sra_files"

# Crear directorio de salida 
mkdir -p "$OUTPUT_DIR"

# Archivo para guardar los logs
LOG_FILE="download_srr.log"

# Limpiar el archivo de logs 
echo "Iniciando proceso de descarga..." > "$LOG_FILE"

# Iterar sobre cada SRR en la lista
while read -r SRR_ID; do
    echo "Descargando: $SRR_ID" | tee -a "$LOG_FILE"
    
    # Descargar el archivo .sra
    prefetch -v "$SRR_ID" -o "$OUTPUT_DIR/$SRR_ID.sra" >> "$LOG_FILE" 2>&1
    
    # Verificar la descarga 
    if [[ $? -ne 0 ]]; then
        echo "Error al descargar $SRR_ID. Saltando." | tee -a "$LOG_FILE"
        continue
    fi
    
    echo "Extrayendo FASTQ: $SRR_ID" | tee -a "$LOG_FILE"
    
    # Extraer a FASTQ comprimido
    fastq-dump --gzip --outdir "$OUTPUT_DIR" "$OUTPUT_DIR/$SRR_ID.sra" >> "$LOG_FILE" 2>&1
    
    # Verificar la extraccion
    if [[ $? -ne 0 ]]; then
        echo "Error al extraer $SRR_ID. Saltando." | tee -a "$LOG_FILE"
        continue
    fi

    echo "Completado: $SRR_ID" | tee -a "$LOG_FILE"
done < "$SRR_LIST"

echo "Proceso terminado." | tee -a "$LOG_FILE"
