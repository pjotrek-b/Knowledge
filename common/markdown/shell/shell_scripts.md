---
title: Commandline Shell Scripting
author: |
        | Peter Bubestinger-Steindl
        | `( email (at) ArkThis com )`
date: 2024-11-dd

geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

; If both values are specified, totalTime wins and defaultTiming is ignored:
;defaultTiming: 6
;totalTime: 30
;transition: none
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page | false

slideNumber: true
---


<!--
Stück für Stück ein Script mit FFmpeg im Core ausbauen.
- Von video format A zu B
- Von "film" (images + wav) zu video
-->

# The "#!" (shebang)

  * Any code script is "just a textfile".
  * Computer needs to know what to "run" that text with.

```{.bash}
#!/bin/bash

echo "Hello World! 🌈️"
```

<small>See: [https://en.wikipedia.org/wiki/Shebang_Unix](https://en.wikipedia.org/wiki/Shebang_%28Unix%29)</small>


# Let's build a video-converter!

  * From any source format
  * To specific output format/properties


# The core: FFmpeg

```{.bash}
ffmpeg                     \    $FFMPEG
-i input_file              \    -i $INPUT
-c:v libx264               \    -c:v libx264
-preset preset_value       \    -preset veryslow
-crf constant_rate_factor  \    -crf $CRF
-pix_fmt yuv420p           \    -pix_fmt $PIXFMT
-c:a copy                  \    -c:a copy
output_file                \    $OUTPUT
```

# The core command

```{.bash}
CMD="$FFMPEG -i $INPUT -c:v libx264 -preset veryslow 
-crf $CRF -pix_fmt $PIXFMT -c:a copy $OUTPUT"

echo "$CMD"     # print/show the command before running it.
#eval "$CMD"    # execute the "string".
```


# Adding variables

```{.bash}
FFMPEG="ffmpeg"

INPUT="$1"      # Script argument 1
OUTPUT="$2"     # Script argument 2

CRF=18  # See: https://trac.ffmpeg.org/wiki/Encode/H.264#crf
PIXFMT="yuv420p"    # YUV, 4:2:0, 8 bits-per-component
```


# Adding sanity checks

```{.bash}
if [ -z "$INPUT" ]; then
    echo "ERROR: No input file given."
    exit 1
fi

if [ -s "$INPUT" ]; then
    echo "ERROR: Invalid input source (0 bytes)?"
    exit 2
fi
```


# Add Status/Progress Output

```{.bash}
echo "Converting '$INPUT' to h.264, using CRF=$CRF and $PIXFMT."
echo "Output file is: '$OUTPUT'"
echo "Using ffmpeg binary: '$FFMPEG'" 

# Wait for user to confirm:
read -p "Press RETURN to continue..."
```

# Putting it all together...

See: [exercises/shell/ffmpeg_x264.sh](../../../exercises/shell/scripts/ffmpeg_x264.sh)

