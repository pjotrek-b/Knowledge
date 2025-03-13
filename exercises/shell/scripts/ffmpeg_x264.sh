#!/bin/bash
# @author: Peter Bubestinger-Steindl
# @date: 2025-03
# @description:
#   This little script uses FFmpeg to convert any video source to a popular
#   h264/aac mpeg-4 file.
#   It takes 2 arguments:
#     1) Input video filename
#     2) Output filename


# Declaring variables (=settings, parameters):

FFMPEG="ffmpeg"     # Useful to easily use specific FFmpeg versions

INPUT="$1"          # Script argument 1
OUTPUT="$2"         # Script argument 2

CRF=18              # Constant Rate Factor. See: https://trac.ffmpeg.org/wiki/Encode/H.264#crf
PIXFMT="yuv420p"    # Pixel format: YUV colorspace, 4:2:0 subsampling, 8 bits-per-component


# Perform some sanity checks on the user-provided arguments:

# Is the filename empty?
if [ -z "$INPUT" ]; then
    echo "ERROR: No input file given".
    exit 1
fi

# Is the source file larger than "0 bytes"?
if [ ! -s "$INPUT" ]; then
    echo "ERROR: Invalid input source (0 bytes)?"
    exit 2
fi


# Print status/progress output:

echo ""
echo "Converting video to h.264, using CRF=$CRF and $PIXFMT."
echo "Using ffmpeg binary: '$FFMPEG'"
echo "Input file is:  '$INPUT'"
echo "Output file is: '$OUTPUT'"
echo ""

# Wait for user to confirm:
read -p "Press RETURN to continue..."


# Assemble the ffmpeg command used for conversion:

CMD="$FFMPEG -i '$INPUT' -t 5 -c:v libx264 -preset veryslow \
    -crf $CRF -pix_fmt $PIXFMT -c:a aac -b:a 192k '$OUTPUT'"

echo "$CMD"         # print/show the command before running it.
eval "$CMD"         # execute the "command string".


RESULT=$?                       # Fetch the return-value (aka "exitcode") of the previously run command.
if [ $RESULT -ne 0 ]; then      # non-zero return values mean "error"
    echo "ERROR: Something went wrong."
    echo "Please check ffmpeg's output for details."
    exit 3
fi

echo ""
echo "Hooray! It worked."
echo ""
exit 0  # This is optional, as the script ends and returns "0" by default anyways.
