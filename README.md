# in-silico-study-biomedicine

# The Role of Small RNAs in the Epigenetic Control of Plant Virus-Responsive Genes  

## Descripción
Este proyecto investiga el papel de los pequeños RNAs (sRNAs) en la regulación epigenética de genes de respuesta a virus en Arabidopsis thaliana. Se analiza la expresión diferencial de sRNAs en mutantes epigenéticos y su relación con elementos transponibles (TEs) cercanos a genes de respuesta viral.  

## **Estructura del Proyecto**  
📂 **data/** – Archivos de entrada, incluyendo datos de secuenciación.  
📂 **scripts/** – Scripts en Bash y R para análisis de datos.  
📂 **results/** – Resultados intermedios y finales del análisis.  
📄 **README.md** – Este documento.  
📄 **main.tex** – Documento principal del manuscrito en LaTeX.  

## **Requisitos**  
- Sistema operativo: Linux o macOS (se recomienda HPC con SLURM).  
- Herramientas bioinformáticas necesarias:  
  - FastQC  
  - Trim Galore  
  - MultiQC  
  - ShortStack  
  - Samtools  
  - IGV  
  - featureCounts  

## Instrucciones de Uso

### 1. Descarga de Datos
Ejecutar el script para descargar los datos de sRNAs desde GEO/SRA:  
```bash
bash scripts/download_srna_data.sh
```

### 2. Control de Calidad y Preprocesamiento 
```bash
bash scripts/preprocessing.sh
```

### **3. Alineamiento de Secuencias**  
```bash
bash scripts/alignment.sh
```

### **4. Análisis de Expresión Diferencial**  
Ejecutar en R:  
```r
source("scripts/diff_expression_analysis.R")
```

### **5. Visualización en IGV**  
Cargar los archivos BAM en IGV y explorar los patrones de expresión.  

## **Resultados Esperados**  
- Identificación de sRNAs diferencialmente expresados en mutantes epigenéticos.  
- Análisis de la relación entre TEs y genes de respuesta a virus.  
- Integración de datos de metilación y expresión.  

## **Autores y Créditos**  
Este proyecto fue desarrollado por **Miriam Caballero Cerveró**, en colaboración con el grupo *Epigenetic Complexes in Plant Immunity* en I2SysBio.  

## **Contacto**  
📧 [Tu email o enlace a contacto]  
🔗 [Repositorio del proyecto (si aplica)]  

---

¿Quieres que agregue algo más, como detalles sobre cómo instalar las herramientas? 🚀
