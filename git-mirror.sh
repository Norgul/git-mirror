#!/bin/bash

primary=$1
secondary=$2

cd ~/

if [[ -d ~/git-mirror ]]; then
    echo "Directory ~/git-mirror exists." 
    cd ~/git-mirror
else
    echo "Directory ~/git-mirror does not exist."
    mkdir git-mirror
    cd git-mirror
fi


repoPath=$(echo ${primary} | rev | cut -d'/' -f 1 | rev)

if [[ -d ${repoPath} ]]; then
    echo "Directory ${repoPath} exists." 
    cd ${repoPath}
else
    echo "Directory ${repoPath} does not exist."
    git clone --mirror $1
    cd ${repoPath}
    git remote add --mirror=fetch secondary $2
fi


git fetch origin
git push secondary --all
git push secondary --tags