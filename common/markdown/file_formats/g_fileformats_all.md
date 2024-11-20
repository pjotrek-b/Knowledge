---
title: |-
       Understanding and Selecting a File Format for AV
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`

institute: ArkThis AV-RD
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

transition: none
slideNumber: true
defaultTiming: 6
showNotes: false

;print-pdf: ?print-pdf&showNotes=separate-page

;title-slide-attributes:
;  data-background-image: "../../../images/_themes/ina/2022_frame/intro.png"
;  data-background-size: cover
;data-background-position: 4% 90%

;background-image: "../../../images/_themes/ina/2022_frame/page.png"
;background-image-size: cover

;date: June 2023
---

<!--
   Understanding and Selecting a File Format for AV media files.
-->



# Artificial restrictions

![Amstrad Schneider Joyce](../../../images/retro/amstrad_pcw-schneider_joyce2.jpg)

<aside class="notes">
Preservability is greatly influenced not only by its technical-, but also
legal- or political-properties of a file format.

[Quote from John Elliot](http://www.seasip.info/Unix/Joyce/faq.html) (the JOYCE emulator developer):

> Q: "Where can I find images of the boot discs?"
> A: "To the best of my knowledge, you can't. They are copyrighted software and
>     can't be distributed."

That's computer programs from the 1980s, and only valid on that platform.
</aside>

# Digital Video Trinity

![](../../../images/tech-video/trinity/video_trinity2.png){.plain}

<aside class="notes">
The uncomfortable truth. It's more than "1 format" to choose/consider for AV.

The container format is the one you see in the filename as suffix:
mov, mkv, mxf, avi, flv, 3gp, wav, etc.


A/V media files:
"The" format of video files usually consists of 3 different formats:

  * Container
  * Video codec
  * Audio codec

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



# What's a Container / Wrapper?

> "A container format [...] is a file format that allows multiple data streams
> to be embedded into a single file.
>
> Usually along with metadata for identifying and further detailing those
> streams."

<small>
Source: [Wikipedia: Container format (computing)](https://en.wikipedia.org/wiki/Container_format_(computing))
</small>



# What's a Container?

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
  * NOTE: Some technical MD may be stored in the container *and* the codec/stream.
    This may be a blessing and a curse... Example: Aspect ratio or fps.
</aside>





# What's a Codec?

> "A codec is a device or computer program which encodes or decodes
> a data stream or signal."

<small>Source: [Wikipedia: Codec](https://en.wikipedia.org/wiki/Codec)</small>



# What's a Codec?

**Think of a human language...**

  * It's coded information.
  * There may be dialects.
  * Different people may  
    "speak / understand" differently.


# Best practices for ingest/digitization

<small>

  * Stay as "unmodified" to the original source as possible.

  * Capture analog video without adding generation loss.  
    Uncompressed <sup>(v210)</sup> or lossless <sup>(FFV1, J2K)</sup>.

  * Or fallback option: high-quality lossy.  
    At the highest quality (bitrate) you can store and manage well over time.

  * Capture digital tape as "natively" as possible.  
    <sup>(MiniDV, DAT, DigiBeta, etc.)</sup>

  * Store already-digital files "as original" as possible.  
    Transcode only if codec does not satisfy "sustainability" checklist.
    Rewrap/rewrite container. Always. Even if identical.

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

# Bitrate = Data per Time

> = How many bytes your (lossy) encoder may spend on the quality of the material.

<p>&nbsp;</p>

| Higher bitrate | Better Codec |
| -------------- | ------------ |
| Better quality, but larger files | Better quality at same size or: Same quality at smaller size|

# Bitrate modes: Constant vs Variable

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
# Calculating filesize: IMAGE

  * Width(px) x Height(px)
  * x Bits-Per-Pixel(bpp)
  * x FPS
  * / 8 = **1 second (in Byte)**

<aside class="notes">
Having calculated the size of an uncompressed image, consider it a `frame` or `field` and multiply it by:

  * x frames per second
  * x time (= duration)

...to get the size of uncompressed video/film recordings.
</aside>


# Calculating filesize: AUDIO

  * Samplerate x bit-depth
  * x channels <small>(even if silence!)</small>
  * / 8 = **1 second (in Byte)**
  * x time (= duration)

<aside class="notes">
So how large is an 8bpc SD PAL minute - with 4 channels audio at SDI standard (48kHz/16bit)?  
Or a 2k 16bpc(!) scan (including 6 channels audio at 48kHz/24bit)?  
Or 74min. of audio CD (red-book standard: 44.1kHz/16bit)?  
</aside>


# Calculating lossy sizes

  * Bitrate mode: CBR vs VBR/CRF?
  * VBR/CRF: min/max Bitrate set for encoding?
  * CBR: Multiply bitrate by duration
  * VBR: Use min/max to multiply by duration

<aside class="notes">
That's one of the reasons why most broadcast or AV-hardware player formats use CBR.
Because it's clear to calculate and support.

VBR is cheaper, as it produces smaller data-frame sizes - yet is a bit trickier to handle, due to its flexibility.
However, most content on the internet - and consumer/prosumer environments is VBR. Possibly CRF encoded.
So VBR works, and is quite a common property.

There's a [great FFmpeg Wiki Article: on h.264 encoding](https://trac.ffmpeg.org/wiki/Encode/H.264) which covers many relevant options and parameters for lossy MPEG-4 AVC encoding.
</aside>


# Per (expected) users

  * Consider all data/file-sizes as bandwidth (size per time)
  * Multiply per number of users
  * To plan your network & (online) servers.

# Preservation Checklist: translated! ⭐

<table>
<tr>
<td class="small">
**Sustainability:**

  1. Documentation openly accessible?
  2. Open reference implementation?
  3. How likely is it to be supported in tools/devices for which userbase?
  4. Which features are implemented/tested/stable?
  5. Which choice/requirements do I have to handle it beyond "shelf life"?
  6. Is it legal/possible to handle it in future/different situations?
  7. Can it contain proper metadata?

</td>

<td class="small">
**Quality and functionality:**

  1. Preserve significant properties?
  2. Sufficient image/sound quality and robustness to multi-generation copies?
  3. Interoperability / ease of usage &amp; access?
  4. Direct use for editing?
  5. How many different formats will I need (pile up)?
  6. Handle performance / data size requirements?

</td>
</tr>
</table>

<small>
Original source: [meemoo.be](https://meemoo.be/)
</small>

<aside class="notes">

  1. Documentation openly accessible?
     Without documentation (or access to it), a file format is the equivalent of
     a secret code/language. You can imagine how well "secret code" satisfies
     preservation requirements?

  2. Open reference implementation?
     Any code that implements a file format can be called an "implementation" of
that format. A "reference implementation" is an application that is able to
read/write that format in a proper way, used to check the validity of other
implementations that read/write the same format.
With proprietary (=closed source) formats it is not uncommon that there is no
real "offical" reference implementation - but merely a black-box binary provided by the
vendor, not necessarily freely accessible and possibly subject to change at
their will.
Without an open reference implementation (=including source code),
interoperability issues are more likely to happen.
     
  3. How likely is it to be supported in tools/devices & for which userbase?

     Adoption of a format plays a major role in how easy (=cheaper) vs hard
(=more expensive) it is to use a format. It may be necessary/useful to engage with
vendors of developers and ask for supporting a certain format in tools you would
like to use.

The userbase is important, as it has a
great impact on where a format is supported, and for which use-cases it is
real-world tested.
If a format is common in a userbase that covers your use cases, it's good. If a
format was designed/intended for a userbase further away from your use cases,
you may find that you get less support (or understanding) for your needs.

  4. Which features are implemented/tested/stable?

     Developing, testing and supporting a file format is a tricky task.
     Therefore it is common that the "most popular/important" features are the
ones most likely to be tested and working reliably. Other functions that may
also be defined (even in a standardized format), may not receive the same
attention by its supporters, often leading to (interoperability-)issues with
not-so-popular functions.
This is especially important for us, since certain features required for
preservation are often less important for the main intended use-case of a
format.

A popular example is "lossless": both, JPEG2000 as well as H.264 can produce
lossy as well as lossless encodings. However in practice, the lossless feature
is often neither tested (and sometimes not even supported) in many of their
implementations.

  5. Which choice/requirements do I have to handle it beyond "shelf life"?
     For digital formats, this can be reduced to: If you have an Open Source
version that is able to encode/decode a format, you can most likely continue using it under 
future (=unknown), possibly changing conditions.

  6. Is it legal/possible to handle it in future/different situations?
     Patents, proprietary licensing and copy protection mechanisms are merely
artificial restrictions that must be considered when choosing a file format for
preservation. Especially since access to the material should not be hindered by
them.

  7. Can it contain proper metadata?
     It is good practice to include at least rudimentary metadata that allows to
"identify" a file if found in the wild. Typical fields are: title,
unique-identifier, institution name, etc.

     Depending on your collection and users, different metadata may be useful or
required to create a proper AIP.



**Quality and functionality:**

  1. Preserve significant properties?
    Can the format maintain certain, relevant properties of the source as close
to the original as possible?

  2. Sufficient image/sound quality and robustness to multi-generation copies?
    Can the format provide sufficient quality, and how much impact would
repeated encoding (lossy) have on it?

  3. Interoperability / ease of usage &amp; access?
    Can the format easily be used with different tools, under different
operating systems, environments, devices, etc?

  4. Direct use for editing?
    Can the format be used directly for non-linear editing or extracting parts,
or does it require pre-transcoding in order to do so?

  5. How many different formats will I need (pile up)?
    Can the format handle and depict the majority of my collection, or would I
need different formats for other source material? It is intended to have a small
number of different file formats in an archive, as maintaining workflows/tools
becomes more difficult (=expensive) with more formats. However, it is also not
advisable to simply choose a "can do anything and everything" format, as
mentioned above: More features = harder to implement, support, maintain, etc.

  6. Handle performance / data size requirements?
    Can the required (daily) workflows be supported in due time,
    or are there bottlenecks, budget constraints, etc?
</aside>


# Checklist for a Preservation Format

<table>
<tr>
<td class="small">
**Sustainability:**

  1. Disclosure?
  2. Open reference implementation/libs?
  3. Adoption/popularity?
  4. Complexity?
  5. Independence vs external contingencies?
  6. Artificial restrictions?
  7. Self descriptive?
</td>

<td class="small">
**Quality and functionality:**

  1. Preserve "original"?
  2. Image/sound quality?
  3. Interoperability?
  4. Editing?
  5. Support for (additional/expected) properties?
  6. Performance &amp; data size?
</td>
</tr>
</table>

<small>
Source: [meemoo.be](https://meemoo.be/)
</small>


<aside class="notes">
One reason why there is no "one-size-fits-all" file format for AV, is that there
are different use cases, each having a different focus.
 
These lists are a good reference for giving you questions to ask about formats
that may be considered as an option.

The next slide translates these buzzwords into more concrete
questions/situations.
</aside>


# Format choice = A balance of ...

  * Size vs Quality
  * Features
  * Performance
  * Sustainability
  * plus: time, budget, staff
  * and of course: convenience

<small>Good starting point for assessing practical usefulness.</small>

<aside class="notes">
Size:
  * Smaller = slower processing power
  * Smaller = less quality
  * Bigger = slower disk I/O

Quality:
  * More quality = larger files
  * More quality = slower processing

Performance:
  * How "fast" can a format be encoded/decoded?
  * Which hardware is required/desired?
  * Making it faster: Often limited by budget
  * Cameras / recording workflows must satisfy real-time and on-site
    constraints.
  * Editing

Features:
  * Can the format handle information/feature XY?
    (Can it do start timecode? timecode track? subtitles? extended metadata? etc)
</aside>


# Rather...

  * ask, ask, ask.
  * get documentation.
  * get sample files.
  * try handling/opening them *outside their "usual bubble"*.
  * with at least 1 open implementation. <small>(FOSS licensed)</small>
  * Before you commit to a format.
  * Try transcoding it to a 
    "[*lossless*](https://en.wikipedia.org/wiki/Lossless_compression)" or 
    "[*uncompressed*](https://en.wikipedia.org/wiki/Uncompressed_video)" form.
    <small>(to know if you can migrate/convert later)</small>

<aside class="notes">
  * Ask users with similar/identical use cases than yours how they're doing with
    that format.

  * Get file format data layout specifications and other related documentation
    that you can get your hands on. We've already profited from the ones who did
    this for past "data formats": analogue ones or even ancient writings on clay
    stone tablets, etc.

  * Get sample files and try using them as-if in your desired workflow.
    Ask manufacturers or service-providers to provide you samples, or show you
    how your samples behave in their application/environment.

  * Try sample files "outside their usual bubble":
    This means that sometimes certain format behave well within expected
    environments (e.g. ProRes on Apple stuff, certain MXF-flavors in broadcast
    tools, etc) - but when deviating from thes tested grounds, things may look quite
    differently.

  * If you have at least 1 open implementation (=binary plus source code under a
    copyleft license), you have everything you need to get out of that format
    under any future conditions. Without artificial restrictions.

  * If you can transcode the format to an uncompressed form, without losing any
    information, you know that you have means of getting out of that format
    once you may decide to switch to another one (in the future).
</aside>


# Tempting...

  * Hey, it's **a standard**!
  * Hey, **everyone's using it**!
  * Hey, the "**big ones**" are using it!
  * Hey, it's from a **major company**!
  * Hey, it can do **everything**!
  * Hey, it's so **easy** to use!
  * Hey, it's **gratis**!

<aside class="notes">
Of course all of these are valid reasons to adopt a file format, but when it
comes to long-term preservation requirements and independent sustainability,
they may not be sufficient, and sometimes even misleading.

And yes, sometimes choosing such a format can be "just fine" too.

At least take some time to align *your* needs and wishes with any format option.
</aside>



# Data Structure (Hex Editor)

<table>
<tr>
<td>
![Hex view of WAV header (annotated)](../../../images/formats/riff-avi-wav/hexedit-wav-header.png)
</td>

<td>
![](../../../images/formats/obsolescence/holy-gibberish.jpg)
</td>
</tr>
</table>


# (Documented?) Data Structure

![](../../../images/formats/angea/binary/PNG.png)

# "Different strokes for different folks" 😉

  * **Digitization:** <small>(<green>V210, FFV1, MPEG-4 / PCM</green>)</small>
    <small>
    uncompressed/lossless or very-high quality lossy.  
    </small>

  * **Preservation:** <small>(<green>V210, FFV1, MPEG-2, MPEG-4 / PCM</green>)</small>
    <small>
    uncompressed/lossless or (very)high-quality lossy, open &amp; documented, error-robust.  
    </small>

  * **Production:** <small>(<green>MPEG-2, MPEG-4, ProRes / PCM</green>)</small>
    <small>
    high-quality/high-bitrate (lossy).  
    </small>

  * **Access:** <small>(<green>H.264 / AAC in MP4</green>)</small>
    <small>
    Most often lossy-compressed currently-popular format combination.  
    </small>


<aside class="notes">
Notice:
The container does not really matter regarding quality or size.

The container does play an important role regarding:

  * metadata
  * structural features
  * certain (technical) features not supported by other containers
    (eg timecode tracks)
</aside>

# "Different strokes for different folks" 😉

  * **Digitization:**
<small> <green>As-original, as-untouched as possible. Records in realtime?</green> </small>  
    <small> (Plus: has headroom for optional restoration/improvements.) </small>

  * **Preservation:**
<small> <green>Stand the tests of time.</green> </small>    
    <small> (Highest 'original' quality) </small>

  * **Production:**
<small> <green>For daily work. High quality.</green> </small>  
    <small> (Optional, if preservation format can be used for this) </small>

  * **Access**
<small> <green>For quick and easy access.</green> </small>  
    <small> (Quality not necessarily best/high, but very convenient to play) </small>


<aside class="notes">
Sometimes one format can be used for all these cases (merely lower
quality/bitrate for access or production), but with AV it's not uncommon that
these are different codecs (or even containers).

It is perfectly normal to have a preservation copy that requires transcoding
before going into other workflows.

The formats for access and editing are more likely to be chanced more often than
the preservation format.
</aside>



# For audio: we're lucky.

> PCM/WAV is used from digitization to preservation - and if bandwidth ain't
> narrow: even as access format.

Why? Because it became "<red>small enough</red>".

# Data errors: Error resilience?

<table>

<tr>
<td class="small">

  * **Bitstream checksums:**  
    Ability to *know* if the content is intact.

  * **Error concealment:**
    Optional choice of decoder to "mask" decoding issues.
    (decoder specific)

  * **Make backup copies!** 😇

</td>

<td>
![](../../../images/fixity/bubble-wrapped-person.jpg)
</td>
</tr>

</table>


<aside class="notes">
Error resilience of a format is nice, but don't solely rely only on it:
Make backups! :)
</aside>

# The Eternal Replayer

![](../../../images/open_source/immortal_replayer/A807_transformer_remove.jpg){height=300px}
+
![](../../../images/open_source/immortal_replayer/bauteile2.jpg){height=300px}
=
![](../../../images/open_source/immortal_replayer/A807_Scaled.jpg){height=300px}

<aside class="notes">
As an example:

  * Schematics
  * Building components
  * +the right to use, study, share and improve them.

= "The Immortal Replayer"

Because it can be kept alive, or rebuilt or adapted to future needs or with
future technology (whatever there may be).

Since software *is* the schematics and building components at the same time,
having the source code and the right (=license) to use, adapt and share them -
gives you an immortal file format. By definition.

This has been proven in the real world in many different digital domains outside
AV or preservation many times already, with different tools and data formats
from ancient computer systems. Even popular ones now dead (Atari, Amiga, C64,
Amstrad Schneider, etc etc.)
</aside>
# "Rebranded" Format Names

> Some (professional) video formats are actually a profile-set for existing
> (standards) formats.

This is good! 😇️

<aside class="notes">
Such profiles may include declaring what is "allowed" (=supported):

  * number of audio channels
  * audio resolution (samplerate, bits, channels)
  * allowed bit-rates
  * image resolutions, frame-rates
  * etc.


Why is this good?

The reason why this is a good thing is, that these formats can now be treated
with tools that support their underlying encodings, simply by adhering to their
profile-specifications, using existing file-format libraries and tools.

For example, broadcast formats can now often be handled using FFmpeg, as long
as sticking to the right profile constraints.
</aside>



# Popular examples:

| Name | Formats |
| ---- | ------- |
| [Digital Cinema Package (DCP)](https://en.wikipedia.org/wiki/Digital_Cinema_Package) = | [Motion-JPEG2000](https://en.wikipedia.org/wiki/Motion_JPEG_2000) (lossy), PCM in [MXF](https://en.wikipedia.org/wiki/Material_Exchange_Format) + XML |
| [AVC-Intra](https://en.wikipedia.org/wiki/AVC-Intra) = | [H.264/MPEG-4 AVC](https://en.wikipedia.org/wiki/H.264/MPEG-4_AVC) |
| [MPEG IMX](https://en.wikipedia.org/wiki/Betacam#MPEG_IMX) = | [H.262/MPEG-2](https://en.wikipedia.org/wiki/H.262/MPEG-2_Part_2) |
| [HDCAM SR](https://en.wikipedia.org/wiki/HDCAM#HDCAM_SR) = | [MPEG-4/Part2](https://en.wikipedia.org/wiki/MPEG-4_Part_2) Simple Studio Profile (SStP)
| [Broadcast Wave Format (BWF)](https://en.wikipedia.org/wiki/Broadcast_Wave_Format) = | [linear PCM](https://en.wikipedia.org/wiki/Pulse-code_modulation) in [WAV](https://en.wikipedia.org/wiki/WAV)
| [WebM](https://en.wikipedia.org/wiki/WebM) = | [Matroska (MKV)](https://en.wikipedia.org/wiki/Matroska) container |

<aside class="notes">
XviD: A (legacy/retro) popular format that also implements MPEG-4/Part2 (MPEG-4 SP).
</aside>

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


# Filesize (still) matters

<small>

| Type          | Duration      | Bitrate   | Filesize      | Usage
| -----         | -----         | -----     | -----         | -----
| Video         | 1 hour        | 210 Mb/s  | 92 GB         | Preservation
|               |               | 50 Mb/s   | 22 GB         | Preservation
|               |               | 25 Mb/s   | 11 GB         | Preservation / Mezzanine
|               |               | 1,5 Mb/s  | 1 GB          | Access
|
| Audio         | 1 hour        | 4,6 Mb/s  | 2 GB          | Preservation
|               |               | 128 kb/s  | 56 MB         | Access

</small>

# Format Complexity

![](../../../images/formats/wenger_giant.png){width=800px .plain}

<aside class="notes">
Be careful with "one size fits all": Sporks are good for camping, but there's a
reason why we still have separate tools for the job: spoon, knife and fork.

Considerations:

  * More features = more complex / chance that only parts of specifications are
    supported by tool X.
  * Can be non-trivial to judge what is "simple" and what is "complex"
  * Find the sweet spot for your use case(s).
</aside>



# Format Complexity: Less is More

<table>
<tr>
<td>
Good rule = "[Minimalistic Data Format](https://fsfe.org/freesoftware/standards/minimalisticstandards.en.html)":

  * As simple as possible
  * As complicated as necessary

</td>

<td>
![](../../../images/formats/knife.png){.plain width=300px}
</td>
</tr>
</table>

> Simpler = more stable, easier to use, keep alive, reconstruct or fix.


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

# Format Wars

> "My format is `...` than yours. Bäh!"

`Options = 😝 🤑 🤩 🤫 🤔 🤐 😴 🤮 ...`
Have fun!

<aside class="notes">
Sometimes the reason for more than 1 suitable format option existing may be,
because different vendors are interested in promoting "their" format.

If a format becomes widespread/important enough, the "owner" of that format has
a great saying/control over the conditions such files can be used/supported.
</aside>


# Let's look inside! :)


# Obsolescence / Vendor Lock-in


# Why bother? - Let's just have:

<table>
<tr>
<td>

  * Best quality
  * Smallest filesize
  * Preserve original properties
  * Fast and easy to open/use/edit
  * Lasts forever
  * +cherries 🍒 &amp; ice cream 🍦on top!
  * ...

</td>

<td>
![The Holy Grail](../../../images/misc/holy_grail.jpg){width=500px}
</td>
</tr>
</table>

<aside class="notes">
That list actually makes sense:

They define the desired properties that you have to choose from, which ones and
how well you want them implemented.
</aside>


# Links

<small>

  * [Primer on Codecs for Moving Image and Sound Archives](https://www.avpreserve.com/wp-content/uploads/2010/04/AVPS_Codec_Primer.pdf)
  * [Hex Editing for Archivists](http://www.av-rd.com/knowhow/data/hexedit_archivists-1.html)
  * [Comparing Video Codecs and Containers for Archives](http://www.av-rd.com/knowhow/video/comparison_video_codecs_containers.html)
  * [Digital Media Primer for Geeks](https://www.xiph.org/video/vid1.shtml)
  * [A short guide to choosing a digital format for video archiving masters](https://www.scart.be/?q=en/content/short-guide-choosing-digital-format-video-archiving-masters)
  * [Media Digitization and Preservation Initiative (MDPI)](https://mdpi.iu.edu/doc/MDPIwhitepaper.pdf)
  * [Understanding audio bitrate](https://www.adobe.com/sea/creativecloud/video/discover/audio-bitrate.html)
  * [Data Compression (Wikipedia)](https://en.wikipedia.org/wiki/Data_compression)

</small>

# Yagni Kiss Moscow?

![](../../../images/tech-video/features/av_container_feature_circles.png){.light}

<small>
[YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it) / [KISS](https://en.wikipedia.org/wiki/KISS_principle) / [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method)
</small>

<aside class="notes">
It may look cryptic, but is actually quite simple and useful:

It is an example for finding the "minimalistic data format" that suits your
needs.

  * **YAGNI = "You Ain't Gonna Need It":**  
  It's supposed to prevent you from selecting a format that is possibly too
bloated or unncessarily complex, or
less-well supported.

  * **KISS = "Keep It Simple, Stupid":**
    "The KISS principle states that most systems work best if they are kept
simple rather than made complicated; therefore, simplicity should be a key goal
in design, and unnecessary complexity should be avoided."

 * **MoSCoW = "Must, Should, Could, Won't":**
    "The Moscow method is a prioritization technique used in management,
business analysis, project management, and software development to reach a
common understanding with stakeholders on the importance they place on the
delivery of each requirement"


The example shows 4 different container formats for AV.
Each one has different number and kinds of supported features, represented by
the size of its circle.

  * Larger circle = more features.
  * Smaller circle = less features.
  * Overlapping circles = common features.

</aside>



# Exercise: Your Format Policy

| Must | Should | Could | Won't |
| ---- | ------ | ----- | ----- |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |


Choose a use-case and try to phrase your "wishes".

<aside class="notes">

Now, according to the MoSCoW method, write down which features you:

  * must have
  * should have
  * could have
  * won't have (this time)

And check which format provides them, then draw a dot in the corresponding
circle area.

**For example:**
Only MXF may be able to provide support for broadcast-specific
metadata/functions, therefore that feature will only have a dot in the MXF
circle.
Whereas, all (except) AVI can store aspect ratio - so that dot would go into
overlap of all - except AVI. The feature of "extremely simple, well-documented
and stable/unmodified for ages" would likely to be a dot in either AVI or MKV.

Use this to find out which format fits your needs, while being "as simple as
possible and only as complicated as necessary".
</aside>


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




# Paper analogy

![](../../../images/tech-video/trinity/Container_Mockup_Contents.png){width=800px}

# Characteristics / Properties

|               | File 1        | File 2        | File 3     |
| ----          | -----         | -----         | -----      |
| **Container**     | <red>MOV</red>           | <red>MOV</red>           | <red>MOV</red>        |
| **Videocodec**    | <blue>UYVY</blue>          | <blue>H.264</blue>         | <blue>XviD</blue>       |
| **Resolution**    | 720 x 576px   | 1920 x 1080   | 640 x 480  | 
| **FPS**           | 25            | 24            | 30000/1001 |
| -        | | | |
| **Audiocodec**    | <green>PCM</green>           | <green>AAC</green>           | <green>MP3</green>        |
| **Samplerate**    | 48 kHz        | 48 kHz        | 44.1 kHz   |
| **Channels**      | Stereo        | Surround 5.1  | Mono       |


<aside class="notes">
This is just a random example to show that from the "outside" (=file explorer) you would only see that all files are ".mov" - whereas their actual audio/video codecs, as well as their technical properties are completely different. It therefore always makes sense to use proper tools to "look inside" (MediaInfo, etc).

As you can see, just declaring the file-ending ".mov" does not really tell us much about the actual video/audio formats/encodings being used.
</aside>

# Format Naming

Triplet notation greatly helps reducing confusion:

  * **H.264** / **AAC** in **MP4**
  * **FFV1** / **PCM** in **MKV** (Matroska)
  * **ProRes** / **PCM** in **MOV**
  * **DPX** / **WAV** (PCM) in **a folder**
  * etc

<small>
See [The MPEG-4 confusion](http://www.av-rd.com/knowhow/video/simplicity-mpeg4.html) 😜️
</small>


<aside class="notes">
When communicating "which video format", please consider using a triplet-notation, like:
"video/audio in container".

It is unfortunately most common to simply quote the file suffix as "the format".
</aside>

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


# Open vs Closed

![Enigma encryption rotor
windows](../../../images/retro/enigma-rotor-windows2.jpg){height=400px}

<aside class="notes">
What will be easier (=more likely) to be understood/accessible now and in the future:
Documented language or secret code?
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

# Examples of published Policies 


  * [Guidelines for the Digital Film Collection](https://www.filmmuseum.at/jart/prj3/filmmuseum/data/uploads/Filmsammlung_Restaurierung/AFM_GuidelinesDigitalFilmCollection.pdf)  
    <small>(Austrian Filmmuseum, 2018)</small>
  * [Digital Preservation &amp; Access Strategy](http://www.ifi.ie/wp-content/uploads/DPAS-V.2.pdf)  
    <small>(Irish Film Archive, 2016)</small>
  * [Digital Preservation: Policy, Standards and Procedures](http://publications.beeldengeluid.nl/pub/388)  
    <small>(Netherlands Institute for Sound and Vision, 2016)</small>

<aside class="notes">
The above links point to preservation policies published by other AV archival
institutions.  They also contain information about file format choices - in the
context of AV preservation.

As you can see, the length and level of detail of such policies can vary greatly.
Often it is great to simply have a rather short written form that at least
provides insights in "how" and "why" someone has chosen one (format) option
over another.

It is also good practice to write such policies in a way that they can be
interpreted and applied properly even if the actual technical
options/conditions change. For example, it's okay to say "we chose format XY" -
but without writing down "why", this choice may seem incomprehensible and
outdated once "format XY" is superseded by another format, or something else in
the tech-envirionment or the conditions has changed.

Another example: It was common to use "MP3" for some (longer) recordings in the
audio archiving domain, instead of WAV/PCM.  Now this may seem odd, but at that
time 10 MB/Minute WAV/PCM (CD-Resolution) was heavy lifting in terms of digital
computer storage.

But back then, a "large" HDD RAID was 80 GB. Consisting of several 20 GB
harddisks.  Now, this would fit on a USB-Stick.

> "Nothing ever doesn't change, but nothing changes much."

All the time.
</aside>

# Significant properties

> Knowing and deciding which properties to safeguard
> and which are allowed to change.

&nbsp;

<small>
See:  
[LoC FADGI: DRAFT Significant Properties for Digital Video](http://www.digitizationguidelines.gov/guidelines/sigpropvideo.html)  
[Nestor (DE): Leitfaden DLTP AV Medien](https://files.dnb.de/nestor/materialien/nestor_mat_19.pdf)  
</small>

<aside class="notes">
For some it's the resolution, color information, audio quality - for others
it's sufficient to see/understand it "good enough", or to be able to quickly
edit-and-broadcast as the main focus.

Depends.

However, be aware that your recording may possibly be used in a different
context in the future, so if possible don't aim "too low".

But please make an active decision and possibly document it (which ones and
why) somewhere.
</aside>



# Significant properties

Depend on media type (and use case).

<table>
<tr>
<th> Video </th>
<th> Audio </th>
<th> Metadata</th>
</tr>

<tr>
<td>

* resolution
* framerate
* aspect ratio
* colorspace
* subsampling
* ... 

</td>

<td>

* "resolution"  
  <small>(= samplerate, bit-depth)</small>
* channels
* channel layout
* ...

</td>

<td>
* language
* title
* author
* rights information
* ...
</td>

</tr>
</table>


<aside class="notes">
Definition fuzziness in the preservation community:

Some say "Significant" are the properties that must be maintained as-is and
kind of "must never change", whereas others define it as "should be aware of
and decided how to deal with them".

Further properties:
  * scan type (interlaced / progressive) 
  * field order
  * color information
  * ...
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

# Digital AV formats...

  * Which do *you* know?
  * Which do *you* use?
  * Which would *you* like to know more about?

<div>&nbsp;</div>

> What are **your** wishes, needs, expectations of a format? 🤔️

# Your use cases/priorities?

  * Who will want/need to work with these files?
  * Under which conditions?
  * For how long?
  * Digitization vs Production vs Preservation vs Access?
  * Which properties are significant *to you*?

<aside class="notes">
It's good to define (and write down) what you actually need from a file format
in which use-case.

Also align these requirements with your restrictions (budget, time, staff, etc)
</aside>

# Digital AV formats...

> What are **your** wishes, needs, expectations of a format? 🤔️

# Risks to format longevity

  * Data errors
  * Obsolescence
  * Vendor lock-in
  * Interoperability/complexity issues
  * Quality degradation

Countermeasures?

<aside class="notes">
  * Data errors:
    Files are corrupt.
    These errors may include filenames or filesystem tech-MD.

  * Obsolescence:
    Not supported anymore by accessible tools.
    This is neither God-given, nor irreversible, unless it's a black-box format.
    Format obsolescense/support is a human-made decision.
    Documentation/schematics are an important game changer.

  * Vendor lock-in:
    For long-term preservation, vendor- and technology-neutrality is a must:
    They will come and go, and with lock-in situations Eternal Migration is
    hindered or even impossible.
    Format normalization helps here.

  * Interoperability issues:
    If a format is read and written differently by different applications, it
    might "morph". This morphed version might work fine with the tools used in a
    certain environment, but might be completely broken if read/written by
    another tool that misunderstands the "dialect".

    A format offering more features, can be considered more "complex".
    Whereas a format offering less features is considered "simpler".
    Simpler (and more popular) formats are usually less susceptible to
    interoperability issues, than complex (and/or less popular ones)

  * Quality degradation:
    Avoid unncessary copy/encoding generation losses, or property conversion.
    This may include, avoiding additional lossy encoding steps, resizing the
    image, resampling audio, etc.
</aside>

# Summary: Preservation Format

<table>
<tr>
<td class="small">

  * Can be used to generate all other versions.
  * Depicts the "original" source as accurately as possible.
  * No artifical restrictions for using it.  
    Now and under unknown future (=unknown) conditions.
  * Well documented, no secrets, FOSS implementation exists.
  * Bit error resilience would be nice.
  * Consider GOP=1 (=Intraframe only).
  * Audio format: Normalize to uncompressed PCM/WAV.
  * For video container formats, consider using MKV or MOV.  
    MXF only if really necessary because:
  * **As simple as possible, as complicated as necessary.**

</td>
</tr>
<tr>

<td>
> summarizes as: "**preserves well**"
</td>
</table>


# Theory vs Practice

![](../../../images/formats/lego-instructions1.jpg){height=400px}
![](../../../images/formats/carriage2.png){height=400px; .plain}

<small>"Implementation overrules paper specs. Always."</small>


<aside class="notes">
If the implementation is open: you can use, study, share and improve if
necessary.

If it's closed/proprietary then there's nothing you can do about it:
Black box. Vendor lock-in.
With digital, this means that it's quite likely that this as-is binary may not
be able to keep running/functioning when its environment changes.

You've probably seen how fast even good and stable programs "age" until they
stop working, once their native Windows version is "too long ago..."?


Even with official standards, their implementation is what creates the actual
encoding/decoding. Regardless of what's written in any paper manual (=theory): The code
implementation (=practice) is what counts.

Therefore, it makes sense to demand an openly accessible reference
implementation, with its source code under a license that allows to make use of
it as you see fit.
</aside>
<!-- END / CREDITS -->

# - Fin -



# Questions?
## Comments?

Peter Bubestinger-Steindl

`Peter @ ArkThis.com`
