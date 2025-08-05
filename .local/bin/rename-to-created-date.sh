#!/usr/bin/env bash

FILES=("$@")

if ((${#FILES[@]} == 0)); then
  cat <<"EOM"
    Rename file to created date, or custom provided date.
    To provide custom date, use CUSTOM_DATE="YYYY-MM-DD".
    Files on same date will be appended with a 2-digit counter.
    Usage: 
      ./script.sh file1.jpg
      ./script.sh file1.jpg file2.jpg ...
      ./script.sh *.jpg
EOM
  exit 1
fi

#CUSTOM_DATE="YYYY-MM-DD"
COUNT=1
COUNT_DISPLAY="0$COUNT"
LAST_CREATED=
IFS=$'\n' read -d '' -r -a SORTED < <(printf '%s\n' "${FILES[@]}" | sort)

for FILE in "${SORTED[@]}"; do
  EXTENSION="${FILE##*.}"

  if [[ -z "$CUSTOM_DATE" ]]; then
    CREATED=$(stat -f '%SB' -t '%F' "$FILE")
  else
    CREATED="$CUSTOM_DATE"
  fi

  if [ "$CREATED" = "$LAST_CREATED" ]; then
    COUNT=$((COUNT + 1))
    if [ "$COUNT" -lt "10" ]; then
      COUNT_DISPLAY="0$COUNT"
    else
      COUNT_DISPLAY="$COUNT"
    fi
  else
    COUNT=1
    COUNT_DISPLAY="0$COUNT"
  fi

  mv "$FILE" "$CREATED--$COUNT_DISPLAY.$EXTENSION"

  LAST_CREATED=$CREATED
done
