---
title: |-
       File formats: \
       Quality &amp; Size
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: false
linkcolor: blue
date: October 2022

transition: none
defaultTiming: 30
slideNumber: true
;showNotes: separate-page
---

<!-- ----------------------------- -->


# Filesize (still) matters

<small>

| Type          | Duration      | Bitrate   | Filesize      | Usage
| -----         | -----         | -----     | -----         | -----
| Video         | 1 hour        | 210 Mb/s  | 92 GB         | Preservation
|               |               | 50 Mb/s   | 22 GB         | Preservation
|               |               | 25 Mb/s   | 11 GB         | Preservation / Production
|               |               | 1,5 Mb/s  | 1 GB          | Access
|
| Audio         | 1 hour        | 4,6 Mb/s  | 2 GB          | Preservation
|               |               | 128 kb/s  | 56 MB         | Access

</small>



# Bitrate = Data per Time

> How many bytes may your encoder spend on the quality of the
material?

  * **Higher bitrate:**  
    Better quality / larger files
  * **Better codec:**  
    Better quality at same size


# Bitrate &amp; Quality

> "Your initial bitrate will inform the quality of all subsequent footage that
> comes from that video data. Aim for the highest practical bitrate."
> <small> --- Source: [Adobe.com](https://www.adobe.com/creativecloud/video/discover/bit-rate.html) </small>

<small>

| Format | Bitrate |
| ------ | ------- |
| DVCPro50 (SD) | 50 Mbps
| DVCPro HD | 100 Mbps |
| DVD (max) | 9.8 Mbps |
| | |
| 720p | 5 Mbps |
| 1080p | 8 Mbps |
| 4K | 35-45 Mbps |

</small>



# Bitrate = Data per Time

  * Mbps / 8 = MB / second
  * MB/s * 60 = MB / minute
  * MB/min * 60 = MB / hour
  * MB / 1024 = GB / 1024 = TB

<aside class="notes">
If you know the bitrate, you can calculate the size of your files, by
multiplying the bitrate by the runtime duration (time).

A fixed bitrate however is only available for:

  * constant bitrate (lossy) compression.
  * uncompressed.

For lossy compression, bitrate is an encoding parameter, but for uncompressed
we'll show later in this session how to calculate the size.

For lossless or variable bitrate, the exact size cannot be pre-calculated -
only estimated.
The actual size can still vary, since the size of these kind of encodings
greatly depends on the content being encoded. Rule of thumb: Less motion =
smaller size and vice versa. Noise make files larger.

There's also the choice with some formats between constant bitrate and variable
bitrate.  Constant bitrate is simpler, more robust, straight to
calculate/estimate. Simpler=preserves better.
Variable bitrate is another way to compress space, but makes
decoding/interpreting the data more complicated and may lead to different
behavior in different tools/setups.
</aside>


# Bitrate: Constant vs Variable

  * **CBR: Constant BitRate**  
    <small>
    Fixed value of data-per-time.  
    Great to calculate/estimate size/bandwidth.  
    Not optimized for saving space.  
    </small>

  * **VBR: Variable BitRate**  
    <small>
    Encoder increases/decreases bitrate, depending on complexity of AV content.  
    Common to define min/max boundaries.  
    Smaller files, but hard(er) to estimate size/bandwidth.  
    </small>
    


# Size

  * Bitrate = Size vs Quality  
    <small>(bitrate as parameter exists *only* for lossy encoding)</small>
  * Uncompressed &gt; lossless &gt; lossy
  * Larger = less processing power, but:  
    More disk/net I/O bandwidth required.


<aside class="notes">
  * Bitrate as tuning parameter only applies to lossy codecs, because
    lossless/uncompressed are not allowed to throw anything away - therefore
    their bitrate cannot be adjusted by definition.

  * Only reason for compression: data size.

  * Any form of compression adds complexity to a format.
    Complexity in terms of understanding (=implementing) a codec.
    Complexity in terms of performance requirements.
    Uncompressed is always the least-CPU-requirement.

  * Why "compressed" is often equated as "lossy".
    Because moving images produce a lot of data and lossy compression produces
    the best compromise between quality/size/performance - lossy is the de-facto
    default when producing videos.
</aside>



# Performance

Often a tradeoff between:

<table>
<tr>
<td>
**Processing power <small>(CPU/RAM)</small>**  
(format/algorithm complexity, smaller files)
</td>

<td>
**I/O bandwidth <small>(disk/network)</small>**  
(data size)
</td>
</tr>
</table>

<aside class="notes">
Better compressed, usually meaning more complex codec - resulting in smaller
files.  These files travel lighter, but require more processing power (CPU/RAM)
to encode/decode.  If these requirements reach the limits of currently available
processing power, realtime issues may occur. This also means: can the daily
workflows be processed in due time?

Oh, btw: Hardware acceleration plays an important role when it comes to codec
performance. However, hardware acceleration is not necessarily available or
implemented for all formats. Usually you will find this for "popular" formats or
ones that are used in professional domains.
</aside>



# Format Examples

<table>
<tr>

<th>
</th>

<th>
Video
</th>

<th>
Audio
</th>

<th>
in&nbsp;Container
</th>

</tr>

<tr>
<th> Preservation: </th>
<td class="small">

  * V210
  * FFV1, J2K
  * High-bitrate lossy
  * DPX/TIFF
  * ...

</td>

<td class="small">

  * PCM (WAV)
  * FLAC

</td>

<td class="small">

  * MOV
  * MKV
  * MXF
  * Folder (film)
  
</td>
</tr>


<tr>
<th> Production: </th>
<td class="small">

  * ProRes
  * H.264
  * DVCPRO50
  * ...

</td>

<td>
</td>

<td>
</td>
</tr>

<tr>
<th> Access: </th>
<td class="small">

  * H.264
  * VP9
  * DVD
  * BluRay
  * ...

</td>

<td class="small">

  * MP3
  * AAC
  * Opus
  * ...
  
</td>

<td class="small">

  * MP4 <sup>(M4V)</sup>
  * MKV <sup>(WebM)</sup>
  * MPG

</td>
</tr>

</table>

<aside class="notes">
I've intentionally used fuzzy wording for access formats, since it better
depicts the perception and wording used in daily life.

Later in this session, we'll get to how to select properties for these use
cases, which helps to decide which format to use for which case.
</aside>



<!-- Quality & compression -->

# Quality & Compression


# Lossy, Lossless, Uncompressed?

<ul>
<li class="fragment"> "AV compression is most-commonly lossy." <small>(nowadays)</small> </li>
<li class="fragment"> "If you can define bitrate as encoding parameter, it is definitely a lossy format." </li>
<li class="fragment"> "Uncompressed is the most dead simple to reverse engineer in the future, but has no error-resilience mechanisms." </li>
<li class="fragment"> "Non-lossy allows fully-auto-validated format migrations. bit-proof." </li>
</ul>

<aside class="notes">
Uncompressed: The bitstreams usually only contain the A/V data. There are no additional mechanisms added to know if bit-errors occurred. Data-errors usually result in hot-pixels (image) or static "clicks" in audio.
</aside>


# Visually lossless = lossy 😇

![Zlad! Elektronik Supersonik](../../../images/tech-video/lossy/elektronik_supersonik.png){width=720px}

<aside class="notes">
"Lossy compression" literally means: some parts of the content are "lost"
(=thrown away) in order to gain more compression (=smaller files). This process
is irreversible and accumulates (=generation loss).


Of course the above image is exaggerated, but it shows pretty well what lossy
compression is and what artefacts a typical MPEG-like compression algorithm
produces.

(btw: This is a snapshot image of the highest-quality version of the video on
the original website (around 2009)).

Due to the vast data sizes of AV, lossy encoding is the current de-facto default
in most environments that handle digital AV (except film). High quality lossy
codecs may sometimes be called "visually lossless" (e.g. ProRes). Which only
means that they're pretty good at hiding their artefacts from your eyes/ears.
High-bitrate lossy formats are standard in broadcast and production.


For audio this is different, merely because the data size is so "trivial" for
modern computer systems that the studio standard is uncompressed (PCM) in WAV.
Suggesting lossy encoding to audio engineers as production source format would
probably get you kicked out of their studio ;)
</aside>


