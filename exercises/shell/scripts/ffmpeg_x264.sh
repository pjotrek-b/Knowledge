#!/bin/bash


# Declaring variables (=settings, parameters):

FFMPEG="ffmpeg"

INPUT="$1"      # Script argument 1
OUTPUT="$2"     # Script argument 2

CRF=18  # See: https://trac.ffmpeg.org/wiki/Encode/H.264#crf
PIXFMT="yuv420p"


# Perform some sanity checks on the user-provided arguments:
if [ -z "$INPUT" ]; then
    echo "ERROR: No input file given".
    exit 1
fi

if [ -s "$INPUT" ]; then
    echo "ERROR: Invalid input source (0 bytes)?"
    exit 2
fi


# Add status/progress output:

echo "Converting '$INPUT' to h.264, using CRF=$CRF and $PIXFMT."
echo "Output file is: '$OUTPUT'"
echo "Using ffmpeg binary: '$FFMPEG'"

# Wait for user to confirm:
read -p "Press RETURN to continue..."


# Assemble the ffmpeg command used for conversion:

CMD="$FFMPEG -i $INPUT -c:v libx264 -preset veryslow 
-crf $CRF -pix_fmt $PIXFMT -c:a copy $OUTPUT"

echo "$CMD"     # print/show the command before running it.
#eval "$CMD"    # execute the "string".


RESULT=$?
if [ $RESULT -ne 0 ]; then
    echo "ERROR: Something went wrong. Please check ffmpeg's output for details."
    exit 3
fi

echo "Hooray! It worked."
exit 0  # This is optional, as the script ends and returns "0" by default anyways.
