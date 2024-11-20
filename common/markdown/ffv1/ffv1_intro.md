---
title: | 
       | Lossless Video Codec "FFV1"
       | for preservation
geometry: a4paper, margin=2cm
linkcolor: blue
date: 2022-11

transition: none
defaultTiming: 15
slideNumber: true
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page
---


<!--
TODO / to include?

  * Don't forget to bridge gaps between private / prosumer / professional / broadcast use cases.
  * FFmpeg commandline example
  * Batch encoding drag-n-drop example
  * Virtualdub encoding screenshot
-->


# FFV1: 

  * What does it do?
  * What does it cost?
  * And what are the next steps?


# FFV1: What does it do?

  <p class="fragment">**It saves disk space** <sup>(\*)</sup></p>
  * A lossless-only video codec. <small>(no audio)</small>
  * No generation loss <small>(=bit-proof / reversible encoding</small>
  * Master for generating different format copies <small>(eg access)</small>
  * It "just works™" <small>(and is FOSS since day 1)</small>
  <p class="fragment">**At highest quality.**</p><p class="fragment">**+Significant Properties = safe. long-term. open.**</p>


<aside class="notes">
  * (\*) It saves space (But only compared to uncompressed)
    About 2-3 copies for the price of one.
  * It's open and already the defacto preservation standard lossless format of
    choice.
</aside>


# How it all began?

<small>Autumn 2009, Vienna (AT)</small>

> **Hermann Lewetz** at the Austrian Mediathek wanted to apply the same
> principles to video preservation as we all agree on the standards for audio:  
> **Lossless or uncompressed, if possible.**
> Lossy is to be avoided.  

See: [IASA-TC 03](https://www.iasa-web.org/sites/default/files/downloads/publications/TC03_English.pdf)


# Uncompressed/J2K/MXF: Okay. But tricky.

![Image source: https://theawesomer.com/switches-the-secret-life-of-components/616632/](../../images/misc/big_switch.jpg "Image source: https://theawesomer.com/switches-the-secret-life-of-components/616632/")

<aside class="notes">
  * Interoperability issues
  * BBC had to write 3 MXF-to-MXF converters to use it in their archival workflow.
  * Proprietary format extensions
  * Different hardware-encoded J2K/MXF versions that were not fully compatible
    to each other and you could not decode them with an open JPEG2000 decoder
    at that time. Later libopenjpeg supported these implementation-dialect format
    variations.
  * MXF Legalizer. Know why it exists? Because MXF is tricky and not nearly as
    interoperable as advertised. In 2009/2010 it was one of the most cumbersome
    combinations to deal with in the first place. And a very expensive one, too.
    Requiring special hardware encoding/decoding cards, and no affordable option to
    software-transcode from there to anything else. It was not possible to do
    realtime on average PC hardware back then.
</aside>


# FFV1 discovered. Great!

but: Introducing an Open Source solution to the professional community (and companies)...?

![Image source: https://vancouversun.com/news/metro/stanley-cup-riot-investigation-winds-down-as-last-two-suspects-charged](../../images/misc/26-white-riot.jpg){width=70%}



# From 2009 to FFV1 as lossless-standard?

[It's a long, yet exciting and adventurous story...! 🤩️](ffv1_history.html)  
(For another time)



# FFV1: A short history about almost everything

<small>

  * **2003:** FFV1 created in Open Source project "FFmpeg"
  * **2006:** Bitstream frozen (version 1)
  * **2009:** <span class="fragment highlight-green">Picked up for preservation</span> (Me+Dave)
  * **2010:** Funding improvements (Mediathek)
  * **2012:** Added 14bit RGB, Multithreading, SliceCRC
  * **2013:** Official release of "FFV1.3"
  * **2014:** PREFORMA Project
  * **2016:** IETF Standardization in progress
  * **202+:** Number of FFV1 users continuously growing.
  * **2021:** <span class="fragment highlight-green">August: IETF Standard [RFC9043](https://datatracker.ietf.org/doc/rfc9043/) officially released!</span>
  * **2023:** 20 years anniversary :)

</small>

<aside class="notes">
So, FFV1 version 1 is stable since 2006, and FFV1 version 3 (FFV1.3) since August 2013.

In 2010, we were able to use regular off-the-shelf office (!) workstations to
capture and check FFV1 in realtime. We even edited directly with and in FFV1
(2-3 tracks SD PAL though).

Since August 23rd 2021, FFV1.3 is an official standard (IETF RFC 9043).
</aside>



# FFV1: What does it do?
## Page 1

  * Always lossless. Nothing to misconfigure.
  * Similar compression as J2K (but faster).
  * Not the fastest lossless codec, but best speed/size/support ratio.
  * Capture and edit lossless (SD) in realtime.
  * Plays in VLC (out-of-the-box).
  * ...

<aside class="notes">
Considering that in 2010 it was common to require a lossy (eg MPEG-2) copy to
view (or work with) the archival material, since playback (or usage) of a
lossless format was considered impossible without special hardware.

Being able to capture, and even work directly with the lossless material on
standard office-PC hardware (about 3.2GHz Intel i5, Dual-to-Quadcore) is still
very practical.
</aside>


# Quality (original = lossless)
![Image source: Peter B.](../../images/tech-video/lossy/bsp-00001/x264-bitrate_comparison/waveform/Original-FFV1.png)

# Quality (x264 8Mbps)
![Image source: Peter B.](../../images/tech-video/lossy/bsp-00001/x264-bitrate_comparison/waveform/x264_8M.png)

# Quality (x264 2Mbps)
![Image source: Peter B.](../../images/tech-video/lossy/bsp-00001/x264-bitrate_comparison/waveform/x264_2M.png)

# Quality (x264 850k)
![Image source: Peter B.](../../images/tech-video/lossy/bsp-00001/x264-bitrate_comparison/waveform/x264_850k.png)

# Quality (x264 200k)
![Image source: Peter B.](../../images/tech-video/lossy/bsp-00001/x264-bitrate_comparison/waveform/x264_200k.png)


# FFV1: What does it do?
## Page 2

  * Preserves almost all common "pix\_fmts" as-is.
  * YUV + RGB up to 16bpc <sup>(\*)</sup>
  * Widely supported by now (thx to FFmpeg libs).
  * Free and Open since day 1.
  * Easy to migrate to other/future formats.
  * Error detection built-in (Slices)

<aside class="notes">
    * Improves preservation properties, because
      * Open since day 1
        = No black box issues.
        = Immortal format due to source code and the right to use it.

    * Does YUV and RGB
      * Due to being lossless, it's also possible to compress other color sources, too.
      * But not as optimized
      * And requiring additional (possibly manual) steps to reproduce proper original color interpretation

    * Slices:
      Each single frame is split into several parts, which are encoded separately.

    * SliceCRC: CRC error detection option built-in per slice.

  * Format support?
    * Everything that uses FFmpeg under the hood can decode FFV1.
    * Everything that uses FFmpeg under the hood can theoretically encode FFV1
      - but the UI must offer you the options to do so.
      Ask your dealer?

</aside>


# Slices

<small>Valid slice numbers: 4, 6, 9, 12, 16, 24, 30, ...</small>

![Image source: Peter B.](../../images/ffv1/tech/slices_9.png){width=70%}
<small>
Example what 9 slices would look like.
</small>

<aside class="notes">
Each frame is split up into segments called "slices", which are separately
encoded. This allows more granular parallel-processing as well as
error-detection and handling on a sub-frame level.
</aside>


# Error detection/concealment

![Image source: Peter B.](../../images/ffv1/tech/ffv1-crc_error_concealment2.png)

<aside class="notes">
With "slicecrc" enabled, FFV1 is able to detect errors in the data of a slice.
A decoder/player can use this information to perform (optional) error
concealment.

In the image you can see an example of error concealment: A slice
from the previous frame is kept and shown instead of the corrupted slice.
</aside>


# FFV1: Performance

<!--
![Lossless codec comparison graph (Source: [MSU, 2007](http://www.compression.ru/video/codec_comparison/lossless_codecs_2007_en.html))](../../images/ffv1/graphs/msu2007-lossless_trade-off_graph2.png){width=70%}
-->


# FFV1: Performance

![Source: Peter B.](../../images/ffv1/graphs/video_codec_comparison-SD.png){class=light}



# Fast enough for realtime (SD+HD)

![Smooth FFV1 playback in Virtualbox (Image source: Peter B.)](../../images/ffv1/VirtualBox-ffv1_vlc_seamless.png){width=90%}

<aside class="notes">
This screenshot shows the CPU usage while playing back SD PAL FFV1 archival
master in a virtual machine. Even with these added layers of performance
overhead, it plays smoothly :)
</aside>



# Dude, it's huge!

(Example: PAL SD 720 x 576px, 8bpc)
 
  * FFV1 VHS = **~350 MB**/min
  * FFV1 DigiBeta = **~700 MB**/min

<p class="fragment">
**Uncompressed = ~1.37 GB**/min  
(&lt; 4 min. on a DVD)
</p>

<aside class="notes">
Be aware that any lossless compression format will usually be significantly
larger than any lossy encoding!

With the VHS vs DigiBeta example, you also see that the compression ratio
depends on the actual content.
</aside>



# Dude, it's huge!

> But: How likely is it that you'll digitize your analogue source again...?

<aside class="notes">
It's quite realistic, that large-scale analogue-digital transfer ingest will
not happen more than once.

And in many situations, the cost for staff handling the ingest, as well as
getting (and keeping) the equipment to do the transfer may be more expensive
than the additional storage costs.

Please check for your environment and situation.
Anyways: Now you have an option :)
</aside>



# FFV1: Size estimations

**Film**

  * Varying between 1/3 and 2/3.
  * Average = 1/2 of uncompressed.
  * Better with less bits (=less noise).

<aside class="notes">
Again: Actual compression ratio depends on the source material.

Also noteworthy is that for example, 16bpc has less effective compression (3:2,
4:3, average -25%), due to the least-significant-bits (LSB) contain more noise
than actual data.
</aside>


# Professional FFV1 Fun Facts!

  * Noise compresses badly <small>(because chaos has no pattern)</small>
  * Synthetic video (=CGI) compresses best: ~1/9th (!)
  * Lossy is always smaller than FFV1.


# Thanks Alex for the Data!
<small>Frisch aus dem *Archiv der sozialen Demokratie*</small>
![Data: Archiv der sozialen Demokratie (2021-05), Graph: Peter B.](../../images/ffv1/graphs/rawcooked-size-202105.svg){width=70%}

# Hardware & Speed.

![Data: Archiv der sozialen Demokratie (2021-05), Graph: Peter B.](../../images/ffv1/graphs/rawcooked-speed-202105.svg){width=80%}


# How to use it?

![Virtualdub2 & FFV1 (Source: Peter B.)](../../images/tools/virtualdub/vdubffv1/201705-vdub_export_ffv1.png){width=85%}


# Most people however, prefer this:

<!--
`$ ffmpeg -i source_material -c:v ffv1 -level 3 -g 1 -slices 24 -slicecrc 1 -c:a pcm_s16le -map 0 preserved_yo.mkv`
-->

<code syntax="sh">$ ffmpeg -i source_material -c:v ffv1 -c:a pcm_s16le -map 0 preserved_yo.mkv</code>

> (FFmpeg is king. But that's another story.)



# Which container to use?

  * AVI
  * MOV
  * <span class="fragment highlight-green">MKV</span>
  * MXF

<aside class="notes">
Not all containers support FFV1, but the ones listed here cover like 99.9% of
all relevant use cases.

MKV is the preferred option, unless specific features that only another
container format supports is required, or the local environment would be
difficult to include MKV.

Since 2022, MXF also supports FFV1.
</aside>



# What is MKV?

> "The Matroska Multimedia Container is a free, open-standard container format,
> a file format that can hold an unlimited number of video, audio, picture, or
> subtitle tracks in one file."

<small>Source: [Wikipedia: Matroska](https://en.wikipedia.org/wiki/Matroska)</small>



# What is MKV?

  * Short for: "Matroska Video"
  * It's a container <small>(like MOV, AVI, MXF)</small>
  * Initial release: December 2002
  * IETF standardization in progress.
  * Also Open since day 1.
  * And btw: the base for [Google's "WebM" format](https://en.wikipedia.org/wiki/WebM)

<aside class="notes">
Features mostly comparable to MOV (except for timecode)

WebM is the default container format of YouTube and technically Matroska
container, but with certain creation profiles to ensure more consistent flavors.

Must know:
No continuous timecode track (currently) - only start timecode value.
</aside>


# MKV is awesome.

  * Can contain/keep almost any source material <sup>(\*)</sup>
  * Which is good for preservation
  * Like: any codecs, VBR, VFR, color infos, etc etc
  * Well documented and well supported <sup>(\*)</sup>
  * It's tech-design allows adaptability to future things.


<aside class="notes">
(\*): It can contain even whole files.
Similar to attachments in an email, or a ZIP archive (except that it doesn't compress them).
This allows inclusion of file-based metadata formats/standards, like XML or
even related images (JPG, PNG, etc)

(\*): Well supported:
Due to its excellent technical features and being widely and easily supported
because of its FOSS licensed programming libraries and tools, it became the
format of choice for pirated copies.

This caused many vendors (especially of TV/media center hardware) to offer
out-of-the-box support for MKV.

That, and the fact that it originated from the OpenSource community rather than
"The Industry" it was (and partially still is?) the reason why MKV is not yet
supported by all major "professional" video tools.

The fact that more and more OpenSource is being developed and used for
professional use cases, and maybe also because MKV is one of the most popular
choices as preservation format, the support for MKV in professional
applications is increasing.
</aside>


# FFV1 & MKV = ❤️

  * FFV1 goes well into MKV, but also AVI/MOV.
  * All 3 combinations are preservation-approved.
  * With MKV being the most vendor-neutral and open/accessible option.
  * Not only stable, but future-proof.
  * <span class="fragment highlight-green">Theoretically *no* format obsolescence issues.</span>

<aside class="notes">
Sourcecode + license to use it = spare parts + construction plans = "[The Immortal Replayer](https://www.youtube.com/watch?v=0TZL2pAdS4A)".
</aside>


# Users: Moving to FFV1/MKV

![Image source: British Film Institute (2019-07)](../../images/ffv1/graphs/bfi_stats-201907.jpg){width=40%}
&nbsp;
![Image source: British Film Institute (2020-10)](../../images/ffv1/graphs/bfi_stats-202010.png){width=40%}

British Film Institute: 2019 vs 2020




# When to use FFV1?

  * Analogue captures.
  * Normalizing (=converting) born-digital files.
  * Personal originals.
  * More backups than uncompressed <small>(for same price)</small>
  * Network transfer.
  * Scientific video research data.



# When **NOT** to use FFV1?

  * Born digital (=lossy encoded) already in "preservable" format.  
    <small>(Refer to the format whitelist approach)</small>
  * If filesize simply is too much for your setup/budget to handle.
  * ...or if simply overkill for a given use case.


<aside class="notes">

Or you prefer lossy artefacts? ;)
Not kidding, see: ![The Lossless Conspiracy](../../images/ffv1/lossless_compression-the_ffv1_conspiracy_1.png)

</aside>


# The Whitelist approach

> A format normalization decision for preservation: 

<small>

  1. Does an open, FOSS licensed implementation for decoding (to uncompressed)
     exist?
  2. Is the format a documented and/or an open standard?
  3. Is the license/patent situation of the format (and codec implementations)
     resolved for unlimited access/usage?
  4. Can you put that in your AIP without future restrictions for access?  
     (maybe has to run then on "Unknown Future Alien Technology 3000™"?)

</small>
    

<aside class="notes">
If you can answer at least the first question with "yes", you could put the
format on a whitelist (=keep as archival format).

If (2) and (3) are "no" however, you're not completely safe and you may
encounter unnecessary artificial restrictions when trying to open or convert
such a format in the future.
</aside>


-----------------------------------

# What does FFV1 cost?

  * Computation time (CPU).
  * FOSS = Free to use, study, share & improve.
  * Support- and license costs:  
    Optional, yet encouraged. <small>(Think of it like [Roads and Bridges](https://www.fordfoundation.org/work/learning/research-reports/roads-and-bridges-the-unseen-labor-behind-our-digital-infrastructure/))</small>


<aside class="notes">
  * FOSS = Freedom to use, study, share and improve
    This means noone can take it away from you, and you have the freedom to
use, study, share and improve it (or have that done for you) as it suits your
needs. Completely decoupled from external/market interests.

  * If you want to, you can use it completely gratis.

  * If you use it professionally, I strongly suggest to plan in ongoing costs
    for integration and support.
    (This applies to *any* software based solution, open and freely accessible
    solutions lack the forced-payment and lock-in factor as income source)
    I recommend reading "[Roads and Bridges: The Unseen Labor Behind Our Digital Infrastructure](https://www.fordfoundation.org/work/learning/research-reports/roads-and-bridges-the-unseen-labor-behind-our-digital-infrastructure/)" - because any software based solution will need ongoing maintenance.

</aside>



-----------------------------------

# Rawcooked


# Rawcooked

> "It's like ZIP for film! Awesome."®

  * 1-stop-shop for image sequences (🎞️) to FFV1/PCM in MKV. 📼 💾
  * And can completely bit-hashcode-proof restore the original file sequence and structure. 🥳
  * Has a Free + Paid license model. 🍒
  * Yes, it's OpenSource. ✅

<small> [https://mediaarea.net/RAWcooked](https://mediaarea.net/RAWcooked) </small>


<aside class="notes">
* Short feature-overview of RAWcooked
* Reversibility
* image and audio format flavors supported:
  Table online: https://mediaarea.net/RAWcooked
</aside>



# FFV1: Next steps?

  * Better support for easier color handling.
  * Continue improving tool/support landscape.

<aside class="notes">
There are things "we" can do, but another question is: "how is we?" - Who is
the community around FFV1, MKV and OpenSource for preservation tools?
</aside>



# The community = Everyone using it.

![Image source: https://en.wikipedia.org/wiki/Success_Kid](../../images/open_source/not_a_coder-contribute.png){width=40%}

<aside class="notes">
For OpenSource, more users don't necessarily mean more resources. They mean
more complaints and bug reports, and unfortunately expecting all of that
matching million-dollar-business proprietary companies - but of course for free.

That doesn't scale.

But if you use FOSS (especially professionally), consider contributing in one
of many different ways:

  * Ask for NLE support.
  * Ask you dealer for enabling FFV1/MKV support
    (it may already use FFmpeg anyways)
  * Generally: Demand open solutions and format documentations, etc.
</aside>

    

# Thanks to everyone who contributed!

![An Original Drawing (Ireland, dated around 2014 AD)](../../images/ffv1/archivist1fin.jpg){width=40%}


# Questions?
## Comments?

<small> `(ffv1@ArkThis.com)` </small>

![Dave Rice and Peter B. (Image Source: Erwin Verbruggen (2016-07))](../../images/photos/2016/07-NTTW1/ffv1-ffvwewon_dr_pb.jpg){width=60%}
