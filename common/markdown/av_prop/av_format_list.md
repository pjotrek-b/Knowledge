---
title: Some Digital A/V Formats
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue

transition: fade
date: April 2022
;showNotes: "separate-page"
---


# Which digital AV formats...

  * do you know?
  * do you use?
  * would you like to know more about?

<aside class="notes">
Let's take a look at pros/cons of some popular (=significantly present in the
wild).
</aside>



# Digital Video Trinity

![](../../../images/tech-video/trinity/video_trinity2.png){ class="plain" }

<aside class="notes">
A/V media files: "The" format of video files usually consists of 3 different formats:

  * Container
  * Video
  * Audio (Except with silent movies ;P)

...and there may also be additional data/tracks (metadata, etc)
eg: Subtitle track in its own format.
</aside>



# A Quick Peek

![MediaInfo's "Easy" view](../../../images/tools/mediainfo/mediainfo-techmd_overview.png)

<aside class="notes">
You need a tool to look inside A/V files properly.
One of the best (and most widely used) tools for the job is "MediaInfo"
</aside>



# Containers

  * AVI: Audio Video Interleave
  * MOV: Quicktime
  * MKV: Matroska Video
  * MXF: Material eXchange Format
  * MPG, MTS: MPEG Transport Stream
  * WAV / RIFF <small>(audio)</small>
  * ...



# Video Codecs

  * H.264 <small>(lossy, lossless, uncompressed)</small>
  * H.265 <small>(lossy, lossless)</small>
  * MPEG-2 <small>lossy (aka:
   [IMX](https://en.wikipedia.org/wiki/Betacam#MPEG_IMX),
   [XDCAM](https://en.wikipedia.org/wiki/XDCAM),
    DVD, HDV
    )</small>
  * [ProRes](https://en.wikipedia.org/wiki/Apple_ProRes) <small>(lossy)</small>
  * [FFV1](https://en.wikipedia.org/wiki/FFV1) <small>(lossless)</small>
  * [Motion JPEG2000 (J2K)](https://en.wikipedia.org/wiki/Motion_JPEG_2000) <small>(lossy, lossless)</small>
  * Uncompressed <small>(v210, RGB, DPX, ...)</small>
  * [WMV](https://en.wikipedia.org/wiki/Windows_Media_Video) <small>(Windows Media Video)</small>
  * ...



# Audio Codecs

  * [AAC](https://en.wikipedia.org/wiki/Advanced_Audio_Coding) <small>Advanced Audio Coding</small>
  * [MP3](https://en.wikipedia.org/wiki/MP3) <small>MPEG-1/2 Audio Layer III</small>
  * [Opus](https://en.wikipedia.org/wiki/Opus_(audio_format))
  * [PCM](https://en.wikipedia.org/wiki/Pulse-code_modulation) <small>Pulse Code Modulation</small>
  * [FLAC](https://en.wikipedia.org/wiki/FLAC) <small>Free Lossless Audio Codec</small>
  * [WMA](https://en.wikipedia.org/wiki/Windows_Media_Audio) <small>(Windows Media Audio)</small>
  * ...



# Default Formats: Video

  * **Image:** Default = lossy encoding
  * **Audio:** production = PCM, consumer = AAC
  * **Metadata:** Often embedded. Sometimes sidecar.
  * **Container:** A video container file format.

<aside class="notes">
As you can see, I didn't mention which image codec for video, because there is
currently still no format option that satisfies the needs of different
communities like: archive vs consumer vs production vs broadcast vs cinema.
</aside>



# Default Formats: Film

  * **Image:** DPX / TIFF files
  * **Audio:** PCM in WAV
  * **Metadata:** Mostly sidecar, some MD in image files.
  * **Container:** Filesystem folder structure.

<aside class="notes">
Film is currently stored as still image sequence (1 frame = 1 file) in a folder,
along with the audio as one ore more WAV (PCM) files and optionally metadata
sidecar files (XML, etc).

Reels are stored in individual subfolders.
</aside>



# A/V Formats: Good practices for DLTP

<small>

  * Capture digital tape in its native format without generation loss
    (MiniDV, DAT, etc.)

  * Store born-digital files "as original" as possible.

  * Audio preservation format: uncompressed WAV (PCM) for analog originals.
  
  * For video container formats, consider using MKV or MOV.
    MXF *only* if necessary (e.g. broadcast)

  * Capture analog video uncompressed (v210) or lossless (FFV1, J2K).

  * Or: At the highest quality (data rate) you can store and manage well over
    time.

</small>



# Comments?
## Questions?


# Links

  * [Primer on Codecs for Moving Image and Sound Archives](https://www.avpreserve.com/wp-content/uploads/2010/04/AVPS_Codec_Primer.pdf)
  * [Comparing Video Codecs and Containers for Archives](http://www.av-rd.com/knowhow/video/comparison_video_codecs_containers.html)
