#!/usr/bin/env bash

# Concatenate audio files via ffmpeg.
#   2020-11-23--0.mp3 + ... + 2020-11-23--7.mp3 => 2020-11-23.mp3

DATE="2020-11-23"
EXT="mp3"
MIN=0
MAX=7
FILES=()
FILELIST=""

for PART in $(seq $MIN $MAX); do 
  FILE="$DATE--$PART.$EXT"

  if [ -z "$FILELIST" ]; then 
    FILELIST="$FILE"
  else 
    FILELIST="$FILELIST|$FILE"
  fi
done

ffmpeg -i "concat:$FILELIST" -acodec copy $DATE.$EXT

