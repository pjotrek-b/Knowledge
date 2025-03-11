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

  * Any code script is "just a textfile"
  * Computer needs to know what to "run it with"

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
CMD="$FFMPEG -i $INPUT -c:v libx264 -preset veryslow -crf $CRF -pix_fmt $PIXFMT -c:a copy $OUTPUT"
```
