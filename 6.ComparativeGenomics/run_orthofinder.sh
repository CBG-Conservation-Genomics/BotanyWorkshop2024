#!/bin/bash

#script to run Orthofinder on Salicaeae
cd
mkdir Orthofinder
cd Orthofinder
ln -s /mnt/class_data/6.CompGen/Orthofinder/* .

orthofinder -t 5 -M msa -A mafft -T fasttree -f . -o Orthofinder
