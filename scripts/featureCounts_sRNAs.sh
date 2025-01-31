featureCounts -a Annotations/atRTD3_TS_21Feb22_transfix.gtf \
      -o counts_genes.txt \
      -T 8 \
      -s 0 \
      -t exon \
      -g gene_id \
      merged_alignments.bam

featureCounts -a Annotations/transposons.gtf \
      -o counts_transposons.txt \
      -T 8 \
      -s 0 \
      -t exon \
      -g gene_id \
      merged_alignments.bam
