---
title: FFmpeg - Swiss army knife for AV cross conversion
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
institute: ArkThis AV-RD
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

transition: none
slideNumber: true
defaultTiming: 6

;print-pdf: ?print-pdf&showNotes=separate-page

;title-slide-attributes:
;  data-background-image: "../../../images/_themes/ina/2022_frame/intro.png"
;  data-background-size: cover
;data-background-position: 4% 90%

;background-image: "../../../images/_themes/ina/2022_frame/page.png"
;background-image-size: cover
---
# FFmpeg? Whatisthat?

> FFmpeg is a free and open-source software project consisting of a suite of
> libraries and programs for handling video, audio, and other multimedia
> files and streams.

> At its core is the command-line ffmpeg tool itself, designed for processing
> of video and audio files.

<cite>
Source: [Wikipedia: FFmpeg](https://en.wikipedia.org/wiki/FFmpeg)
</cite>

# 

![](../../../images/icons-logos/programs/ffmpeg_logo.svg){.r-stretch}

Some Basics...




# Where to get it from?

> ...from an [Organic Farmer's Market](https://ffmpeg.org/download.html)?

![](../../../images/open_source/farming/homestead.jpg){.r-stretch}


<aside class="notes">
OpenSource ist wie Waren vom Bio-Bauernmarkt:

Es ist nicht unbedingt einheitlich, nicht unbedingt gewohnt/schön verpackt,
evtl. muss man handeln - und ab und zu kriegt man sogar was geschenkt.
Außerdem stehen oft direkt die die die Waren gemacht haben am Stand: Die können
einem oft Fragen sogar bis in's kleinste Detail beantworten - und erklären
wie's gemacht wurde.

Wenn man sein Geld dann aber doch nur im Supermarkt lässt, wird's den
Bauernmarkt dann leider bald nicht mehr geben :(
</aside>



# Kind of. But rather...

  * Pre-compiled binaries for different OSs
  * Source code



#  Digital Video Trinity 

![](../../../images/tech-video/trinity/video_trinity2.png)


# Basic Syntax

```{.bash}
ffmpeg -i INPUT_FILE \
-c:v ... -b:v ... [VIDEO PARAMS] \
-c:a ... -b:a ... [AUDIO PARAMS] \
[MORE PARAMETERS] \
[-f FORMAT] OUTPUT_FILE
```


# FFmpeg, what can you do?

  * List Containers: `-formats`  

    ```{.smaller}
    D. = Demuxing supported
    .E = Muxing supported
    ```

  * List Codecs:
	* `-codecs`
	* `-encoder`
	* `-decoder`

    ```{.smaller}
    Codecs:
      D..... = Decoding supported
      .E.... = Encoding supported
      ..V... = Video codec
      ..A... = Audio codec
      ..S... = Subtitle codec
      ...I.. = Intra frame-only codec
      ....L. = Lossy compression
      .....S = Lossless compression
    ```


# Rewrap

`ffmpeg -i INPUT_FILE -c copy -map 0 OUTPUT_FILE`



# Example output

![](../../../images/tools/ffmpeg/ffmpeg-ffv1_to_dvd.png){.r-stretch}

<aside class="notes">
    Explain default/common FFmpeg output.
</aside>



<!--

# Check Result

<p class="fragment" data-fragment-index="1">
    <span class="fragment fade-out" data-fragment-index="2">
    ` ffprobe -i INPUT_FILE `
    </span>
</p>

<span class="fragment fade-in" data-fragment-index="2">
<p>
` ffprobe -i INPUT_FILE [-show_format] [-show_streams] [-of ...] [-pretty] `
</p>


<p>&nbsp;</p>
<small>
[FFprobe Dokumentation](https://ffmpeg.org/ffprobe.html)
</small>
</span>

<aside class="notes">
    Available output formats ("writers"):
    compact,csv,flat,ini,json,xml
</aside>

-->


# A/V separately

  *  Video 'None': `-vn` 
  *  Audio 'None': `-an` 



# Set Encoding Codec

  *  Video codec: `-c:v CODEC` 
  *  Audio codec: `-c:a CODEC` 
  *  Copy A&nbsp;+&nbsp;V as-is: `-c copy`  
     (no transcoding at all! superfast.)



# Transcode

FFV1, PCM 24 bits:
```{.bash}
ffmpeg -i INPUT_FILE \
-c:v ffv1 \
-c:a pcm_s24le \
OUTPUT_FILE
```

FFV1, PCM 16 bits:
```{.bash .fragment}
ffmpeg -i INPUT_FILE \
-c:v ffv1 \
-c:a pcm_s16le \
OUTPUT_FILE
```

<aside class="notes">
CODEC enthält bei zB uncompressed PCM auch die Bittiefe/Endianess/Signed.
Fragen wer weiß was "pcm_s16le" heißt.

Hier Endianess und "Signed/Unsigned" erklären (WAV 4GB anyone? ;))
</aside>



# Video 1

  *  Resolution: `-s WIDTHxHEIGHT`  <small>(eg: 720x576)</small>
  *  Aspect Ratio (DAR): `-aspect X:Y` 
  *  Framerate: `-r FPS` 

<aside class="notes">
FPS: Can also be a fraction.

NTSC anyone?
e.g: 30000 / 1001
</aside>



# Change the "image"

  * Resize:  
    `ffmpeg -i INPUT_FILE -an -c:v ffv1 -vf scale=720:-1 OUTPUT_FILE`{.small .fragment}

  * Display Aspect Ratio:  
    `ffmpeg -i INPUT_FILE -an -c:v ffv1 -aspect 4:3 OUTPUT_FILE`{.small .fragment}

  * Framerate:  
    `ffmpeg -i INPUT_FILE -an -c:v ffv1 -r 30000/1001 OUTPUT_FILE`{.small .fragment}



# Video 2

> Pixel color model / bit-depth:  
> `-pix_fmt FORMAT` 

<aside class="notes">
pix_fmt: Enthält Farbmodell, Subsampling, Farbtiefe
Siehe nächste Folie.
</aside>


# pix_fmt? = "pixel format"

  * yuv422p = **YUV 4:2:2 planar**
  * yuv420p
  * --
  * yuv422p**10**le (10bpc)
  * yuv420p**10**le
  * --
  * yuv**a**422p (+alpha channel)
  * <span class="fragment">Keep-or-die: `-pix_fmt +`</span>

<p class="fragment">
    List: `-pix_fmts`
</p>
<aside class="notes">
    Hier Endianess erklären!

    btw: "+" wurde auf meine Anfrage hin eingeführt (25.Apr.2012):
    http://www.ffmpeg-archive.org/Preserve-pix-fmt-regardless-of-codec-td4586546.html
</aside>


# Change Subsampling

`ffmpeg -i INPUT_FILE -c:v ffv1 -pix_fmt yuv422p OUTPUT_FILE`

<small> (Watch out: changing sub-sampling **requires re-encoding**!) </small>


# Audio

  *  Audiocodec: `-c:a CODEC` 
  *  Samplerate: `-ar SAMPLERATE` 
  *  Channels: `-ac CHANNELS` 
  *  Bitrate: `-b:a BITRATE{k,M}` 

<aside class="notes">
More on audio channel manipulation:
https://trac.ffmpeg.org/wiki/AudioChannelManipulation
</aside>


# A/V separately

  * Only Image (keep encoding):  
    `ffmpeg -i INPUT_FILE -an -c:v copy OUTPUT_FILE`{.small .fragment}

  * Only Audio (keep encoding):  
    `ffmpeg -i INPUT_FILE -vn -c:v copy OUTPUT_FILE`{.small .fragment}

  * Only Audio (to **MP3**):  
    `ffmpeg -i INPUT_FILE -vn -c:a libmp3lame -b:a 128k out.mp3`{.small .fragment}

  * Only Audio (to **FLAC**):  
    `ffmpeg -i INPUT_FILE -vn -c:a flac out.flac`{.small .fragment}



# Video 3

  *  Bitrate: `-b:v BITRATE{k,M}` 
  *  Bitrate (min): `-minrate BITRATE` 
  *  Bitrate (max): `-maxrate BITRATE` 
  *  [GOP](av_properties.html#gop) size: `-g FRAMES` 



# Video Excerpts

  * [Start position](https://trac.ffmpeg.org/wiki/Seeking): `-ss DURATION` 
  * Backwards: `-sseof DURATION` 
  * Length: `-t DURATION` 

**DURATION Syntax:**

  * Timecode: `[-][HH:]MM:SS[.m]`  
  * or Seconds: `[-]S[.m]`

<aside class="notes">
Time duration syntax:
See: http://ffmpeg.org/ffmpeg-utils.html#time-duration-syntax

3 seeking options (before FFmpeg v2.1):<br />

  * Input seeking: before "-i"
    Position parsed using keyframes. Fast but not 100% accurate (until v2.1)
  * Output seeking: after "-i"
    Very slowly. Later position = longer time to wait.
  * Combined seeking: before and after "-i"
    Probably obsolete: replaced by accurate "input seeking" since v2.1
</aside>



# Video Excerpts

  * Start Offset:  
    `ffmpeg -ss DURATION -i INPUT_FILE -c copy OUTPUT_FILE`{.small .fragment}

  * Only Beginning:  
    `ffmpeg -t DURATION -i INPUT_FILE -c copy OUTPUT_FILE`{.small .fragment}

  * Offset + Length:  
    `ffmpeg -ss DURATION -t DURATION -i INPUT_FILE -c copy OUTPUT_FILE`{.small .fragment}



<!--
# Video skalieren

  *  Resize: `-s WIDTHxHEIGHT` 
  *  Letterbox:<br/> `-filter:v "pad=iw:iw*3/4:(ow-iw)/2:(oh-ih)/2"` 
  *  Pillarbox (+resize):<br/> `-filter:v "colormatrix=bt601:bt709, scale=1440:1080:flags=lanczos, pad=1920:1080:240:0"` 


# Video beschneiden

  *  Crop: `-vf "crop=width:height"` 
  *  Crop (offset):<br /> `-vf "crop=width:height:x_position:y_position"` 



# Videos "zusammenkleben"

`-f concat -i list.txt -c copy`

<aside class="notes">
Syntax "list.txt":
<pre>
file './one.ext'
file './two.ext'
...
file './end.ext'
</pre>

Bash:
<pre>
-f concat -i &lt;(for f in ./*.avi; do echo "file '$PWD/$f'"; done)
</pre>
</aside>

-->


# Transcoding II


<!-- -->

# H.264

> "x264 H.264/MPEG-4 AVC encoder wrapper. [...]  
> libx264 supports an 
> [impressive number of features](https://ffmpeg.org/ffmpeg-all.html#libx264_002c-libx264rgb), [...]"
  


# H.264

<ul>
    <li> Codec: `-c:v libx264` </li>
    <li> Bitrate: `-b:v BITRATE{k,M}` </li>
    <li> CRF:
        `-crf {0..51}` <small>={lossless .. worst}</small>
    </li>
    <li> Presets:
        <small>`-preset:v {ultrafast,superfast,veryfast,faster,fast,medium(*),slow,slower,veryslow}`</small>
    </li>
    <li>
        Fine tuning:
        `-tune {film,animation,grain,...}`
    </li>
</ul>

<small>
    Sources/Links:
    [FFmpeg Wiki](https://trac.ffmpeg.org/wiki/Encode/H.264),
    [FFmpeg docs](https://ffmpeg.org/ffmpeg-all.html#libx264_002c-libx264rgb)
</small>

<aside class="notes">
    "subjectively sane range is 17-28"<br />
    Preset: "medium" is default
</aside>



# H.264

<code class="bash" data-noescape>
ffmpeg -i INPUT_FILE <span class="fragment">-c:v&nbsp;libx264</span> 
<span class="fragment">-preset:v&nbsp;superfast</span> 
<span class="fragment">-crf&nbsp;22</span>
<span class="fragment">-c:a&nbsp;aac -b:a&nbsp;192k</span> 
OUTPUT_FILE.mp4
</code>
<!-- -->

# ProRes

> "Apple ProRes is a lossy video compression format developed by Apple Inc. for
> use in post-production"

  *  Codec: `-c:v {prores,prores_aw,prores_ks}` 
  *  Profiles: `-profile:v {proxy,lt,standard,hq,4444,4444xq}` 


<small>
    Sources / Links:
    [Wikipedia: Apple ProRes](https://en.wikipedia.org/wiki/Apple_ProRes),
    [FFmpeg docs](https://ffmpeg.org/ffmpeg-all.html#ProRes),
    [Kieran Kunya's Blog](https://codecs.multimedia.cx/2012/03/a-few-words-about-my-prores-encoder/),
    [FinalCut docs](https://documentation.apple.com/en/finalcutpro/professionalformatsandworkflows/index.html#chapter=10&section=2&tasks=true)
</small>
    


# ProRes

```{.bash}
ffmpeg -i INPUT_FILE \
-an \
-c:v prores_ks \
-profile:v hq \
OUTPUT_FILE.mov
```

<aside class="notes">
Mal das ":v" bei "-profile" weglassen und schauen was passiert.
</aside>
<!-- -->

# FFV1

> FFV1 ("FF video codec 1") is a lossless-only video codec.

  *  Codec: `-c:v ffv1` 
  *  Version: `-level {1,3}` 
  *  Coder: `-coder {0=golomb,1=range}` 
  *  Context: `-context {0=small,1=large}` 
  *  Slices: `-slices {4,6,9,12,16,24,..}` 
  *  CRC: `-slicecrc {0,1}` 

<cite>
Sources: [ffv1.info](https://en.wikipedia.org/wiki/FFV1">Wikipedia: FFV1</a>, <a href="http://www.ffv1.info/)
</cite>



# FFV1

```{.bash}
ffmpeg -i INPUT_FILE -an -c:v ffv1 \
-level 3 \
-slices 24 \
-slicecrc 1 \
OUTPUT_FILE
```
<!-- -->

# From Video to Images + WAV

```{.bash}
ffmpeg -i input.mp4 \
-an out/FRAME_%04d.png \
-vn -c:a pcm_s16le out/AUDIO.wav 
```
<!-- -->

# From Images (+Audio) to Video

```{.bash}
ffmpeg -r $FPS -start_number $FRAMENO \
-i reel/FRAME_%04d.png -i reel/AUDIO.wav \
-c:v libx264 -crf 22 \
-c:a aac -b:a 128k \
OUTPUT.mkv
```

<!-- -->

# Links

  *  [ffmprovisr](https://amiaopensource.github.io/ffmprovisr/) 
  *  [FFmpeg Website](http://ffmpeg.org/) 
  *  [FFmpeg Dokumentation](http://ffmpeg.org/ffmpeg.html) 
  *  [FFmpeg Wiki](https://trac.ffmpeg.org/) 
<!-- END / CREDITS -->

# - Fin -



# Questions?
## Comments?

Peter Bubestinger-Steindl

`email (at) ArkThis com`
