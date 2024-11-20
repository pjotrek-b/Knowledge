---
title: |-
       Digital Audiovisual Formats - \
       Naming
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue
date: November 2023

transition: none
defaultTiming: 6
slideNumber: true
;fragments: false
---



# Digital Video Trinity

![](../../../images/tech-video/trinity/video_trinity2.png){ width=500px; class="plain" }

<aside class="notes">
A/V media files: "The" format of video files usually consists of 3 different formats:

  * Container
  * Video
  * Audio (\*)

(\*) Except silent movies ;P
</aside>



# Format Naming

Clearer would be to declare a triplet:  

  * **H.264** / **AAC** in **MP4**
  * **FFV1** / **PCM** in **Matroska** (MKV)
  * **ProRes** / **PCM** in **MOV**
  * **DPX** / **WAV**(PCM) in **a folder**

(= Video/Audio format in Container)

<aside class="notes">
It is unfortunately most common to simply quote the file suffix as "the format":
avi, mov, mxf, mp4 - etc.
</aside>



# Format Naming
## Real-life Status Quo


# It's "MPEG-4": All clear?

<small>
See: [The MPEG-4 Confusion](http://www.av-rd.com/knowhow/video/simplicity-mpeg4.html)

  * MPEG-4 video
  * MPEG-4 audio
  * MPEG-4 Flash video
  * MPEG-4 (AVI)
  * .mp4 .m4v .m4a .m4p .aac
  * AAC
  * H.264
  * XviD &amp; DivX
  * QuickTime
  * BluRay
  * Apple Lossless (ALAC/ALE)
  * MPEG-4 SP (Simple Profile)
  * MPEG-4 ASP (Advanced Simple Profile)
  * MPEG-4 SStP (Simple Studio Profile)
  * MPEG-4 AVC (Advanced Video Coding)
  * H.263
  * ...

</small>



# It's already a mess...

![](../../../images/tools/magix/VHS_rescue/magix-file_formats-20150208-cut_av.png){width=40%}

<cite>
Source: [MAGIX product website (Feb.2015)](http://www.magix.com/at/retten-sie-ihre-videokassetten/detail/)
</cite>


# But getting better:

![](../../../images/tools/magix/VHS_rescue/magix-file_formats-20161025-cut_av.png)

<cite>
Source: [MAGIX Produkt-Website (Okt.2016)](http://www.magix.com/at/retten-sie-ihre-videokassetten/detail/)
</cite>



# FourCC

# FourCC

> Is short for '**Four Character Code**' -  
> an identifier for a video codec, compression format,
> color or pixel format used in media files.

<small>
(FourCC is the legacy format identifier in AVI &amp; Quicktime)
</small>

<aside class="notes">
Originating from AVI/MOV, and somewhat still in use today, not all container
formats use the FourCC codes to identify stream encodings. Some keep FourCC
alongside other, container-specific, identifiers.

FourCCs are still practical handles/names to refer to a specific coding format.
You may therefore see FourCC identifiers being used as the go-to-term to
indicate certain pixel/color layouts.

For example, when configuring an analog-digital video capture source, you may see terms like:

  * UYVY
  * VYUY
  * YUY2

These are the FourCC names 

</aside>



# FourCC Examples

  * **FFV1** = FFV1
  * **v210** = v210
  * **X264** = H.264
  * **XviD** = XviD
  * **DV25** = DVCPro
  * **DV50** = DVCPro 50
  * **MJ2C, LCW2, LJ2K** = MJPEG 2000
  * ...



# Links:

  * [FourCC.org](https://fourcc.org/)
  * [List of FourCCs (abcAVI Tag Editor documentation)](http://abcavi.kibi.ru/fourcc.php)
  * [Video Codecs by FourCC (MovieCodec.com)](https://www.moviecodec.com/fcc/)
  * [Microsoft: DirectShow FourCC Codes](https://learn.microsoft.com/en-us/windows/win32/directshow/fourcc-codes)
  * [Microsoft: YUV Video Subtypes](https://learn.microsoft.com/en-us/windows/win32/directshow/yuv-video-subtypes)
  * [RGB pixel formats](https://web.archive.org/web/20211204012739/https://www.fourcc.org/rgb.php)
  * [YUV pixel formats](https://web.archive.org/web/20211015201859/https://www.fourcc.org/yuv.php)

<!-- Outdated links:
  * [List of codecs](https://fourcc.org/codecs.php)
  * [Uncompressed YUV](https://fourcc.org/yuv.php)
  * [Uncompressed RGB](https://fourcc.org/rgb.php)
-->



# Comments?
## Questions?



# More to know about digital AV:

  * [AV Format Intro](av_format_intro.html)
  * [Format Naming](av_prop_naming.html)
  * [Basic](av_prop_basics.html)
  * [Advanced](av_prop_advanced.html)
  * [Extra](av_prop_extra.html)


