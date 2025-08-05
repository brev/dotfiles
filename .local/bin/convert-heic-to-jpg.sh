#!/usr/bin/env bash
magick mogrify -monitor -format jpg -define preserve-timestamp=true *.{HEIC,heic}
