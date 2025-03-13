#!/bin/bash

FILES="$@"

for INPUT in $FILES; do
    echo "Input video: $INPUT"

    FILENAME=${INPUT%.*}        # Remove file ending
    OUTPUT="$FILENAME.mkv"      # Create new output filename

    ./ffmpeg_x264.sh "$INPUT" "$OUTPUT"
done
