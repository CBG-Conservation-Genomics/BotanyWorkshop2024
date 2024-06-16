#!/bin/bash

pip install jcvi
sudo apt install last-align

cd
mkdir MCScan
cd MCScan
ln -s /mnt/class_data/6.CompGen/MCScan/* .

#convert gff annotations to bed
python3 -m jcvi.formats.gff bed --type=CDS --key=Name Populus_deltoides.gff -o Populus_deltoides.bed
python3 -m jcvi.formats.gff bed --type=mRNA --key=Name Populus_trichocarpa.gff -o Populus_trichocarpa.bed

#reformat fasta files
python3 -m jcvi.formats.fasta format Populus_deltoides_CDS.fasta Populus_deltoides.cds
python3 -m jcvi.formats.fasta format Populus_trichocarpa_CDS.fasta Populus_trichocarpa.cds

#may need to remove excessive isoforms in some annotations, we aren't doing this here

#do alignments, will run awhile
python3 -m jcvi.compara.catalog ortholog Populus_deltoides Populus_trichocarpa --no_strip_names

#make synteny plot
python3 -m jcvi.graphics.dotplot Populus_deltoides.Populus_trichocarpa.anchors

#view macrosynteny
python3 -m jcvi.compara.synteny screen --minspan=30 --simple Populus_deltoides.Populus_trichocarpa.anchors Populus_deltoides.Populus_trichocarpa.anchors.new 
python3 -m jcvi.graphics.karyotype seqids layout

