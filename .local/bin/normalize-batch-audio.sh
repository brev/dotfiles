#!/usr/bin/env bash

# Normalize batch of all audio files in current directory.
#   Outputs into new normalized/ subdir.
# Requires:
#   pip3 install ffmpeg-normalize

EXT="mp3"
RATE="320k"

ffmpeg-normalize *.$EXT -c:a libmp3lame -b:a $RATE -ext $EXT -nt peak -t 0
