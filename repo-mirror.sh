#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

inputFile="${DIR}/repos.txt"
mirrorFile="${DIR}/git-mirror.sh"

while IFS= read -r line
do

    primary=$(echo ${line} | rev | cut -d' ' -f 2 | rev)
    secondary=$(echo ${line} | rev | cut -d' ' -f 1 | rev)

    echo "Primary repo: $primary"
    echo "Secondary repo: $secondary"

    ${mirrorFile} ${primary} ${secondary}

done < "$inputFile"
