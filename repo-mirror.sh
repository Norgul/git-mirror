#!/bin/bash

if [[ -z "$1" ]]
  then
    echo "No repos.txt file location supplied."
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mirrorFile="${DIR}/git-mirror.sh"

while IFS= read -r line
do

    primary=$(echo ${line} | rev | cut -d' ' -f 2 | rev)
    secondary=$(echo ${line} | rev | cut -d' ' -f 1 | rev)

    echo "Primary repo: $primary"
    echo "Secondary repo: $secondary"

    ${mirrorFile} ${primary} ${secondary}

done < "$1"
