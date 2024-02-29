#!/bin/bash

wget -q https://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa -O proteins.fasta

fasta_file="proteins.fasta"

num_sequences=0
total_length=0

while IFS= read -r line; do
    if [[ "$line" == ">"* ]]; then
        ((num_sequences++))
    else
        length=$(echo -n "$line" | wc -m)
        total_length=$((total_length + length))
    fi
done < "$fasta_file"

if [ "$num_sequences" -gt 0 ]; then
    average_length=$(echo "scale=2; $total_length / $num_sequences" | bc)
    echo "Average length of proteins: $average_length"
else
    echo "No protein sequences found in the file."
fi


