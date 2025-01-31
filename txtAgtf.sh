# Convertir aarchivo .txt en .gtf 
awk 'BEGIN{OFS="\t"} 
NR > 1 {  # Quitar la primera línea (cabecera)
    gsub(/^Chr/, "", $1);  # Eliminar "Chr" del nombre del cromosoma
    gene_id = $4;           # El TEID como gene_id
    transcript_id = $4 ".1"; # Creamos el transcript_id con ".1"
    exon_number = 1;        
    print $1, "PBRI", "exon", $2, $3, ".", $5, ".", "gene_id \"" gene_id "\"; transcript_id \"" transcript_id "\"; exon_number \"" exon_number "\"; uniq_trans_id \"" gene_id "\";"
}
' TE_transcripts_SlotkinLab_10.1105_tpc.20.00115_SuppFile1.txt > transposons.gtf
