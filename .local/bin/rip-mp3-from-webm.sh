#!/usr/bin/env bash

FILES=("$@")

if (( ${#FILES[@]} == 0 )); then
  cat <<"EOM"
    Usage: 
      ./script.sh file1.webm
      ./script.sh file1.webm file2.webm ...
      ./script.sh *.webm
EOM
  exit 1
fi


for FILE in "${FILES[@]}"; do
  ffmpeg -i "${FILE}" -vn -ab 320k -ar 44100 -y "${FILE%.webm}.mp3";
done;
