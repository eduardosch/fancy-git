#!/bin/bash
#
# Author:   Diogo Alexsander Cavilha <diogocavilha@gmail.com>
# Date:     11.28.2017
#
# GIT DIFF
#
# Show changes of a file and suggests to add it

clear

if [ "$1" = "" ]
then
    git diff
    return
fi

git diff "$1"

echo -ne "\n Add this file to commit? [s/N]: "
read r

if [ "$r" = "s" ]
then
    ga "$1"
fi

git status