#!/bin/bash

DIR_IN="$1"
DIR_OUT="$2"


#DEBUG="-t 15"

if [ ! -d "$DIR_IN" ]; then
    echo "ERROR: Expecting a folder as source ($DIR_IN)"
    exit 1
fi

if [ ! -d "$DIR_OUT" ]; then
    echo "ERROR: Output folder doesn't exist ($DIR_OUT)"
    exit 1
fi

for VIDEO_IN in $DIR_IN/*.*; do
    echo "File: $VIDEO_IN"

    BASE=$(basename "$VIDEO_IN")        # get rid of any path part
    NAME=${BASE%.*}                     # get rid of the file ending
    OUTPUT="$DIR_OUT/$NAME-audio.mp3"         # add output folder and target ending

    CMD="ffmpeg $DEBUG -i '$VIDEO_IN' -vn -c:a libmp3lame -b:a 320k '$OUTPUT'"
    echo "$CMD"
    eval "$CMD"
done
