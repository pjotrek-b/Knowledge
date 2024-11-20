---
title: A/V Data Compression - Basics
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue
date: November 2023

transition: fade
;showNotes: "separate-page"
---



# Compressed? Uncompressed?

<aside class="notes">
What does that mean?
What is "uncompressed"?
What is "data compression"?

It's not only technical, but highly political...
Including [Fear, Uncertainty and Doubt (FUD)](http://www.av-rd.com/knowhow/video/comparison_video_codecs_containers.html#lossy_vs_lossless).
</aside>


# Current default = Lossy compression

![Zlad! Elektronik Supersonik](../../../images/tech-video/lossy/elektronik_supersonik.png){ width=720px }

<aside class="notes">
Of course this image is exaggerated, but it shows pretty well what lossy
compression is and what artefacts a typical MPEG-like compression algorithm
produces.

btw: This is a snapshot image of the highest-quality version of the video on
the original website (around 2009).
</aside>


# Generation Loss

![](../../../images/tech-video/lossy/noa/FFv1_GenerationLoss_FFv1vsLossy.png){ width=90% }

<aside class="notes">
Here's an example where one can see the difference between each encoded version
in popular broadcast codecs.
</aside>


# Uncompressed

  * No generation loss
  * Dead simple (=preserves well)
  * The largest possible version
    <small>(ca. 1.3 GB/minute PAL SD)</small>
  * There's [*more* than just 1 "uncompressed"](http://www.av-rd.com/knowhow/video/comparison_video_codecs_containers.html#codec_uncompressed)


# Calculating filesize: IMAGE

  * Width(px) x Height(px)
  * x Bits-Per-Pixel(bpp)
  * x FPS
  * / 8 = **1 second (in Byte)**


# Calculating filesize: AUDIO

  * Samplerate x bit-depth
  * x channels <small>(even if silence!)</small>
  * / 8 = **1 second (in Byte)**

<aside class="notes">
So how large is an 8bpc SD PAL minute - with 4 channels audio at SDI standard (48kHz/16bit)?  
Or a 2k 16bpc(!) scan (including 6 channels audio at 48kHz/24bit)?  
Or 74min. of audio CD (red-book standard: 44.1kHz/16bit)?  
</aside>


# Lossless

> "It's like ZIP for film!"

  * No generation loss
  * Way larger than lossy
  * But: Smaller than uncompressed



# Behind the Scenes: Algorithms

<aside class="notes">
There are several different algorithms used for compression.
Each has its pros and cons.
And "story" why it's in this format/application and (not) in another.
</aside>


# Run Length Enoding (RLE)

  * Uncompressed: ```BBBBBBBBGGBBBBBRRRBBBB``` = 19 Bytes
  * Compressed: ```8B2G5B3R4B``` = 10 Byte

<aside class="notes">
This could be seen as "delta coding", since only *changes* between 2 characters
really require space.
</aside>


# Huffman

<small>

| Letter  | Freq  |
| ------- | ----- |
| E       | 120   |
| D       | 42    |
| L       | 42    |
| U       | 37    |
| C       | 32    |
| M       | 24    |
| K       | 7     |
| Z       | 2     |


Source: [Indiana University](http://homes.sice.indiana.edu/yye/lab/teaching/spring2014-C343/huffman.php)
</small>


# Huffman Tree

![](../../../images/data/compression/huffman_tree1.png){ width=80% }


# Huffman Code

<small>

| Letter  | Freq  | Code   | Bits  |
| ------- | ----- | ------ | ----- |
| E       | 120   | 0      | 1     |
| D       | 42    | 101    | 3     |
| L       | 42    | 110    | 3     |
| U       | 37    | 100    | 3     |
| C       | 32    | 1110   | 4     |
| M       | 24    | 11111  | 5     |
| K       | 7     | 111101 | 6     |
| Z       | 2     | 111100 | 6     |

</small>

<aside class="notes">
Interesting: For very infrequent characters, the Huffman coding might even take
more bits than an uncompressed representation.

This is especially problematic for noise signals, because:
noise = chaos = no frequency pattern.
</aside>


<!-- Lossy compression -->

# Lossy

# JPEG

![Encoding Pipeline](../../../images/data/compression/jpeg_pipeline1.jpg){ width=70% }

<!--
```
quantTable = [
    16,  11,  10,  16,  24,  40,  51,  61,
    12,  12,  14,  19,  26,  58,  60,  55,
    14,  13,  16,  24,  40,  57,  69,  56,
    14,  17,  22,  29,  51,  87,  80,  62,
    18,  22,  37,  56,  68, 109, 103,  77,
    24,  35,  55,  64,  81, 104, 113,  92,
    49,  64,  78,  87, 103, 121, 120, 101,
    72,  92,  95,  98, 112, 100, 103,  99 ];
```
-->

# Terms used

  * lossy
  * lossless
  * uncompressed
  * data reduced format
  * compressed
  * near-lossless
  * visually lossless
  * mathematically lossless


# Format examples: VIDEO

| Lossy         | Lossless    | Uncompressed |
| ------------- | ----------  | ------------ |
| MPEG-1,2,4    | FFV1        | v210         |
| JPEG2000      | JPEG2000    | UYVY         |
| ProRes        | Dirac       | YUY2         |
| H.264         | H.264       | H.264        |
| H.265         | H.265       | RGBA         |
| ...           | ...         | ...          |



# Compression: Spatial and Temporal

A/V allows to apply compression in 2 ways:

  * **Spatial:**
    Inside an image
  * **Temporal:**
    Between images

<aside class="notes">
The 1st one doesn't differ much from "image only" compression algorithms (JPEG,
RLE, etc).

Temporal compression can be seen as "delta coding", similar to RLE:
You only write down what *changes* between 2 images/samples, as you would only
write down what changes between 2 characters in text compression.
</aside>


# Spatial compression: Examples

  * **Audio:**
    [Differential pulse-code modulation (DPCM)](https://en.wikipedia.org/wiki/Dpcm)
  * **Video:**
    [GOP](https://en.wikipedia.org/wiki/Group_of_pictures),
    [Motion estimation](https://en.wikipedia.org/wiki/Motion_estimation)


# Data rate / Bitrate

> "Data per time"  

  * Mbps / 8 = MB / second
  * MB/s * 60 = MB / minute
  * MB/min * 60 = MB / hour

<aside class="notes">
For lossy formats, this is a tuning parameter that can be used to adjust the
final filesize and quality.  For lossless or uncompressed formats, the actual
bitrate can be calculated but *not* adjusted.  Because the format cannot throw
anything away, so there's the bitrate is determined by content+algorithm and not
a parameter.

Bitrate means "data per time", so this means:

  * Higher bitrate = larger files, but higher quality
  * Lower bitrate = smaller files, but lower quality

The gain of newer encoding algorithms is always to produce smaller files with
higher quality.
</aside>


# Data rate / Bitrate

  * **Higher bitrate** =  
    larger files, higher quality
  * **Lower bitrate** =   
    smaller files, lower quality

  * **"Better" format** =  
    Same size, better quality - OR:  
    Smaller size, same quality.



# Links

  * [Huffman coding <small>(Indiana.edu)</small>](http://homes.sice.indiana.edu/yye/lab/teaching/spring2014-C343/huffman.php)
  * EETimes: Data compression tutorial:
    * [Part 1](https://www.eetimes.com/document.asp?doc_id=1275417),
    * [Part 2 (LZW)](https://www.eetimes.com/document.asp?doc_id=1275419),
    * [Part 3 (JPEG + MPEG)](https://www.eetimes.com/document.asp?doc_id=1275420)
  * [Introduction to Data Compression <small>(blellochcs.cmu.edu, 2013)</small>](https://www.cs.cmu.edu/~guyb/realworld/compression.pdf)


# Comments?
## Questions?
