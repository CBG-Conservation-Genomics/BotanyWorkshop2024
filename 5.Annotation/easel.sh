#!/bin/bash
sudo /home/exouser/Software/nextflow run -hub gitlab PlantGenomicsLab/easel \
    -c nextflow.conf \
    --genome annotation/earlGreyOutputsScaffolds/populusTrichocarpa_EarlGrey/populusTrichocarpa_summaryFiles/populusTrichocarpa.softmasked.fasta \
    --user_reads annotation/rna-seq/*{1,2}.fastq.gz \
    --busco_lineage embryophyta \
    --order Viridiplantae \
    --taxon null \
    --training_set plant \
    --outdir annotation/easel/
    --with-report --with-trace
