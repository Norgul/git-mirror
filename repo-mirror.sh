#!/bin/bash

input="repos.txt"

while IFS= read -r line
do

    secondary=$(echo ${line} | rev | cut -d' ' -f 1 | rev)
    primary=$(echo ${line} | rev | cut -d' ' -f 2 | rev)

    echo "Primary repo: $primary"
    echo "Secondary repo: $secondary"

    ./git-mirror.sh ${primary} ${secondary}

done < "$input"
