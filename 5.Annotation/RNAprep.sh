fastp -i /mnt/class_data/5.Annotation/data/SRR26075323_1.fastq.gz \
    -I /mnt/class_data/5.Annotation/data/SRR26075323_2.fastq.gz \
    -o /mnt/class_data/5.Annotation/data/SRR26075323_fastp_1.fastq.gz \
    -O /mnt/class_data/5.Annotation/data/SRR26075323_fastp_2.fastq.gz \
    --thread 8 \
    --json /mnt/class_data/haley_data/SRR26075323.json \
    --html /mnt/class_data/haley_data/SRR26075323.html


hisat2 --dta -q -x /mnt/class_data/5.Annotation/data/easelOutputsSingleContigShort/02_index/hisat2/hisat2.index/hisat2 \
    -1 /mnt/class_data/5.Annotation/data/SRR26075323_fastp_1.fastq.gz \
    -2 /mnt/class_data/5.Annotation/data/SRR26075323_fastp_2.fastq.gz \
    -S /mnt/class_data/5.Annotation/data/SRR26075323.sam
    

samtools view -b /mnt/class_data/5.Annotation/data/SRR26075323.sam | samtools sort -o /mnt/class_data/5.Annotation/data/sorted.bam