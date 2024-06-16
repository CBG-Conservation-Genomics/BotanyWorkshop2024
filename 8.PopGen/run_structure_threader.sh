#!/bin/bash

pip3 install structure_threader

#add to .bashrc, adjust to your path
#export PATH="/home/instructor/.local/bin/$PATH"
#source ~/.bashrc

cd
mkdir Structure
cd Structure
ln -s /mnt/class_data/8.PopGen/* .

structure_threader run -K 5  -i /mnt/class_data/8.PopGen/tgdr675_panel4SNPv3.bed -o struture1 -t 5 -st ~/.local/bin/
