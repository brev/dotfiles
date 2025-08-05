#!/usr/bin/env bash

FILES=("$@")

if ((${#FILES[@]} == 0)); then
	cat <<"EOM"
    Usage:
      ./script.sh file1.mov
      ./script.sh file1.mov file2.mov ...
      ./script.sh *.mov
EOM
	exit 1
fi

for FILE in "${FILES[@]}"; do
	NAME="${FILE%.*}"
	ffmpeg -i "$FILE" -vcodec libx265 -crf 18 -tag:v hvc1 -preset veryslow "$NAME"-compressed.mp4
done
