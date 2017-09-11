#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

WIDTH=$1
HEIGHT=$2

FOLDER="$WIDTH"x"$HEIGHT"

mkdir "$FOLDER"

for FILE in ./cartes/*.svg
do
    FULLNAME=$(basename "$FILE")
    NAME="${FULLNAME%.*}"
    inkscape --export-png="$FOLDER"/"$NAME".png --export-area-page --export-width="$WIDTH" --export-height="$HEIGHT" --export-background-opacity=0.0 "$FILE"
done
