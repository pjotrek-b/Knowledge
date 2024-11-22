#!/bin/bash

LIST="$1"

while read LINE; do
    URL=$(echo "$LINE" | cut -d ' ' -f 1)
    CMD="yt-dlp $URL"
    echo "command: $CMD"
done < "$LIST"

