#!/bin/bash

#script to run Orthofinder on Salicaeae

cd
git clone https://github.com/CBG-Conservation-Genomics/BotanyWorkshop2024.git
mkdir Orthofinder
ln -s /mnt/class_data/ .

orthofinder -t 5 -M msa -S diamond -A mafft -T fasttree -f /mnt/class_data/ -o Orthofinder
