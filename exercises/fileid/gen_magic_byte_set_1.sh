#!/bin/bash
# @author: Peter B. (peter @ ArkThis.com)
# @date: 2024-11-13 (Started: 2019-11-19)

# @description:
#   Generates a few files in different formats, then removes their
#   file-endings (suffix). This set can then be used in exercises to identify
#   the file formats.

# Example exercises:
#   - Use [Wikipedia: List of file signatures](https://en.wikipedia.org/wiki/List_of_file_signatures) and a hex editor (manual identification)
#   - Use unix command "file" (tool-based identification)



DIR_OUT="${1:-.}"               # Where to put the generated files. Default is current folder (".")

IM="convert rose:"
FFMPEG="ffmpeg"
ZIP="zip"
BZ2="bzip2"
MEDIAINFO="mediainfo"

# Clear leftovers from previous runs:
mkdir "$DIR_OUT"
rm -v $DIR_OUT/[1-9]*.*

# Generate images:
$IM $DIR_OUT/01.bmp
$IM $DIR_OUT/02.jpg
$IM $DIR_OUT/03.gif
$IM $DIR_OUT/04.png
$IM $DIR_OUT/05.tiff
$IM $DIR_OUT/06.psd

# Generate data archives:
$ZIP $DIR_OUT/07.zip $DIR_OUT/01.bmp
$BZ2 -k9 $DIR_OUT/01.bmp
mv $DIR_OUT/01.bmp.bz2 $DIR_OUT/08.bz2

# Generate videos:
$FFMPEG -f lavfi -i testsrc -t 0.5 -c:v libx264 -b:v 85k $DIR_OUT/09.avi
$FFMPEG -f lavfi -i testsrc -t 0.5 -r 24 -c:v libx264 -b:v 85k $DIR_OUT/10.mkv

# There are currently no "magic bytes" currently not listed on Wikipedia for MP4/MOV.
# But they still contain "hints" in their header that point into the right direction:
$FFMPEG -f lavfi -i testsrc -t 0.5 -r 24 -c:v libx264 -b:v 85k $DIR_OUT/11.mp4
$FFMPEG -f lavfi -i testsrc -t 0.5 -r 24 -c:v libx264 -b:v 85k $DIR_OUT/12.mov

# Generate text:
$MEDIAINFO $DIR_OUT/11.mp4 > $DIR_OUT/13.mediainfo


# Remove file suffix:
for FILE in $DIR_OUT/*.*; do
    NAME="${FILE%.*}"
    echo $NAME
    mv "$FILE" "$NAME"
done
