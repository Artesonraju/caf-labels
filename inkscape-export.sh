#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function export_sizes {
    WIDTH=$1
    HEIGHT=$2

    FOLDER="$WIDTH"x"$HEIGHT"

    rm -rf "$FOLDER"
    mkdir "$FOLDER"

    for FILE in ./cartes/*.svg
    do
        FULLNAME=$(basename "$FILE")
        NAME="${FULLNAME%.*}"
        inkscape --export-png="$FOLDER"/"$NAME".png --export-area-page --export-width="$WIDTH" --export-height="$HEIGHT" --export-background-opacity=0.0 "$FILE"
    done
}  

function zip_folder {
    FOLDER=$1
    NAME=$2
    rm -f ./${NAME}.zip
    cd $FOLDER
    zip -r ../${NAME}.zip *
    cd ..
}

cd ./labels
cd ./ski-rando
export_sizes 70 90
cp -r ./animations ./70x90
export_sizes 210 270
zip_folder ./70x90 caf-labels-ski-rando
cd ../raquettes
export_sizes 70 90
export_sizes 210 270
zip_folder ./70x90 caf-labels-raquettes
cd ../alpi
export_sizes 70 90
export_sizes 210 270
zip_folder ./70x90 caf-labels-alpi
cd ../v2m
export_sizes 70 90
export_sizes 210 270
zip_folder ./70x90 caf-labels-v2m
cd ../formations
export_sizes 70 90
export_sizes 210 270
zip_folder ./70x90 caf-labels-formations
cd ..
rm -rf ./caf-labels.zip
rm -rf ./all
mkdir ./all
cp -rf ./ski-rando/70x90 ./all/ski-rando
cp -rf ./raquettes/70x90 ./all/raquettes
cp -rf ./alpi/70x90 ./all/alpi
cp -rf ./v2m/70x90 ./all/v2m
cp -rf ./formations/70x90 ./all/formations
cd ./all
zip -r ../caf-labels.zip *
cd ..
rm -rf ./all
cd ..
rm -rf ./docs/ski-rando/70x90
rm -rf ./docs/raquettes/70x90
rm -rf ./docs/alpi/70x90
rm -rf ./docs/v2m/70x90
rm -rf ./docs/formations/70x90
rm -rf ./docs/ski-rando/70x90.zip
rm -rf ./docs/raquettes/70x90.zip
rm -rf ./docs/alpi/70x90.zip
rm -rf ./docs/v2m/70x90.zip
rm -rf ./docs/formations/70x90.zip
rm -rf ./docs/ski-rando/210x270
rm -rf ./docs/raquettes/210x270
rm -rf ./docs/alpi/210x270
rm -rf ./docs/v2m/210x270
rm -rf ./docs/formations/210x270
cp -r ./labels/ski-rando/70x90 ./docs/ski-rando
cp ./labels/ski-rando/caf-labels-ski-rando.zip ./docs/ski-rando
cp -r ./labels/raquettes/70x90 ./docs/raquettes
cp ./labels/raquettes/caf-labels-raquettes.zip ./docs/raquettes
cp -r ./labels/alpi/70x90 ./docs/alpi
cp ./labels/alpi/caf-labels-alpi.zip ./docs/alpi
cp -r ./labels/v2m/70x90 ./docs/v2m
cp ./labels/v2m/caf-labels-v2m.zip ./docs/v2m
cp -r ./labels/formations/70x90 ./docs/formations
cp ./labels/formations/caf-labels-formations.zip ./docs/formations
cp ./labels/caf-labels.zip ./docs
cp -r ./labels/ski-rando/210x270 ./docs/ski-rando
cp -r ./labels/raquettes/210x270 ./docs/raquettes
cp -r ./labels/alpi/210x270 ./docs/alpi
cp -r ./labels/v2m/210x270 ./docs/v2m
cp -r ./labels/formations/210x270 ./docs/formations
