#!/bin/bash
sudo /home/exouser/Software/nextflow run -hub gitlab PlantGenomicsLab/easel \
    -c /home/hsc945/nextflow.conf \
    --genome annotation/earlGreyOutputs/oenotheraHarringtonii_EarlGrey/oenotheraHarringtonii_summaryFiles/populusTrichocarpa.softmasked.fasta \
    --user_reads annotation/rna-seq/*{1,2}.fastq.gz \
    --busco_lineage embryophyta \
    --order Viridiplantae \
    --taxon null \
    --training_set plant \
    --outdir annotation/easel/
    --with-report --with-trace
