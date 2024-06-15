#!/bin/bash

#script to run Orthofinder on Salicaeae

mkdir Orthofinder

orthofinder -t 5 -M msa -A mafft -T fasttree -f /mnt/class_data/6.CompGen/OrthoFinder/ -o Orthofinder
