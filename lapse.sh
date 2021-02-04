#!/bin/bash

FOLDER=$1
[[ -z "$FOLDER" ]] && echo "specify a folder" && exit 1

RATE=$2
[[ -z "$RATE" ]] && RATE=30

FILE=$3
[[ -z "$FILE" ]] && FILE="$FOLDER/timelapse"

echo "ffmpeg -framerate $RATE\
 -pattern_type glob -i \"$FOLDER/*.jpg\"\
 -c:v libx264 -pix_fmt yuv420p\
 $FILE.mp4"

ffmpeg -framerate $RATE\
 -pattern_type glob -i "$FOLDER/*.jpg"\
 -c:v libx264 -pix_fmt yuv420p\
 $FILE.mp4
