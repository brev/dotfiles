#!/usr/bin/env bash

FILES=("$@")

if (( ${#FILES[@]} == 0 )); then
  cat <<"EOM"
    Usage: 
      ./script.sh file1.mov
      ./script.sh file1.mov file2.mov ...
      ./script.sh *.mov
EOM
  exit 1
fi

for FILE in "${FILES[@]}"; do
  ffmpeg -i $FILE -q:a 0 -map a $FILE.mp3
done
