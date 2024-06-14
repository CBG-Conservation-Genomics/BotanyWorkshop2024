#!/bin/bash
./nextflow run -hub gitlab PlantGenomicsLab/easel \
  -c nextflow.conf \
  --genome /mnt/class_data/tempAnnotation/populusTrichocarpa.softmasked.singleContigShort.fasta \
  --bam /mnt/class_data/5.Annotation/data/rna-seq/sorted.bam \
  --busco_lineage embryophyta \
  --order Viridiplantae     --taxon null \
  --training_set plant \
  --outdir /mnt/class_data/haley_outputs \
  -w /mnt/class_data/haley_work \
  --singularity_cache_dir /mnt/class_data/singularityForNextflow