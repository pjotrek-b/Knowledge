---
title: Writing a video format-converter shell-script
author: |
        | Peter Bubestinger-Steindl
        | `( email (at) ArkThis com )`

date: 2025-11

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

# Let's build a video-converter!

  * From any source format
  * To specific output format/properties
  * Using [FFmpeg](www.ffmpeg.org)


# The "#!" (shebang)

```{.bash}
#!/bin/bash

echo "Hello World! 🌈️"
```

  * Any programming-code script is "just a textfile".
  * Computer needs to know what to "run" that text with.
  * Start with a "magic" sequence: `#!`  
    (followed by path/name of shell-interpreter to run the code with)


<small>See: [https://en.wikipedia.org/wiki/Shebang_Unix](https://en.wikipedia.org/wiki/Shebang_%28Unix%29)</small>

<aside class="notes">
A very popular shebang is "#!/bin/bash", which calls the program 'bash' in the
path '/bin/' to run the code (=text) that is within the file.

It could also be any other interpreter, which is able to run the code.
Examples:

```
#!/bin/sh       A very basic shell.
#!/bin/zsh      zshell (another other shell variant)

#!/bin/python   Python Code
#!/bin/php      PHP Code
```
</aside>


# Prepare your script:

  1. Save your file as:  
     `to_mp4.sh`

  2. Set executable flag:  
     `chmod +x to_mp4.sh`

  3. See if it runs:  
     `./to_mp4.sh`


# If all went well...

You should see:

> Hello World! 🌈️

Now, we can put more interesting stuff inside.


# The Core Command

```{.bash}
ffmpeg -i 'input.mkv' -c:v libx264 -preset veryslow \
    -crf 18 -pix_fmt yuv420p -c:a aac -b:a 192k 'output.mp4'
```

So what does this mean/do?


# The Core: FFmpeg

```{.bash}
ffmpeg                         \    $FFMPEG
-i       input_file            \    -i $INPUT
-c:v     video_format          \    -c:v libx264
-preset  preset_value          \    -preset veryslow
-crf     constant_rate_factor  \    -crf $CRF
-pix_fmt pixel_format          \    -pix_fmt $PIXFMT
-c:a     audio_format          \    -c:a aac
-b:a     bitrate_value         \    -b:a 192k
output_file                    \    $OUTPUT
```


# The Core Command: "more flexible"

```{.bash}
CMD="$FFMPEG -i '$INPUT' -c:v libx264 -preset veryslow \
    -crf $CRF -pix_fmt $PIXFMT -c:a aac -b:a 192k '$OUTPUT'"

echo "$CMD"     # print (=show) the command before running it.
eval "$CMD"     # execute (=run) the "string".
```
<aside class="notes">
Wrapping the script in the variable "$CMD" allows us to show/print the actual command before calling it.
</aside>


# Adding variables

```{.bash}
FFMPEG="ffmpeg"     # Useful to easily use specific FFmpeg versions

INPUT="$1"          # Commandline argument 1
OUTPUT="$2"         # Commandline argument 2

CRF=18              # See: https://trac.ffmpeg.org/wiki/Encode/H.264#crf
PIXFMT="yuv420p"    # YUV, 4:2:0, 8 bits-per-component
```


# Print Status/Progress Output

```{.bash}
echo ""
echo "Converting video to h.264, using CRF=$CRF and $PIXFMT."
echo "Using ffmpeg binary: '$FFMPEG'"
echo "Input file is:  '$INPUT'"
echo "Output file is: '$OUTPUT'"
echo ""

# Wait for user to confirm:
read -p "Press RETURN to continue..."
```


# Checking if FFmpeg ran successfully

```{.bash}
eval "$CMD" # <- This runs the command.

# Fetch return-value of previous command:
RESULT=$?

# non-zero return values mean "error":
if [ $RESULT -ne 0 ]; then

    echo "ERROR: Something went wrong."
    echo "Please check ffmpeg's output for details."

    # Exit the script also with a non-zero value (=error):
    exit 3
fi
```


# Adding sanity checks

```{.bash}
# Is the filename empty?
if [ -z "$INPUT" ]; then
    echo "ERROR: No input file given."
    exit 1
fi

# Is the source file larger than "0 bytes"
if [ ! -s "$INPUT" ]; then
    echo "ERROR: Invalid input source (0 bytes)?"
    exit 2
fi
```



# Putting it all together...

See: [exercises/shell/ffmpeg_x264.sh](../../../exercises/shell/scripts/ffmpeg_x264.sh)



# Homework! 🎉️

  * Identify other encoding "parameters" that could be interesting to vary.
  * And replace them with BASH variables.
    (Their values declared at the top of the script)
  * Set the video-codec from a 3rd commandline argument.



<!-- --------------------------------- -->




# Comments?
## Questions?

# - The End -