# Generation Loss

![](../../../images/tech-video/lossy/noa/FFv1_GenerationLoss_FFv1vsLossy.png){width=1000px}

<aside class="notes">
Here's an example where one can see the difference between each encoded version
in popular broadcast codecs.

Since it's almost certain that there's not "evergreen format", any format will
sooner or later have to be migrated to another one.
The longer an item is preserved, the more often it will encour such a format
change (transcoding). Therefore, generation loss should be considered.

Also: Usage of archive material:
What happens if you hand out your material to an editor, say on DVD or a
"production" format (aka "mezzanine")?
The editor then edits and exports to another format, the broadcaster or cinema then to another?
...and in the end this work is then also converted to an access format.

And theeeen, years later that access copy is used as a source for a documentary or online edit.

How many generation losses accumulate here?
How could they be reduced?


Generally: please try to avoid unnecessary generation losses.
Why not? :)
</aside>


# Lossless

> "It's like ZIP for film!"

  * No generation loss
  * Way larger than lossy
  * but: Smaller than uncompressed

<aside class="notes">

</aside>


# Uncompressed

  * No generation loss
  * Dead simple <small>(=preserves well)</small>
  * The largest possible version
  * Uncompressed != Uncompressed?  
    There's [*more* than just 1 "uncompressed"](http://www.av-rd.com/knowhow/video/comparison_video_codecs_containers.html#codec_uncompressed)  
    <small>(Ex: RGB, BGR, UYVY, YUY2, V210, etc)</small>

