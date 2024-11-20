---
title: Understanding Digital AV File Formats
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: false
linkcolor: blue

;date: October 2022

transition: none
defaultTiming: 30
slideNumber: true
;showNotes: separate-page

;title-slide-attributes:
;  data-background-image: "../../../images/_themes/ina/2022_frame/intro.png"
;  data-background-size: cover
;data-background-position: 4% 90%

;background-image: "../../../images/_themes/ina/2022_frame/page.png"
;background-image-size: cover
---


<!--
# Which digital AV formats...

  * do you know?
  * do you use?
  * would you like to know more about?
-->



# Digital Video Trinity

![](../../../images/tech-video/trinity/video_trinity2.png){.plain}

<aside class="notes">
The uncomfortable truth. It's more than "1 format" to choose/consider for AV.

The container format is the one you see in the filename as suffix:
mov, mkv, mxf, avi, flv, 3gp, wav, etc.


A/V media files:
"The" format of video files usually consists of 3 different formats:

  * Container
  * Video coding
  * Audio coding

Optional:

Embedded metadata of all kinds:

  * Descriptive
  * Technical
  * non time-based / time-based

Additional data streams:
(usually "time-based")

  * subtitles
  * timecode
  * crazy special feature xy
  * etc, etc, etc...


</aside>



# Why "Trinity"?

> 1 video file &ge; 3 formats <small>(\*)</small>.  
> Better would be to name all 3 components.

<small>
(\*) ...except silent movies 😉️
</small>



# File Suffix = Container

> Statements like:  
> "**The videos are in MOV format.**"
> or:  
> "**The camera creates [MP4,MXF,AVI,MOV] files.**"  
> usually *only* say something about the container format.



# What's a Container?

> "A container format (informally, sometimes called a wrapper) [...] is a file
> format that allows multiple data streams to be embedded into a single file,
> usually along with metadata for identifying and further detailing those
> streams."

<small>
Source: [Wikipedia: Container format (computing)](https://en.wikipedia.org/wiki/Container_format_(computing))
</small>



# What's a Container Format?

<table>
<tr>
<td>
**Think of a regular paper folder...**

  * It's a wrapper around content.
  * Contains Metadata.
  * Structures the content streams.
</td>

<td>
![Videofile paper mockup](../../../images/tech-video/trinity/pb-video_container_mockup.jpg){width=500px}
</td>
</tr>
</table>

<aside class="notes">
Metadata:
  * Index (which streams are contained, etc)
  * Descriptive MD (title, language, etc)
  * as well as technical MD (fps, aspect ratio, color handling, etc)
  * NOTE: Some technical MD may be stored in the container *and* the coding/stream.
    This may be a blessing and a curse... Example: Aspect ratio or fps.
</aside>



# What's a Coding Format?

> "coding format (or sometimes [...] compression format) is a content representation format for storage or transmission of digital [...] content (such as in a data file or bitstream)."
<small> --- Source: [Wikipedia: Video Coding Format](https://en.wikipedia.org/wiki/Video_coding_format)</small>

<aside class="notes">
"Codec" vs "Coding Format"

Codec is the actual implementation encoding/decoding a coding format.

Examples: 
  * "h.264" is a video coding format, whereas "x264" would be a codec handling it.

In practice, the term "codec" is used more often, even when "coding format" is
meant.  I'll therefore stick to the term "codec" here, even if it's wrong - but
then it stays real-life compatible :P

Most important is to distinguish between the container-format and the "codecs"
required for handling audio/video inside an AV file.
</aside>



# What's a Codec?

> "codec is a device or computer program which encodes or decodes a data stream or signal."
<small> --- Source: [Wikipedia: Codec](https://en.wikipedia.org/wiki/Codec)</small>

**Example:**

  * Coding Format = [h.264 (MPEG-4 AVC)](https://en.wikipedia.org/wiki/Advanced_Video_Coding)
  * Codec = [x264](https://en.wikipedia.org/wiki/X264)



# What's a Codec?

**Think of a human language...**

  * It's coded information.
  * There may be dialects.
  * Different people may  
    "speak / understand" differently.



# Format Naming

Triplet notation greatly helps reducing confusion:

  * **H.264** / **AAC** in **MP4**
  * **FFV1** / **PCM** in **MKV** (Matroska)
  * **ProRes** / **PCM** in **MOV** (Quicktime)
  * **DPX** / **WAV** (PCM) in **a folder**
  * etc

<aside class="notes">
When communicating "which video format", please consider using a triplet-notation, like:
"video/audio in container".

It is unfortunately most common to simply quote the file suffix as "the format".
</aside>



<!-- ----------------------------- -->



# Let's look inside! :)


<!--
# Paper analogy

![](../../../images/tech-video/trinity/Container_Mockup_Contents.png){width=800px}
-->



# VLC / MediaInfo

<table>

<tr>
<td>
![](../../../images/tools/vlc/VLC-media_information-ffv1_1.png){.plain width=400px}
<small>
Website: [videolan.org/vlc](https://www.videolan.org/vlc/)
</small>
</td>

<td>
![Mediainfo's "Easy View"](../../../images/tools/mediainfo/mediainfo-techmd_overview.png){.plain width=500px}
<small>
Website: [mediaarea.net/MediaInfo](https://mediaarea.net/MediaInfo)
</small>
</td>

</tr>
</table>

<aside class="notes">
"MediaInfo is a convenient unified display of the most relevant technical and
tag data for video and audio files." 

btw: A VLC-related WARNING:
There's a major fraud out there: "www.vlc.de" - aka "VLC Plus Player".
It contains the original VLC, but with unknown - possibly malicious - additions/modifications.
Stay away from it.
</aside>



# Characteristics / Properties

|                   | File 1        | File 2        | File 3     |
| ----              | -----         | -----         | -----      |
| **Container**     | MOV           | MOV           | MOV        |
| **Video coding**  | UYVY          | H.264         | XviD       |
| **Resolution**    | 720 x 576px   | 1920 x 1080   | 640 x 480  | 
| **FPS**           | 25            | 24            | 30000/1001 |
| -        | | | |
| **Audio coding**  | PCM           | AAC           | MP3        |
| **Samplerate**    | 48 kHz        | 48 kHz        | 44.1 kHz   |
| **Channels**      | Stereo        | Surround 5.1  | Mono       |


<aside class="notes">
This is just a random example to show that from the "outside" (=file explorer) you would only see that all files are ".mov" - whereas their actual audio/video codings, as well as their technical properties are completely different. It therefore always makes sense to use proper tools to "look inside" (MediaInfo, etc).
</aside>



# Questions?
## Comments?


# More to know about digital AV:

  * [Format Naming](av_prop_naming.html)
  * [Basic](av_prop_basics.html)
  * [Advanced](av_prop_advanced.html)
  * [Extra](av_prop_extra.html)



<!--

# Data rate / Filesize

| Type          | Duration      | Bitrate   | Filesize      |
| -----         | -----         | -----     | -----         |
| Video         | 1 hour        | 210 Mb/s  | 92 GB         |
|               |               | 50 Mb/s   | 22 GB         |
|               |               | 25 Mb/s   | 11 GB         |
|               |               | 1,5 Mb/s  | 1 GB          |
|
| Audio         | 1 hour        | 4,6 Mb/s  | 2 GB          |
|               |               | 128 kb/s  | 56 MB         |

-->
