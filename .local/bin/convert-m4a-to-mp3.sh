#!/usr/bin/env bash

for f in *.m4a; do
	ffmpeg -i "$f" -ab 320k -map_metadata 0 -id3v2_version 3 "${f%m4a}mp3"
done