<aside class="notes">
**Uncompressed != Uncompressed:**

There are many variations, and each one is a separate (not necessarily compatible) format.
However, they're all dead-simple, easy to implement and cross-convert without any loss.
(Except if changing color spaces/models - but that's another story...)

Examples:
* YVYU / YUYV: stored information is identical except the U and V samples are swapped.
* RGB / BGR: stored information is identical, except their "order of appearance" in the bitstream.
</aside>



# Uncompressed - Think of it as:

**First pixels of RGB Lines/Frame (8bpc)**

    RGB RGB RGB RGB ...       (4 pixel * 3 Byte)  = 12 Bytes)
    = 24 bit/px


**Same with alpha (transparency) channel**

    RGBA RGBA RGBA RGBA ...       (4 pixel * 4 Byte)  = 16 Bytes)
    = 32 bit/px


<aside class="notes">
Each uppercase letter represents 1 byte (=8 bits).

Image:
RGB: 8 bits-per-component = 24 bytes per pixel

  * Red, Green, Blue, Alpha

YUV:

  * Subsampling 4:2:2 uses only half the bits for U and V.
    Therefore, the proper notation would be:
    U0Y0V0Y1 U2Y2V2Y3
    See: https://www.fourcc.org/pixel-format/yuv-uyvy/

Audio:
16 bits per sample, 2 channels (left/right).

  * Left
  * Right


All you need to know to manually reverse engineer (decode) an uncompressed image bitstream would be (somewhat):

  * Color model
  * Image size (width=line length, height=number of lines per field/frame)
  * Sample size/bit depth


Some Uncompressed Variations/Names:

  * RGB
  * BGR
  * RGB24
  * RGB32
  * RGBA
  * yuv422p
  * yuv444p16le
  * v210
  * h.264 (uncompressed)

</aside>



# Quality Tips

  * Avoid generation loss. <sup>(if possible)</sup>
  * Avoid resizing. <sup>(=rescaling)</sup>
  * Don't invent more bits. <sup>(e.g. DV as v210)</sup>
  * Preserve colorspace / bit-depth, etc.
  * More headroom for lower quality. <sup>(e.g. 24bit/96kHz for Shellack)</sup>
  * Select high enough bitrate. <sup>(lossy)</sup>  
    <small>
    (Or proper "[Constant Rate Factor (CRF)](https://trac.ffmpeg.org/wiki/Encode/H.264#crf)")
    </small>

<aside class="notes">
These are some guidelines for maintaining the highest (reasonable) quality for
preservation copies.
</aside>



# Default Formats

<table>
<tr>
<th> Video: </th>
<td class="small">

  * **Image:** Default = lossy encoding
  * **Audio:** production = PCM, consumer = AAC
  * **Metadata:** Often embedded. Sometimes sidecar.

</td>
</tr>

<tr>
<th> Film: </th>
<td class="small">

  * **Image:** DPX / TIFF files
  * **Audio:** PCM in WAV
  * **Metadata:** Mostly sidecar, some MD in image files.

</td>
</tr>
</table>

<aside class="notes">
Film is currently stored as still image sequence (1 frame = 1 file) in a folder,
along with the audio as one ore more WAV (PCM) files and optionally metadata
sidecar files (XML, etc).

Reels are stored in individual subfolders.

As you can see, I didn't mention which image codec for video, because there is
currently still no format option that satisfies the needs of different
communities like: archive vs consumer vs production vs broadcast vs cinema.


Question:
Where's the difference between *digital* film and *digital* video?
</aside>



# Questions?
## Comments?


# Calculating Size

# Filesize
## Uncompressed Image

  * Width(px) x Height(px)
  * x Bits-Per-Pixel(bpp)
  * x FPS
  * / 8 = **1 second (in Byte)**



# Filesize
## Uncompressed Audio

  * Samplerate x Bit-depth
  * x channels <small>(even if silence!)</small>
  * / 8 = **1 second (in Byte)**



# Exercise:

  * How large is an 8bpc SD PAL minute (720x576px, @25fps) minute?  
    with 4 channels audio at SDI standard (48kHz/16bit)?  
  * Or a 2k 16bpc(!) scan (including 6 channels audio at 48kHz/24bit)?  
  * Or 74min. of audio CD (red-book standard: 44.1kHz/16bit, stereo)?  
  * 60min 50MBit video (in GB)?


<!--
# File formats and preservation implications

<aside class="notes">
  * What do you think "preserves well"?
  * What to look out for?
  * What to check/ask/know?
  * When to acquire that information?
</aside>
-->


