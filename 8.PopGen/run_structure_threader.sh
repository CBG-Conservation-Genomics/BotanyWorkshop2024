#!/bin/bash

pip3 install structure_threader

#add to .bashrc, adjust to your path
#export PATH="/home/instructor/.local/bin/$PATH"
#source ~/.bashrc

cd
mkdir Structure
cd Structure
ln -s /mnt/class_data/8.PopGen/* .

structure_threader run -K 5  -i infile -o struture1 -t 5 -st ~/.local/bin/
